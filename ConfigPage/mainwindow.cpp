#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <string>
#include <iostream>
#include <QSettings>
#include <QDebug>
#include <QFile>
#include <QFileDialog>
#include <QFileSystemModel>
#include <QFileInfo>
#include <syslog.h>
#include <QProcess>


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
    //this->setCentralWidget(this->ui->gbx_network);
    ui->setupUi(this);
    setlogmask (LOG_UPTO (LOG_DEBUG));
    openlog ("IT4S-ConfigPage", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);

    // read setting
    m_sSettingsFile = QApplication::applicationDirPath() + "/setting/setting.ini";
    syslog_buffer = m_sSettingsFile.toLocal8Bit();
    syslog(LOG_NOTICE, "Open settings file %s", syslog_buffer.data());
    loadSettings();
    syslog(LOG_DEBUG, "load settings.");


    // read profile
    m_sProfilesFile = SETTINGS_PATH;
    syslog_buffer = m_sProfilesFile.toLocal8Bit();
    syslog(LOG_NOTICE, "Open profiles file %s", syslog_buffer.data());
    loadProfiles();
    syslog(LOG_DEBUG, "load profile settings.");

}

/**
 * @brief MainWindow::~MainWindow
 */
MainWindow::~MainWindow()
{
    syslog(LOG_DEBUG, "close application.");
    closelog();
    delete ui;
}


/**
 * @brief MainWindow::loadSettings
 */
void MainWindow::loadSettings()
{
    QSettings settings(m_sSettingsFile, QSettings::NativeFormat);
    syslog(LOG_DEBUG, "set settings globally.");

    // load all paths
    // certificates
    path_certificates = settings.value("path/path_certificates").toString();
    syslog(LOG_DEBUG, "set path for certificates to upload.");
    syslog_buffer = path_certificates.toLocal8Bit();
    syslog(LOG_NOTICE, "Path for certificates: %s", syslog_buffer.data());

    // scripts
    path_scripts = settings.value("path/path_scripts").toString();
    syslog(LOG_DEBUG, "set path for scripts.");
    syslog_buffer = path_scripts.toLocal8Bit();
    syslog(LOG_NOTICE, "Path for scripts: %s", syslog_buffer.data());

    // usb
    path_usb = settings.value("path/path_usb").toString();
    syslog(LOG_DEBUG, "set path for usb.");
    syslog_buffer = path_usb.toLocal8Bit();
    syslog(LOG_NOTICE, "Path for usb: %s", syslog_buffer.data());

    // load all scripts
    // dns
    script_get_dns = settings.value("script/get_dns").toString();
    syslog(LOG_DEBUG, "set script to get dns server.");
    syslog_buffer = script_get_dns.toLocal8Bit();
    syslog(LOG_NOTICE, "Script for dns server: %s", syslog_buffer.data());

    // gateway
    script_get_gateway = settings.value("script/get_gateway").toString();
    syslog(LOG_DEBUG, "set script to get gateway.");
    syslog_buffer = script_get_gateway.toLocal8Bit();
    syslog(LOG_NOTICE, "Script for gateway: %s", syslog_buffer.data());

    // ip from ethernet
    script_get_ip_ethernet = settings.value("script/get_ip_ethernet").toString();
    syslog(LOG_DEBUG, "set script to get ip from ethernet");
    syslog_buffer = script_get_ip_ethernet.toLocal8Bit();
    syslog(LOG_NOTICE, "Script for ip from ethernet: %s", syslog_buffer.data());

    // rehash certs
    script_rehash_certs = settings.value("script/rehash_certs").toString();
    syslog(LOG_DEBUG, "set script to rehash certificates after upload them.");
    syslog_buffer = script_rehash_certs.toLocal8Bit();
    syslog(LOG_NOTICE, "Script to rehash certificates: %s", syslog_buffer.data());
}


/**
 * @brief MainWindow::loadProfiles
 */
void MainWindow::loadProfiles()
{
    QSettings profiles(m_sProfilesFile, QSettings::NativeFormat);
    if (profiles.status() == QSettings::AccessError) {
        syslog(LOG_ERR, "We could not access the file.");
    }
    syslog(LOG_NOTICE, "set profile settings globally.");

    // check if have dhcp or a static ip
    // network type
    network_type = profiles.value(NETWORK_TYPE).toString();
    syslog(LOG_DEBUG, "get type of network.");
    syslog_buffer = network_type.toLocal8Bit();
    syslog(LOG_INFO, "Networktype: %s", syslog_buffer.data());

    // set ui for network
    setNetworkUi(network_type);
    syslog(LOG_NOTICE, "set networksetting on ui.");

    // check if we use citrix or rdp
    // vdi type
    citrix_rdp_type = profiles.value(CITRIX_RDP_TYPE).toString();
    syslog(LOG_DEBUG, "get type of vdi.");
    syslog_buffer = citrix_rdp_type.toLocal8Bit();
    syslog(LOG_INFO, "VDI type: %s", syslog_buffer.data());

    // citrix store
    QString citrix_store = profiles.value(STORE_URL).toString();
    syslog(LOG_DEBUG, "get citrix store.");
    syslog_buffer = citrix_store.toLocal8Bit();
    syslog(LOG_NOTICE, "citrix - Store: %s", syslog_buffer.data());

    // citrix netscaler
    QString citrix_netscaler = profiles.value(NETSCALER_URL).toString();
    syslog(LOG_DEBUG, "get citrix netscaler.");
    syslog_buffer = citrix_netscaler.toLocal8Bit();
    syslog(LOG_INFO, "Citrix - Netscaler: %s", syslog_buffer.data());

    // citrix domain
    QString citrix_domain = profiles.value(CTX_DOMAIN).toString();
    syslog(LOG_DEBUG, "get citrix domain");
    syslog_buffer = citrix_domain.toLocal8Bit();
    syslog(LOG_INFO, "Citrix - Domain: %s", syslog_buffer.data());


    // windows domain
    QString rdp_domain = profiles.value(RDP_DOMAIN).toString();
    syslog(LOG_DEBUG, "get windows domain for rdp.");
    syslog_buffer = rdp_domain.toLocal8Bit();
    syslog(LOG_INFO, "Windows domain: %s", syslog_buffer.data());

    // rdp server
    QString rdp_server = profiles.value(RDP_URL).toString();
    syslog(LOG_DEBUG, "get rdp server.");
    syslog_buffer = rdp_server.toLocal8Bit();
    syslog(LOG_INFO, "RDP - Server: %s", syslog_buffer.data());

    // set ui for vdi
    setVdiUi(citrix_rdp_type, citrix_store, citrix_netscaler, citrix_domain, rdp_domain, rdp_server);
    syslog(LOG_NOTICE, "set vdi settings on ui");

}

/**
 * @brief MainWindow::setNetworkUi
 * @param network_type
 */
void MainWindow::setNetworkUi(QString network_type)
{
    if(QString::compare(network_type, "dhcp") == 0)
    {
        // network type is dhcp

        syslog(LOG_DEBUG, "we use as network type 'dhcp'");
        // radio button for dhcp checked
        this->ui->rbn_dhcp->setChecked(true);
        syslog(LOG_DEBUG, "check radio button for dhcp");

        // all other textfields for network has to be disable
        this->ui->txt_ip->setDisabled(true);
        this->ui->txt_dns->setDisabled(true);
        this->ui->txt_gateway->setDisabled(true);
        this->ui->txt_netmask->setDisabled(true);
        syslog(LOG_DEBUG, "disable all network input fields.");

    } else {
        // network type is static
        syslog(LOG_DEBUG, "we use as network type 'static'");

        this->ui->rbn_static->setChecked(true);

        syslog(LOG_DEBUG, "all fields are enabled to insert data.");

    }

    // get current ip
    this->ui->txt_ip->setText(getNetworkIp());
    syslog(LOG_DEBUG, "get current ip of network.");
    syslog_buffer = getNetworkIp().toLocal8Bit();
    syslog(LOG_INFO, "Current ip: %s", syslog_buffer.data());

    // get current dns
    this->ui->txt_dns->setText(getNetworkDns());
    syslog(LOG_DEBUG, "get current dns.");
    syslog_buffer = getNetworkDns().toLocal8Bit();
    syslog(LOG_INFO, "Current dns: %s", syslog_buffer.data());

    // get current gateway
    this->ui->txt_gateway->setText(getNetworkGateway());
    syslog(LOG_DEBUG, "get current gateway.");
    syslog_buffer = getNetworkGateway().toLocal8Bit();
    syslog(LOG_INFO, "Current gateway: %s", syslog_buffer.data());

    // get current netmask
    this->ui->txt_netmask->setText(getNetworkNetmask());
    syslog(LOG_DEBUG, "get current netmask.");
    syslog_buffer = getNetworkNetmask().toLocal8Bit();
    syslog(LOG_INFO, "Current netmask: %s", syslog_buffer.data());

    // at the moment it is not possible to change network type
    this->ui->rbn_dhcp->setDisabled(true);
    this->ui->rbn_static->setDisabled(true);
    syslog(LOG_DEBUG, "disable radio buttons for network type.");
}

/**
 * @brief MainWindow::getNetworkIp
 * @return
 */
QString MainWindow::getNetworkIp()
{
    syslog(LOG_DEBUG, "inside function getNetworkIp().");

    // declare variables
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;
    exec_cmd script;

    // prepare command
    command = QApplication::applicationDirPath() + path_scripts + script_get_ip_ethernet;
    syslog_buffer = command.toLocal8Bit();
    syslog(LOG_DEBUG, "Script command for ip: %s", syslog_buffer.data());

    // execute script
    buffer = script.exec_process(command);

    // result
    syslog(LOG_DEBUG, "Result: %s", buffer.first.data());

    // error
    if(!buffer.second.isEmpty())
    {
        syslog(LOG_ERR, "Result: %s", buffer.second.data());
    }

    // convert it back to QString
    result = QString::fromLatin1(buffer.first);

    // return the result
    return result;
}

/**
 * @brief MainWindow::getNetworkDns
 * @return
 */
QString MainWindow::getNetworkDns()
{
    syslog(LOG_DEBUG, "inside function getNetworkDns().");

    // declare variables
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;
    exec_cmd script;

    // prepare command
    command = QApplication::applicationDirPath() + path_scripts + script_get_dns;
    syslog_buffer = command.toLocal8Bit();
    syslog(LOG_DEBUG, "Script command for dns: %s", syslog_buffer.data());

    // execute script
    buffer = script.exec_process(command);

    // result
    syslog(LOG_DEBUG, "Result: %s", buffer.first.data());

    // error
    if(!buffer.second.isEmpty())
    {
        syslog(LOG_ERR, "Result: %s", buffer.second.data());
    }


    // convert it back to QString
    result = QString::fromLatin1(buffer.first);

    // return the result
    return result;
}

/**
 * @brief MainWindow::getNetworkGateway
 * @return
 */
QString MainWindow::getNetworkGateway()
{
    syslog(LOG_DEBUG, "inside function getNetworkGateway().");

    // declare variables
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;
    exec_cmd script;

    // prepare command
    command = QApplication::applicationDirPath() + path_scripts + script_get_gateway;
    syslog_buffer = command.toLocal8Bit();
    syslog(LOG_DEBUG, "Script command for gateway: %s", syslog_buffer.data());

    // execute script
    buffer = script.exec_process(command);

    // result
    syslog(LOG_DEBUG, "Result: %s", buffer.first.data());

    // error
    if(!buffer.second.isEmpty())
    {
        syslog(LOG_ERR, "Result: %s", buffer.second.data());
    }

    // convert it back to QString
    result = QString::fromLatin1(buffer.first);


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
    syslog(LOG_DEBUG, "inside function getNetworkNetmaks().");

    // declare variables
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;
    exec_cmd script;

    // prepare command
    command = QApplication::applicationDirPath() + path_scripts + script_get_netmask;
    syslog_buffer = command.toLocal8Bit();
    syslog(LOG_DEBUG, "Script command for netmask: %s", syslog_buffer.data());

    // execute script
    buffer = script.exec_process(command);

    // result
    syslog(LOG_DEBUG, "Result: %s", buffer.first.data());

    // error
    if(!buffer.second.isEmpty())
    {
        syslog(LOG_ERR, "Result: %s", buffer.second.data());
    }

    // convert it back to QString
    result = QString::fromLatin1(buffer.first);


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
void MainWindow::setVdiUi(QString citrix_rdp_type, QString citrix_store, QString citrix_netscaler, QString citrix_domain, QString rdp_domain, QString rdp_server)
{
    if(QString::compare(citrix_rdp_type, "citrix") == 0)
    {
        // we use citrix
        syslog(LOG_DEBUG, "we use citrix");

        // we enable all fields, maybe there are disabled
        this->ui->txt_netscaler->setEnabled(true);
        this->ui->txt_storefront->setEnabled(true);
        this->ui->txt_ctx_domain->setEnabled(true);

        // set radio button for citrix checked
        this->ui->rbn_citrix->setChecked(true);
        syslog(LOG_DEBUG, "check radio button for citrix.");

        // set citrix store
        this->ui->txt_storefront->setText(citrix_store);
        syslog(LOG_DEBUG, "get current citrix store.");
        syslog_buffer = citrix_store.toLocal8Bit();
        syslog(LOG_INFO, "Current citrix store: %s", syslog_buffer.data());


        // set citrix netscaler
        this->ui->txt_netscaler->setText(citrix_netscaler);
        syslog(LOG_DEBUG, "get current citrix netscaler.");
        syslog_buffer = citrix_netscaler.toLocal8Bit();
        syslog(LOG_INFO, "Current citrix netscaler: %s", syslog_buffer.data());

        // set citrix domain
        this->ui->txt_ctx_domain->setText(citrix_domain);
        syslog(LOG_DEBUG, "get current citrix domain.");
        syslog_buffer = citrix_domain.toLocal8Bit();
        syslog(LOG_INFO, "Current citrix domain: %s", syslog_buffer.data());

        // disable rdp fields
        this->ui->txt_rdp_server->setDisabled(true);
        this->ui->txt_rdp_domain->setDisabled(true);

    } else {
        // we use rdp
        syslog(LOG_DEBUG, "we use rdp.");

        // we enable all fields, maybe there are disabled
        this->ui->txt_rdp_domain->setEnabled(true);
        this->ui->txt_rdp_server->setEnabled(true);

        // set radio button for rdp checked
        this->ui->rbn_rdp->setChecked(true);
        syslog(LOG_DEBUG, "check radio button for rdp.");

        // set windows domain
        this->ui->txt_rdp_domain->setText(rdp_domain);
        syslog(LOG_DEBUG, "get current windows domain");
        syslog_buffer = rdp_domain.toLocal8Bit();
        syslog(LOG_INFO, "Current windows domain: %s", syslog_buffer.data());

        // set rdp server
        this->ui->txt_rdp_server->setText(rdp_server);
        syslog(LOG_DEBUG, "get current rdp server.");
        syslog_buffer = rdp_server.toLocal8Bit();
        syslog(LOG_INFO, "Current rdp server: %s", syslog_buffer.data());

        // disable citrix fields
        this->ui->txt_storefront->setDisabled(true);
        this->ui->txt_netscaler->setDisabled(true);
        this->ui->txt_ctx_domain->setDisabled(true);
    }
}

/**
 * @brief MainWindow::RehashCerts
 */
void MainWindow::RehashCerts()
{

    // declare variables
    QString command;
    QPair<QByteArray, QByteArray> buffer;
    QString result;
    exec_cmd script;

    // at first check if there are some certificates to hash
    if(QDir(QApplication::applicationDirPath() + path_certificates).entryInfoList(QDir::NoDotAndDotDot|QDir::AllEntries).count() != 0)
    {
        syslog(LOG_NOTICE, "we have some certificates to move and rehash.");
        command = QApplication::applicationDirPath() + path_scripts + script_rehash_certs + " " + QApplication::applicationDirPath() + path_certificates + "*";
        syslog_buffer = command.toLocal8Bit();
        syslog(LOG_DEBUG, "Command: %s", syslog_buffer.data());

        // execute script
        buffer = script.exec_process(command);

        // result
        syslog(LOG_DEBUG, "Result: %s", buffer.first.data());

        // error
        if(!buffer.second.isEmpty())
        {
            syslog(LOG_ERR, "Result: %s", buffer.second.data());
        }
    }
}



/**
 * @brief start StartPage and kill ConfigPage
 */
void MainWindow::startStartPage() {
    // create the new process (StartPage)
    qDebug() << "starting ...";
    QProcess *process = new QProcess();
    process->startDetached("/bin/sh", QStringList{PRG_START_PAGE});
    process->waitForFinished();

    // killing actual process (ConfigPage)
    qDebug() << "killing ..." << qApp->applicationFilePath();
    qint64 pid = QCoreApplication::applicationPid();
    QProcess::startDetached("kill -SIGTERM " + QString::number(pid));
    //this->~StartPage();

}

/******************************************************************************\
|******************************************************************************|
|* 				slots	  				      *|
|******************************************************************************|
\******************************************************************************/

void MainWindow::on_btn_upload_cert_clicked()
{
    syslog(LOG_INFO, "user clicked button to upload a custom certificate.");

    path_certificates = QApplication::applicationDirPath() + path_certificates;
    syslog_buffer = path_certificates.toLocal8Bit();
    syslog(LOG_INFO, "Complete path for certificates: %s", syslog_buffer.data());

    // create own file dialog
    FileSystemModelDialog* dialog = new FileSystemModelDialog(this, path_usb, path_certificates);
    syslog(LOG_DEBUG, "create own file dialog for certificate upload.");

    dialog->resize (700,500);
    dialog->show();
}


/**
 * @brief MainWindow::on_btn_save_quiet_clicked
 * @todo add support for rdp
 */
void MainWindow::on_btn_save_clicked()
{
    syslog(LOG_DEBUG, "inside function on_btn_save_quit().");
    syslog(LOG_NOTICE, "save all profile settings.");

    // load profiles file
    QSettings profiles(m_sProfilesFile, QSettings::NativeFormat);
    syslog_buffer = m_sProfilesFile.toLocal8Bit();
    syslog(LOG_INFO, "load current profile: %s", syslog_buffer.data());

    // declare variables
    QString citrix_store, citrix_netscaler, rdp_domain, rdp_server;
    bool valid_input;
    valid_input = false;

    // get all informationen from textboxes
    syslog(LOG_DEBUG, "collect user input...");
    if(this->ui->rbn_citrix->isChecked())
    {
        citrix_rdp_type = "citrix";
        syslog(LOG_DEBUG, "user selected citrix.");

        // citrix store
        citrix_store = QString::fromStdString(this->ui->txt_storefront->text().toStdString());
        syslog_buffer = citrix_store.toLocal8Bit();
        syslog(LOG_NOTICE, "User input citrix store: %s", syslog_buffer.data());

        // citrix netscaler
        citrix_netscaler = QString::fromStdString(this->ui->txt_netscaler->text().toStdString());
        syslog_buffer = citrix_netscaler.toLocal8Bit();
        syslog(LOG_NOTICE, "User inpute citrix netscaler: %s", syslog_buffer.data());

        // check if either netscler or storefront is filled
        if(citrix_store.isEmpty() && citrix_netscaler.isEmpty())
        {
            syslog(LOG_WARNING, "User didn't type in any citrix relevant input field.");
            msgBox  = new QMessageBox();
            msgBox->setWindowTitle("Citrix Einstellungen");
            msgBox->setText("Sie müssen das Feld für Netscaler oder Storefront ausfüllen.");
            msgBox->exec();
            syslog(LOG_DEBUG, "message box with warning showed.");

        } else {
            syslog(LOG_NOTICE, "all needed information are available.");
            // global
            profiles.setValue(CITRIX_RDP_TYPE, citrix_rdp_type);

            // citrix
            profiles.setValue(STORE_URL, citrix_store);
            profiles.setValue(NETSCALER_URL, citrix_netscaler);
            valid_input = true;
        }

    } else {
        citrix_rdp_type = "rdp";
        rdp_domain = QString::fromStdString(this->ui->txt_rdp_domain->text().toStdString());
        rdp_server = QString::fromStdString(this->ui->txt_rdp_server->text().toStdString());

        // RDP is not active at the moment
        if(rdp_domain.isEmpty() && rdp_server.isEmpty())
        {
            msgBox  = new QMessageBox();
            msgBox->setWindowTitle("RDP Einstellungen");
            msgBox->setText("Sie müssen das Feld für Domäne und Server ausfüllen.");
            msgBox->exec();
        } else {
            // global
            profiles.setValue(CITRIX_RDP_TYPE, citrix_rdp_type);

            // rdp
            profiles.setValue(RDP_DOMAIN, rdp_domain);
            profiles.setValue(RDP_URL, rdp_server);
            valid_input = true;

        }

    }

    // save it
    profiles.sync();

    syslog(LOG_INFO, "save all changes.");

    // rehash certificates if there are some one
    RehashCerts();
    syslog(LOG_INFO, "try to rehash certificates.");

    if(valid_input)
    {
        syslog(LOG_INFO, "we stored alle profile settings successful.");
        msgBox = new QMessageBox();
        msgBox->setWindowTitle("Konfiguration");
        msgBox->setText("Alle Einstellungen wurden erfolgreich gespeichert.");
        msgBox->exec();

        this->startStartPage(); // start StartPage
    }    

}

/**
 * @brief MainWindow::on_btn_cancel_clicked
 *  all new settings will be discard
 *  the app is closed with return 0;
 */
void MainWindow::on_btn_cancel_clicked()
{
    syslog(LOG_INFO, "application quit because 'cancel' button clicked");
    this->startStartPage();
}


/**
 * @brief MainWindow::on_rbn_citrix_clicked
 */
void MainWindow::on_rbn_citrix_clicked()
{
    syslog(LOG_DEBUG, "Radiobutton for citrix clicked");

    // get current configuration
    syslog(LOG_DEBUG, "get current citrix configuration");

    QSettings profiles(m_sProfilesFile, QSettings::NativeFormat);
    if (profiles.status() == QSettings::AccessError) {
        syslog(LOG_ERR, "We could not access the file.");
    }

    // citrix store
    QString citrix_store = profiles.value(STORE_URL).toString();
    syslog(LOG_DEBUG, "get citrix store.");
    syslog_buffer = citrix_store.toLocal8Bit();
    syslog(LOG_NOTICE, "citrix - Store: %s", syslog_buffer.data());

    // citrix netscaler
    QString citrix_netscaler = profiles.value(NETSCALER_URL).toString();
    syslog(LOG_DEBUG, "get citrix netscaler.");
    syslog_buffer = citrix_netscaler.toLocal8Bit();
    syslog(LOG_INFO, "Citrix - Netscaler: %s", syslog_buffer.data());

    // citrix domain
    QString citrix_domain = profiles.value(CTX_DOMAIN).toString();
    syslog(LOG_DEBUG, "get citrix domain");
    syslog_buffer = citrix_domain.toLocal8Bit();
    syslog(LOG_INFO, "Citrix - Domain: %s", syslog_buffer.data());

    // set ui for vdi
    setVdiUi("citrix", citrix_store, citrix_netscaler, citrix_domain, "", "");
    syslog(LOG_NOTICE, "set vdi settings on ui");

}

/**
 * @brief MainWindow::on_rbn_rdp_clicked
 */
void MainWindow::on_rbn_rdp_clicked()
{
    syslog(LOG_DEBUG, "Radiobutton for rdp clicked");

    // get current configuration
    syslog(LOG_DEBUG, "get current rdp configuration");

    QSettings profiles(m_sProfilesFile, QSettings::NativeFormat);
    if (profiles.status() == QSettings::AccessError) {
        syslog(LOG_ERR, "We could not access the file.");
    }

    // windows domain
    QString rdp_domain = profiles.value(RDP_DOMAIN).toString();
    syslog(LOG_DEBUG, "get windows domain for rdp.");
    syslog_buffer = rdp_domain.toLocal8Bit();
    syslog(LOG_INFO, "Windows domain: %s", syslog_buffer.data());

    // rdp server
    QString rdp_server = profiles.value(RDP_URL).toString();
    syslog(LOG_DEBUG, "get rdp server.");
    syslog_buffer = rdp_server.toLocal8Bit();
    syslog(LOG_INFO, "RDP - Server: %s", syslog_buffer.data());

    // set ui for vdi
    setVdiUi("rdp", "","", "", rdp_domain, rdp_server);
    syslog(LOG_NOTICE, "set vdi settings on ui");
}
