#include "exec_cmd.h"
#include <QProcess>
#include <QDebug>

/**
 * @brief exec_cmd::exec_cmd
 */
exec_cmd::exec_cmd(void)
{
    //qDebug() << "Create exec_cmd";
}

/**
 * @brief exec_cmd::~exec_cmd
 */
exec_cmd::~exec_cmd(void)
{
    //qDebug() << "Destroy exec_cmd";
}

/**
 * @brief exec_cmd::exec_process
 * @param command
 * @return
 */
QPair<QByteArray,QByteArray> exec_cmd::exec_process(QString command)
{
    QPair<QByteArray,QByteArray> ret_pair; // initiate return pair of <QByteArray,QByteArray>

    // start process
    QProcess *process = new QProcess();
    process->start("/bin/sh");
    process->write(command.toLatin1());
    process->closeWriteChannel();

    // get buffer and buffer error
    QByteArray buffer;
    QByteArray buffer_error;
    while(process->waitForFinished())
    {
        buffer.append(process->readAllStandardOutput());
        buffer_error.append(process->readAllStandardError());
    }

    process->close();

    // return the QPair
    ret_pair.first = buffer;
    ret_pair.second = buffer_error;
    return ret_pair;
}
