import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation 5.15
import QtPositioning 5.15

Window {
    visible: true
    width: 800
    height: 600
    Plugin{
        id: mapPlugin
        name: "osm"  //nome do plugin, onStreetMap
    }
    Rectangle {
        anchors.fill: parent //Ocupar toda a area da window

        Map{
            anchors.fill: parent
            id: map
            plugin: mapPlugin
            zoomLevel: 14
            center: QtPositioning.coordinate(-22.7253, -47.6492)

            MapQuickItem {
                id: markPin
            coordinate: QtPositioning.coordinate(-22.7253, -47.6492)

            sourceItem: Column {
                spacing: 2

                Item {
                width: 40
                height: 40

                // Círculo do pin
                Rectangle {
                width: 28
                height: 28
                radius: 14
                color: "#e53935"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top

                Text {
                    anchors.centerIn: parent
                    text: "!"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 18
                }
            }

            // Pontinha do pin
                Rectangle {
                    width: 12
                    height: 12
                    color: "#e53935"
                    rotation: 45
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 22
            }
        }

                Text {
                    text: "PERIGO"
                    color: "red"
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }





        MouseArea {
            anchors.fill: parent

            property real lastX
            property real lastY

            onPressed: {
                lastX = mouse.x
                lastY = mouse.y
            }

            onPositionChanged: {
                if (pressed) {
                    var dx = mouse.x - lastX
                    var dy = mouse.y - lastY

                    map.pan(-dx, -dy)

                    lastX = mouse.x
                    lastY = mouse.y
                }
            }
            onWheel: {
                if(wheel.angleDelta.y > 0){
                    map.zoomLevel++
                }else{
                    map.zoomLevel--
                }
            }
        }

    }
}
