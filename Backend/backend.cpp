#include "backend.h"
#include "Lib/database/dbman.h"

Backend::Backend(QObject *parent)
    : QObject{parent}, dbMan(nullptr)
{}

void Backend::setDatabase(DbMan *_dbMan)
{
    dbMan = _dbMan;
}
