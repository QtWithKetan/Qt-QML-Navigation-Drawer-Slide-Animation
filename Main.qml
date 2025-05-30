import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window
{
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    property bool  isdraweropen: false

    Rectangle
    {
        anchors.fill: parent
        color: "black"
        opacity: isdraweropen ? 0.4 : 0.0
        visible: isdraweropen
        z:1

        Behavior on opacity { NumberAnimation { duration: 300 } }

        MouseArea
        {
            anchors.fill: parent
            onClicked: isdraweropen = false
        }
    }

    Rectangle
    {
        id: drawer
        width: 300
        height: parent.height
        color: "#333"
        z:2
        x: isdraweropen ? 0 : -width

        Behavior on x { NumberAnimation { duration: 300; easing.type: Easing.InOutQuad } }

        ColumnLayout
        {
            anchors.fill: parent
            anchors.margins: 30
            spacing: 10

            Label { text: "Menu"; font.pointSize: 30; font.bold: true; color: "white" }
            Button { text: "Home";Layout.preferredWidth: 200; Layout.preferredHeight: 80; font.pointSize: 15; font.bold: true}
            Button { text: "Aboutus";Layout.preferredWidth: 200; Layout.preferredHeight: 80; font.pointSize: 15; font.bold: true}
            Button { text: "Settings";Layout.preferredWidth: 200; Layout.preferredHeight: 80; font.pointSize: 15; font.bold: true}
            Button { text: "Contact";Layout.preferredWidth: 200; Layout.preferredHeight: 80; font.pointSize: 15; font.bold: true}
        }
    }

    Rectangle
    {
        anchors.fill: parent
        color: "#f0f0f0"
        z: 0

        Button
        {
            text: isdraweropen ? "Close Menu" : "Open Menu"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 30
            onClicked: isdraweropen = !isdraweropen
        }

        Text {
            anchors.centerIn: parent
            text: qsTr("Main Content Area")
            font.pointSize: 25
        }
    }
}
