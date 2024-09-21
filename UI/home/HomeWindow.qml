import QtQuick
import QtQuick.Window
import QtQuick.Controls

ApplicationWindow {

    id: appWindowId
    minimumWidth: 400
    minimumHeight: 400
    visibility: Window.Maximized
    visible: true
    color: "lavender"
    title: qsTr("روشنگران")
    //flags: Qt.WindowSystemMenuHint | ~Qt.WindowCloseButtonHint;


    FontLoader { id: yekanFont; source: "qrc:/Assets/font/yekan.ttf" }

    Text {
        id: homeTxtId
        text: qsTr("Home")
        anchors.centerIn: parent
        font.pixelSize: 28
    }
}
