import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "ListUser.js" as ListUserJS

Page {
    id: userListPage
    background: Rectangle{anchors.fill: parent; color: "ghostwhite"}

    function updateUserListModel()
    {
        ListUserJS.updateUsersModel();
    }

    Connections
    {
        target: appWindowId
        function onNewUserSignal()
        {
            ListUserJS.updateUsersModel();
        }
    }

    GridLayout
    {
        anchors.fill: parent
        columns: 3

        Button
        {
            id: userListBackBtnId
            Layout.preferredHeight: 64
            Layout.preferredWidth: 64
            background: Item{}
            icon.source: "qrc:/Assets/images/arrow-right.png"
            icon.width: 64
            icon.height: 64
            opacity: 0.5
            onClicked: homeStackViewId.pop();
            hoverEnabled: true
            onHoveredChanged: userListBackBtnId.opacity=(hovered)? 1 : 0.5;
        }
        Text {
            id: userListTitle
            text: "لیست کاربران سامانه"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            font.family: yekanFont.font.family
            font.pixelSize: 24
            font.bold: true
            color: "mediumvioletred"
        }
        Button
        {
            id: userListSearchBtnId
            Layout.preferredHeight: 64
            Layout.preferredWidth: 64
            background: Item{}
            icon.source: "qrc:/Assets/images/search.png"
            icon.width: 64
            icon.height: 64
            opacity: 0.5
            onClicked: userSearchDrawer.open();
            hoverEnabled: true
            onHoveredChanged: userListSearchBtnId.opacity=(hovered)? 1 : 0.5;
        }

        Button
        {
            Layout.columnSpan: 3
            Layout.preferredHeight: 64
            Layout.preferredWidth: 64
            background: Item{}
            icon.source: "qrc:/Assets/images/add.png"
            icon.width: 64
            icon.height: 64
            opacity: 0.5
            //onClicked: .open();
            hoverEnabled: true
            onHoveredChanged: userListSearchBtnId.opacity=(hovered)? 1 : 0.5;
        }


        GridView {
            id: gview
            Layout.columnSpan: 3
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 20
            cellWidth: 300
            cellHeight: 300
            //spacing: 20
            model: ListModel{id: userListModel}
            delegate: UsersListWidget{
                userId: Id; userName: Name; userLastname: Lastname; userNatId: Nat_id; userJobPosition: Job_position;
                userEnabled: Enabled; userAdmin: Admin; userIsFemale: UserFemale; }
            layoutDirection: Qt.LeftToRight
            //orientation: ListView.Horizontal
            Component.onCompleted: { ListUserJS.updateUsersModel();}
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
                spacing: 10

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

                //Rectangle{Layout.fillWidth: true; height: 4; color:"royalblue"}
                // name lastname natid tel email position admin en admin
                //name
                Text {
                    text: "نام کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    color: "royalblue"
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignLeft
                    Layout.leftMargin: 10
                }
                TextField
                {
                    id: searchUserNameTF
                    placeholderText: "نام کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.margins: 10
                    Layout.topMargin: -10
                }

                //lastname
                Text {
                    text: "نام‌خانوادگی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    color: "royalblue"
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignLeft
                    Layout.leftMargin: 10
                }
                TextField
                {
                    id: searchUserLastNameTF
                    placeholderText: "نام‌خانوادگی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.margins: 10
                    Layout.topMargin: -10
                }

                //natid
                Text {
                    text: "کد‌ملی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    color: "royalblue"
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignLeft
                    Layout.leftMargin: 10
                }
                TextField
                {
                    id: searchUserNatidTF
                    placeholderText: "کد‌ملی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.margins: 10
                    Layout.topMargin: -10
                }

                //tel
                Text {
                    text: "شماره‌تماس کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    color: "royalblue"
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignLeft
                    Layout.leftMargin: 10
                }
                TextField
                {
                    id: searchUserTelTF
                    placeholderText: "شماره‌تماس کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.margins: 10
                    Layout.topMargin: -10
                }
                //email
                Text {
                    text: "پست‌الکترونیکی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    color: "royalblue"
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignLeft
                    Layout.leftMargin: 10
                }
                TextField
                {
                    id: searchUserEmailTF
                    placeholderText: "پست‌الکترونیکی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.margins: 10
                    Layout.topMargin: -10
                }

                //Positioner
                Text {
                    text: "سمت‌شغلی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    color: "royalblue"
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignLeft
                    Layout.leftMargin: 10
                }
                TextField
                {
                    id: searchUserPositionTF
                    placeholderText: "سمت‌شغلی کاربر"
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.margins: 10
                    Layout.topMargin: -10
                }

                // button

                Button
                {
                    text: "جستجو"
                    font.family: yekanFont.font.family
                    font.pixelSize: 14
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 100
                    Layout.alignment: Qt.AlignHCenter
                    icon.source: "qrc:/Assets/images/search.png"
                    icon.width: 32
                    icon.height: 32

                    onClicked: {}

                    Rectangle{width: parent.width; height: 4; color:"royalblue"; anchors.bottom: parent.bottom}
                }
            }
        }
    }
}

