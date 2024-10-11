import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "Basis.js" as Methods

Page {
    id: basisDeletePage
    property int basisId
    property int basisIndex
    property string basisName
    property string step
    property string branch

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
            text: "حذف پایه"
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
                            id: basisDeleteCL
                            width: parent.width

                            GridLayout
                            {
                                id: basisDeleteGL
                                columns: 2
                                rows: 5
                                rowSpacing: 20
                                columnSpacing: 10
                                Layout.preferredWidth:  parent.width

                                Text {
                                    Layout.columnSpan: 2
                                    text: "شعبه " + basisDeletePage.branch
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
                                    Layout.columnSpan: 2
                                    text: "دوره " + basisDeletePage.step
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
                                    text: "نام پایه"
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
                                    text: basisDeletePage.basisName
                                    font.bold: true
                                }
                            }

                            Item
                            {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                            }

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
                                onClicked: basisDelDialog.open();
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
        id: basisDelDialog
        dialogTitle:  "حذف پایه"
        dialogText: "آیا از حذف پایه از سامانه مطمئن می‌باشید؟"
        acceptVisible: true
        rejectVisible: true

        acceptAction: function(){
            if(dbMan.deleteBasis(basisDeletePage.basisId))
                basisSuccessDelDialog.open();
            else
                basisErrorDelDialog.open();
        }
    }

    BaseDialog
    {
        id: basisSuccessDelDialog
        dialogTitle:  "حذف پایه"
        dialogText: "حذف پایه با موفقیت صورت پذیرفت"
        acceptVisible: true
        dialogSuccess: true
        acceptAction: function(){
            homeStackViewId.pop();
            basissPage.basisDeleted(basisDeletePage.basisIndex);
        }
    }

    BaseDialog
    {
        id: basisErrorDelDialog
        dialogTitle:  "حذف پایه"
        dialogText: "حذف پایه با مشکل مواجه شد"
        acceptVisible: true
        dialogSuccess: false
    }
}
