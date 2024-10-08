#include <QGuiApplication>
#include "Backend/Backend.h"

#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Backend backend(app);
    backend.initiate();

    return app.exec();
}
