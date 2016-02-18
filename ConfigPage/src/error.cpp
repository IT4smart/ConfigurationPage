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
  |* 				error.cpp				      *|
  |******************************************************************************|
  \******************************************************************************/
#include <QObject>
#include "../inc/errorMsg.h"

QMessageBox::StandardButton criticalMessage(QWidget * parent,
					    const QString & message)
{
    return QMessageBox::critical(parent,
				 QObject::tr("configuration page"),
				 message,
				 QMessageBox::Abort
				 | QMessageBox::Retry
				 | QMessageBox::Ignore);
}

QMessageBox::StandardButton informationMessage(QWidget * parent,
					       const QString & message)
{
    return QMessageBox::information(parent,
				    QObject::tr("configuration page"),
				    message);
}

QMessageBox::StandardButton questionMessage(QWidget * parent,
					    const QString & message)
{
    return QMessageBox::question(parent,
				 QObject::tr("configuration page"),
				 message,
				 QMessageBox::Yes | QMessageBox::No);
}

int warningMessage(QWidget * parent, const QString & message)
{
    QMessageBox msgBox(QMessageBox::Warning,
		       QObject::tr("configuration page"),
		       message, 0, parent);
    msgBox.addButton(QObject::tr("Save &Again"), QMessageBox::AcceptRole);
    msgBox.addButton(QObject::tr("&Continue"), QMessageBox::RejectRole);
    return msgBox.exec();
}

void errorMessage(QWidget * parent, const QString & message)
{
    QErrorMessage errorMessageDialog(parent);
    errorMessageDialog.showMessage(message);
    errorMessageDialog.exec();
}
