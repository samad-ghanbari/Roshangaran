import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

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

        TableView
        {
            id: branchesListView

            property var columnWidths: [40, 25, 25, 10] //weights
            columnWidthProvider: function (column) { var w =  columnWidths[column]*branchesListView.width/100; if(w < 100) return 100; else return w; }
            // rowHeightProvider: function (row) {
            //     if (isRowLoaded(row)) {
            //         var item = loadedRow(row);
            //         var contentHeight = 0;
            //         for (var i = 0; i < item.children.length; i++) {
            //             if (item.children[i].contentHeight > contentHeight) {
            //                 contentHeight = item.children[i].contentHeight;
            //             }
            //         }
            //         return contentHeight + 10;
            //     } else {
            //         return -1;
            //     }
            // }

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 20
            rowSpacing: 2
            columnSpacing: 1
            alternatingRows: true
            animate: true
            resizableColumns: true
            //resizableRows: true
            contentWidth: parent.width
            editTriggers: TableView.DoubleTapped
            selectionBehavior : TableView.SelectRows


            model: TableModel{
                id: branchModel

                TableModelColumn{ display: "Address"}
                TableModelColumn{ display: "Description"}
                TableModelColumn{ display: "Name"}
                TableModelColumn{ display: "City"}


                rows: []
            }

            delegate: // BranchWidget{branchId: Id; branchCity: City; branchName: Name; branchDescription: Description; branchAddress: Address}
                      Rectangle
            {
                border.width: 1
                border.color: "lightgray"
                implicitHeight: 40
                color: row % 2 == 0 ? "snow" : "whitesmoke"
                Item
                {
                    anchors.fill: parent
                    anchors.leftMargin: 5
                    Text {
                        anchors.fill: parent
                        text: model.display
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        //wrapMode: Text.WordWrap
                        clip: true
                        elide: Text.ElideRight
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignLeft
                    }
                }

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        homeStackViewId.push(updateBranchComponent);
                    }
                }
            }

            Component.onCompleted: { BMethods.updateBranches(); }
        }
    }

    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
