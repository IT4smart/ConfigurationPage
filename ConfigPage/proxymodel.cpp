#include <iostream>
#include <QPushButton>
#include <QDebug>
#include "proxymodel.h"
#include "exec_cmd.h"


FileSystemModelDialog::FileSystemModelDialog(QWidget *parent, const QString & usb_path, const QString & out_path):
    QDialog(parent),
    dirFilModel(new QFileSystemModel(this)),
    treeView(new QTreeView()),
    buttonBox(new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel))
{

    setCertPath(out_path);

    //do not list the special entries . and ..
    //NoSymLinks is very important, otherwise they could get root access
    //and list all Files and Directories
    dirFilModel->setFilter(QDir::NoDotAndDotDot | QDir::Files | QDir::AllDirs | QDir::NoSymLinks);
    dirFilModel->setRootPath(usb_path);

    //set the treeView
    treeView->setModel(dirFilModel);
    QModelIndex idx = dirFilModel->index(usb_path);

    treeView->setRootIndex(idx);
    treeView->expand(idx);
    treeView->scrollTo(idx);
    //would set the Current Index to the usb_path-Directory
    //treeView->setCurrentIndex(idx);
    //set the name to the half-width
    treeView->setColumnWidth(0,treeView->size().width()/2);

    //connect the accpet and reject functions to its buttons
    connect(buttonBox, SIGNAL(accepted()), this, SLOT(accept()));
    connect(buttonBox, SIGNAL(rejected()), this, SLOT(reject()));
    //view the new Dialog
    QVBoxLayout *mainLayout = new QVBoxLayout;
    mainLayout->addWidget(treeView);
    mainLayout->addWidget(buttonBox);
    setLayout(mainLayout);
    setWindowTitle("Zertifikate hochladen");
}

/**
 * @brief FileSystemModelDialog::setCertPath
 * @param path
 */
void FileSystemModelDialog::setCertPath(QString path)
{
    cert_path = path;
}

/**
 * @brief FileSystemModelDialog::getCertPath
 * @return
 */
QString FileSystemModelDialog::getCertPath()
{
    return cert_path;
}

/**
 * @brief FileSystemModelDialog::accept
 * @todo rehash all certificates after upload
 */
void FileSystemModelDialog::accept()
{
    const QString file = dirFilModel->fileInfo(treeView->currentIndex()).absoluteFilePath();
    qDebug() << "Cert file: " << file;

    //set the name of the new pic and its path
    QString picName = dirFilModel->fileInfo(treeView->currentIndex()).fileName();
    qDebug() << "picName: " << getCertPath() + picName;

    QString mDlFile = getCertPath() + picName;

    //copy new file
    QFile::copy(file, mDlFile);

    this->hide();
    delete this;
}

void FileSystemModelDialog::reject()
{
    this->hide();
    delete this;
}

FileSystemModelDialog::~FileSystemModelDialog()
{
    delete dirFilModel;
    delete treeView;
    delete buttonBox;
}
