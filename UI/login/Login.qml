import QtQuick
import QtQuick.Controls.Basic

Page {
    id: appLoginForm

    Image {
        id: backimageId
        source: "qrc:/Assets/images/background/back1.jpg"
        anchors.fill: parent
        opacity: 1
    }

    SequentialAnimation
    {
        id: backgroundAnimId

        PropertyAnimation {
            target: loginFormRecId
            property: "color"
            duration: 200
            easing.type: Easing.InOutQuad
            from: "#88DDCCFF"
            to: "#3300FF00"
        }

        PropertyAnimation {
            target: loginFormRecId
            property: "color"
            duration: 200
            easing.type: Easing.InOutQuad
            from: "#3300FF00"
            to: "#88DDCCFF"
        }
    }

    Rectangle
    {
        id: loginFormRecId
        width: 400; // parent.width
        height:  400; //Qt.binding(function(){ return loginFormColumnId.height+100;})
        anchors.centerIn: parent
        color: "#88DDCCFF"
        radius: 5
        border.width: 1
        border.color: "#555"


        Column
        {
            id: loginFormColumnId
            width: 300
            height: 300
            visible: true
            anchors.centerIn: parent

            Image {
                id: loginImageId
                source: "qrc:/Assets/images/logo/logo64.png"
                width: 64
                height: 64
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.top: parent.top
            }

            Item{height:10;width:parent.width}

            Text{
                id: loginTextId
                width: parent.width
                height: 40
                text: "ورود به سامانه روشنگران"
                color: "#FFF"
                font.bold: true
                font.pixelSize: 20
                font.family: yekanFont.font.family

                horizontalAlignment:  Text.AlignHCenter
            }

            TextField
            {
                id: username
                height: 50
                width : parent.width
                placeholderText: "username"
                focus: true
            }

            TextField
            {
                id: password
                height: 50
                width : parent.width
                placeholderText: "password"
            }

            Item{height:10;width:parent.width}

            Row
            {
                width: parent.width
                Button {
                    id: closeBtnId
                    text: "Cancel"
                    height: 50
                    width : parent.width/2

                    //anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        id: cancelBtnId
                        implicitWidth: 100
                        implicitHeight: 50
                        color: closeBtnId.down ? "#FAA" : "#FEE"
                        border.width: 1
                        border.color:"#f99"
                    }
                    onClicked:
                    {
                        backgroundAnimId.start()
                        appWindowId.close();
                    }
                    hoverEnabled: true
                    onHoveredChanged: cancelBtnId.color= hovered? "#fde"  : "#fee";

                }
                Button {
                    id: button
                    text: "Login"
                    height: 50
                    width : parent.width/2

                    //anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        id:loginBtnId
                        implicitWidth: 100
                        implicitHeight: 50
                        color: button.down ? "#3858ff" : "#77bbf7"
                        border.width: 1
                        border.color:"#88F"
                    }
                    onClicked:
                    {
                        backgroundAnimId.start()

                        stackview.replace(Qt.createComponent("./../home/Home.qml"))
                    }
                    hoverEnabled: true
                    onHoveredChanged: loginBtnId.color= hovered? "#77aaf7"  : "#77bbf7";
                }
            }

            Item{height:10;width:parent.width}
            Text {
                id: versiontxt
                text: "Version " + dbMan.getAppVersion();
                color: "gray"
            }
        }
    }



}
