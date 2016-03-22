/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.5.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QGroupBox *gb_network;
    QLabel *lb_network_ip;
    QLabel *lb_network_netmask;
    QLabel *lb_network_gateway;
    QLineEdit *txb_network_ip;
    QLineEdit *txb_network_netmask;
    QLineEdit *txb_network_gateway;
    QRadioButton *rdb_network_type_dhcp;
    QRadioButton *rdb_network_type_static;
    QPushButton *btn_change_network;
    QLabel *lb_network_dns;
    QLineEdit *txb_network_dns;
    QGroupBox *gb_wlan;
    QLabel *lb_wlan_ssid;
    QLabel *lb_wlan_passwd;
    QLineEdit *txb_wlan_ssid;
    QLineEdit *txb_wlan_passwd;
    QPushButton *btn_change_wlan;
    QCheckBox *chk_wlan_active;
    QPushButton *btn_cancel;
    QComboBox *drdw_profiles;
    QLabel *lb_drdw_profiles;
    QPushButton *btn_save_quit;
    QPushButton *btn_profile_delete;
    QLabel *lb_picture_left;
    QLabel *lb_picture_right;
    QPushButton *btn_new_profile;
    QGroupBox *gb_citrix_rdp;
    QLabel *lb_citrix_rdp_citrix_store;
    QLineEdit *txb_citrix_rdp_citrix_store;
    QPushButton *btn_change_citrix_rdp;
    QLineEdit *txb_citrix_rdp_rdp_domain;
    QLabel *lb_citrix_rdp_rdp_domain;
    QLineEdit *txb_citrix_rdp_rdp_server;
    QLabel *lb_citrix_rdp_rdp_server;
    QLineEdit *txb_citrix_rdp_citrix_url;
    QLabel *lb_citrix_rdp_citrix_url;
    QRadioButton *rdb_citrix_rdp_type_citrix;
    QRadioButton *rdb_citrix_rdp_type_rdp;
    QGroupBox *gb_wlan_2;
    QPushButton *btn_pictures;
    QComboBox *drdw_pictures;
    QPushButton *btn_pictures_delete;
    QLabel *lb_wlan_ssid_3;
    QPushButton *btn_certificates;
    QMenuBar *menuBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(862, 768);
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(MainWindow->sizePolicy().hasHeightForWidth());
        MainWindow->setSizePolicy(sizePolicy);
        MainWindow->setMinimumSize(QSize(0, 0));
        MainWindow->setLayoutDirection(Qt::LeftToRight);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        centralWidget->setAutoFillBackground(false);
        gb_network = new QGroupBox(centralWidget);
        gb_network->setObjectName(QStringLiteral("gb_network"));
        gb_network->setEnabled(true);
        gb_network->setGeometry(QRect(20, 140, 831, 161));
        gb_network->setAutoFillBackground(false);
        gb_network->setFlat(false);
        gb_network->setCheckable(false);
        lb_network_ip = new QLabel(gb_network);
        lb_network_ip->setObjectName(QStringLiteral("lb_network_ip"));
        lb_network_ip->setGeometry(QRect(152, 13, 67, 20));
        lb_network_netmask = new QLabel(gb_network);
        lb_network_netmask->setObjectName(QStringLiteral("lb_network_netmask"));
        lb_network_netmask->setGeometry(QRect(110, 53, 67, 17));
        lb_network_gateway = new QLabel(gb_network);
        lb_network_gateway->setObjectName(QStringLiteral("lb_network_gateway"));
        lb_network_gateway->setGeometry(QRect(110, 93, 67, 17));
        txb_network_ip = new QLineEdit(gb_network);
        txb_network_ip->setObjectName(QStringLiteral("txb_network_ip"));
        txb_network_ip->setGeometry(QRect(230, 10, 201, 27));
        txb_network_netmask = new QLineEdit(gb_network);
        txb_network_netmask->setObjectName(QStringLiteral("txb_network_netmask"));
        txb_network_netmask->setGeometry(QRect(230, 50, 201, 27));
        txb_network_gateway = new QLineEdit(gb_network);
        txb_network_gateway->setObjectName(QStringLiteral("txb_network_gateway"));
        txb_network_gateway->setGeometry(QRect(230, 90, 201, 27));
        rdb_network_type_dhcp = new QRadioButton(gb_network);
        rdb_network_type_dhcp->setObjectName(QStringLiteral("rdb_network_type_dhcp"));
        rdb_network_type_dhcp->setGeometry(QRect(440, 10, 61, 22));
        rdb_network_type_static = new QRadioButton(gb_network);
        rdb_network_type_static->setObjectName(QStringLiteral("rdb_network_type_static"));
        rdb_network_type_static->setGeometry(QRect(510, 10, 71, 22));
        btn_change_network = new QPushButton(gb_network);
        btn_change_network->setObjectName(QStringLiteral("btn_change_network"));
        btn_change_network->setGeometry(QRect(690, 130, 130, 27));
        lb_network_dns = new QLabel(gb_network);
        lb_network_dns->setObjectName(QStringLiteral("lb_network_dns"));
        lb_network_dns->setGeometry(QRect(140, 133, 67, 17));
        txb_network_dns = new QLineEdit(gb_network);
        txb_network_dns->setObjectName(QStringLiteral("txb_network_dns"));
        txb_network_dns->setGeometry(QRect(230, 130, 201, 27));
        gb_wlan = new QGroupBox(centralWidget);
        gb_wlan->setObjectName(QStringLiteral("gb_wlan"));
        gb_wlan->setGeometry(QRect(20, 320, 831, 111));
        lb_wlan_ssid = new QLabel(gb_wlan);
        lb_wlan_ssid->setObjectName(QStringLiteral("lb_wlan_ssid"));
        lb_wlan_ssid->setGeometry(QRect(140, 43, 41, 17));
        lb_wlan_passwd = new QLabel(gb_wlan);
        lb_wlan_passwd->setObjectName(QStringLiteral("lb_wlan_passwd"));
        lb_wlan_passwd->setGeometry(QRect(110, 83, 81, 20));
        txb_wlan_ssid = new QLineEdit(gb_wlan);
        txb_wlan_ssid->setObjectName(QStringLiteral("txb_wlan_ssid"));
        txb_wlan_ssid->setGeometry(QRect(230, 40, 201, 27));
        txb_wlan_ssid->setMaxLength(32767);
        txb_wlan_passwd = new QLineEdit(gb_wlan);
        txb_wlan_passwd->setObjectName(QStringLiteral("txb_wlan_passwd"));
        txb_wlan_passwd->setGeometry(QRect(230, 80, 201, 27));
        txb_wlan_passwd->setMaxLength(64);
        txb_wlan_passwd->setEchoMode(QLineEdit::PasswordEchoOnEdit);
        btn_change_wlan = new QPushButton(gb_wlan);
        btn_change_wlan->setObjectName(QStringLiteral("btn_change_wlan"));
        btn_change_wlan->setGeometry(QRect(690, 80, 130, 27));
        chk_wlan_active = new QCheckBox(gb_wlan);
        chk_wlan_active->setObjectName(QStringLiteral("chk_wlan_active"));
        chk_wlan_active->setGeometry(QRect(230, 10, 97, 22));
        btn_cancel = new QPushButton(centralWidget);
        btn_cancel->setObjectName(QStringLiteral("btn_cancel"));
        btn_cancel->setGeometry(QRect(550, 710, 130, 27));
        drdw_profiles = new QComboBox(centralWidget);
        drdw_profiles->setObjectName(QStringLiteral("drdw_profiles"));
        drdw_profiles->setGeometry(QRect(250, 90, 201, 31));
        lb_drdw_profiles = new QLabel(centralWidget);
        lb_drdw_profiles->setObjectName(QStringLiteral("lb_drdw_profiles"));
        lb_drdw_profiles->setGeometry(QRect(140, 103, 81, 21));
        btn_save_quit = new QPushButton(centralWidget);
        btn_save_quit->setObjectName(QStringLiteral("btn_save_quit"));
        btn_save_quit->setGeometry(QRect(710, 710, 130, 27));
        btn_profile_delete = new QPushButton(centralWidget);
        btn_profile_delete->setObjectName(QStringLiteral("btn_profile_delete"));
        btn_profile_delete->setEnabled(false);
        btn_profile_delete->setGeometry(QRect(530, 90, 61, 31));
        btn_profile_delete->setCheckable(false);
        lb_picture_left = new QLabel(centralWidget);
        lb_picture_left->setObjectName(QStringLiteral("lb_picture_left"));
        lb_picture_left->setGeometry(QRect(20, 10, 100, 100));
        lb_picture_right = new QLabel(centralWidget);
        lb_picture_right->setObjectName(QStringLiteral("lb_picture_right"));
        lb_picture_right->setGeometry(QRect(740, 10, 100, 100));
        btn_new_profile = new QPushButton(centralWidget);
        btn_new_profile->setObjectName(QStringLiteral("btn_new_profile"));
        btn_new_profile->setEnabled(false);
        btn_new_profile->setGeometry(QRect(470, 90, 41, 31));
        gb_citrix_rdp = new QGroupBox(centralWidget);
        gb_citrix_rdp->setObjectName(QStringLiteral("gb_citrix_rdp"));
        gb_citrix_rdp->setGeometry(QRect(20, 450, 831, 151));
        lb_citrix_rdp_citrix_store = new QLabel(gb_citrix_rdp);
        lb_citrix_rdp_citrix_store->setObjectName(QStringLiteral("lb_citrix_rdp_citrix_store"));
        lb_citrix_rdp_citrix_store->setGeometry(QRect(110, 40, 71, 20));
        txb_citrix_rdp_citrix_store = new QLineEdit(gb_citrix_rdp);
        txb_citrix_rdp_citrix_store->setObjectName(QStringLiteral("txb_citrix_rdp_citrix_store"));
        txb_citrix_rdp_citrix_store->setGeometry(QRect(230, 37, 201, 27));
        txb_citrix_rdp_citrix_store->setMaxLength(32767);
        btn_change_citrix_rdp = new QPushButton(gb_citrix_rdp);
        btn_change_citrix_rdp->setObjectName(QStringLiteral("btn_change_citrix_rdp"));
        btn_change_citrix_rdp->setGeometry(QRect(690, 120, 130, 27));
        txb_citrix_rdp_rdp_domain = new QLineEdit(gb_citrix_rdp);
        txb_citrix_rdp_rdp_domain->setObjectName(QStringLiteral("txb_citrix_rdp_rdp_domain"));
        txb_citrix_rdp_rdp_domain->setGeometry(QRect(620, 80, 201, 27));
        txb_citrix_rdp_rdp_domain->setMaxLength(32767);
        lb_citrix_rdp_rdp_domain = new QLabel(gb_citrix_rdp);
        lb_citrix_rdp_rdp_domain->setObjectName(QStringLiteral("lb_citrix_rdp_rdp_domain"));
        lb_citrix_rdp_rdp_domain->setGeometry(QRect(483, 83, 91, 20));
        txb_citrix_rdp_rdp_server = new QLineEdit(gb_citrix_rdp);
        txb_citrix_rdp_rdp_server->setObjectName(QStringLiteral("txb_citrix_rdp_rdp_server"));
        txb_citrix_rdp_rdp_server->setGeometry(QRect(620, 40, 201, 27));
        txb_citrix_rdp_rdp_server->setMaxLength(32767);
        lb_citrix_rdp_rdp_server = new QLabel(gb_citrix_rdp);
        lb_citrix_rdp_rdp_server->setObjectName(QStringLiteral("lb_citrix_rdp_rdp_server"));
        lb_citrix_rdp_rdp_server->setGeometry(QRect(490, 43, 81, 20));
        txb_citrix_rdp_citrix_url = new QLineEdit(gb_citrix_rdp);
        txb_citrix_rdp_citrix_url->setObjectName(QStringLiteral("txb_citrix_rdp_citrix_url"));
        txb_citrix_rdp_citrix_url->setGeometry(QRect(230, 77, 201, 27));
        txb_citrix_rdp_citrix_url->setMaxLength(32767);
        lb_citrix_rdp_citrix_url = new QLabel(gb_citrix_rdp);
        lb_citrix_rdp_citrix_url->setObjectName(QStringLiteral("lb_citrix_rdp_citrix_url"));
        lb_citrix_rdp_citrix_url->setGeometry(QRect(120, 80, 71, 20));
        rdb_citrix_rdp_type_citrix = new QRadioButton(centralWidget);
        rdb_citrix_rdp_type_citrix->setObjectName(QStringLiteral("rdb_citrix_rdp_type_citrix"));
        rdb_citrix_rdp_type_citrix->setGeometry(QRect(250, 460, 61, 22));
        rdb_citrix_rdp_type_rdp = new QRadioButton(centralWidget);
        rdb_citrix_rdp_type_rdp->setObjectName(QStringLiteral("rdb_citrix_rdp_type_rdp"));
        rdb_citrix_rdp_type_rdp->setGeometry(QRect(640, 460, 71, 22));
        gb_wlan_2 = new QGroupBox(centralWidget);
        gb_wlan_2->setObjectName(QStringLiteral("gb_wlan_2"));
        gb_wlan_2->setGeometry(QRect(20, 620, 831, 81));
        btn_pictures = new QPushButton(gb_wlan_2);
        btn_pictures->setObjectName(QStringLiteral("btn_pictures"));
        btn_pictures->setGeometry(QRect(690, 10, 130, 27));
        drdw_pictures = new QComboBox(gb_wlan_2);
        drdw_pictures->setObjectName(QStringLiteral("drdw_pictures"));
        drdw_pictures->setGeometry(QRect(230, 10, 201, 27));
        btn_pictures_delete = new QPushButton(gb_wlan_2);
        btn_pictures_delete->setObjectName(QStringLiteral("btn_pictures_delete"));
        btn_pictures_delete->setEnabled(true);
        btn_pictures_delete->setGeometry(QRect(230, 50, 201, 26));
        btn_pictures_delete->setCheckable(false);
        lb_wlan_ssid_3 = new QLabel(gb_wlan_2);
        lb_wlan_ssid_3->setObjectName(QStringLiteral("lb_wlan_ssid_3"));
        lb_wlan_ssid_3->setGeometry(QRect(80, 30, 111, 20));
        btn_certificates = new QPushButton(gb_wlan_2);
        btn_certificates->setObjectName(QStringLiteral("btn_certificates"));
        btn_certificates->setGeometry(QRect(690, 50, 130, 27));
        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 862, 19));
        MainWindow->setMenuBar(menuBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "configuration page", 0));
        gb_network->setTitle(QApplication::translate("MainWindow", "Network", 0));
        lb_network_ip->setText(QApplication::translate("MainWindow", "IP :", 0));
        lb_network_netmask->setText(QApplication::translate("MainWindow", "Netmask :", 0));
        lb_network_gateway->setText(QApplication::translate("MainWindow", "Gateway :", 0));
        txb_network_ip->setText(QApplication::translate("MainWindow", "default", 0));
        txb_network_netmask->setText(QApplication::translate("MainWindow", "default", 0));
        txb_network_gateway->setText(QApplication::translate("MainWindow", "default", 0));
        rdb_network_type_dhcp->setText(QApplication::translate("MainWindow", "dhcp", 0));
        rdb_network_type_static->setText(QApplication::translate("MainWindow", "static", 0));
        btn_change_network->setText(QApplication::translate("MainWindow", "change Network", 0));
        lb_network_dns->setText(QApplication::translate("MainWindow", "DNS:", 0));
        txb_network_dns->setText(QApplication::translate("MainWindow", "default", 0));
        gb_wlan->setTitle(QApplication::translate("MainWindow", "WLan", 0));
        lb_wlan_ssid->setText(QApplication::translate("MainWindow", "SSID :", 0));
        lb_wlan_passwd->setText(QApplication::translate("MainWindow", "Password :", 0));
        txb_wlan_ssid->setText(QApplication::translate("MainWindow", "default", 0));
        txb_wlan_passwd->setText(QApplication::translate("MainWindow", "deafult", 0));
        btn_change_wlan->setText(QApplication::translate("MainWindow", "change WLan", 0));
        chk_wlan_active->setText(QApplication::translate("MainWindow", "active ?", 0));
        btn_cancel->setText(QApplication::translate("MainWindow", "&Cancel", 0));
        lb_drdw_profiles->setText(QApplication::translate("MainWindow", "Profiles:", 0));
        btn_save_quit->setText(QApplication::translate("MainWindow", "Save && &Quit", 0));
        btn_profile_delete->setText(QApplication::translate("MainWindow", "delete ", 0));
        lb_picture_left->setText(QApplication::translate("MainWindow", "TextLabel", 0));
        lb_picture_right->setText(QApplication::translate("MainWindow", "TextLabel", 0));
        btn_new_profile->setText(QApplication::translate("MainWindow", "new", 0));
        gb_citrix_rdp->setTitle(QApplication::translate("MainWindow", "Citrix && RDP", 0));
        lb_citrix_rdp_citrix_store->setText(QApplication::translate("MainWindow", "Citrix-Store:", 0));
        txb_citrix_rdp_citrix_store->setText(QApplication::translate("MainWindow", "default", 0));
        btn_change_citrix_rdp->setText(QApplication::translate("MainWindow", "change Citrix && RDP", 0));
        txb_citrix_rdp_rdp_domain->setText(QApplication::translate("MainWindow", "default", 0));
        lb_citrix_rdp_rdp_domain->setText(QApplication::translate("MainWindow", "RDP-Domain:", 0));
        txb_citrix_rdp_rdp_server->setText(QApplication::translate("MainWindow", "default", 0));
        lb_citrix_rdp_rdp_server->setText(QApplication::translate("MainWindow", "RDP-Server:", 0));
        txb_citrix_rdp_citrix_url->setText(QApplication::translate("MainWindow", "default", 0));
        lb_citrix_rdp_citrix_url->setText(QApplication::translate("MainWindow", "Citrix-URL:", 0));
        rdb_citrix_rdp_type_citrix->setText(QApplication::translate("MainWindow", "Citrix", 0));
        rdb_citrix_rdp_type_rdp->setText(QApplication::translate("MainWindow", "RDP", 0));
        gb_wlan_2->setTitle(QApplication::translate("MainWindow", "Logo && Certificate", 0));
        btn_pictures->setText(QApplication::translate("MainWindow", "upload Logo", 0));
        btn_pictures_delete->setText(QApplication::translate("MainWindow", "delete current Logo", 0));
        lb_wlan_ssid_3->setText(QApplication::translate("MainWindow", "Configure Logo:", 0));
        btn_certificates->setText(QApplication::translate("MainWindow", "upload Certificate", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
