import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "StudyPeriod.js" as Methods

Page {
    id: updateStudyPeriodPage
    property int studyPeriodId
    property string period
    property string branch
    property string step
    property string basis

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
            text: "ویرایش سال‌تحصیلی"
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
                    Item{
                        anchors.fill: parent
                        anchors.margins: 10
                        ColumnLayout
                        {
                            id: studyPeriodUpdateCL
                            width: parent.width
                            Image {
                                source: "qrc:/Assets/images/edit.png"
                                Layout.alignment: Qt.AlignHCenter
                                Layout.preferredHeight:  64
                                Layout.preferredWidth:  64
                                Layout.margins: 20
                                NumberAnimation on scale { from: 0; to: 1; duration: 2000;}
                            }

                            GridLayout
                            {
                                id: studyPeriodUpdateGL
                                columns: 2
                                rows: 5
                                rowSpacing: 20
                                columnSpacing: 10
                                Layout.preferredWidth:  parent.width


                                Text {
                                    text: "شعبه"
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
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                    text: updateStudyPeriodPage.branch
                                    color: "royalblue"
                                    font.bold: true

                                }

                                Text {
                                    text: "دوره"
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
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                    text: updateStudyPeriodPage.step
                                    color: "royalblue"
                                    font.bold: true
                                }

                                Text {
                                    text: "پایه"
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
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                    text: updateStudyPeriodPage.basis
                                    color: "royalblue"
                                    font.bold: true
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
                                TextField
                                {
                                    id: studyPeriodTF
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    font.family: yekanFont.font.family
                                    font.pixelSize: 16
                                    text: updateStudyPeriodPage.period
                                    color: "royalblue"
                                    font.bold: true
                                    placeholderText: "سال‌تحصیلی"
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
                                    var StudyPeriod = {};
                                    StudyPeriod["id"] = updateStudyPeriodPage.studyPeriodId;
                                    StudyPeriod["period"] = studyPeriodTF.text;

                                    var check = true
                                    // check entries
                                    if(!Methods.checkPeriodUpdateEntries(StudyPeriod))
                                    {
                                        studyPeriodInfoDialogId.open();
                                        return;
                                    }

                                    if(dbMan.studyPeriodUpdate(StudyPeriod))
                                    {
                                        studyPeriodInfoDialogId.dialogSuccess = true
                                        studyPeriodInfoDialogId.dialogTitle = "عملیات موفق"
                                        studyPeriodInfoDialogId.dialogText = "اطلاعات سال‌تحصیلی با موفقیت بروزرسانی شد"
                                        StudyPeriod = dbMan.getStudyPeriod(StudyPeriod["id"]);
                                        studyPeriodDelegate.periodUpdated(StudyPeriod);
                                        studyPeriodInfoDialogId.acceptAction = function(){studyPeriodInfoDialogId.close(); homeStackViewId.pop();}
                                        studyPeriodInfoDialogId.open();

                                    }
                                    else
                                    {
                                        var errorString = dbMan.getLastError();
                                        studyPeriodInfoDialogId.dialogTitle = "خطا"
                                        studyPeriodInfoDialogId.dialogText = errorString
                                        studyPeriodInfoDialogId.width = parent.width
                                        studyPeriodInfoDialogId.height = 500
                                        studyPeriodInfoDialogId.dialogSuccess = false
                                        studyPeriodInfoDialogId.open();
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
        id: studyPeriodInfoDialogId
        dialogTitle: "خطا"
        dialogText: "ورود فیلد الزامی می‌باشد"
        dialogSuccess: false
    }
}
