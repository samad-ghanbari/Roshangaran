import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Page {
    id: updateBranchPage
    property int branchId
    property string branchCity
    property string branchName
    property string branchDescription
    property string branchAddress


    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    ColumnLayout
    {
        anchors.fill: parent

        RowLayout
        {
            width: parent.width
            height: 64
            Button
            {
                id: userListBackBtnId
                background: Item{}
                icon.source: "qrc:/Assets/images/arrow-right.png"
                icon.width: 64
                icon.height: 64
                opacity: 0.5
                onClicked: homeStackViewId.pop();
                hoverEnabled: true
                onHoveredChanged: userListBackBtnId.opacity=(hovered)? 1 : 0.5;
            }
            Item
            {
                Layout.fillWidth: true
            }

            Text {
                id: userListTitle
                text: branchName
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
    }
}
