import Quickshell
import QtQuick

FloatingWindow {
    id: root

    color: "black"

    Rectangle {
        id: middleBox

        implicitHeight: 100
        implicitWidth: mouse.hovered ? 150 : 100
        radius: 10

        anchors.centerIn: parent

        color: mouse.hovered ? "grey" : "white"

        Text {
            anchors.centerIn: parent
            text: mouse.hovered ? ":(" : ":)"
        }

        Behavior on implicitWidth {
            NumberAnimation { duration: 200 }
        }

        HoverHandler {
            id: mouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        } 
    }
}
