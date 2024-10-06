import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

PaddedRectangle {

    //id, city, branch_name, address, description
    id: branchWidget
    property int branchId
    property string branchCity
    property string branchName
    property string branchDescription
    property string branchAddress

    color: "white"
    padding: -5
    implicitHeight: branchWRL.height
    width: parent.width
    RowLayout
    {
        id: branchWRL
        width: parent.width

        spacing: 10

        Text {
            text: branchCity
            font.family: yekanFont.font.family
            font.pixelSize: 16
            font.bold: true
            color: "royalblue"
            Layout.preferredWidth: 100
            Layout.preferredHeight: 40
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 5
        }
        Text {
            text: branchName
            font.family: yekanFont.font.family
            font.pixelSize: 16
            font.bold: true
            color: "royalblue"
            Layout.preferredWidth: 200
            Layout.preferredHeight: 40
            Layout.alignment: Qt.AlignLeft
        }
        Text {
            text: branchDescription
            font.family: yekanFont.font.family
            font.pixelSize: 16
            font.bold: true
            color: "royalblue"
            Layout.alignment: Qt.AlignLeft
            Layout.preferredHeight: 40
            Layout.preferredWidth: 200
            Layout.margins: 5
        }
        Text {
            text: branchAddress
            font.family: yekanFont.font.family
            font.pixelSize: 16
            color: "royalblue"
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
            Layout.preferredHeight: 40
        }

    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        onHoveredChanged: branchWidget.color = (containsMouse)? "lavender" : "white"
        onClicked: {
            homeStackViewId.push(updateBranchComponent, {branchId: branchWidget.branchId, branchCity: branchWidget.branchCity, branchName:branchWidget.branchName, branchDescription: branchWidget.branchDescription, branchAddress: branchWidget.branchAddress });
        }
    }

    Component
    {
        id: updateBranchComponent
        UpdateBranch{}
    }

}
