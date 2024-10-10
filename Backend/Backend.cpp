#include "Backend.h"
#include "Lib/database/dbman.h"
#include <QJsonObject>
//models
//#include "Lib/models/BranchModel.h"

Backend::Backend(QGuiApplication &app, QObject *parent)
    : QObject{parent}, dbMan(nullptr)
{
    dbMan = new DbMan(this);
    //branchModel = new BranchModel(dbMan, this);

    QQmlApplicationEngine engine;

    //register
    // i need to pass dbman so i use contextProperty instead of class registratin
    //qmlRegisterType<BranchModel>("BranchModel",1,0,"BranchModel");

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

    //qmlRegisterType<BranchModel>("Lib.models.BranchModel",1,0,"BranchModel");
    //qmlRegisterUncreatableType<BranchModel>("models.BranchModel", 1,0, "BranchModel", "");
    //BranchModel *branchModel = new BranchModel(this);

    QJsonObject user = dbMan->getUserJson();
    engine.rootContext()->setContextProperty("user", user);
    //models
    //-engine.rootContext()->setContextProperty("BranchModel", branchModel);

    engine.loadFromModule("Roshangaran", "HomeWindow");
}
