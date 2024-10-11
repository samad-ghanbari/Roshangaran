import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Basis.js" as Methods

SwipeDelegate
{
    //basisId stepId basisName branch step
    id: basisDelegate
    property int basisId
    property int stepId
    property string basisName
    property string branch
    property string step

    signal basisUpdated(var basisObj);
    onBasisUpdated: (basisObj) => Methods.updateWidget(basisObj);

    width: basisLV.width
    height: 110
    checkable: true
    checked: swipe.complete
    onCheckedChanged: {if(!checked) swipe.close();}
    highlighted: (index === basisLV.currentIndex)? true: false;
    clip: true

    background: Rectangle{color: (highlighted)? "snow" : "whitesmoke";}



    contentItem: Rectangle
    {
        color: (highlighted)? "snow" : "whitesmoke";

        Column
        {
            id: basisDelegateCol
            anchors.fill: parent

            spacing: 0
            Label {
                text: basisDelegate.basisName
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
                text: basisDelegate.branch + " - " + basisDelegate.step
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
                homeStackViewId.push(deleteBasisComponent, {basisId: basisDelegate.basisId, basisIndex: basisLV.currentIndex,  basisName: basisDelegate.basisName, branch: basisDelegate.branch, step: basisDelegate.step});
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
                homeStackViewId.push(updateBasisComponent, {basisId: basisDelegate.basisId, basisName: basisDelegate.basisName, branch: basisDelegate.branch, step: basisDelegate.step });
            }
        }
    }

    onClicked: {swipe.close();}
    onPressed: { basissLV.currentIndex = index;}

    Component
    {
        id: updateBasisComponent
        BasisUpdate{}
    }
    Component
    {
        id: deleteBasisComponent
        BasisDelete{}
    }

}
