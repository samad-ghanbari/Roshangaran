import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./../public"
import "Base.js" as Methods

Page {
    id: basePage
    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    signal baseDeleted(int deleteIndex);
    onBasisDeleted: (deleteIndex)=>
                   {
                       basisModel.remove(deleteIndex);
                   }

    signal basisInserted(int sId);
    onBasisInserted: (sId)=> Methods.updateBasis(sId);


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
            text: "لیست پایه‌ها"
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
                onActivated: Methods.updateBase(stepCB.currentValue)
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
                    visible: (stepCB.currentIndex >=0)? true : false;
                    icon.source: "qrc:/Assets/images/add.png"
                    icon.width: 64
                    icon.height: 64
                    opacity: 0.5
                    onClicked:
                    {
                        var sid = stepCB.currentValue;
                        if(sid >= 0)
                            homeStackViewId.push(baseInsertComponent, {stepId: sid, branch: branchCB.currentText, step: stepCB.currentText });
                        else
                            insertInfoDialogId.open();
                    }
                    hoverEnabled: true
                    onHoveredChanged: this.opacity=(hovered)? 1 : 0.5;
                }

                ButtonGroup
                {
                    buttons: baseLV.contentItem.children
                }

                ListView
                {
                    id: baseLV
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: 10
                    flickableDirection: Flickable.AutoFlickDirection
                    clip: true
                    spacing: 5
                    model: ListModel{id: baseModel} //Id BranchId baseName BranchName BranchDescription
                    highlight: Item{}
                    // property int baseId
                    // property int branchId
                    // property string baseName
                    // property string branchCity
                    // property string branchName
                    // property string branchDescription
                    delegate: BaseWidget{baseId: Id; stepId: StepId; baseName: BaseName; branch: Branch; step: Step}

                }
            }
        }
    }

    Component
    {
        id: baseInsertComponent
        BaseInsert{}
    }
    BaseDialog
    {
        id: insertInfoDialogId
        dialogTitle: "خطا"
        dialogText: "شعبه مورد نظر خود را انتخاب نمایید"
        dialogSuccess: false
    }
}
