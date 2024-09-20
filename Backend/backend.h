#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
class DbMan;

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);
    void setDatabase(DbMan *_dbMan);


private:
    DbMan *dbMan;
};

#endif // BACKEND_H
