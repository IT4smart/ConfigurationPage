#/*******************************************************************************
#* Copyright (c) 2016, Andreas Thomas Haller, Cedrique Tassi
#* All rights reserved.
#*
#* Redistribution and use in source and binary forms, with or without
#* modification, are permitted provided that the following conditions are met:
#*    1. Redistributions of source code must retain the above copyright
#*       notice, this list of conditions and the following disclaimer.
#*    2. Redistributions in binary form must reproduce the above copyright
#*       notice, this list of conditions and the following disclaimer in the
#*       documentation and/or other materials provided with the distribution.
#*    3. The name of the authors may not be used to endorse or promote products
#*       derived from this software without specific prior written permission.
#*
#* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#* DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
#* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#*******************************************************************************/
 

project(ConfigPage)
cmake_minimum_required(VERSION 3.0)

# The version number.
set (VERSION_MAJOR 1)
set (VERSION_MINOR 0)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
#-Weffc++ throws too many error with Qt standard MainWindows
add_definitions ("-std=c++14 -Wall -Wextra -Weffc++ -pedantic")
#add_definitions ("-g -std=c++11 -Wall -Wextra -pedantic")

#debug
add_definitions (" -g ")
add_definitions (-DCMAKE_BUILD_TYPE=Debug)



# Find includes in corresponding build directories
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

# Find the QtWidgets library
#hunter_add_package(Qt COMPONENTS qtdeclarative)
find_package(Qt5Widgets REQUIRED)
#find_package(Qt5Declarative)
#find_package(OpenGL REQUIRED)

add_definitions(-DGLEW_STATIC)


qt5_wrap_ui(UI_HEADERS mainwindow.ui)
#qt5_add_resources(UI_RESOURCES bsed.qrc)
qt5_add_resources(UI_RESOURCES )

#Explaination: Generate a list of files that match the <globbing-expressions> and store it into the <variable>. Globbing expressions are similar to regular expressions, but much simpler. If RELATIVE flag is specified, the results will be returned as relative paths to the given path.
#grep all sourcefiles
file(GLOB SOURCE_FILE 
	"./src/*.cpp"
	)
file(GLOB HEADER_FILE 
	"./inc/*.hpp"
	"./inc/*.h"
	)
#make a library out of the used files named: 
add_library(
	#name:
	ConfigPage_LIB
	#sources and headers: (except the main.cpp)
	mainwindow.cpp
	mainwindow.h
	ui_mainwindow.h
	${SOURCE_FILE}
	${HEADER_FILE}
	)
#use these modules in the library
qt5_use_modules(ConfigPage_LIB Widgets)

add_executable(
	ConfigPage
	main.cpp
	${UI_HEADERS}
	${UI_RESOURCES}
	)

target_link_libraries(
	ConfigPage
	ConfigPage_LIB
	)


#set(MACOSX_BUNDLE_ICON_FILE BSEd.icns)
#SET_SOURCE_FILES_PROPERTIES(
#	BSEd.icns
#	PROPERTIES
#	)

#target_link_libraries(
#	BSEd Bullet glew LibPng LibZLib
#	Polyvox voxcol voxcore voxdata voxmath voxrend voxscene
#	${OPENGL_LIBRARY}
#	make_test Widgets
#	${Qt5Core_QTMAIN_LIBRARIES}
#	)




#qt5_use_modules(BSEd Widgets OpenGL)
qt5_use_modules(ConfigPage Widgets)


#add_executable(hello_world main.cpp mainwindow.cpp)
#qt5_use_modules(hello_world Widgets)



###### test ######
	#If you do not want to have tests built all the time, remove
	#enable_testing()
	#and run cmake with
	#cmake . -DENABLE_TESTING=true
	#in order to build tests. 
enable_testing()

	# Find includes in corresponding build directories
	# As moc files are generated in the binary dir, tell CMake
	# to always look for includes there:
	#set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5Test REQUIRED)
	#find_package(Qt5Widgets REQUIRED)

file(GLOB TEST_SOURCE_FILE 
	"./test/*.cpp"
	)
file(GLOB TEST_HEADER_FILE 
	"./test/*.hpp"
	"./test/*.h"
	)

add_executable(
	UnitTest 
	${TEST_SOURCE_FILE}
	${TEST_HEADER_FILE}
	)

	#add_test (NAME MyTest COMMAND Test)
add_test(UnitTest UnitTest)

	#maybe needed
	#qt5_use_modules(UnitTest Widgets)


#link in the ConfigPage_LIB, so that you don't have to compile every single *.cpp twice
target_link_libraries(
	UnitTest 
	ConfigPage_LIB
	Qt5::Test)

###### test-End ######





