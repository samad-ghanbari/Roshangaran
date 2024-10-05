import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Page {

    property var user

    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    ColumnLayout
    {
        anchors.fill: parent

        RowLayout
        {
            width: parent.width
            Button
            {
                background: Item{}
                icon.source: "qrc:/Assets/images/arrow-right.png"
                icon.width: 64
                icon.height: 64
                opacity: 0.5
                palette.buttonText: "steelblue"
                onClicked: homeStackViewId.pop();
                hoverEnabled: true
                onHoveredChanged: this.opacity=(hovered)? 1 : 0.5;
            }
            Item
            {
                Layout.fillWidth: true
            }

            Text {
                text: user["name"] + " " + user["lastname"];
                Layout.alignment: Qt.AlignHCenter
                font.family: yekanFont.font.family
                font.pixelSize: 24
                font.bold: true
                color: "mediumvioletred"
                style: Text.Outline
                styleColor: "white"
            }

            Item
            {
                Layout.fillWidth: true
            }
        }
        PaddedRectangle
        {
            Layout.fillHeight: true
            Layout.fillWidth: true

            color: "lavenderblush"

        }
    }
}
