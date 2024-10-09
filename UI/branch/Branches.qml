import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import Lib.models.BranchModel

import "Branches.js" as BMethods

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

        Rectangle
        {
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "ghostwhite"

            ButtonGroup
            {
                buttons: branchesLV.contentItem.children
            }

            ListView
            {
                id: branchesLV
                anchors.fill: parent
                anchors.margins: 10
                flickableDirection: Flickable.AutoFlickDirection
                clip: true
                spacing: 5
                model: ListModel{id: branchModel}
                highlight: Item{}
                delegate: BranchWidget{branchId: Id; branchCity: City; branchName: Name; branchDescription: Description; branchAddress: Address}

            }
            Component.onCompleted: BMethods.updateBranches();

        }

    }
    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
