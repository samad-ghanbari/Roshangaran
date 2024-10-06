import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "Branches.js" as BMethods

Page {
    id: branchesPage
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
                text: "لیست شعبه‌ها"
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

        ListView
        {
            id: branchesListView
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: branchesPage.width
            //Layout.fillHeight: true
            //Layout.fillWidth: true
            Layout.margins: 20
            orientation: ListView.Vertical
            model: ListModel{id: branchModel}
            delegate: BranchWidget{branchId: Id; branchCity: City; branchName: Name; branchDescription: Description; branchAddress: Address}
            layoutDirection: Qt.LeftToRight
            ScrollBar.horizontal: ScrollBar { active: true; visible: true }
            ScrollBar.vertical: ScrollBar { active: true; visible: true }

            Component.onCompleted: { BMethods.updateBranches(); }
        }
    }
}
