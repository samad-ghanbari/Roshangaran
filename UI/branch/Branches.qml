import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import Lib.models.BranchModel

//import "Branches.js" as BMethods

Page {
    id: branchesPage
    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    GridLayout
    {
        anchors.fill: parent
        columns:2

        Button
        {
            id: userListBackBtnId
            Layout.preferredHeight: 64
            Layout.preferredWidth: 64
            background: Item{}
            icon.source: "qrc:/Assets/images/arrow-right.png"
            icon.width: 64
            icon.height: 64
            opacity: 0.5
            onClicked: homeStackViewId.pop();
            hoverEnabled: true
            onHoveredChanged: userListBackBtnId.opacity=(hovered)? 1 : 0.5;
        }
        Text {
            id: userListTitle
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            text: "لیست شعبه‌ها"
            font.family: yekanFont.font.family
            font.pixelSize: 24
            font.bold: true
            color: "mediumvioletred"
            style: Text.Outline
            styleColor: "white"
        }

        PaddedRectangle
        {
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            padding: 10
            color: "ghostwhite"

            TableView
            {
                id: branchesTV
                anchors.fill: parent
                anchors.topMargin:  100
                property var columnWidths: [20, 30, 20, 30, 30]
                columnWidthProvider: function (column) { return columnWidths[column]*branchesTV.width/100; }
                flickableDirection: Flickable.AutoFlickDirection
                clip: true
                rowSpacing: 10
                columnSpacing: 5
                model: BranchModel
                //HorizontalHeaderView{ syncView: branchesTV; model: ["aa", "bb", "cc", "dd"]; height: 60; width: parent.width; delegate: Rectangle{color:"red"; implicitHeight: 60; implicitWidth: 100} }
                delegate: Rectangle{
                    property bool row0 : row == 0;
                    implicitWidth: 200; implicitHeight: 50;
                    color: row0? "lavender" : "gray";
                    Text{ anchors.fill: parent; anchors.margins: 10; text:display; font.bold: row0? true: false; horizontalAlignment: row0? Qt.AlignHCenter : Qt.AlignLeft; }}
            }

        }

    }
    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
