import QtQuick
import QtQuick.Effects
import QtMultimedia
import QtQuick.Controls


Rectangle {

    id: tuplet_type_switch_rectangle
    width: 100
    height: 50
    radius: height/2
    color: even_quarter_color

    property int tuplets_type: 5

    anchors.left: tempo_rectangle.right
    anchors.leftMargin: 10
    anchors.verticalCenter: tempo_rectangle.verticalCenter

    Text {

        id: quintuplets_text
        text: "5"
        color: instrument_rect_color
        font.pointSize: 14

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: tuplet_selection_circle.width/2

    }

    Text {

        id: septuplets_text
        text: "7"
        color: instrument_rect_color
        font.pointSize: 14

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: tuplet_selection_circle.width/2

    }

    Rectangle {

        id: tuplet_selection_circle
        width: parent.height
        height: width
        radius: height/2
        color: odd_quarter_color
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0

        Text {

            id: tuplets_type_text
            text: main_window.tuplets_type === "quintuplets" ? "5" : "7"
            color: instrument_rect_color
            font.pointSize: 14

            anchors.centerIn: parent

        }

        state: "quintuplets"
        states: [
            State {
                name: "quintuplets"
                when: tuplet_type_switch_rectangle.tuplets_type === 5
                PropertyChanges { target: tuplet_selection_circle; anchors.leftMargin: 0}
            },
            State {
                name: "septuplets"
                when: tuplet_type_switch_rectangle.tuplets_type === 7
                PropertyChanges { target: tuplet_selection_circle; anchors.leftMargin: tuplet_selection_circle.width }
            }
        ]
        transitions: Transition {
            PropertyAnimation { property: "anchors.leftMargin"; duration: 200; easing.type: Easing.InOutCubic }
        }

    }

    MouseArea {

        id: tuplets_selection_mouse_area

        hoverEnabled: true
        anchors.fill: parent

        onClicked: (mouse) => {

                       if (mouse.x < 50) {

                           tuplet_selection_circle.state = "quintuplets"
                           main_window.tuplets_type = "quintuplets"

                       } else if (mouse.x > 50) {

                           tuplet_selection_circle.state = "septuplets"
                           main_window.tuplets_type = "septuplets"

                       }

                   }

    }

}
