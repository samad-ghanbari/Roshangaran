import QtQuick
import QtQuick.Controls

import "./../user"

// menuBar: MenubarModule{}
MenuBar {
    id: menubarId;
    property alias menuSettingTBId: menuSettingTBId
    property bool toolbarView: true
    font.family: yekanFont.font.family
    font.pixelSize: 16

    Connections
    {
        target: toolbarId
        function onToolBarShow()
        {
            menuSettingTBId.text="حذف نوار‌ابزار";
            toolbarView=true
            toolbarId.visible=true;
        }

        function onToolBarHide()
        {
            menuSettingTBId.text="نمایش نوار‌ابزار";
            toolbarView=false
            toolbarId.visible=false;
        }
    }

    Menu {
        title: "کاربران"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action {
            text: "کاربر جدید";
            onTriggered:
            {
                if(homeStackViewId.currentItem.objectName === "newUserON")
                    homeStackViewId.pop();

                homeStackViewId.push(newUserPageComponent, {objectName: "newUserON"});
            }
            icon.source: "qrc:/Assets/images/newUser.png"; icon.width: 24;icon.height:24;
        }
        MenuSeparator { }
        Action {
            text: "لیست کاربران";
            onTriggered:
            {
                if(homeStackViewId.currentItem.objectName === "listUserON")
                    homeStackViewId.pop();

                homeStackViewId.push(listUserPageComponent,{objectName: "listUserON"});
            }
            icon.source: "qrc:/Assets/images/users.png"; icon.width: 24;icon.height:24;
        }
    }

    Menu {
        title: "مدارس"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "شعبه مدارس"; onTriggered: console.log("new user");icon.source: "qrc:/Assets/images/branch.png"; icon.width: 24;icon.height:24; }
        MenuSeparator { }
        Action { text: "دوره مدارس"; onTriggered: console.log("users");icon.source: "qrc:/Assets/images/school.png"; icon.width: 24;icon.height:24; }
        MenuSeparator { }
        Action { text: "پایه‌تحصیلی"; onTriggered: console.log("users"); icon.source: "qrc:/Assets/images/school2.png"; icon.width: 24;icon.height:24;}
        MenuSeparator { }
        Action { text: "سال‌تحصیلی"; onTriggered: console.log("users");icon.source: "qrc:/Assets/images/date.png"; icon.width: 24;icon.height:24; }
        MenuSeparator { }
        Action { text: "کلاس‌درس"; onTriggered: console.log("users");icon.source: "qrc:/Assets/images/classroom.png"; icon.width: 24;icon.height:24; }
        MenuSeparator { }
        Action { text: "دروس"; onTriggered: console.log("users");icon.source: "qrc:/Assets/images/course.png"; icon.width: 24;icon.height:24; }
    }

    Menu {
        title: "دبیران"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "دبیران"; onTriggered: console.log("new user");icon.source: "qrc:/Assets/images/teacher.png"; icon.width: 24;icon.height:24; }
    }

    Menu {
        title: "دانش‌آموزان"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "دانش‌آموزان"; onTriggered: console.log("new user");icon.source: "qrc:/Assets/images/student.png"; icon.width: 24;icon.height:24; }
        MenuSeparator { }
        Action { text: "والدین"; onTriggered: console.log("new user");icon.source: "qrc:/Assets/images/parents.png"; icon.width: 24;icon.height:24; }
    }

    Menu {
        title: "ارزیابی‌ها"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "ارزیابی‌ها"; onTriggered: console.log("new user");icon.source: "qrc:/Assets/images/evaluation.png"; icon.width: 24;icon.height:24; }
    }

    Menu {
        id: menuSettingId
        title: "تنظیمات"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action {
            id:menuSettingTBId;
            icon.source: "qrc:/Assets/images/toolbox.png"; icon.width: 24;icon.height:24;
            text: "حذف نوار‌ابزار";
            onTriggered:
                if(toolbarView)
                {
                    menuSettingTBId.text="نمایش نوار‌ابزار";
                    toolbarView=false
                    toolbarId.visible=false;
                }
                else
                {
                    menuSettingTBId.text="حذف نوار‌ابزار";
                    toolbarView=true
                    toolbarId.visible=true;

                }
        }
        Action {
            text: "پروفایل کاربر";
            onTriggered: console.log("profile")
            icon.source: "qrc:/Assets/images/user.png"; icon.width: 24;icon.height:24;
        }

    }

    Component
    {
        id: newUserPageComponent
        NewUser{}
    }

    Component
    {
        id: listUserPageComponent
        ListUser{}
    }
}
