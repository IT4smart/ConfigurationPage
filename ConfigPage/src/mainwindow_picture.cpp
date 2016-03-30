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
 ******************************************************************************|
 * 				mainwindow_pictures.cpp			      *|
 ******************************************************************************|
 ******************************************************************************/



#include <QList>
#include <QDirIterator>
#include "../mainwindow.h"
#include "../ui_mainwindow.h"
#include "../../../libs/tools/inc/custom_exceptions.h"
#include "../../../libs/tools/inc/remove_file.h"



/**
 * set the logos on the GUI 
 * take the provider logo 
 * and all the clients logos and choose the default one
 */
void MainWindow::set_logos()
{
	ui->drdw_pictures->clear ();
	//ui->drdw_pictures->setInsertPolicy(QComboBox::InsertAlphabetically);

	//read in and sort all the pictures of client logos and put them into the drdw
	setDrDwPicturesList(readInPictures());
	//set the default client picture
	on_drdw_pictures_activated(ui->drdw_pictures->currentText());
	
	//set the default provider picture
	QPixmap imgRight(setting.get_Map_Value("path", "path_provider_logo") + "/picture.png");
	int height 	= ui->lb_picture_right->height();
	int width 	= ui->lb_picture_right->width();
	ui->lb_picture_right->setMinimumSize(1, 1);
	ui->lb_picture_right->setPixmap(imgRight.scaled(width, height, Qt::KeepAspectRatio, Qt::FastTransformation));
}


/**
 *  save the client logo as default 
 *  sets this value in the MapMap of setting and saves it to the IniFile on disk
 */
void MainWindow::save_client_logo_from_ui() {
	// save last used profile as default
	try {
		setting.set_Map_Value("profile", "last_client_logo", ui->drdw_pictures->currentText());
		setting.save_Map_to_IniFile();
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}
}



/**
 *  read in the names of all possible client_logos
 *  and sort these entries alphabetically
 *  @return list with all client_logo names
 */
QStringList MainWindow::readInPictures()
{
	QDirIterator it (this->setting.get_Map_Value("path", "path_client_logo"),
			QDirIterator::Subdirectories);
	QStringList list;
	while (it.hasNext()) {
		//take only the last token
		QString fl = it.next().split("/").back();
		if( !fl.startsWith(".") && !fl.startsWith("..")) {
			list.append(fl);
		}
	}
	//don't distinguish between lower and capital letter
	list.sort(Qt::CaseInsensitive);
	return list;
}




/**
 *  take all elements of the client_logo list and add them to the drdw menu
 *  set the right default logo
 *  @param list list with all client_logo names
 */
void MainWindow::setDrDwPicturesList(QStringList list)
{
	int defaultIndex = 0;
	for (auto element: list) {
			ui->drdw_pictures->addItem(element);
			//set the default index
			if ( !element.compare(setting.get_Map_Value("profile", "last_client_logo").toUtf8().constData()))
				ui->drdw_pictures->setCurrentIndex(defaultIndex);
			++defaultIndex;
	}
}
/**
 *  on each change of the dropdown menu pictures
 *  change the viewed pic
 *  @param logo name of the new logo
 */
void MainWindow::drdw_pictures_select(const QString &logo)
{
	if (logo.isEmpty() || logo.isNull())
		return;
	QPixmap imgLeft(this->setting.get_Map_Value("path", "path_client_logo") + logo);

	int height 	= ui->lb_picture_left->height();
	int width 	= ui->lb_picture_left->width();
	ui->lb_picture_left->setMinimumSize(1, 1);
	ui->lb_picture_left->setPixmap(imgLeft.scaled(width, height, Qt::KeepAspectRatio, Qt::FastTransformation));
	//for resizing, add this .scaled in the resizeEvent
}

/**
*  delete the current client_logo
*  check if text of client_logo to be deleted: 
*	last-exisiting client_logo
*	empty
*	last_client_logo in setting.ini -> then set a new last_client_logo
*/
void MainWindow::pictures_delete()
{
	if (ui->drdw_pictures->currentText().isEmpty() || ui->drdw_pictures->currentText().isNull())
		return;

	// last remaining profile
	if ( !(ui->drdw_pictures->count() > 1) ) {
		print_customer_info("can't delete last remaining logo");
		return;
	}


	QString curPic = ui->drdw_pictures->currentText();
	QString defPic = setting.get_Map_Value("profile", "last_client_logo").toUtf8().constData();
	//ask to delete picture
	QString fullname = this->setting.get_Map_Value("path", "path_client_logo") + curPic;

	QMessageBox::StandardButton reply = questionMessage (this,"Do you really want to remove"
			" the selected logo from folder");

	//delete: yes
	if (reply == QMessageBox::Yes) {
		// delete profile out of the profiles-folder
		try{
			remove_file(fullname.toStdString ());
		} catch(const developer_error& e) {
			handle_developer_error(e);
			return;
		}
		print_customer_info("logo successfully deleted");
		ui->drdw_pictures->removeItem(ui->drdw_pictures->currentIndex());
		ui->drdw_pictures->update();

		//if not deleted the default picture
		if (curPic != defPic) {
			//set the index of the picture to the default one
			int defaultIndex = ui->drdw_pictures->findText(defPic);
			ui->drdw_pictures->setCurrentIndex(defaultIndex);

			//deleted the default picture
		} else {
			//set default to first one
			ui->drdw_pictures->setCurrentIndex(0);
			defPic = ui->drdw_pictures->currentText();
			//save the now new logo as default into Map and onto disk
			save_client_logo_from_ui();
		}
		//load the pic on the gui
		on_drdw_pictures_activated(defPic);

		//delete: no
	} else {
		print_customer_info("no logo has been deleted!");
		return;
	}
}


