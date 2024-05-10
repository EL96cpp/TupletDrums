import QtQuick
import QtQuick.Effects
import QtMultimedia
import QtQuick.Controls


Text {

    id: text_button
    text: text_value
    color: text_button_mouse_area.containsMouse ? odd_quarter_color : instrument_text_color
    font.pointSize: 16

    property string text_value

    signal textButtonClicked();

    anchors.top: parent.top
    anchors.right: parent.right
    anchors.margins: 30

    Rectangle {

        id: upper_text_line
        height: 1
        width: text_value.paintedWidth
        color: instrument_text_color

        anchors.left: text_button.left
        anchors.top: text_button.bottom
        anchors.topMargin: 2

        state: "non-hovered"
        states: [
            State {
                name: "non-hovered"
                when: !text_button_mouse_area.containsMouse
                PropertyChanges { target: upper_text_line; width: 0}
            },
            State {
                name: "hovered"
                when: text_button_mouse_area.containsMouse
                PropertyChanges { target: upper_text_line; width: text_button.paintedWidth }
            }
        ]
        transitions: Transition {
            PropertyAnimation { property: "width"; duration: 200; easing.type: Easing.InOutCubic }
        }

    }

    Rectangle {

        id: lower_text_line
        height: 1
        width: text_button.paintedWidth
        color: instrument_text_color

        anchors.left: text_button.left
        anchors.top: upper_text_line.bottom
        anchors.topMargin: 2

        state: "non-hovered"
        states: [
            State {
                name: "non-hovered"
                when: !text_button_mouse_area.containsMouse
                PropertyChanges { target: lower_text_line; width: 0}
            },
            State {
                name: "hovered"
                when: text_button_mouse_area.containsMouse
                PropertyChanges { target: lower_text_line; width: text_button.paintedWidth }
            }
        ]
        transitions: Transition {
            PropertyAnimation { property: "width"; duration: 300; easing.type: Easing.InOutCubic }
        }

    }


    MouseArea {

        id: text_button_mouse_area

        hoverEnabled: true
        anchors.fill: parent

        onClicked: {

            textButtonClicked();

        }

    }


}
