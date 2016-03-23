#-------------------------------------------------
#
# Project created by QtCreator 2015-12-01T12:06:16
#
#-------------------------------------------------

QT       += core gui
CONFIG   += c++11

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

DESTDIR  = ./
TARGET   = ConfigPage
TEMPLATE = app

SOURCES  +=  main.cpp \
            mainwindow.cpp \
            ./src/error.cpp \
            ./src/mainwindow_citrix_rdp.cpp \
            ./src/mainwindow_handle_custom_exceptions.cpp \
            ./src/mainwindow_nm_network_wlan.cpp \
            ./src/mainwindow_picture.cpp \
            ./src/mainwindow_profile.cpp \
            ./src/parameter_return.cpp \
            ./src/profile.cpp \
            ./src/proxyModel.cpp \
            ../../libs/tools/src/custom_exceptions.cpp \
            ../../libs/tools/src/exec_cmd.cpp \
            ../../libs/tools/src/IniFile.cpp \
            ../../libs/tools/src/ini_parser.cpp \
            ../../libs/tools/src/maps.cpp \
            ../../libs/tools/src/remove_file.cpp \
            ../../libs/tools/src/set_permission.cpp \
            ../../libs/tools/src/setting.cpp \
            ../../libs/nm+tools/src/nm_check_functions.cpp \
            ../../libs/nm+tools/src/nm_get_functions.cpp \
            ../../libs/nm+tools/src/nm_make_file.cpp \
            ../../libs/nm+tools/src/nm_make_functions.cpp

HEADERS  +=  mainwindow.h \
            ./inc/errorMsg.h \
            ./inc/parameter_return.h \
            ./inc/profile.h \
            ./inc/proxyModel.h \
            ../../libs/tools/inc/custom_exceptions.h \
            ../../libs/tools/inc/exec_cmd.h \
            ../../libs/tools/inc/IniFile.h \
            ../../libs/tools/inc/ini_parser.h \
            ../../libs/tools/inc/maps.h \
            ../../libs/tools/inc/remove_file.h \
            ../../libs/tools/inc/set_permission.h \
            ../../libs/tools/inc/setting.h \
            ../../libs/nm+tools/inc/nm_check_functions.h \
            ../../libs/nm+tools/inc/nm_get_functions.h \
            ../../libs/nm+tools/inc/nm_make_file.h \
            ../../libs/nm+tools/inc/nm_make_functions.h

FORMS    +=  mainwindow.ui
