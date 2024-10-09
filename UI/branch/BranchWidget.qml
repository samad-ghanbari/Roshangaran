import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


SwipeDelegate
{
    //id, city, branch_name, address, description
    id: branchDelegate
    property int branchId
    property string branchCity
    property string branchName
    property string branchDescription
    property string branchAddress

    width: parent.width
    height: 100
    checkable: true
    checked: swipe.complete
    onCheckedChanged: {if(!checked) swipe.close();}
    highlighted: (index === branchesLV.currentIndex)? true: false;
    clip: true

    background: Rectangle{color: (highlighted)? "whitesmoke" : "snow";}



    contentItem: Rectangle
    {
        color: (highlighted)? "whitesmoke" : "snow";
        //border.width: (highlighted)? 1 : 0
        //border.color: "mediumvioletred"

        Column
        {
            id: branchDelegateCol
            anchors.fill: parent

            spacing: 0
            Label {
                text: branchCity +" - "+ branchName +" - "+ branchDescription
                padding: 0
                font.family: yekanFont.font.family
                font.pixelSize: 16
                font.bold: (highlighted)? true : false
                color: (highlighted)? "royalblue":"black"
                horizontalAlignment: Label.AlignHCenter
                width: parent.width
                height: 50
                elide: Text.ElideRight
            }
            Label {
                text: branchAddress
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
            SwipeDelegate.onClicked: console.log("del")
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
            SwipeDelegate.onClicked: homeStackViewId.push(updateBranchComponent, {branchId: branchDelegate.branchId, branchCity: branchDelegate.branchCity, branchName:branchDelegate.branchName, branchDescription: branchDelegate.branchDescription, branchAddress: branchDelegate.branchAddress });
        }
    }

    onClicked: {swipe.close();}
    onPressed: { branchesLV.currentIndex = index;}

    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
