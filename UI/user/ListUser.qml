import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Page {

    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    ColumnLayout
    {
        anchors.fill: parent

        RowLayout
        {
            width: parent.width
            Button
            {
                id: newUserBackBtnId
                font.family: yekanFont.font.family
                font.pixelSize: 48
                background: Item{}
                icon.source: "qrc:/Assets/images/arrow-right.png"
                icon.width: 64
                icon.height: 64
                opacity: 0.5
                palette.buttonText: "steelblue"
                font.bold: true
                onClicked: homeStackViewId.pop();
                hoverEnabled: true
                //onHoveredChanged: newUserBackBtnId.palette.buttonText=(hovered)? "royalblue" : "steelblue";
                onHoveredChanged: newUserBackBtnId.opacity=(hovered)? 1 : 0.5;
            }
            Item
            {
                Layout.fillWidth: true
            }
        }

        Text {
            id: newUserTitle
            text: "لیست کاربران سامانه"
            width: parent.width
            Layout.alignment: Qt.AlignHCenter
            font.family: yekanFont.font.family
            font.pixelSize: 24
            font.bold: true
            color: "mediumvioletred"
            style: Text.Outline
            styleColor: "black"

        }
        Image {
            id: newUserIcon
            source: "qrc:/Assets/images/users.png"
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumHeight: 128
            Layout.maximumWidth: 128
            Layout.margins: 20
            width: 128
            height: 128
            NumberAnimation on scale { from: 0; to: 1; duration: 2000;}
        }

        ListView {
            id: lv
            Layout.maximumWidth: (parent.width < 700)? parent.width : 700
            Layout.minimumWidth: (parent.width < 700)? parent.width : 700
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true

            model:     ListModel { id: myModel }
            delegate: Switch {text: type + ", " + age; onCheckedChanged: console.log(item_id) }
            Component.onCompleted:
            {
                myModel.append({item_id:"a1",  type: "Dog", age: 8 });
                myModel.append({ item_id:"a2",  type: "cat", age: 2 });
            }
        }

        Button
        {
            text: "click"
            // onClicked: lv.model. ;
        }
    }
}
