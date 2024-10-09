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
        Column
        {
            id: branchDelegateCol
            anchors.fill: parent

            spacing: 0
            Text {
                text: branchCity +" - "+ branchName +" - "+ branchDescription
                padding: 0
                font.family: yekanFont.font.family
                font.pixelSize: 16
                font.bold: true
                color: "royalblue"
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
                width: parent.width
                height: 50
                horizontalAlignment: Label.AlignHCenter
                elide: Text.ElideRight
            }
        }
    }

    swipe.right: Row{
        width: 110
        height: 100
        anchors.left: parent.left

        Button
        {
            height: 100
            width: 50
            background: Rectangle{id:trashBtnBg; color: "tomato"}
            hoverEnabled: true
            onHoveredChanged: trashBtnBg.color=(hovered)? Qt.darker("tomato", 1.1):"tomato"
            icon.source: "qrc:/Assets/images/trash.png"
            icon.width: 32
            icon.height: 32
            SwipeDelegate.onClicked: console.log("del")
        }
        Button
        {
            height: 100
            width: 50
            background:  Rectangle{id:editBtnBg; color: "royalblue"}
            hoverEnabled: true
            onHoveredChanged: editBtnBg.color=(hovered)? Qt.darker("royalblue", 1.1):"royalblue"
            icon.source: "qrc:/Assets/images/edit.png"
            icon.width: 32
            icon.height: 32
            SwipeDelegate.onClicked: homeStackViewId.push(updateBranchComponent, {branchId: branchDelegate.branchId, branchCity: branchDelegate.branchCity, branchName:branchDelegate.branchName, branchDescription: branchDelegate.branchDescription, branchAddress: branchDelegate.branchAddress });
        }
    }

    onClicked: {swipe.close(); branchesLV.currentIndex = index;}
    //onPressed: { branchesLV.currentIndex = index;}

    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
