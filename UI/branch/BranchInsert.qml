import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "Branches.js" as BMethods

Page {
    id: insertBranchPage

    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    GridLayout
    {
        anchors.fill: parent
        columns:2

        Button
        {
            Layout.preferredHeight: 64
            Layout.preferredWidth: 64
            background: Item{}
            icon.source: "qrc:/Assets/images/arrow-right.png"
            icon.width: 64
            icon.height: 64
            opacity: 0.5
            onClicked: homeStackViewId.pop();
            hoverEnabled: true
            onHoveredChanged: this.opacity=(hovered)? 1 : 0.5;
        }
        Text {
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            text: "افزودن شعبه‌"
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
            color: "honeydew"

            ScrollView
            {
                height: parent.height
                width: parent.width
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                Rectangle
                {
                    id: centerBoxId
                    color:"snow"
                    border.width: 20
                    border.color: "snow"
                    width:  (parent.width < 700)? parent.width : 700
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.margins: 10
                    implicitHeight: branchInsertCL.height

                    radius: 10

                    ColumnLayout
                    {
                        id: branchInsertCL
                        width: parent.width
                        Image {
                            source: "qrc:/Assets/images/add.png"
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredHeight:  64
                            Layout.preferredWidth:  64
                            Layout.margins: 20
                            NumberAnimation on scale { from: 0; to: 1; duration: 2000;}
                        }

                        GridLayout
                        {
                            id: branchInsertGL
                            columns: 2
                            rows: 5
                            rowSpacing: 20
                            columnSpacing: 10
                            Layout.preferredWidth:  parent.width


                            Text {
                                text: "شهر"
                                Layout.minimumWidth: 100
                                Layout.maximumWidth: 100
                                Layout.preferredHeight: 50
                                verticalAlignment: Text.AlignVCenter
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                font.bold: true
                                color: "royalblue"
                            }
                            TextField
                            {
                                id: branchCityTF
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                placeholderText: "شهر"

                            }

                            Text {
                                text: "شعبه"
                                Layout.minimumWidth: 100
                                Layout.maximumWidth: 100
                                Layout.preferredHeight: 50
                                verticalAlignment: Text.AlignVCenter
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                font.bold: true
                                color: "royalblue"
                            }
                            TextField
                            {
                                id: branchNameTF
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                placeholderText: "شعبه"
                            }

                            Text {
                                text: "توضیحات"
                                Layout.minimumWidth: 100
                                Layout.maximumWidth: 100
                                Layout.preferredHeight: 50
                                verticalAlignment: Text.AlignVCenter
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                font.bold: true
                                color: "royalblue"
                            }
                            TextField
                            {
                                id: branchDescTF
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                placeholderText: "توضیحات"
                            }

                            Text {
                                text: "آدرس"
                                Layout.minimumWidth: 150
                                Layout.maximumWidth: 150
                                Layout.preferredHeight: 50
                                verticalAlignment: Text.AlignVCenter
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                font.bold: true
                                color: "royalblue"
                          }
                            TextField
                            {
                                id: branchAddressTF
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                font.family: yekanFont.font.family
                                font.pixelSize: 16
                                placeholderText: "آدرس"
                            }
                        }

                        Item
                        {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                        }

                        Button
                        {
                            text: "تایید"
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 50
                            Layout.alignment: Qt.AlignHCenter
                            font.family: yekanFont.font.family
                            font.pixelSize: 16
                            Rectangle{width:parent.width; height:2; anchors.bottom: parent.bottom; color: "forestgreen"}
                            onClicked:
                            {
                                var Branch = {};
                                Branch["city"] = branchCityTF.text;
                                Branch["branch_name"] = branchNameTF.text;
                                Branch["description"] = branchDescTF.text;
                                Branch["address"] = branchAddressTF.text;

                                var check = true
                                // check entries
                                if(!BMethods.checkBranchEntries(Branch))
                                {
                                    branchInfoDialogId.open();
                                    return;
                                }

                                if(dbMan.insertBranch(Branch))
                                {
                                    branchInfoDialogId.dialogSuccess = true
                                    branchInfoDialogId.dialogTitle = "عملیات موفق"
                                    branchInfoDialogId.dialogText = "شعبه جدید با موفقیت افزوده شد."
                                    branchesPage.branchInserted();
                                    branchInfoDialogId.acceptAction = function(){branchInfoDialogId.close(); homeStackViewId.pop();}
                                    branchInfoDialogId.open();

                                }
                                else
                                {
                                    var errorString = dbMan.getLastError();
                                    branchInfoDialogId.dialogTitle = "خطا"
                                    branchInfoDialogId.dialogText = errorString
                                    branchInfoDialogId.width = parent.width
                                    branchInfoDialogId.height = 500
                                    branchInfoDialogId.dialogSuccess = false
                                    branchInfoDialogId.open();
                                }
                            }
                        }

                        Item
                        {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                        }
                    }

                }
            }
        }

    }

    BaseDialog
    {
        id: branchInfoDialogId
        dialogTitle: "خطا"
        dialogText: "افزودن شعبه جدید با خطا مواجه شد."
        dialogSuccess: false
    }
}
