#-------------------------------------------------
#
# Project created by QtCreator 2015-12-01T12:06:16
#
#-------------------------------------------------

QT       += core gui
CONFIG   += c++11

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET   = ConfigPage
TEMPLATE = app


SOURCES  +=  main.cpp                   \
             mainwindow.cpp             \
             src/profile.cpp            \
             src/parameter_return.cpp   \
             src/setting.cpp            \
             src/error.cpp              \
             src/proxyModel.cpp

HEADERS  +=  mainwindow.h               \
             inc/profile.h              \
             inc/parameter_return.h     \
             inc/setting.h              \
             inc/errorMsg.hpp           \
             inc/proxyModel.h

FORMS    +=  mainwindow.ui
