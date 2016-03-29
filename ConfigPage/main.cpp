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
 * 				main.cpp				      *|
 ******************************************************************************|
 ******************************************************************************/

#include <QApplication>
#include <QWidget>
#include <QDesktopWidget>
#include <iostream>
#include "mainwindow.h"
#include "./inc/parameter_return.h"
#include "../../libs/tools/inc/custom_exceptions.h" //for the debug <<


int main(int argc, char *argv[])
{
	//only the executable without arguments	
	if (argc == 1) {
		QApplication a(argc, argv);
		MainWindow w;
		//for fullscreen:
		//w.setWindowState(Qt::WindowFullScreen);
		//alternative//w.setWindowState(Qt::WindowMaximized);
		//to move the window on the screen://w.move(a.desktop()->screen()->rect().center() - w.rect().center());
		w.show();

		return a.exec();

	//the executable with ONE argument
	} else if (argc == 2) {
		parameter_return(argv[0], argv[1]);
	} else if (argc == 3) {
		set_parameter(argv[0], argv[1], argv[2]);
	} else {
		std::cout << "Too many arguments, see:" << std::endl;
		parameter_return(argv[0], "-h");
	}
	return 0;
}
