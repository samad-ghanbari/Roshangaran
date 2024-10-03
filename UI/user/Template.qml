import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Page {

    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    ColumnLayout
    {
        anchors.fill: parent

        RowLayout
        {
            width: parent.width
            Button
            {
                id: newUserBackBtnId
                font.family: yekanFont.font.family
                font.pixelSize: 48
                background: Item{}
                icon.source: "qrc:/Assets/images/arrow-right.png"
                icon.width: 64
                icon.height: 64
                opacity: 0.5
                palette.buttonText: "steelblue"
                font.bold: true
                onClicked: homeStackViewId.pop();
                hoverEnabled: true
                //onHoveredChanged: newUserBackBtnId.palette.buttonText=(hovered)? "royalblue" : "steelblue";
                onHoveredChanged: newUserBackBtnId.opacity=(hovered)? 1 : 0.5;
            }
            Item
            {
                Layout.fillWidth: true
            }

            Text {
                id: newUserTitle
                text: "لیست کاربران سامانه"
                Layout.alignment: Qt.AlignHCenter
                font.family: yekanFont.font.family
                font.pixelSize: 24
                font.bold: true
                color: "mediumvioletred"
                style: Text.Outline
                styleColor: "black"
            }

            Item
            {
                Layout.fillWidth: true
            }
        }

        ListView {
            id: lv
            Layout.maximumWidth: (parent.width < 700)? parent.width : 700
            Layout.minimumWidth: (parent.width < 700)? parent.width : 700
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true

        }
    }
}
