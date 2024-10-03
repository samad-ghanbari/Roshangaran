import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import "newUserJS.js" as UserMethods

Page {
    id: addNewUserPageId
    property var accessBranch:[]
    property var accessStep:[]
    property var accessBasis:[]
    property var permissionBranch:[]
    property var permissionStep:[]
    property var permissionBasis:[]



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

            ColumnLayout
            {
                width: newUserSV.width

                GridLayout
                {
                    id: newUserBasicsId
                    columns: 2
                    rows: 11
                    rowSpacing: 20
                    columnSpacing: 10
                    width: newUserSV.width


                    Text {
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
                        id: newUserNameId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "نام کاربر"

                    }

                    Text {
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
                        id: newUserLastNameId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "نام خانوادگی"
                    }

                    Text {
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
                        id: newUserNatidId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "کد ملی کاربر"
                    }

                    Text {
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
                        id: newUserPassId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "رمز عبور"
                        echoMode: TextField.Password
                    }
                    Text {
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
                        id: newUserPassConfirmId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "تکرار رمز عبور"
                        echoMode: TextField.Password
                    }


                    Text {
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
                        id: newUserEmailId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "پست الکترونیکی"
                    }

                    Text {
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
                        id: newUserPositionId
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        font.family: yekanFont.font.family
                        font.pixelSize: 16
                        placeholderText: "پست کاربر"
                    }

                    Text {
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
                        id: newUserTelId
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

                    //admin
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
                        onCheckedChanged:
                        {
                            newUserAccPermId.visible=(checked)? false : true;
                            adminWarningMessage.visible=(checked)? true : false;
                        }
                    }
                    Text {
                        id: adminWarningMessage
                        visible: false
                        text: "هشدار! کاربر ادمین، دسترسی کامل به مدیریت سامانه دارد"
                        Layout.columnSpan: 2
                        Layout.alignment: Qt.AlignLeft
                        font.family: yekanFont.font.family
                        Layout.topMargin: -10
                        font.pixelSize: 16
                        font.bold: true
                        color: "orange"
                    }

                }

                GridLayout
                {
                    id: newUserAccPermId
                    columns: 2
                    rows: 11
                    rowSpacing: 20
                    columnSpacing: 10
                    width: parent.width


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
                        spacing: 20
                        Layout.columnSpan: 2
                        //flow: Flow.TopToBottom

                        Repeater
                        {
                            id: newUserAccessBranchId
                            model: ListModel {id: accessBranchModel }
                            delegate:
                                Switch{
                                objectName: "'branch"+id+"'"
                                checked: (accessBranch.indexOf(id) > -1)? true : false;
                                text: city + " - " + branch_name
                                font.family: yekanFont.font.family
                                font.pixelSize: 14
                                onToggled:
                                {
                                    permissionBranchModel.clear();
                                    accessBasisModel.clear();
                                    accessStepModel.clear();
                                    accessStep = []
                                    accessBasis = []

                                    var branchId = id;
                                    var index = accessBranch.indexOf(branchId)

                                    if(this.checked)
                                    {
                                        if(index < 0)
                                            accessBranch.push(branchId);
                                    }
                                    else
                                    {
                                        if(index > -1)
                                            accessBranch.splice(index, 1);

                                    }

                                    UserMethods.updateAccessStep()
                                    UserMethods.updatePermissionBranch();
                                }
                            }
                        }
                        Component.onCompleted:
                        {
                            UserMethods.updateAccessBranch()
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
                        spacing: 20
                        Layout.columnSpan: 2

                        Repeater
                        {
                            id: newUserAccessStepId
                            model: ListModel {id: accessStepModel }
                            delegate:
                                Switch{
                                text: branch_name +"-"+step_name
                                checked: (accessStep.indexOf(id) > -1)? true : false;
                                font.family: yekanFont.font.family
                                font.pixelSize: 14
                                onToggled:
                                {
                                    accessBasisModel.clear();
                                    permissionStepModel.clear();
                                    accessBasis = [];
                                    permissionBasis=[]
                                    var stepId = id;
                                    var index = accessStep.indexOf(stepId)

                                    if(this.checked)
                                    {
                                        if(index < 0)
                                            accessStep.push(stepId);
                                    }
                                    else
                                    {
                                        if(index > -1)
                                            accessStep.splice(index, 1);

                                    }

                                    UserMethods.updateAccessBasis();
                                    UserMethods.updatePermissionStep();

                                }
                            }
                        }
                        Component.onCompleted:
                        {
                            UserMethods.updateAccessStep()
                        }
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
                        spacing: 20
                        Layout.columnSpan: 2

                        Repeater
                        {
                            id: newUserAccessBasisId
                            model: ListModel {id: accessBasisModel }
                            delegate:
                                Switch{
                                text: branch_name +"-"+step_name+"-"+basis_name
                                checked: (accessBasis.indexOf(id) > -1)? true : false;
                                font.family: yekanFont.font.family
                                font.pixelSize: 14
                                onToggled:
                                {
                                    permissionBasisModel.clear();
                                    permissionBasis=[]

                                    var basisId = id;
                                    var index = accessBasis.indexOf(basisId)

                                    if(this.checked)
                                    {
                                        if(index < 0)
                                            accessBasis.push(basisId);
                                    }
                                    else
                                    {
                                        if(index > -1)
                                            accessBasis.splice(index, 1);

                                    }

                                    UserMethods.updatePermissionBasis();
                                }
                            }
                        }
                        Component.onCompleted:
                        {
                            UserMethods.updateAccessBasis()
                        }
                    }

                    // //app-module
                    // Text {
                    //     text: "دسترسی‌ به ماژول‌های برنامه"
                    //     Layout.columnSpan: 2
                    //     Layout.alignment: Qt.AlignLeft
                    //     font.family: yekanFont.font.family
                    //     font.pixelSize: 18
                    //     font.bold: true
                    //     color: "royalblue"
                    // }
                    // Flow
                    // {
                    //     id: newUserAccessAppModuleId
                    //     Layout.columnSpan: 2
                    //     spacing: 20
                    //     width: parent.width
                    //     //flow: Flow.LeftToRight  // Flow.TopToBottom
                    //     //layoutDirection: Qt.LeftToRight  //Qt.RightToLeft

                    //     Repeater
                    //     {
                    //         model: ListModel{id:accessappModuleModel}
                    //         Switch
                    //         {
                    //             checked: false
                    //             text: model.description
                    //             font.family: yekanFont.font.family
                    //             font.pixelSize: 14
                    //         }

                    //         Component.onCompleted:
                    //         {
                    //             UserMethods.updateAccessAppModule();
                    //         }
                    //     }
                    // }


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
                        spacing: 20
                        Layout.columnSpan: 2
                        //flow: Flow.TopToBottom

                        Repeater
                        {
                            id: newUserPermissionBranchId
                            model: ListModel {id: permissionBranchModel }
                            delegate:
                                Switch{
                                checked: (permissionBranch.indexOf(id) > -1)? true : false;
                                text: city + " - " + branch_name
                                font.family: yekanFont.font.family
                                font.pixelSize: 14
                                onToggled:
                                {
                                    var branchId = id;
                                    var index = permissionBranch.indexOf(branchId)

                                    if(this.checked)
                                    {
                                        if(index < 0)
                                            permissionBranch.push(branchId);
                                    }
                                    else
                                    {
                                        if(index > -1)
                                            permissionBranch.splice(index, 1);

                                    }
                                }
                            }
                        }

                        Component.onCompleted:
                        {
                            permissionBranch=[]
                            permissionBranchModel.clear();
                            UserMethods.updatePermissionBranch();
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
                        spacing: 20
                        Layout.columnSpan: 2
                        //flow: Flow.TopToBottom

                        Repeater
                        {
                            id: newUserPermissionStepId
                            model: ListModel {id: permissionStepModel }
                            delegate:
                                Switch{
                                checked: (permissionStep.indexOf(id) > -1)? true : false;
                                text: branch_name + " - " + step_name
                                font.family: yekanFont.font.family
                                font.pixelSize: 14
                                onToggled:
                                {
                                    var stepId = id;
                                    var index = permissionStep.indexOf(stepId)

                                    if(this.checked)
                                    {
                                        if(index < 0)
                                            permissionStep.push(stepId);
                                    }
                                    else
                                    {
                                        if(index > -1)
                                            permissionStep.splice(index, 1);

                                    }
                                }
                            }
                        }

                        Component.onCompleted:
                        {
                            permissionStep=[]
                            permissionStepModel.clear();
                            UserMethods.updatePermissionStep();
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
                        spacing: 20
                        Layout.columnSpan: 2
                        //flow: Flow.TopToBottom

                        Repeater
                        {
                            id: newUserPermissionBasisId
                            model: ListModel {id: permissionBasisModel }
                            delegate:
                                Switch{
                                checked: (permissionBasis.indexOf(id) > -1)? true : false;
                                text: branch_name + " - " + step_name + " - " + basis_name
                                font.family: yekanFont.font.family
                                font.pixelSize: 14
                                onToggled:
                                {
                                    var basisId = id;
                                    var index = permissionStep.indexOf(basisId)

                                    if(this.checked)
                                    {
                                        if(index < 0)
                                            permissionBasis.push(basisId);
                                    }
                                    else
                                    {
                                        if(index > -1)
                                            permissionBasis.splice(index, 1);
                                    }
                                }
                            }
                        }

                        Component.onCompleted:
                        {
                            permissionBasis=[]
                            permissionBasisModel.clear();
                            UserMethods.updatePermissionBasis();
                        }
                    }
                }


                Item
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                }

                Button
                {
                    text: "تایید"
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 50
                    Layout.alignment: Qt.AlignHCenter
                    font.family: yekanFont.font.family
                    font.pixelSize: 16
                    Rectangle{width:parent.width; height:2; anchors.bottom: parent.bottom; color: "forestgreen"}
                    onClicked:
                    {
                        var user = {};
                        user["name"] = newUserNameId.text;
                        user["lastname"] = newUserLastNameId.text;
                        user["natid"] = newUserNatidId.text;
                        user["password"] = newUserPassId.text;
                        user["passwordConfirm"] = newUserPassConfirmId.text;
                        user["email"] = newUserEmailId.text;
                        user["position"] = newUserPositionId.text
                        user["telephone"] = newUserTelId.text;

                        user["accessBranch"] = accessBranch;
                        user["accessStep"] = accessStep;
                        user["accessBasis"] = accessBasis;

                        user["permissionBranch"] = permissionBranch;
                        user["accessStep"] = permissionStep;
                        user["accessBasis"] = permissionBasis;

                        user["enabled"] = newUserEnabledId.checked
                        user["admin"] = newUserAdminId.checked

                        var check = true
                        // check entries
                        if(!UserMethods.checkFormEntries(user))
                        {
                            newUserInfoDialogId.open();
                            return;
                        }

                        if(dbMan.insertUser(user))
                        {
                            newUserInfoDialogId.dialogSuccess = true
                            newUserInfoDialogId.dialogTitle = "عملیات موفق"
                            newUserInfoDialogId.dialogText = "کاربر جدید با موفقیت به دیتابیس افزوده شد"
                            newUserInfoDialogId.acceptAction = function(){newUserInfoDialogId.close(); homeStackViewId.pop();}
                            newUserInfoDialogId.open();

                        }
                        else
                        {
                            var errorString = dbMan.getLastError();
                            newUserInfoDialogId.dialogTitle = "خطا"
                            newUserInfoDialogId.dialogText = errorString
                            newUserInfoDialogId.width = parent.width
                            newUserInfoDialogId.height = 500
                            newUserInfoDialogId.dialogSuccess = false
                            newUserInfoDialogId.open();
                        }
                    }
                }

                Item
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                }
            }
        }
    }
    BaseDialog
    {
        id: newUserInfoDialogId
        dialogTitle: "خطا"
        dialogText: "ورود فیلد الزامی می‌باشد"
        dialogSuccess: false
    }
}
