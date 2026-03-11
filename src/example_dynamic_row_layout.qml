import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

FloatingWindow {
    id: root
    color: "black"

    Rectangle {
        id: rootRect
        color: "white"
        height: 200
        
        // 1. Determine the width of the raw text content
        property real leftTextWidth: leftText.paintedWidth
        property real rightTextWidth: rightText.paintedWidth
        property real middleTextWidth: middleText.paintedWidth

        // 2. Add some padding so text isn't flush against the edges
        property int padding: 20

        // 3. LOGIC: Find the widest side
        property real maxSideWidth: Math.max(leftTextWidth, rightTextWidth) + padding

        // 4. Calculate Total Container Width
        // Total = (Middle Width) + (Max Left Width) + (Max Right Width)
        // This ensures the side widths are symmetric (equal), keeping the middle perfectly centered.
        width: middleTextWidth + (maxSideWidth * 2) + padding 

        anchors.centerIn: parent

        Item {
            id: container
            anchors.fill: parent
            anchors.margins: 5

            // --- MIDDLE ITEM ---
            Rectangle {
                id: middle
                
                // The middle rectangle is only as wide as its text content
                width: middleText.paintedWidth + rootRect.padding
                height: parent.height
                
                // Anchor to the absolute center of the container
                anchors.centerIn: parent
                
                color: "green"
                
                Text {
                    id: middleText
                    anchors.centerIn: parent
                    text: "middle"
                }
            }

            // --- LEFT ITEM ---
            Rectangle {
                id: left

                // Fills all space from Left Edge to Middle Left Edge
                anchors.left: parent.left
                anchors.right: middle.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                color: "red"

                Text {
                    id: leftText
                    anchors.centerIn: parent
                    text: "smoll"
                }
            }

            // --- RIGHT ITEM ---
            Rectangle {
                id: right

                // Fills all space from Middle Right Edge to Right Edge
                anchors.left: middle.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                color: "blue"
                
                Text {
                    id: rightText
                    anchors.centerIn: parent
                    text: "A lot of widgets which takes up a lot of space"
                }
            }
        }
    }
}
