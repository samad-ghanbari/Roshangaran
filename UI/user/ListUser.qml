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
            height: 64
            Button
            {
                id: userListBackBtnId
                background: Item{}
                icon.source: "qrc:/Assets/images/arrow-right.png"
                icon.width: 64
                icon.height: 64
                opacity: 0.5
                onClicked: homeStackViewId.pop();
                hoverEnabled: true
                onHoveredChanged: userListBackBtnId.opacity=(hovered)? 1 : 0.5;
            }
            Item
            {
                Layout.fillWidth: true
            }

            Text {
                id: userListTitle
                text: "لیست کاربران سامانه"
                Layout.alignment: Qt.AlignHCenter
                font.family: yekanFont.font.family
                font.pixelSize: 24
                font.bold: true
                color: "mediumvioletred"
                style: Text.Outline
                styleColor: "black"
            }

            Item
            {
                Layout.fillWidth: true
            }
            Button
            {
                id: userListSearchBtnId
                background: Item{}
                icon.source: "qrc:/Assets/images/search.png"
                icon.width: 64
                icon.height: 64
                opacity: 0.5
                onClicked: userSearchDrawer.open();
                hoverEnabled: true
                onHoveredChanged: userListSearchBtnId.opacity=(hovered)? 1 : 0.5;
            }
        }


        ListView {
            id: lv
            Layout.maximumWidth: (parent.width < 700)? parent.width : 700
            Layout.minimumWidth: (parent.width < 700)? parent.width : 700
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true

        }
    }

    Drawer
    {
        id: userSearchDrawer
        modal: true
        height: parent.height
        width: 300 //(parent.width > 300)? 300 : parent.width;

        ScrollView
        {
            id: userListDrawerSV
            anchors.fill: parent

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            ColumnLayout
            {
                anchors.fill: parent
                width:parent.width

                Rectangle
                {
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: 110
                    color: "lavender"

                    Image {
                        id: searchUserListImage
                        source: "qrc:/Assets/images/search.png"
                        width: 64
                        height: 64
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        width: parent.width
                        height: 40
                        anchors.top: searchUserListImage.bottom
                        horizontalAlignment: Qt.AlignHCenter
                        anchors.topMargin: 10
                        text: "جستجوی کاربران"
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter
                        font.bold: true
                        color:"royalblue"
                    }
                }

                Rectangle{Layout.fillWidth: true; height: 4; color:"royalblue"}

                // name lastname natid tel email position admin en admin
            }
        }
    }
}

