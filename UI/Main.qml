import QtQuick
import QtQuick.Window
import QtQuick.Controls

import "./login"
import "./home"

ApplicationWindow {
    id: appWindowId
    minimumWidth: 400
    minimumHeight: 400
    visibility: ApplicationWindow.Maximized
    visible: true
    color: "skyblue"
    title: qsTr("روشنگران")
    //flags: ~Qt.WindowCloseButtonHint; //Qt.WindowSystemMenuHint |
    //property bool dbConnected: dbMan.isDbConnected();


    FontLoader { id: yekanFont; source: "qrc:/Assets/font/yekan.ttf" }

    function initialLogin()
    {
        var dbConnected = dbMan.isDbConnected();
        if(dbConnected === false)
            return noConnectionComponent;

        var onMaintenance = dbMan.isOnMaintenance();
        if(onMaintenance === true)
            return onMaintenanceComponent

        var newRelease = dbMan.newRelease();
        if(newRelease === true)
            return newReleaseComponent

        return loginComponent
    }

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: initialLogin()
    }

    Component
    {
        id: noConnectionComponent
        NoConnection{}
    }

    Component
    {
        id: onMaintenanceComponent
        OnMaintenance{}
    }

    Component
    {
        id: newReleaseComponent
        NewRelease{}
    }

    Component
    {
        id: loginComponent
        Login{}
    }

}

