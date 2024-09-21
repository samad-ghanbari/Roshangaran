#include <QGuiApplication>
#include "Backend/backend.h"

#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Backend backend(app);
    backend.initiate();

    return app.exec();
}
