import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


SwipeDelegate
{
    //id, city, branch_name, address, description
    id: branchWidget
    property int branchId
    property string branchCity
    property string branchName
    property string branchDescription
    property string branchAddress

    width: parent.width
    height: gridviewItem.implicitHeight
    checkable: false
    checked: swipe.complete
    onCheckedChanged: if(!checked) swipe.close()
    highlighted: true
    clip: true

    GridLayout
    {
        id: gridviewItem
        columns: 3
        Text {
            text: branchCity
            font.family: yekanFont.font.family
            font.pixelSize: 16
            width: 50
            horizontalAlignment: Qt.AlignHCenter
        }
        Text {
            text: branchName
            font.family: yekanFont.font.family
            font.pixelSize: 16
            width: 50
            horizontalAlignment: Qt.AlignHCenter
        }
        Text {
            text: branchDescription
            font.family: yekanFont.font.family
            font.pixelSize: 16
            Layout.fillWidth: true
            horizontalAlignment: Qt.AlignHCenter
        }

        Text {
            Layout.columnSpan: 3
            text: branchAddress
            font.family: yekanFont.font.family
            font.pixelSize: 14
            Layout.fillWidth: true
            horizontalAlignment: Qt.AlignHCenter
        }
    }

    swipe.right: Row
    {
        anchors.left: parent.left
        height: parent.height
        width: 128
        Button
        {
            background: Item{}
            icon.source: "qrc:/Assets/images/trash.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("del")
            Layout.alignment: Qt.AlignVCenter

        }
        Button
        {
            background: Item{}
            icon.source: "qrc:/Assets/images/edit.png"
            icon.width: 32
            icon.height: 32
            onClicked: homeStackViewId.push(updateBranchComponent, {branchId: branchWidget.branchId, branchCity: branchWidget.branchCity, branchName:branchWidget.branchName, branchDescription: branchWidget.branchDescription, branchAddress: branchWidget.branchAddress });
            Layout.alignment: Qt.AlignVCenter

        }

    }

    onClicked: {swipe.close();}

    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }
}
