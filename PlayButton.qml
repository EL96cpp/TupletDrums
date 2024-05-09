import QtQuick
import QtQuick.Effects
import QtMultimedia
import QtQuick.Controls


Rectangle {

    id: play_rectangle
    width: 60
    height: 60
    radius: 10
    border.width: 1
    border.color: instrument_text_color

    property bool playing: quintuplet_timer.running
    property string playing_background_color: "#134b5f"
    property string stopped_background_color
    property string playing_inner_color: "#66BAD8"
    property string stopped_inner_color
    property int pause_lines_width: 7
    property int pause_lines_heigt: 30
    property int play_triangle_margins: 15

    color: instrument_rect_color

    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.margins: 30

    layer.enabled: play_button_mouse_area.containsMouse
    layer.effect: MultiEffect {

        id: hat_shadow
        blurEnabled: true
        blurMax: 30
        blur: 0.7
        saturation: 0.5
        contrast: 0.3

    }

    Item {

        id: pause_rectangles
        width: parent.width
        height: parent.height
        visible: !playing

        anchors.centerIn: parent

        Rectangle {

            id: left_rectangle
            width: pause_lines_width
            height: pause_lines_heigt
            color: playing_inner_color

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -width

        }

        Rectangle {

            id: right_rectangle
            width: pause_lines_width
            height: pause_lines_heigt
            color: playing_inner_color

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: width

        }

    }

    Item {

        id: play_triangle
        width: parent.width
        height: parent.height
        visible: playing

        anchors.centerIn: parent

        Canvas {

            id: play_triangle_canvas
            width: parent.width - 2*play_triangle_margins
            height: parent.height - 2*play_triangle_margins

            anchors.centerIn: parent

            onPaint: {

                var ctx = getContext("2d")

                ctx.strokeStyle = playing_inner_color;
                ctx.lineWidth = 5;

                ctx.beginPath();

                ctx.moveTo(0, 0);
                ctx.lineTo(parent.width - play_triangle_margins*2, (parent.height - play_triangle_margins*2)/2);
                ctx.lineTo(0, parent.height - play_triangle_margins*2);
                ctx.lineTo(0, 0);

                ctx.stroke()

            }

        }

    }

    MouseArea {

        id: play_button_mouse_area
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {

            main_window.playing = !main_window.playing;
            quintuplet_timer.current_beat = 0;

            if (quintuplet_timer.running) {

                console.log("stopped timer");
                quintuplet_timer.stop();

            } else {

                console.log("started timer");
                quintuplet_timer.start();

            }

        }

    }

}
