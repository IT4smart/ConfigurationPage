#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSettings>
#include <QMessageBox>

// constants
const QString SETTINGS_PATH = "../../startpagenew/Ressources/settings.ini"; // hier werden settings gespeichert
const QString LOGO_PATH = "global/logo_path"; // key für settings.ini
const QString CITRIX_RDP_TYPE = "global/citrix_rdp_type"; // key
const QString NETWORK_TYPE = "network/type"; // key for settings.ini
const QString NETSCALER_URL = "citrix/netscaler_url"; // key for settings.ini
const QString STORE_URL = "citrix/store_url"; // key for settings.ini
const QString RDP_DOMAIN = "rdp/domain"; // key
const QString RDP_URL = "rdp/server_url"; // key
const QString PRG_START_PAGE = "../../startpagenew/StartPage/StartPage";


namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

    // settings data
    QString path_certificates;
    QString path_scripts;
    QString path_usb;
    QString script_get_dns, script_get_gateway, script_get_ip_ethernet, script_get_netmask, script_rehash_certs;

    // profiles data
    QString network_type, network_ip, network_netmask, network_gateway, network_dns, citrix_rdp_type;

    // for syslog as bufffer
    QByteArray syslog_buffer;

private slots:
    void on_btn_cancel_clicked();
    void on_btn_save_clicked();
    void on_btn_upload_cert_clicked();

private:
    Ui::MainWindow *ui;
    void loadSettings();
    void loadProfiles();
    void startStartPage();
    void setNetworkUi(QString network_type);
    void setVdiUi(QString citrix_rdp_type, QString citrix_store, QString citrix_netscaler, QString rdp_domain, QString rdp_server);
    void RehashCerts();
    QString getNetworkIp();
    QString getNetworkDns();
    QString getNetworkGateway();
    QString getNetworkNetmask();
    QString m_sSettingsFile;
    QString m_sProfilesFile;
    QMessageBox* msgBox;
};

#endif // MAINWINDOW_H
