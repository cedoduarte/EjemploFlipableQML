import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Flipable {
        id: flipable
        anchors.fill: parent

        property bool flipped: false

        front: Rectangle {
            width: parent.width
            height: parent.height
            color: "red"
        }
        back: Rectangle {
            width: parent.width
            height: parent.height
            color: "blue"
        }

        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis.x: 0
            axis.y: 1 // set axis.y to 1 to rotate around y-axis
            axis.z: 0
            angle: 0 // the default angle
        }

        states: State {
            name: "back"
            PropertyChanges {
                target: rotation
                angle: 180
            }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation {
                target: rotation
                property: "angle"
                duration: 4000
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                flipable.flipped = !flipable.flipped
            }
        }
    }
}