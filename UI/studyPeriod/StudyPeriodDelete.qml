import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "StudyPeriod.js" as Methods

Page {
    id: studyPeriodDeletePage
    property int studyPeriodId
    property int studyPeriodIndex
    property string period
    property string basis
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
            text: "حذف سال‌تحصیلی"
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
                            id: studyPeriodDeleteCL
                            width: parent.width

                            GridLayout
                            {
                                id: studyPeriodDeleteGL
                                columns: 2
                                rows: 5
                                rowSpacing: 20
                                columnSpacing: 10
                                Layout.preferredWidth:  parent.width

                                Text {
                                    Layout.columnSpan: 2
                                    text: "شعبه " + studyPeriodDeletePage.branch
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
                                    text:  studyPeriodDeletePage.step
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
                                    text:  studyPeriodDeletePage.basis
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
                                    text: "سال‌تحصیلی"
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
                                    text: studyPeriodDeletePage.period
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
                                onClicked: studyPeriodDelDialog.open();
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
        id: studyPeriodDelDialog
        dialogTitle:  "حذف سال‌تحصیلی"
        dialogText: "آیا از حذف سال‌تحصیلی از سامانه مطمئن می‌باشید؟"
        acceptVisible: true
        rejectVisible: true

        acceptAction: function(){
            if(dbMan.studyPeriodDelete(studyPeriodDeletePage.studyPeriodId))
                studyPeriodSuccessDelDialog.open();
            else
                studyPeriodErrorDelDialog.open();
        }
    }

    BaseDialog
    {
        id: studyPeriodSuccessDelDialog
        dialogTitle:  "حذف سال‌تحصیلی"
        dialogText: "حذف سال‌تحصیلی با موفقیت صورت پذیرفت"
        acceptVisible: true
        dialogSuccess: true
        acceptAction: function(){
            homeStackViewId.pop();
            studyPeriodPage.studyPeriodDeleted(studyPeriodDeletePage.studyPeriodIndex);
        }
    }

    BaseDialog
    {
        id: studyPeriodErrorDelDialog
        dialogTitle:  "حذف سال‌تحصیلی"
        dialogText: "حذف سال‌تحصیلی با مشکل مواجه شد"
        acceptVisible: true
        dialogSuccess: false
    }
}
