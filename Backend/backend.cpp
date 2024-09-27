#include "backend.h"
#include "Lib/database/dbman.h"
#include <QJsonObject>

#include <QDebug>

Backend::Backend(QGuiApplication &app, QObject *parent)
    : QObject{parent}, dbMan(nullptr)
{
    dbMan = new DbMan(this);
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
}

void Backend::initiate()
{
    engine.rootContext()->setContextProperty("backend", this);
    engine.rootContext()->setContextProperty("dbMan", dbMan);
    engine.loadFromModule("Roshangaran", "LoginWindow");
}

void Backend::loadHome()
{
    QJsonObject user = dbMan->getUser();
    engine.rootContext()->setContextProperty("user", user);
    engine.loadFromModule("Roshangaran", "HomeWindow");
}
