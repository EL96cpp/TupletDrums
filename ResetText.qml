import QtQuick
import QtQuick.Effects
import QtMultimedia
import QtQuick.Controls


Text {

    id: reset_text
    text: "Reset"
    color: instrument_text_color
    font.pointSize: 14

    anchors.top: parent.top
    anchors.right: parent.right
    anchors.margins: 30

    layer.enabled: reset_mouse_area.containsMouse
    layer.effect: MultiEffect {

        id: reset_text_shadow
        blurEnabled: true
        blurMax: 20
        blur: 0.7
        saturation: 0.5
        contrast: 0.3

    }

    Rectangle {

        id: upper_reset_text_line
        height: 1
        width: reset_text.paintedWidth
        color: instrument_text_color

        anchors.left: reset_text.left
        anchors.top: reset_text.bottom
        anchors.topMargin: 2

        state: "non-hovered"
        states: [
            State {
                name: "non-hovered"
                when: !reset_mouse_area.containsMouse
                PropertyChanges { target: upper_reset_text_line; width: 0}
            },
            State {
                name: "hovered"
                when: reset_mouse_area.containsMouse
                PropertyChanges { target: upper_reset_text_line; width: reset_text.paintedWidth }
            }
        ]
        transitions: Transition {
            PropertyAnimation { property: "width"; duration: 200; easing.type: Easing.InOutCubic }
        }

    }

    Rectangle {

        id: lower_reset_text_line
        height: 1
        width: reset_text.paintedWidth
        color: instrument_text_color

        anchors.left: reset_text.left
        anchors.top: upper_reset_text_line.bottom
        anchors.topMargin: 1

        state: "non-hovered"
        states: [
            State {
                name: "non-hovered"
                when: !reset_mouse_area.containsMouse
                PropertyChanges { target: lower_reset_text_line; width: 0}
            },
            State {
                name: "hovered"
                when: reset_mouse_area.containsMouse
                PropertyChanges { target: lower_reset_text_line; width: reset_text.paintedWidth }
            }
        ]
        transitions: Transition {
            PropertyAnimation { property: "width"; duration: 300; easing.type: Easing.InOutCubic }
        }

    }


    MouseArea {

        id: reset_mouse_area

        hoverEnabled: true
        anchors.fill: parent

        onClicked: {

            resetCurrentAccents();

        }

    }


}
