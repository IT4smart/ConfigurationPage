/*******************************************************************************
 * Copyright (c) 2016, Andreas Thomas Haller, Cedrique Tassi
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    1. Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *    2. Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *    3. The name of the authors may not be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************/
 
/******************************************************************************\
  |******************************************************************************|
  |* 				proxyModel.cpp				      *|
  |******************************************************************************|
  \******************************************************************************/

#include <iostream>
#include <QPushButton> 		//for changing the Cancel Text
//#include "../inc/custom_exceptions.h"
#include "../mainwindow.h"
#include "../inc/proxyModel.h"
#include "../../../libs/tools/inc/custom_exceptions.h"
#include "../../../libs/tools/inc/exec_cmd.h" //for new directories



/**
 * Constructor for pictures
 * create a dialog, where you can upload a file
 * @param parent the parent window
 * @param usb_path the path where the new files shall lie
 * @param out_path the path where the new files shall be saved
 * @param isCertificate if we have a certificate
 * @param _language the first language for Cancel and so on
 * @param _language_fallback the fallback language, if entries don't exist in language
 * @param cb the combobox drdw_pictures
 * @param lb label of the left picture
 */
FileSystemModelDialog::FileSystemModelDialog(QWidget * parent, const QString & usb_path,
		const QString & out_path, bool isCertificate, 
		const IniFile& _language, const IniFile& _language_fallback,
		QComboBox *cb, QLabel *lb
):
	QDialog(parent),
	mPath(out_path),
	isCertificates(isCertificate),
	dirFilModel(new QFileSystemModel(this)),
	treeView(new QTreeView()),
	buttonBox(new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel)),
	pcb(cb),
	plb(lb),
	language(_language),
	language_fallback(_language_fallback)
{
	//Set the language for the cancel button
	buttonBox->button(QDialogButtonBox::Cancel)->setText(language_than_fallback("button", "cancel"));

	//do not list the special entries . and .. 
	//NoSymLinks is very important, otherwise they could get root access
	//and list all Files and Directories
	dirFilModel->setFilter(QDir::NoDotAndDotDot | QDir::Files | QDir::AllDirs | QDir::NoSymLinks);
	dirFilModel->setRootPath(usb_path);
	
	//set the treeView
	treeView->setModel(dirFilModel);
	QModelIndex idx = dirFilModel->index(usb_path);

	treeView->setRootIndex(idx);
	treeView->expand(idx);
	treeView->scrollTo(idx);
	//would set the Current Index to the usb_path-Directory
	//treeView->setCurrentIndex(idx);

	//set the name to the half-width
	treeView->setColumnWidth(0,treeView->size().width()/2);


	//tried to select the whole first row but didn't work. then is suddenly was selfselected
	//wait until all files are loaded and then set the default index
	//connect(dirFilModel, SIGNAL(directoryLoaded(QString)), this, SLOT(model_directoryLoaded(QString)));
	/* didn't work quite well, neither in the connected Slot
	treeView->setCurrentIndex(dirFilModel->index(0, 0, dirFilModel->index(QDir::homePath())));
	QModelIndex next_index = treeView->currentIndex().sibling(0,0); //child instead of sibling
        treeView->selectionModel()->select(next_index, QItemSelectionModel::ClearAndSelect | QItemSelectionModel::Rows);
	*/

	//connect the accpet and reject functions to its buttons
	connect(buttonBox, SIGNAL(accepted()), this, SLOT(accept()));
	connect(buttonBox, SIGNAL(rejected()), this, SLOT(reject()));


	//view the new Dialog
	QVBoxLayout *mainLayout = new QVBoxLayout;
	mainLayout->addWidget(treeView);
	mainLayout->addWidget(buttonBox);
	setLayout(mainLayout);
	setWindowTitle(language_than_fallback("label", "choose_file"));
}
/**
 * ask for the value in the language. if the response is empty, the value of the language_fallback is taken
 * @param group the group name of the language-ini-file
 * @param key the key of the language-ini-file
 * @return the value saved under group-value combination
 */
QString FileSystemModelDialog::language_than_fallback(QString group, QString key) {
	return (language.get_Map_Value(group, key) != "") 
			? language.get_Map_Value(group, key) 
			: language_fallback.get_Map_Value(group, key);
}


/**
 * check if the name of the new marked file already exists 
 * copy the new file 
 * make directories id necessary
 * if picture: then send signal to update the new pic and the pic-drdw-list
 */
void FileSystemModelDialog::accept()
{
	//make directories if they do not exist
	make_directories(mPath);

	const QString file = dirFilModel->fileInfo(treeView->currentIndex()).absoluteFilePath();
	//set the name of the new pic and its path 
	QString picName = dirFilModel->fileInfo(treeView->currentIndex()).fileName();
	QString mDlFile = mPath + picName;
	//std::cout << picName << std::endl;

	QFileInfo out_f(mDlFile);
	//if the selected file already exists
	if (out_f.exists()) {
		QString err =
			(isCertificates) ?
			language_than_fallback("customer_info", "question_override_certificate") :
			language_than_fallback("customer_info", "question_override_picture");

		//get the app name and yes and no in the right language for the user-question-dialog
		QString app_name = language_than_fallback("label", "title");
		QString yes = language_than_fallback("button", "yes");
		QString no = language_than_fallback("button", "no");
		int reply = questionMessage(this, err, app_name, yes, no);
		//don't override the existing file
		if (reply == QMessageBox::No) {
			emit send_customer_info("file_remained");
			mDlFile=QString::null;
			return;
		}
		// delete existing file
		QFile file;
		if (!file.remove(mDlFile)) {
			emit send_customer_info("file_remove_failed; ERRORMSG=" + file.errorString() + ";");
			return;
		}
		emit send_customer_info("override_file");
	}
	//copy new file
	QFile::copy(file, mDlFile);

	//change picture-combobox after adding new picture
	if (!isCertificates) {
		//emit Signal to change the DrDw-Pictures and GUI-Picture
		emit signalPictureAdd(picName);
	}
	this->hide();
	delete this;
}

/**
 * reject: so delete and hide the Dialog
 */
void FileSystemModelDialog::reject()
{
	this->hide();
	delete this;
}


/**
 * Destructor
 */
FileSystemModelDialog::~FileSystemModelDialog()
{
	delete dirFilModel;
	delete treeView;
	delete buttonBox;
}
