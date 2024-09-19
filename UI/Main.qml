import QtQuick
import QtQuick.Window
import QtQuick.Controls

import "./login"

ApplicationWindow {
    id: appWindowId
    minimumWidth: 400
    minimumHeight: 400
    visibility: ApplicationWindow.Maximized
    visible: true
    color: "skyblue"
    title: qsTr("login")
    //flags: ~Qt.WindowCloseButtonHint; //Qt.WindowSystemMenuHint |

    FontLoader { id: myFont; source: "qrc:/Assets/font/yekan.ttf" }

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: Login{}
    }
}

