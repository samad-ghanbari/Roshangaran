import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "Basis.js" as Methods

Page {
    id: insertBasisPage

    property int stepId;
    property string branch
    property string step

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
            text: "افزودن پایه"
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
                    width:  (parent.width < 700)? parent.width : 700
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.margins: 10
                    implicitHeight: parent.height

                    radius: 10
                    Item {
                        anchors.fill: parent
                        anchors.margins: 10

                        ColumnLayout
                        {
                            id: basisInsertCL
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
                                id: basisInsertGL
                                columns: 2
                                rows: 5
                                rowSpacing: 20
                                columnSpacing: 10
                                Layout.preferredWidth:  parent.width

                                Text {
                                    Layout.columnSpan: 2
                                    text: "شعبه " + insertBasisPage.branch
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "royalblue"
                                }
                                Text {
                                    Layout.columnSpan: 2
                                    text: "دوره " + insertBasisPage.step
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "royalblue"
                                }


                                Text {
                                    text: "نام پایه"
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
                                    id: basisNameTF
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                    placeholderText: "نام پایه"

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
                                    var Basis = {};
                                    Basis["step_id"] = insertBasisPage.stepId
                                    Basis["basis_name"] = basisNameTF.text

                                    var check = true
                                    // check entries
                                    if(!Methods.checkBasisInsertEntries(Basis))
                                    {
                                        basisInfoDialogId.open();
                                        return;
                                    }

                                    if(dbMan.insertBasis(Basis))
                                    {
                                        basisInfoDialogId.dialogSuccess = true
                                        basisInfoDialogId.dialogTitle = "عملیات موفق"
                                        basisInfoDialogId.dialogText = "پایه جدید با موفقیت افزوده شد."
                                        basisPage.basisInserted(insertBasisPage.stepId);
                                        basisInfoDialogId.acceptAction = function(){basisInfoDialogId.close(); homeStackViewId.pop();}
                                        basisInfoDialogId.open();

                                    }
                                    else
                                    {
                                        var errorString = dbMan.getLastError();
                                        basisInfoDialogId.dialogTitle = "خطا"
                                        basisInfoDialogId.dialogText = errorString
                                        basisInfoDialogId.width = parent.width
                                        basisInfoDialogId.height = 500
                                        basisInfoDialogId.dialogSuccess = false
                                        basisInfoDialogId.open();
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

    }

    BaseDialog
    {
        id: basisInfoDialogId
        dialogTitle: "خطا"
        dialogText: "افزودن پایه جدید با خطا مواجه شد."
        dialogSuccess: false
    }
}
