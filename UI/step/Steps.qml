import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "Step.js" as Methods

Page {
    id: stepsPage
    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    signal stepDeleted(int deleteIndex);
    onStepDeleted: (deleteIndex)=>
                   {
                       stepsModel.remove(deleteIndex);
                   }

    signal stepInserted(int bId);
    onStepInserted: (bId)=> Methods.stepsUpdate(bId);


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
            text: "لیست دوره‌ها"
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

                onActivated: Methods.stepsUpdate(branchCB.currentValue)

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
                    visible: (branchCB.currentIndex >=0)? true : false;
                    icon.source: "qrc:/Assets/images/add.png"
                    icon.width: 64
                    icon.height: 64
                    opacity: 0.5
                    onClicked:
                    {
                        var bid = branchCB.currentValue;
                        if(bid >= 0)
                            homeStackViewId.push(stepInsertComponent, {branchId: bid, branchText: branchCB.currentText });
                        else
                            insertInfoDialogId.open();
                    }
                    hoverEnabled: true
                    onHoveredChanged: this.opacity=(hovered)? 1 : 0.5;
                }

                ButtonGroup
                {
                    buttons: stepsLV.contentItem.children
                }

                ListView
                {
                    id: stepsLV
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: 10
                    flickableDirection: Flickable.AutoFlickDirection
                    clip: true
                    spacing: 5
                    model: ListModel{id: stepsModel} //Id BranchId StepName BranchName BranchDescription
                    highlight: Item{}
                    // property int stepId
                    // property int branchId
                    // property string stepName
                    // property string branchCity
                    // property string branchName
                    // property string branchDescription
                    delegate: StepWidget{stepId: Id; branchId: BranchId; stepName: StepName; branchCity: BranchCity; branchName: BranchName; branchDescription: BranchDescription}

                }
            }
        }
    }

    Component
    {
        id: stepInsertComponent
        StepInsert{}
    }
    BaseDialog
    {
        id: insertInfoDialogId
        dialogTitle: "خطا"
        dialogText: "شعبه مورد نظر خود را انتخاب نمایید"
        dialogSuccess: false
    }
}
