import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: addNewUserPageId

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
            text: "ایجاد کاربر جدید سامانه"
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
            source: "qrc:/Assets/images/newUser.png"
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumHeight: 128
            Layout.maximumWidth: 128
            Layout.margins: 20
            width: 128
            height: 128
            NumberAnimation on scale { from: 0; to: 1; duration: 2000;}
        }

        // name lastname  natid password repassword email position telephone  access permission enable
        // access       object  branch[]-step[]-grade[]-app-module[]
        // permission   object  branch[]-step[]-grade[]-app-module[] this is write permissions


        ScrollView
        {
            id: newUserSV
            Layout.maximumWidth: (parent.width < 700)? parent.width : 700
            Layout.minimumWidth: (parent.width < 700)? parent.width : 700
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            background: Rectangle{anchors.fill: parent; color:"white"; anchors.margins: -20; radius: 10}

            GridLayout
            {
                id: newUserFormId
                columns: 2
                rows: 11
                rowSpacing: 20
                columnSpacing: 10
                width: newUserSV.width


                Text {
                    id: newUserNameId
                    text: "نام کاربر "
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "نام کاربر"
                }

                Text {
                    id: newUserFamilyId
                    text: "نام خانوادگی"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "نام خانوادگی"
                }

                Text {
                    id: newUserNatidId
                    text: "کد ملی"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "کد ملی کاربر"
                }

                Text {
                    id: newUserPassId
                    text: "رمز عبور کاربر"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "رمز عبور"
                    echoMode: TextField.Password
                }
                Text {
                    id: newUserPassRepeatId
                    text: "تکرار رمز عبور"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "تکرار رمز عبور"
                    echoMode: TextField.Password
                }


                Text {
                    id: newUserEmailId
                    text: "پست الکترونیکی"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "پست الکترونیکی"
                }

                Text {
                    id: newUserPositionId
                    text: "پست کاربر"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "پست کاربر"
                }

                Text {
                    id: newUserTelId
                    text: "شماره تماس"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                TextField
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    placeholderText: "شماره تماس"
                }


                //enabled
                Text {
                    text: "فعال بودن کاربر"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "royalblue"
                }
                Switch
                {
                    id: newUserEnabledId
                    checked: true
                }


                // access
                Text {
                    text: "دسترسی‌های کاربر"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignHCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 24
                    font.bold: true
                    color: "royalblue"
                    style: Text.Outline
                    styleColor: "gray"
                }

                Rectangle
                {
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: "dodgerblue"
                }

                // branch
                Text {
                    text: "دسترسی‌ به شعبه‌ها"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                Flow
                {
                id: newUserAccessBranchId
                Layout.columnSpan: 2

                function getBranchJson()
                {
                    var jsondata = '[{"id":1, "city":"تهران", "branch_name":"شعبه میرداماد", "address":"منطقه۳ - میرداماد، میدان مادر (محسنی)، خیابان رودبار غربی", "description":"دوره اول میرداماد"}]';
                    jsondata = JSON.parse(jsondata);
                    return jsondata;
                }

                Repeater
                {
                    model: newUserAccessBranchId.getBranchJson();

                    Text
                    {
                        required property var branch

                        text: branch["tehran"]
                    }
                }

                }
                // step
                Text {
                    text: "دسترسی‌ به دوره‌ها"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                // basis
                Text {
                    text: "دسترسی‌ به پایه‌ها"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                //app-module
                Text {
                    text: "دسترسی‌ به ماژول‌های برنامه"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                Flow
                {
                id: newUserAccessId
                Layout.columnSpan: 2


                }


                // permissions
                Text {
                    text: "مجوزهای کاربر"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignHCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 24
                    font.bold: true
                    color: "royalblue"
                    style: Text.Outline
                    styleColor: "gray"
                }
                Rectangle
                {
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: "dodgerblue"
                }

                // branch
                // step
                // grade
                //app-module
                Flow
                {
                id: newUserPermissionId
                Layout.columnSpan: 2
                }

                Item
                {
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                }

                Button
                {
                    Layout.columnSpan: 2
                    text: "تایید"
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 50
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: console.log(newUserAccessBranchId.getBranchJson()[0]['city']);
                }

                Item
                {
                    Layout.columnSpan: 2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                }

            }

        }
    }

}
