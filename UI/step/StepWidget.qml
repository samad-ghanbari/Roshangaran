import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Step.js" as Methods

SwipeDelegate
{
   //s.id, s.branch_id, s.step_name, b.city, b.branch_name, b.description
    id: stepDelegate
    property int stepId
    property int branchId
    property string stepName
    property string branchCity
    property string branchName
    property string branchDescription

    signal stepUpdated(var stepObj);
    onStepUpdated: (stepObj) => Methods.updateWidget(stepObj);

    width: stepsLV.width
    height: 110
    checkable: true
    checked: swipe.complete
    onCheckedChanged: {if(!checked) swipe.close();}
    highlighted: (index === stepsLV.currentIndex)? true: false;
    clip: true

    background: Rectangle{color: (highlighted)? "snow" : "whitesmoke";}



    contentItem: Rectangle
    {
        color: (highlighted)? "snow" : "whitesmoke";

        Column
        {
            id: stepDelegateCol
            anchors.fill: parent

            spacing: 0
            Label {
                text: stepName
                padding: 0
                font.family: yekanFont.font.family
                font.pixelSize: (highlighted)? 20 :16
                font.bold: (highlighted)? true : false
                color: (highlighted)? "royalblue":"black"
                horizontalAlignment: Label.AlignHCenter
                width: parent.width
                height: 50
                elide: Text.ElideRight
            }
            Label {
                text: branchCity + " - " + branchName
                padding: 0
                font.family: yekanFont.font.family
                font.pixelSize: 14
                font.bold: (highlighted)? true : false
                color: (highlighted)? "darkcyan": "black"
                width: parent.width
                height: 50
                horizontalAlignment: Label.AlignHCenter
                elide: Text.ElideRight
            }

            Rectangle{width: 400; height:5; color: (highlighted)? "mediumvioletred" : "whitesmoke"; anchors.horizontalCenter: parent.horizontalCenter }
        }
    }

    swipe.right: Row{
        width: 150
        height: 100
        anchors.left: parent.left

        Button
        {
            height: 100
            width: 75
            background: Rectangle{id:trashBtnBg; color: "crimson"}
            hoverEnabled: true
            onHoveredChanged: trashBtnBg.color=(hovered)? Qt.darker("crimson", 1.1):"crimson"
            text: "حذف"
            font.bold: true
            font.family: yekanFont.font.family
            font.pixelSize: 14
            palette.buttonText:  "white"
            icon.source: "qrc:/Assets/images/trash.png"
            icon.width: 32
            icon.height: 32
            display: AbstractButton.TextUnderIcon
            SwipeDelegate.onClicked:
            {
                if(swipe.complete)
                    swipe.close();
                //homeStackViewId.push(deletestepComponent, {stepId: stepDelegate.stepId, stepIndex: stepsLV.currentIndex,  stepCity: stepDelegate.stepCity, stepName:stepDelegate.stepName, stepDescription: stepDelegate.stepDescription, stepAddress: stepDelegate.stepAddress });
            }
        }
        Button
        {
            height: 100
            width: 75
            background:  Rectangle{id:editBtnBg; color: "royalblue"}
            hoverEnabled: true
            onHoveredChanged: editBtnBg.color=(hovered)? Qt.darker("royalblue", 1.1):"royalblue"
            text: "ویرایش"
            font.bold: true
            font.family: yekanFont.font.family
            font.pixelSize: 14
            palette.buttonText:  "white"
            icon.source: "qrc:/Assets/images/edit.png"
            icon.width: 32
            icon.height: 32
            display: AbstractButton.TextUnderIcon
            SwipeDelegate.onClicked:
            {
                if(swipe.complete)
                    swipe.close();
                //homeStackViewId.push(updatestepComponent, {stepId: stepDelegate.stepId, stepCity: stepDelegate.stepCity, stepName:stepDelegate.stepName, stepDescription: stepDelegate.stepDescription, stepAddress: stepDelegate.stepAddress });
            }
        }
    }

    onClicked: {swipe.close();}
    onPressed: { stepsLV.currentIndex = index;}

    // Component
    // {
    //     id: updatestepComponent
    //     Updatestep{}
    // }
    // Component
    // {
    //     id: deletestepComponent
    //     stepDelete{}
    // }

}
