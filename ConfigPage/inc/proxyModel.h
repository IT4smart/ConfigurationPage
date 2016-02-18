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
 * 				proxyModel.h				      *|
 ******************************************************************************|
 ******************************************************************************/


#ifndef FileSystemModelDialog_H
#define FileSystemModelDialog_H

#include <QLabel>
#include <QDialog>
#include <QComboBox>
#include <QFileSystemModel>
#include <QTreeView>
#include <QDialogButtonBox>
#include <QVBoxLayout>

class FileSystemModelDialog : public QDialog
{
	Q_OBJECT

	public:
		// delete the copy contructors, because they are not needed and
		// otherwise there will be problems with the copying of the ui* pointer
		FileSystemModelDialog(const FileSystemModelDialog&) = delete;
		FileSystemModelDialog* operator=(const FileSystemModelDialog&) = delete;
		FileSystemModelDialog(QWidget *parent = 0,const QString& usb_path = QString::null,
				const QString& out_path = QString::null,
				bool isCertificate = true,QComboBox *cb = NULL,QLabel *lb = NULL);
		~FileSystemModelDialog();

	private:
		QString mPath;
		bool isCertificates;
		QFileSystemModel *dirFilModel;
		QTreeView *treeView;
		QDialogButtonBox *buttonBox;
		QComboBox * pcb;
		QLabel *plb;

	private slots:
		void accept();
		void reject();
		//void model_directoryLoaded(const QString &path);

	signals:
		void signalPictureAdd(const QString &logo);
};

#endif // FileSystemModelDialog_H
