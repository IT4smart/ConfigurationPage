#ifndef PROXYMODEL_H
#define PROXYMODEL_H

#include <QFileSystemModel>
#include <QTreeView>
#include <QDialogButtonBox>
#include <QDialog>
#include <QVBoxLayout>

class FileSystemModelDialog : public QDialog
{
    Q_OBJECT

    public:
        // delete the copy contructors, because they are not needed and
        // otherwise there will be problems with the copying of the ui* pointer
        FileSystemModelDialog(const FileSystemModelDialog&) = delete;
        FileSystemModelDialog* operator=(const FileSystemModelDialog&) = delete;
        FileSystemModelDialog(QWidget *parent = 0,const QString& usb_path = QString::null,
                const QString& out_path = QString::null);
        ~FileSystemModelDialog();
        QString cert_path;

    private:
        QFileSystemModel *dirFilModel;
        QTreeView *treeView;
        QDialogButtonBox *buttonBox;
        void setCertPath(QString path);
        QString getCertPath();

    private slots:
        virtual void accept();
        void reject();
};

#endif // PROXYMODEL_H
