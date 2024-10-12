import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "StudyPeriod.js" as Methods

Page {
    id: studyPeriodPage
    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    signal studyPeriodDeleted(int deleteIndex);
    onStudyPeriodDeleted: (deleteIndex)=>
                   {
                       studyPeriodModel.remove(deleteIndex);
                   }

    signal studyPeriodInserted(int bId);
    onStudyPeriodInserted: (bId)=> Methods.updateStudyPeriod(bId);


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
            text: "لیست سال‌های تحصیلی"
            font.family: yekanFont.font.family
            font.pixelSize: 24
            font.bold: true
            color: "mediumvioletred"
            style: Text.Outline
            styleColor: "white"
        }

        RowLayout{
            Layout.columnSpan: 2
            Layout.preferredHeight:  50
            Layout.preferredWidth: branchLbl.width + branchCB.width
            Layout.alignment: Qt.AlignHCenter

            Label
            {
                id: branchLbl
                Layout.preferredHeight:  50
                Layout.preferredWidth: 100
                text:" انتخاب شعبه"
                font.family: yekanFont.font.family
                font.pixelSize: 16
                font.bold: true
                horizontalAlignment: Label.AlignLeft
                verticalAlignment: Label.AlignVCenter
            }
            ComboBox
            {
                id: branchCB
                Layout.preferredHeight:  50
                Layout.fillWidth: true
                Layout.maximumWidth: 400
                editable: false
                font.family: yekanFont.font.family
                font.pixelSize: 16
                model: ListModel{id: branchCBoxModel}
                textRole: "text"
                valueRole: "value"
                Component.onCompleted:
                {
                    Methods.updateBranchCB();
                    branchCB.currentIndex = -1
                }
                onActivated: Methods.updateStepCB(branchCB.currentValue)
            }
        }

        RowLayout{
            Layout.columnSpan: 2
            Layout.preferredHeight:  50
            Layout.preferredWidth: stepLbl.width + stepCB.width
            Layout.alignment: Qt.AlignHCenter

            Label
            {
                id: stepLbl
                Layout.preferredHeight:  50
                Layout.preferredWidth: 100
                text:" انتخاب دوره"
                font.family: yekanFont.font.family
                font.pixelSize: 16
                font.bold: true
                horizontalAlignment: Label.AlignLeft
                verticalAlignment: Label.AlignVCenter
            }
            ComboBox
            {
                id: stepCB
                Layout.preferredHeight:  50
                Layout.fillWidth: true
                Layout.maximumWidth: 400
                editable: false
                font.family: yekanFont.font.family
                font.pixelSize: 16
                model: ListModel{id: stepCBoxModel}
                textRole: "text"
                valueRole: "value"
                onActivated: Methods.updateBasis(stepCB.currentValue)
            }
        }

        RowLayout{
            Layout.columnSpan: 2
            Layout.preferredHeight:  50
            Layout.preferredWidth: basisLbl.width + basisCB.width
            Layout.alignment: Qt.AlignHCenter

            Label
            {
                id: basisLbl
                Layout.preferredHeight:  50
                Layout.preferredWidth: 100
                text:" انتخاب پایه"
                font.family: yekanFont.font.family
                font.pixelSize: 16
                font.bold: true
                horizontalAlignment: Label.AlignLeft
                verticalAlignment: Label.AlignVCenter
            }
            ComboBox
            {
                id: basisCB
                Layout.preferredHeight:  50
                Layout.fillWidth: true
                Layout.maximumWidth: 400
                editable: false
                font.family: yekanFont.font.family
                font.pixelSize: 16
                model: ListModel{id: basisCBoxModel}
                textRole: "text"
                valueRole: "value"
                onActivated: Methods.updateStudyPeriod(basisCB.currentValue)
            }
        }

        Rectangle
        {
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "ghostwhite"
            ColumnLayout
            {
                anchors.fill: parent

                Button
                {
                    Layout.preferredHeight:   64
                    Layout.preferredWidth: 64
                    Layout.alignment: Qt.AlignRight
                    background: Item{}
                    visible: (basisCB.currentIndex >=0)? true : false;
                    icon.source: "qrc:/Assets/images/add.png"
                    icon.width: 64
                    icon.height: 64
                    opacity: 0.5
                    onClicked:
                    {
                        var bid = basisCB.currentValue;
                        if(bid >= 0)
                            homeStackViewId.push(studyPeriodInsertComponent, {basisId: bid, branch: branchCB.currentText, step: stepCB.currentText, basis: basisCB.currentText });
                        else
                            insertInfoDialogId.open();
                    }
                    hoverEnabled: true
                    onHoveredChanged: this.opacity=(hovered)? 1 : 0.5;
                }

                ButtonGroup
                {
                    buttons: studyPeriodLV.contentItem.children
                }

                ListView
                {
                    id: studyPeriodLV
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: 10
                    flickableDirection: Flickable.AutoFlickDirection
                    clip: true
                    spacing: 5
                    model: ListModel{id: studyPeriodModel}
                    highlight: Item{}
                    delegate: StudyPeriodWidget{studyPeriodId: Id; basisId: BasisId; period: Period; branch: Branch; step: Step; basis: Basis}

                }
            }
        }
    }

    Component
    {
        id: studyPeriodInsertComponent
        StudyPeriodInsert{}
    }
    BaseDialog
    {
        id: insertInfoDialogId
        dialogTitle: "خطا"
        dialogText: "دوره تحصیل مورد نظر خود را انتخاب نمایید"
        dialogSuccess: false
    }
}
