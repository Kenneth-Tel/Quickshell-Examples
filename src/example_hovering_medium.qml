import Quickshell
import Quickshell.Widgets
import QtQuick

FloatingWindow {
    id: root
    color: "black"

    // --- Configuration ---
    readonly property int widgetCollapsedHeight: 100
    readonly property int expansionFactor: 4
    readonly property int widgetExpandedHeight: widgetCollapsedHeight * expansionFactor
    
    // The footer overlaps the header by this amount (25% of header height)
    readonly property int overlapAmount: widgetCollapsedHeight / 4

    ClippingRectangle {
        id: dropdownWidget

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 4
        
        width: parent.width / 2
        
        // Directly bind height to the hover state for clarity
        height: hoverDetector.containsMouse ? widgetExpandedHeight : widgetCollapsedHeight
        
        color: "transparent"
        radius: 20

        Behavior on height {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutQuad
            }
        }

        MouseArea {
            id: hoverDetector
            anchors.fill: parent
            hoverEnabled: true
        }

        // --- Header (Static Green Part) ---
        Rectangle {
            id: header
            width: parent.width
            height: widgetCollapsedHeight
            color: "green"

            Text {
                text: "Hello"
                anchors.horizontalCenter: parent.horizontalCenter
                // Original logic placed the top of the text at the bottom of the header
                anchors.top: parent.bottom 
            }
        }

        // --- Footer (Expanding Grey Part) ---
        Rectangle {
            id: footer
            width: parent.width
            
            // Layout Logic: 
            // 1. Attach to the bottom of the header.
            // 2. Move up by 'overlapAmount' to create the overlap effect.
            anchors.top: header.bottom
            anchors.topMargin: -overlapAmount

            // Height Calculation:
            // Fills the remaining space + the overlap area to ensure it reaches the bottom.
            // (Expanded Total - Header Height) + Overlap
            height: (widgetExpandedHeight - widgetCollapsedHeight) + overlapAmount

            color: "grey"

            Text {
                anchors.centerIn: parent
                text: "Hello"
            }
        }
    }
}
