import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./StudyPeriod.js" as Methods

SwipeDelegate
{
    //basisId stepId basisName branch step
    id: studyPeriodDelegate
    property int studyPeriodId
    property int basisId
    property string period
    property string branch
    property string step
    property string basis

    signal periodUpdated(var basisObj);
    onPeriodUpdated: (periodObj) => Methods.updateWidget(periodObj);

    width: studyPeriodLV.width
    height: 110
    checkable: true
    checked: swipe.complete
    onCheckedChanged: {if(!checked) swipe.close();}
    highlighted: (index === studyPeriodLV.currentIndex)? true: false;
    clip: true

    background: Rectangle{color: (highlighted)? "snow" : "whitesmoke";}



    contentItem: Rectangle
    {
        color: (highlighted)? "snow" : "whitesmoke";

        Column
        {
            id: studyPeriodDelegateCol
            anchors.fill: parent

            spacing: 0
            Label {
                text: studyPeriodDelegate.period
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
                text: studyPeriodDelegate.branch + " - " + studyPeriodDelegate.step + " - " + studyPeriodDelegate.basis
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
                homeStackViewId.push(deletePeriodComponent, {studyPeriodId: studyPeriodDelegate.studyPeriodId, studyPeriodIndex: studyPeriodLV.currentIndex, period: studyPeriodDelegate.period,  basis: studyPeriodDelegate.basis, branch: studyPeriodDelegate.branch, step: studyPeriodDelegate.step});
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
                homeStackViewId.push(updatePeriodComponent, {studyPeriodId: studyPeriodDelegate.studyPeriodId, period: studyPeriodDelegate.period, branch: studyPeriodDelegate.branch, step: studyPeriodDelegate.step, basis: studyPeriodDelegate.basis });
            }
        }
    }

    onClicked: {swipe.close();}
    onPressed: { studyPeriodLV.currentIndex = index;}

    Component
    {
        id: updatePeriodComponent
        StudyPeriodUpdate{}
    }
    Component
    {
        id: deletePeriodComponent
        StudyPeriodDelete{}
    }

}
