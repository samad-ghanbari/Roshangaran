import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "Step.js" as Methods

Page {
    id: stepDeletePage
    property int stepId
    property int stepIndex
    property string stepName
    property string branchText

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
            text: "حذف دوره"
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
            color: "lavenderblush"

            ScrollView
            {
                height: parent.height
                width: parent.width
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                Rectangle
                {
                    id: centerBoxSDId
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
                            id: stepDeleteCL
                            width: parent.width

                            GridLayout
                            {
                                id: stepDeleteGL
                                columns: 2
                                rows: 5
                                rowSpacing: 20
                                columnSpacing: 10
                                Layout.preferredWidth:  parent.width

                                Text {
                                    Layout.columnSpan: 2
                                    text: "شعبه " + stepDeletePage.branchText
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 20
                                    font.bold: true
                                    color: "royalblue"
                                }


                                Text {
                                    text: "نام دوره"
                                    Layout.minimumWidth: 100
                                    Layout.maximumWidth: 100
                                    Layout.preferredHeight: 50
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                }
                                Text
                                {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                    text: stepDeletePage.stepName
                                    font.bold: true
                                }
                            }

                            Item
                            {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                            }
                            // Text
                            // {
                            //     text: "حذف"
                            //     font.family: yekanFont.font.family
                            //     font.pixelSize: 24
                            //     font.bold: true
                            //     color: "crimson"
                            //     Layout.preferredWidth: parent.width
                            //     Layout.preferredHeight: 50
                            //     horizontalAlignment: Qt.AlignHCenter
                            //     verticalAlignment: Qt.AlignVCenter
                            // }
                            Button
                            {
                                background: Item{}
                                icon.source: "qrc:/Assets/images/trash3.png"
                                icon.width: 64
                                icon.height: 64
                                Layout.preferredHeight: 64
                                Layout.preferredWidth: 64
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                opacity: 0.5
                                onClicked: stepDelDialog.open();
                                hoverEnabled: true
                                onHoveredChanged:
                                {
                                    if(hovered)
                                    {
                                        this.opacity = 1
                                        this.scale = 1.1
                                    }
                                    else
                                    {
                                        this.opacity = 0.8
                                        this.scale = 1
                                    }
                                }
                            }

                        }

                    }
                }
            }
        }

    }

    BaseDialog
    {
        id: stepDelDialog
        dialogTitle:  "حذف دوره"
        dialogText: "آیا از حذف دوره از سامانه مطمئن می‌باشید؟"
        acceptVisible: true
        rejectVisible: true

        acceptAction: function(){
            if(dbMan.deleteStep(stepDeletePage.stepId))
                stepSuccessDelDialog.open();
            else
                stepErrorDelDialog.open();
        }
    }

    BaseDialog
    {
        id: stepSuccessDelDialog
        dialogTitle:  "حذف دوره"
        dialogText: "حذف دوره با موفقیت صورت پذیرفت"
        acceptVisible: true
        dialogSuccess: true
        acceptAction: function(){
            homeStackViewId.pop();
            stepsPage.stepDeleted(stepDeletePage.stepIndex);
        }
    }

    BaseDialog
    {
        id: stepErrorDelDialog
        dialogTitle:  "حذف دوره"
        dialogText: "حذف دوره با مشکل مواجه شد"
        acceptVisible: true
        dialogSuccess: false
    }
}
