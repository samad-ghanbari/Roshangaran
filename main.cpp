#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Lib/database/dbman.h"
#include "Backend/backend.h"


#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Backend *backend = new Backend();
    DbMan dbMan(backend);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("dbMan", &dbMan);
    engine.rootContext()->setContextProperty("backend", backend);

    engine.loadFromModule("Roshangaran", "Main");


    return app.exec();
}
