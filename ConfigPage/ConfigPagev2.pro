#-------------------------------------------------
#
# Project created by QtCreator 2016-06-03T23:12:44
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = ConfigPagev2
TEMPLATE = app

CONFIG += c++11

SOURCES += main.cpp\
        mainwindow.cpp \
    exec_cmd.cpp \
    proxymodel.cpp

HEADERS  += mainwindow.h \
    exec_cmd.h \
    proxymodel.h

FORMS    += mainwindow.ui
