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
#include <QtWidgets/QFrame>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QGroupBox *gbx_network;
    QGridLayout *gridLayout_2;
    QLabel *lbl_dns;
    QLabel *lbl_gateway;
    QLabel *lbl_ip;
    QLabel *lbl_network_type;
    QLineEdit *txt_ip;
    QLabel *label;
    QLineEdit *txt_gateway;
    QLineEdit *txt_netmask;
    QRadioButton *rbn_static;
    QRadioButton *rbn_dhcp;
    QLineEdit *txt_dns;
    QGroupBox *gbx_vdi;
    QGridLayout *gridLayout_3;
    QLineEdit *txt_rdp_server;
    QFrame *line_2;
    QLineEdit *txt_netscaler;
    QLabel *lbl_netscaler;
    QLabel *lbl_vdi_type;
    QLabel *lbl_rdp;
    QLabel *lbl_rdp_server;
    QRadioButton *rbn_citrix;
    QLineEdit *txt_storefront;
    QRadioButton *rbn_rdp;
    QLineEdit *txt_rdp_domain;
    QFrame *line;
    QLabel *lbl_storefront;
    QLabel *lbl_rdp_domain;
    QLabel *label_2;
    QGroupBox *gbx_certificates;
    QPushButton *btn_save;
    QPushButton *btn_cancel;
    QPushButton *btn_upload_cert;
    QToolBar *mainToolBar;
    QMenuBar *menuBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(862, 768);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        gbx_network = new QGroupBox(centralWidget);
        gbx_network->setObjectName(QStringLiteral("gbx_network"));
        gbx_network->setGeometry(QRect(9, 9, 521, 190));
        gridLayout_2 = new QGridLayout(gbx_network);
        gridLayout_2->setSpacing(6);
        gridLayout_2->setContentsMargins(11, 11, 11, 11);
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        lbl_dns = new QLabel(gbx_network);
        lbl_dns->setObjectName(QStringLiteral("lbl_dns"));

        gridLayout_2->addWidget(lbl_dns, 5, 0, 1, 1);

        lbl_gateway = new QLabel(gbx_network);
        lbl_gateway->setObjectName(QStringLiteral("lbl_gateway"));

        gridLayout_2->addWidget(lbl_gateway, 1, 0, 1, 2);

        lbl_ip = new QLabel(gbx_network);
        lbl_ip->setObjectName(QStringLiteral("lbl_ip"));

        gridLayout_2->addWidget(lbl_ip, 0, 0, 1, 2);

        lbl_network_type = new QLabel(gbx_network);
        lbl_network_type->setObjectName(QStringLiteral("lbl_network_type"));

        gridLayout_2->addWidget(lbl_network_type, 6, 0, 1, 1);

        txt_ip = new QLineEdit(gbx_network);
        txt_ip->setObjectName(QStringLiteral("txt_ip"));

        gridLayout_2->addWidget(txt_ip, 0, 2, 1, 2);

        label = new QLabel(gbx_network);
        label->setObjectName(QStringLiteral("label"));

        gridLayout_2->addWidget(label, 2, 0, 2, 2);

        txt_gateway = new QLineEdit(gbx_network);
        txt_gateway->setObjectName(QStringLiteral("txt_gateway"));

        gridLayout_2->addWidget(txt_gateway, 1, 2, 1, 2);

        txt_netmask = new QLineEdit(gbx_network);
        txt_netmask->setObjectName(QStringLiteral("txt_netmask"));

        gridLayout_2->addWidget(txt_netmask, 2, 2, 2, 2);

        rbn_static = new QRadioButton(gbx_network);
        rbn_static->setObjectName(QStringLiteral("rbn_static"));

        gridLayout_2->addWidget(rbn_static, 6, 3, 1, 1);

        rbn_dhcp = new QRadioButton(gbx_network);
        rbn_dhcp->setObjectName(QStringLiteral("rbn_dhcp"));

        gridLayout_2->addWidget(rbn_dhcp, 6, 2, 1, 1);

        txt_dns = new QLineEdit(gbx_network);
        txt_dns->setObjectName(QStringLiteral("txt_dns"));

        gridLayout_2->addWidget(txt_dns, 5, 2, 1, 2);

        gbx_vdi = new QGroupBox(centralWidget);
        gbx_vdi->setObjectName(QStringLiteral("gbx_vdi"));
        gbx_vdi->setGeometry(QRect(15, 223, 521, 254));
        gridLayout_3 = new QGridLayout(gbx_vdi);
        gridLayout_3->setSpacing(6);
        gridLayout_3->setContentsMargins(11, 11, 11, 11);
        gridLayout_3->setObjectName(QStringLiteral("gridLayout_3"));
        txt_rdp_server = new QLineEdit(gbx_vdi);
        txt_rdp_server->setObjectName(QStringLiteral("txt_rdp_server"));

        gridLayout_3->addWidget(txt_rdp_server, 8, 1, 1, 2);

        line_2 = new QFrame(gbx_vdi);
        line_2->setObjectName(QStringLiteral("line_2"));
        line_2->setFrameShape(QFrame::HLine);
        line_2->setFrameShadow(QFrame::Sunken);

        gridLayout_3->addWidget(line_2, 5, 0, 1, 3);

        txt_netscaler = new QLineEdit(gbx_vdi);
        txt_netscaler->setObjectName(QStringLiteral("txt_netscaler"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(txt_netscaler->sizePolicy().hasHeightForWidth());
        txt_netscaler->setSizePolicy(sizePolicy);

        gridLayout_3->addWidget(txt_netscaler, 3, 1, 1, 2);

        lbl_netscaler = new QLabel(gbx_vdi);
        lbl_netscaler->setObjectName(QStringLiteral("lbl_netscaler"));

        gridLayout_3->addWidget(lbl_netscaler, 3, 0, 1, 1);

        lbl_vdi_type = new QLabel(gbx_vdi);
        lbl_vdi_type->setObjectName(QStringLiteral("lbl_vdi_type"));

        gridLayout_3->addWidget(lbl_vdi_type, 0, 0, 1, 1);

        lbl_rdp = new QLabel(gbx_vdi);
        lbl_rdp->setObjectName(QStringLiteral("lbl_rdp"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        lbl_rdp->setFont(font);

        gridLayout_3->addWidget(lbl_rdp, 6, 0, 1, 1);

        lbl_rdp_server = new QLabel(gbx_vdi);
        lbl_rdp_server->setObjectName(QStringLiteral("lbl_rdp_server"));

        gridLayout_3->addWidget(lbl_rdp_server, 8, 0, 1, 1);

        rbn_citrix = new QRadioButton(gbx_vdi);
        rbn_citrix->setObjectName(QStringLiteral("rbn_citrix"));

        gridLayout_3->addWidget(rbn_citrix, 0, 1, 1, 1);

        txt_storefront = new QLineEdit(gbx_vdi);
        txt_storefront->setObjectName(QStringLiteral("txt_storefront"));

        gridLayout_3->addWidget(txt_storefront, 4, 1, 1, 2);

        rbn_rdp = new QRadioButton(gbx_vdi);
        rbn_rdp->setObjectName(QStringLiteral("rbn_rdp"));

        gridLayout_3->addWidget(rbn_rdp, 0, 2, 1, 1);

        txt_rdp_domain = new QLineEdit(gbx_vdi);
        txt_rdp_domain->setObjectName(QStringLiteral("txt_rdp_domain"));

        gridLayout_3->addWidget(txt_rdp_domain, 7, 1, 1, 2);

        line = new QFrame(gbx_vdi);
        line->setObjectName(QStringLiteral("line"));
        line->setFrameShape(QFrame::HLine);
        line->setFrameShadow(QFrame::Sunken);

        gridLayout_3->addWidget(line, 1, 0, 1, 3);

        lbl_storefront = new QLabel(gbx_vdi);
        lbl_storefront->setObjectName(QStringLiteral("lbl_storefront"));

        gridLayout_3->addWidget(lbl_storefront, 4, 0, 1, 1);

        lbl_rdp_domain = new QLabel(gbx_vdi);
        lbl_rdp_domain->setObjectName(QStringLiteral("lbl_rdp_domain"));

        gridLayout_3->addWidget(lbl_rdp_domain, 7, 0, 1, 1);

        label_2 = new QLabel(gbx_vdi);
        label_2->setObjectName(QStringLiteral("label_2"));
        QFont font1;
        font1.setPointSize(11);
        font1.setBold(true);
        font1.setWeight(75);
        label_2->setFont(font1);

        gridLayout_3->addWidget(label_2, 2, 0, 1, 1);

        gbx_certificates = new QGroupBox(centralWidget);
        gbx_certificates->setObjectName(QStringLiteral("gbx_certificates"));
        gbx_certificates->setGeometry(QRect(15, 483, 838, 28));
        btn_save = new QPushButton(centralWidget);
        btn_save->setObjectName(QStringLiteral("btn_save"));
        btn_save->setGeometry(QRect(580, 650, 163, 27));
        btn_cancel = new QPushButton(centralWidget);
        btn_cancel->setObjectName(QStringLiteral("btn_cancel"));
        btn_cancel->setGeometry(QRect(40, 650, 93, 27));
        btn_upload_cert = new QPushButton(centralWidget);
        btn_upload_cert->setObjectName(QStringLiteral("btn_upload_cert"));
        btn_upload_cert->setGeometry(QRect(70, 520, 211, 27));
        MainWindow->setCentralWidget(centralWidget);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 862, 25));
        MainWindow->setMenuBar(menuBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "Konfiguration ThinClient", 0));
        gbx_network->setTitle(QApplication::translate("MainWindow", "Netzwerk", 0));
        lbl_dns->setText(QApplication::translate("MainWindow", "DNS:", 0));
        lbl_gateway->setText(QApplication::translate("MainWindow", "Gateway:", 0));
        lbl_ip->setText(QApplication::translate("MainWindow", "IP:", 0));
        lbl_network_type->setText(QApplication::translate("MainWindow", "Typ:", 0));
        label->setText(QApplication::translate("MainWindow", "Netzmaske:", 0));
        rbn_static->setText(QApplication::translate("MainWindow", "Statisch", 0));
        rbn_dhcp->setText(QApplication::translate("MainWindow", "DHCP", 0));
        gbx_vdi->setTitle(QApplication::translate("MainWindow", "Citrix && RDP", 0));
        lbl_netscaler->setText(QApplication::translate("MainWindow", "Netscaler Gateway:", 0));
        lbl_vdi_type->setText(QApplication::translate("MainWindow", "Typ:", 0));
        lbl_rdp->setText(QApplication::translate("MainWindow", "RDP:", 0));
        lbl_rdp_server->setText(QApplication::translate("MainWindow", "Server:", 0));
        rbn_citrix->setText(QApplication::translate("MainWindow", "Citrix", 0));
        rbn_rdp->setText(QApplication::translate("MainWindow", "RDP", 0));
        lbl_storefront->setText(QApplication::translate("MainWindow", "Storefront - Server:", 0));
        lbl_rdp_domain->setText(QApplication::translate("MainWindow", "Dom\303\244ne:", 0));
        label_2->setText(QApplication::translate("MainWindow", "Citrix:", 0));
        gbx_certificates->setTitle(QApplication::translate("MainWindow", "Zertifikate", 0));
        btn_save->setText(QApplication::translate("MainWindow", "Speichern", 0));
        btn_cancel->setText(QApplication::translate("MainWindow", "Abbrechen", 0));
        btn_upload_cert->setText(QApplication::translate("MainWindow", "Zertifikate hochladen", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
