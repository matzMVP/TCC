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
            anchors.fill: parent //Ocupar a area do objeto herdado
            id: map
            plugin: mapPlugin //qual plugin ta usando, no caso, usa o plugin do objeto mapPlugin que é o osm
            zoomLevel: 14
            center: QtPositioning.coordinate(-22.7253, -47.6492)

            MapQuickItem {
                id: markPin
                coordinate: QtPositioning.coordinate(-22.7253, -47.6492)
                sourceItem: Column {
                    Image {
                        source: "file:///C:/Users/mathe/Downloads/Pin.png"
                        width: 40
                        height: 40
                    }
                    Text {
                        text: "PERIGO"
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