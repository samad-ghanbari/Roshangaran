import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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

        PaddedRectangle
        {
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            padding: 10
            color: "ghostwhite"

            ScrollView
            {
                anchors.fill: parent

                ListView
                {
                    id: branchesLV
                    property var columnWidths: [40, 25, 25, 10] //weights
                    anchors.fill: parent
                    spacing: 10
                    flickableDirection: Flickable.AutoFlickDirection
                    model: ListModel{ id: branchModel}
                    delegate: BranchWidget{branchId: Id; branchCity: City; branchName: Name; branchAddress: Address; branchDescription: Description}
                    header: Row{
                        width: branchesLV.width
                        height:  64

                        Rectangle
                        {
                            Layout.preferredWidth:  branchesLV.width * 10/100;
                            Layout.preferredHeight: parent.height
                            color: "red"
                            Text {
                                anchors.centerIn: parent
                                 text: "شهر"
                            }

                        }
                        Rectangle
                        {
                            Layout.preferredWidth:  branchesLV.width * 25/100;
                            Layout.preferredHeight: parent.height
                            color: "lavender"
                            Text {
                                anchors.centerIn: parent
                                 text: "شعبه"
                            }
                        }
                        Rectangle
                        {
                            Layout.preferredWidth:  branchesLV.width * 25/100;
                            Layout.preferredHeight: parent.height
                            color: "lavender"
                            Text {
                                anchors.centerIn: parent
                                 text: "توضیحات"
                            }
                        }
                        Rectangle
                        {
                            Layout.preferredWidth:  branchesLV.width * 40/100;
                            Layout.preferredHeight: parent.height
                            color: "lavender"
                            Text {
                                anchors.centerIn: parent
                                 text: "آدرس"
                            }
                        }
                    }

                    Component.onCompleted: { BMethods.updateBranches();}


                }
            }

        }

    }
    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
