import QtQuick
import QtQuick.Controls
import QtQuick.Layouts



ToolBar {
    property alias switchId : toolbarSwitchId
    position: ToolBar.Header
    width: parent.width
    onWidthChanged: appWidthChanged();

    function menuHoverAction(id)
    {
        id.font.bold=(id.hovered)? true : false;
    }
    function appWidthChanged()
    {
        var w = appWindowId.width;

        if(w < 1500)
        {
            menuUserId.icon.width=1
            menuBranchId.icon.width=1
            menuStepId.icon.width=1
            menuBaseId.icon.width=1
            menuPeriodId.icon.width=1
            menuClassId.icon.width=1
            menuCourseId.icon.width=1
            menuTeacherId.icon.width=1
            menuStudentId.icon.width=1
            menuParentId.icon.width=1
            menuEvalId.icon.width=1

            menuUserId.font.pixelSize=12
            menuBranchId.font.pixelSize=12
            menuStepId.font.pixelSize=12
            menuBaseId.font.pixelSize=12
            menuPeriodId.font.pixelSize=12
            menuClassId.font.pixelSize=12
            menuCourseId.font.pixelSize=12
            menuTeacherId.font.pixelSize=12
            menuStudentId.font.pixelSize=12
            menuParentId.font.pixelSize=12
            menuEvalId.font.pixelSize=12


        }
        else
        {
            menuUserId.icon.width=32
            menuUserId.icon.height=32
            menuBranchId.icon.width=32
            menuStepId.icon.width=32
            menuBaseId.icon.width=32
            menuPeriodId.icon.width=32
            menuClassId.icon.width=32
            menuCourseId.icon.width=32
            menuTeacherId.icon.width=32
            menuStudentId.icon.width=32
            menuParentId.icon.width=32
            menuEvalId.icon.width=32

            menuUserId.font.pixelSize=16
            menuBranchId.font.pixelSize=16
            menuStepId.font.pixelSize=16
            menuBaseId.font.pixelSize=16
            menuPeriodId.font.pixelSize=16
            menuClassId.font.pixelSize=16
            menuCourseId.font.pixelSize=16
            menuTeacherId.font.pixelSize=16
            menuStudentId.font.pixelSize=16
            menuParentId.font.pixelSize=16
            menuEvalId.font.pixelSize=16
        }
    }

    RowLayout {
        anchors.fill: parent

        ToolButton {
            id: menuUserId
            text: "کاربران سامانه"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            onClicked: console.log(menuUserId.children)
            icon.source: "qrc:/Assets/images/users.png"
            icon.width: 32
            icon.height: 32
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuUserId)

        }

        ToolButton {
            id: menuBranchId
            text: "شعبه مدارس"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/branch.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuBranchId)
        }

        ToolButton {
            id: menuStepId
            text: "دوره مدارس"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/school.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuStepId)
        }

        ToolButton {
            id: menuBaseId
            text: "پایه‌تحصیلی"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/school2.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuBaseId)
        }

        ToolButton {
            id: menuPeriodId
            text: "سال‌تحصیلی"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/date.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuPeriodId)
        }

        ToolButton {
            id: menuClassId
            text: "کلاس‌درس"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/classroom.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuClassId)
        }

        ToolButton {
            id: menuCourseId
            text: "دروس"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/course.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuCourseId)
        }

        ToolButton {
            id: menuTeacherId
            text: "دبیران"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/teacher.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuTeacherId)
        }

        ToolButton {
            id: menuStudentId
            text: "دانش‌آموزان"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/student.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuStudentId)
        }

        ToolButton {
            id: menuParentId
            text: "والدین"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/parents.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuParentId)
        }

        ToolButton {
            id: menuEvalId
            text: "ارزیابی‌ها"
            font.family: yekanFont.font.family
            font.pixelSize: 16
            icon.source: "qrc:/Assets/images/evaluation.png"
            icon.width: 32
            icon.height: 32
            onClicked: console.log("567")
            hoverEnabled: true
            onHoveredChanged: menuHoverAction(menuEvalId)
        }

        Item{Layout.fillWidth: true;}
        Switch
        {
            id: toolbarSwitchId
            checked: true
            onClicked: {toolbarId.visible=false; toolbarSwitchId.checked=true; menuSettingId.text="aaa"}
        }
    }
}

