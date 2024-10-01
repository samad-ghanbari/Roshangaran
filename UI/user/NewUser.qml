import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "newUserJS.js" as UserMethods

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

                //enabled
                Text {
                    text: "ادمین سامانه"
                    Layout.minimumWidth: 150
                    Layout.maximumWidth: 150
                    Layout.preferredHeight: 50
                    verticalAlignment: Text.AlignVCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    font.bold: true
                    color: "crimson"
                }
                Switch
                {
                    id: newUserAdminId
                    checked: false
                }
                Text {
                    text: "هشدار! کاربر ادمین، دسترسی کامل به مدیریت سامانه دارد"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    Layout.topMargin: -10
                    font.pixelSize: 14
                    font.bold: true
                    color: "orange"
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





                ListView
                {
                    id: newUserAccessBranchId
                    Layout.columnSpan: 2
                    model:                     ListModel {
                        id: myModel
                        ListElement { type: "Dog"; age: 8 }
                        ListElement { type: "Cat"; age: 5 }
                    }
                    // ListModel{ ListElement{id:1; city:"تهران"; branch_name:"شعبه میرداماد"; address:"منطقه۳ - میرداماد، میدان مادر (محسنی)، خیابان رودبار غربی"; description:"دوره اول میرداماد"}}
                    delegate:
                        Text{
                        //id: model.id
                        text: model.type + " - " + model.age
                        font.family: yekanFont.font.family
                        font.pixelSize: 14
                    }

                    Component.onCompleted:
                    {
                        //UserMethods.updateAccessBranch()
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
                Flow
                {
                    id: newUserAccessStepId
                    Layout.columnSpan: 2

                    ListView
                    {
                        id: newUserAccesssteId
                        model:ListModel{id:accessStepModel}
                        delegate:
                            Text{
                            //id: model.id
                            text: step_name
                            font.family: yekanFont.font.family
                            font.pixelSize: 14
                        }
                    }


                    Component.onCompleted:
                    {
                        UserMethods.updateAccessStep()
                    }


                    // Repeater
                    // {
                    //     model: ListModel{id:accessStepModel}
                    //     Switch
                    //     {
                    //         checked: false
                    //         text: model.step_name
                    //         font.family: yekanFont.font.family
                    //         font.pixelSize: 14
                    //     }

                    //     Component.onCompleted:
                    //     {
                    //         UserMethods.updateAccessStep()
                    //     }
                    // }
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
                Flow
                {
                    id: newUserAccessBasisId
                    Layout.columnSpan: 2


                    Repeater
                    {
                        model: ListModel{id:accessBasisModel}
                        Switch
                        {
                            checked: false
                            text: model.basis_name
                            font.family: yekanFont.font.family
                            font.pixelSize: 14
                        }

                        Component.onCompleted:
                        {
                            UserMethods.updateAccessBasis()
                        }
                    }
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
                    id: newUserAccessAppModuleId
                    Layout.columnSpan: 2


                    Repeater
                    {
                        model: ListModel{id:accessappModuleModel}
                        Switch
                        {
                            checked: false
                            text: model.description
                            font.family: yekanFont.font.family
                            font.pixelSize: 14
                        }

                        Component.onCompleted:
                        {
                            UserMethods.updateAccessAppModule();
                        }
                    }
                }


                // permissions
                Text {
                    text: "مجوزهای اعمال تغییرات"
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
                    text: "مجوز اعمال تغییرات در شعبه‌ها"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                Flow
                {
                    id: newUserPermBranchId
                    Layout.columnSpan: 2


                    Repeater
                    {
                        model: ListModel{id:permBranchModel}
                        Switch
                        {
                            checked: false
                            text: model.city + " " + model.branch_name
                            font.family: yekanFont.font.family
                            font.pixelSize: 14
                        }

                        Component.onCompleted:
                        {
                            UserMethods.updatePermissionBranch()
                        }
                    }
                }
                // step
                Text {
                    text: "مجوز اعمال تغییرات در دوره‌ها"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                Flow
                {
                    id: newUserPermStepId
                    Layout.columnSpan: 2


                    Repeater
                    {
                        model: ListModel{id:permStepModel}
                        Switch
                        {
                            checked: false
                            text: model.step_name
                            font.family: yekanFont.font.family
                            font.pixelSize: 14
                        }

                        Component.onCompleted:
                        {
                            UserMethods.updatePermissionStep()
                        }
                    }
                }
                // basis
                Text {
                    text: "مجوز اعمال تغییرات در پایه‌ها"
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignLeft
                    font.family: yekanFont.font.family
                    font.pixelSize: 18
                    font.bold: true
                    color: "royalblue"
                }
                Flow
                {
                    id: newUserPermBasisId
                    Layout.columnSpan: 2


                    Repeater
                    {
                        model: ListModel{id:permBasisModel}
                        Switch
                        {
                            checked: false
                            text: model.basis_name
                            font.family: yekanFont.font.family
                            font.pixelSize: 14
                        }

                        Component.onCompleted:
                        {
                            UserMethods.updatePermissionBasis()
                        }
                    }
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
                    onClicked: {id1.scale=2}
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
