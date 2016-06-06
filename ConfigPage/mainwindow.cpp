#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <string>
#include <iostream>
#include <QSettings>
#include <QDebug>
#include <QFile>
#include <QFileDialog>
#include <QFileSystemModel>

// custom
#include "exec_cmd.h"
#include "proxymodel.h"


/**
 * @brief MainWindow::MainWindow
 * @param parent
 * @todo add syslog support
 */
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // read setting
    m_sSettingsFile = QApplication::applicationDirPath() + "/setting/setting.ini";
    loadSettings();


    // read profile
    m_sProfilesFile = QApplication::applicationDirPath() + "/profiles/default_profile.ini";
    loadProfiles();

    // connect button for save profile settings
    connect(this->ui->btn_save_quiet, SIGNAL(clicked()), this, SLOT(on_btn_save_quiet_clicked()));
    connect(this->ui->btn_uplod_cert, SIGNAL(clicked()), this, SLOT(on_btn_upload_cert_clicked()));

}

/**
 * @brief MainWindow::~MainWindow
 */
MainWindow::~MainWindow()
{
    delete ui;
}


/**
 * @brief MainWindow::loadSettings
 */
void MainWindow::loadSettings()
{
    QSettings settings(m_sSettingsFile, QSettings::NativeFormat);

    // load all paths
    path_certificates = settings.value("path/path_certificates").toString();
    path_scripts = settings.value("path/path_scripts").toString();
    path_usb = settings.value("path/path_usb").toString();

    // load all scripts
    script_get_dns = settings.value("script/get_dns").toString();
    script_get_gateway = settings.value("script/get_gateway").toString();
    script_get_ip_ethernet = settings.value("script/get_ip_ethernet").toString();
    script_rehash_certs = settings.value("script/rehash_certs").toString();
}


/**
 * @brief MainWindow::loadProfiles
 */
void MainWindow::loadProfiles()
{
    QSettings profiles(m_sProfilesFile, QSettings::NativeFormat);

    // check if have dhcp or a static ip
    network_type = profiles.value("network/network_type").toString();
    setNetworkUi(network_type);

    // check if we use citrix or rdp
    citrix_rdp_type = profiles.value("global/citrix_rdp_type").toString();
    QString citrix_store = profiles.value("citrix/citrix_store").toString();
    QString citrix_netscaler = profiles.value("citrix/citrix_netscaler").toString();
    QString rdp_domain = profiles.value("rdp/rdp_domain").toString();
    QString rdp_server = profiles.value("rdp/rdp_server").toString();
    setVdiUi(citrix_rdp_type, citrix_store, citrix_netscaler, rdp_domain, rdp_server);


}

/**
 * @brief MainWindow::setNetworkUi
 * @param network_type
 */
void MainWindow::setNetworkUi(QString network_type)
{
    if(QString::compare(network_type, "dhcp") == 0)
    {
        // radio button for dhcp checked
        this->ui->rbn_dhcp->setChecked(true);

        // all other textfields for network has to be disable
        this->ui->txt_ip->setDisabled(true);
        this->ui->txt_dns->setDisabled(true);
        this->ui->txt_gateway->setDisabled(true);
        this->ui->txt_netmask->setDisabled(true);

    } else {
        this->ui->rbn_static->setChecked(true);
    }

    // get current ip
    this->ui->txt_ip->setText(getNetworkIp());

    // get current dns
    this->ui->txt_dns->setText(getNetworkDns());

    // get current gateway
    this->ui->txt_gateway->setText(getNetworkGateway());

    // get current netmask
    this->ui->txt_netmask->setText(getNetworkNetmask());

    // at the moment it is not possible to change network type
    this->ui->rbn_dhcp->setDisabled(true);
    this->ui->rbn_static->setDisabled(true);
}

/**
 * @brief MainWindow::getNetworkIp
 * @return
 */
QString MainWindow::getNetworkIp()
{
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;

    command = QApplication::applicationDirPath() + path_scripts + script_get_ip_ethernet;
    qDebug() << "Script for IP: " << command;

    exec_cmd script;
    buffer = script.exec_process(command);

    qDebug() << "Error: " << buffer.second;
    qDebug() << "Result: " << buffer.first;

    std::string str_result, str_error;

    str_result = buffer.first.toStdString();
    str_error = buffer.second.toStdString();

    // convert it back to QString
    result = QString::fromStdString(str_result);

    qDebug() << "Clean result: " << result;

    // return the result
    return result;
}

/**
 * @brief MainWindow::getNetworkDns
 * @return
 */
QString MainWindow::getNetworkDns()
{
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;

    command = QApplication::applicationDirPath() + path_scripts + script_get_dns;
    qDebug() << "Script for DNS: " << command;

    exec_cmd script;
    buffer = script.exec_process(command);

    qDebug() << "Error: " << buffer.second;
    qDebug() << "Result: " << buffer.first;

    std::string str_result, str_error;

    str_result = buffer.first.toStdString();
    str_error = buffer.second.toStdString();

    // convert it back to QString
    result = QString::fromStdString(str_result);

    qDebug() << "Clean result: " << result;

    // return the result
    return result;
}

/**
 * @brief MainWindow::getNetworkGateway
 * @return
 */
QString MainWindow::getNetworkGateway()
{
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;

    command = QApplication::applicationDirPath() + path_scripts + script_get_gateway;
    qDebug() << "Script for Gateway: " << command;

    exec_cmd script;
    buffer = script.exec_process(command);

    qDebug() << "Error: " << buffer.second;
    qDebug() << "Result: " << buffer.first;

    std::string str_result, str_error;

    str_result = buffer.first.toStdString();
    str_error = buffer.second.toStdString();

    // convert it back to QString
    result = QString::fromStdString(str_result);

    qDebug() << "Clean result: " << result;

    // return the result
    return result;
}

/**
 * @brief MainWindow::getNetworkNetmask
 * @return
 * @todo    change script to return netmask as 255.255.255.0
 */
QString MainWindow::getNetworkNetmask()
{
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;

    command = QApplication::applicationDirPath() + path_scripts + script_get_netmask;
    qDebug() << "Script for Netmask: " << command;

    exec_cmd script;
    buffer = script.exec_process(command);

    qDebug() << "Error: " << buffer.second;
    qDebug() << "Result: " << buffer.first;

    std::string str_result, str_error;

    str_result = buffer.first.toStdString();
    str_error = buffer.second.toStdString();

    // convert it back to QString
    result = QString::fromStdString(str_result);

    qDebug() << "Clean result: " << result;

    // return the result
    return result;
}

/**
 * @brief MainWindow::setVdiUi
 * @param citrix_rdp_type
 * @param citrix_store
 * @param citrix_netscaler
 * @param rdp_domain
 * @param rdp_server
 */
void MainWindow::setVdiUi(QString citrix_rdp_type, QString citrix_store, QString citrix_netscaler, QString rdp_domain, QString rdp_server)
{
    if(QString::compare(citrix_rdp_type, "citrix") == 0)
    {
        // we use citrix
        // set radio button for citrix checked
        this->ui->rbn_citrix->setChecked(true);

        // set citrix store
        this->ui->txt_storefront->setText(citrix_store);

        // set citrix netscaler
        this->ui->txt_netscaler->setText(citrix_netscaler);

    } else {
        // we use rdp
        // set radio button for rdp checked
        this->ui->rbn_rdp->setChecked(true);

        // set windows domain
        this->ui->txt_rdp_domain->setText(rdp_domain);

        // set rdp server
        this->ui->txt_rdp_server->setText(rdp_server);
    }

    // but at the moment we don't use rdp
    this->ui->rbn_citrix->setDisabled(true);
    this->ui->rbn_rdp->setDisabled(true);
    this->ui->txt_rdp_domain->setDisabled(true);
    this->ui->txt_rdp_server->setDisabled(true);
}

/**
 * @brief MainWindow::RehashCerts
 */
void MainWindow::RehashCerts()
{
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;

    command = QApplication::applicationDirPath() + path_scripts + script_rehash_certs + " " + QApplication::applicationDirPath() + path_certificates + "*";
    qDebug() << "Rehash command: " << command;

    exec_cmd script;
    buffer = script.exec_process(command);

    qDebug() << "Error: " << buffer.second;
    qDebug() << "Result: " << buffer.first;

    std::string str_result, str_error;

    str_result = buffer.first.toStdString();
    str_error = buffer.second.toStdString();

    // convert it back to QString
    result = QString::fromStdString(str_result);

    qDebug() << "Clean result: " << result;
}

/******************************************************************************\
|******************************************************************************|
|* 				slots	  				      *|
|******************************************************************************|
\******************************************************************************/

void MainWindow::on_btn_upload_cert_clicked()
{
    QSettings settings(m_sSettingsFile, QSettings::NativeFormat);

    QString usb_path = settings.value("path/path_usb").toString();
    QString cert_path = settings.value("path/path_certificates").toString();
    cert_path = QApplication::applicationDirPath() + cert_path;

    FileSystemModelDialog* dialog = new FileSystemModelDialog(this, usb_path, cert_path);

    dialog->resize (700,500);
    dialog->show();
}


/**
 * @brief MainWindow::on_btn_save_quiet_clicked
 */
void MainWindow::on_btn_save_quiet_clicked()
{
    // load profiles file
    QSettings profiles(m_sProfilesFile, QSettings::NativeFormat);

    QString citrix_store, citrix_netscaler, rdp_domain, rdp_server;

    // get all informationen from textboxes
    if(this->ui->rbn_citrix->isChecked())
    {
        citrix_rdp_type = "citrix";
        citrix_store = QString::fromStdString(this->ui->txt_storefront->text().toStdString());
        citrix_netscaler = QString::fromStdString(this->ui->txt_netscaler->text().toStdString());
    } else {
        citrix_rdp_type = "rdp";
        rdp_domain = QString::fromStdString(this->ui->txt_rdp_domain->text().toStdString());
        rdp_server = QString::fromStdString(this->ui->txt_rdp_server->text().toStdString());
    }

    // we have all informationen
    // now we can prepare to store tem

    // global
    profiles.setValue("global/citrix_rdp_type", citrix_rdp_type);

    // citrix
    profiles.setValue("citrix/citrix_store", citrix_store);
    profiles.setValue("citrix/citrix_netscaler", citrix_netscaler);

    // rdp
    profiles.setValue("rdp/rdp_domain", rdp_domain);
    profiles.setValue("rdp/rdp_server", rdp_server);

    // save it
    profiles.sync();

    // rehash certificates if there are some one
    RehashCerts();


}

/**
 * @brief MainWindow::on_btn_cancel_clicked
 *  all new settings will be discard
 *  the app is closed with return 0;
 */
void MainWindow::on_btn_cancel_clicked()
{
    QApplication::quit();
}
