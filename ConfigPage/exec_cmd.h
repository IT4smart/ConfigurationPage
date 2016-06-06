#include <QPair>

#ifndef EXEC_CMD_H
#define EXEC_CMD_H


class exec_cmd
{
public:
    exec_cmd();
    ~exec_cmd();
    QPair<QByteArray,QByteArray> exec_process(QString command);

};

#endif // EXEC_CMD_H
