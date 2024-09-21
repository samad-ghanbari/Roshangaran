import QtQuick
import QtQuick.Controls

Item
{
    id: loginInitialItem
    anchors.fill: parent
    function initialLogin()
    {
        // database connection
        var dbConnected = dbMan.isDbConnected();
        if(dbConnected === false)
            return noConnectionComponent;
        // on maintenance mode
        var onMaintenance = dbMan.isOnMaintenance();
        if(onMaintenance === true)
            return onMaintenanceComponent
        // new realease check
        var newRelease = dbMan.newRelease();
        if(newRelease === true)
            return newReleaseComponent
        //login to App
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
        LoginForm{}
    }

}

