import QtQuick
import QtQuick.Controls
// menuBar: MenubarModule{}
MenuBar {
    property alias menuSettingId: menuSettingId
    font.family: yekanFont.font.family
    font.pixelSize: 16

    Menu {
        title: "کاربران"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "کاربر جدید"; onTriggered: console.log("new user"); }
        MenuSeparator { }
        Action { text: "لیست کاربران"; onTriggered: console.log("users"); }
    }

    Menu {
        title: "مدارس"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "شعبه مدارس"; onTriggered: console.log("new user"); }
        MenuSeparator { }
        Action { text: "دوره مدارس"; onTriggered: console.log("users"); }
        MenuSeparator { }
        Action { text: "پایه‌تحصیلی"; onTriggered: console.log("users"); }
        MenuSeparator { }
        Action { text: "سال‌تحصیلی"; onTriggered: console.log("users"); }
        MenuSeparator { }
        Action { text: "کلاس‌درس"; onTriggered: console.log("users"); }
        MenuSeparator { }
        Action { text: "دروس"; onTriggered: console.log("users"); }
    }

    Menu {
        title: "دبیران"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "دبیران"; onTriggered: console.log("new user"); }
    }

    Menu {
        title: "دانش‌آموزان"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "دانش‌آموزان"; onTriggered: console.log("new user"); }
        MenuSeparator { }
        Action { text: "والدین"; onTriggered: console.log("new user"); }
    }

    Menu {
        title: "ارزیابی‌ها"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "ارزیابی‌ها"; onTriggered: console.log("new user"); }
    }
    Menu {
        id: menuSettingId
        title: "تنظیمات"
        font.family: yekanFont.font.family
        font.pixelSize: 16
        Action { text: "نمایش نوار‌ابزار"; onTriggered:  toolbarId.visible=true;  }

    }
}
