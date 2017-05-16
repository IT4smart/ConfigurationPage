#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSettings>
#include <QMessageBox>

// constants
const QString SETTINGS_PATH = "../../startpage/Ressources/settings.ini"; // hier werden settings gespeichert
const QString LOGO_PATH = "global/logo_path"; // key für settings.ini
const QString CITRIX_RDP_TYPE = "global/citrix_rdp_type"; // key
const QString NETWORK_TYPE = "network/type"; // key for settings.ini
const QString NETSCALER_URL = "citrix/netscaler_url"; // key for settings.ini
const QString STORE_URL = "citrix/store_url"; // key for settings.ini
const QString CTX_DOMAIN = "citrix/domain"; //key for settings.ini
const QString RDP_DOMAIN = "rdp/domain"; // key for settings.ini
const QString RDP_URL = "rdp/server_url"; // key for settings.ini
const QString RDP_AUTOLOGIN = "rdp/autologin"; // keyy for settings.ini
const QString RDP_USERNAME = "rdp/user"; // key for settings.ini
const QString RDP_PASSWORD = "rdp/password"; // key for settings.ini
const QString SYS_RESOLUTION_TYPE = "global/resolution_type"; //key for settings.ini
const QString SYS_RESOLUTION = "global/resolution"; // key for settings.ini
const QString PRG_START_PAGE = "./scripts/start_StartPage.sh";


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
    QString script_get_dns, script_get_gateway, script_get_ip_ethernet, script_get_netmask, script_rehash_certs, script_change_screen_resolution, script_get_hardware;

    // profiles data
    QString network_type, network_ip, network_netmask, network_gateway, network_dns, citrix_rdp_type;

    // for syslog as bufffer
    QByteArray syslog_buffer, syslog_buffer_p;

private slots:
    void on_btn_cancel_clicked();
    void on_btn_save_clicked();
    void on_btn_upload_cert_clicked();
    void on_rbn_citrix_clicked();
    void on_rbn_rdp_clicked();
    void on_rbn_autologin_yes_clicked();
    void on_rbn_autologin_no_clicked();
    void on_rbn_res_dyn_clicked();
    void on_rbn_res_stat_clicked();

private:
    Ui::MainWindow *ui;
    void loadSettings();
    void loadProfiles();
    void startStartPage();
    void setNetworkUi(QString network_type);
    void setSystemUi(QString resolution_type = "dynamic", QString resolution = "800x600", bool active = true);
    void setVdiData( QString citrix_store, QString citrix_netscaler, QString citrix_domain, QString rdp_domain, QString rdp_server, QString rdp_username, QString rdp_password);
    void setVdiUi(QString citrix_rdp_type, QString rdp_autologin);
    void RehashCerts();
    void killStartPage();
    void rebootDevice();
    void runChangeScreenResolution(QString mode, QString hdmi_mode = "0");
    int getScreenResolutionMode(QString resolution);
    QString getNetworkIp();
    QString getNetworkDns();
    QString getNetworkGateway();
    QString getNetworkNetmask();
    QString getHardwareInformation();
    QString m_sSettingsFile;
    QString m_sProfilesFile;
    QMessageBox* msgBox;
};

#endif // MAINWINDOW_H
