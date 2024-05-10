import QtQuick
import QtQuick.Effects
import QtMultimedia
import QtQuick.Controls


Window {

    id: main_window
    width: 1280
    height: 800
    visible: true
    title: qsTr("Tuplet Drums")

    property bool playing: false
    property int tempo

    property string accent_beat_color: "#0080FB"
    property string odd_quarter_color: "#66BAD8"
    property string even_quarter_color: "#BACFE2"

    property string instrument_rect_color: "#00213E"
    property string instrument_text_color: "#B8E0FF"

    property string tuplets_type: "quintuplets"


    Connections {

        target: reset_text_button

        function onTextButtonClicked() {

            for (var i = 0; i < hat_view.model.count; ++i) {

                hat_view.model.get(i).accent = false;

            }

            for (var i = 0; i < kick_view.model.count; ++i) {

                kick_view.model.get(i).accent = false;

            }

            for (var i = 0; i < snare_view.model.count; ++i) {

                snare_view.model.get(i).accent = false;

            }

            for (var i = 0; i < clap_view.model.count; ++i) {

                clap_view.model.get(i).accent = false;

            }

        }

    }


    Image {

        id: background_image
        source: "qrc:/Images/background.jpg"
        anchors.fill: parent

    }


    Timer {

        id: main_timer
        interval: 60000/(tempo*(tuplets_type === "septuplets" ? 7 : 5))
        running: false
        repeat: true

        property int current_beat
        property int max_beats_index: tuplets_type === "septuplets" ? 28 : 20

        onTriggered: {

            if (hat_view.model.get(current_beat).accent) {

                hat_view.itemAtIndex(current_beat).play();

            }

            if (kick_view.model.get(current_beat).accent) {

                kick_view.itemAtIndex(current_beat).play();

            }

            if (snare_view.model.get(current_beat).accent) {

                snare_view.itemAtIndex(current_beat).play();

            }

            if (clap_view.model.get(current_beat).accent) {

                clap_view.itemAtIndex(current_beat).play();

            }

            ++current_beat;

            if (current_beat == max_beats_index) {

                current_beat = 0;

            }

        }

    }

    Text {

        id: logo_text
        text: "Tuplet Drums"
        color: "white"
        font.family: logo_font.name
        font.pointSize: 70
        font.bold: true

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: logo_text.paintedHeight/4

    }

    FontLoader {

        id: logo_font
        source: "qrc:/Fonts/LogoFont.ttf"

    }


    FontLoader {

        id: tempo_font
        source: "qrc:/Fonts/TempoFont.ttf"

    }

    Rectangle {

        id: drum_kit_rectangle
        width: 1015
        height: 550
        radius: 15
        color: "#001C31"
        border.width: 1
        border.color: "#abdbe3"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: logo_text.bottom
        anchors.topMargin: logo_text.paintedHeight/4

        TextButton {

            id: reset_text_button

            text_value: "Reset"

        }

        PlayButton {

            id: play_rectangle

            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 30

        }

        TempoInput {

            id: tempo_rectangle

            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 50

        }

        Text {

            id: tempo_text
            text: "Tempo"
            font.pointSize: 12
            color: instrument_text_color

            anchors.top: tempo_rectangle.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: tempo_rectangle.horizontalCenter

        }

        TupletTypeSwitch {
            id: tuplet_type_switch_rectangle
        }

        Text {

            id: tuplet_type_switch_text
            text: "Tuplets"
            font.pointSize: 12
            color: instrument_text_color

            anchors.verticalCenter: tempo_text.verticalCenter
            anchors.horizontalCenter: tuplet_type_switch_rectangle.horizontalCenter

        }


        QuintupletsHatModel {
            id: quintuplets_hat_model
        }

        QuintupletsKickModel {
            id: quintuplets_kick_model
        }

        QuintupletsSnareModel {
            id: quintuplets_snare_model
        }

        QuintupletsClapModel {
            id: quintuplets_clap_model
        }

        SeptupletsHatModel {
            id: septuplets_hat_model
        }

        SeptupletsKickModel {
            id: septuplets_kick_model
        }

        SeptupletsSnareModel {
            id: septuplets_snare_model
        }

        SeptupletsClapModel {
            id: septuplets_clap_model
        }


        Rectangle {

            id: hat_rectangle
            width: 150
            height: 50
            radius: 5
            border.width: 1
            border.color: instrument_text_color
            color: instrument_rect_color

            Text {

                id: hat_text
                text: "Hi-hat"
                color: instrument_text_color
                font.pointSize: 14

                anchors.centerIn: parent

            }

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: tuplets_type === "quintuplets" ? 110 : 10
            anchors.topMargin: 100

        }

        ListView {

            id: hat_view
            model: tuplets_type === "quintuplets" ? quintuplets_hat_model : septuplets_hat_model
            width: 850
            height: 50
            spacing: 5
            orientation: ListView.Horizontal
            delegate: Rectangle {

                id: hat_delegate
                width: 25
                height: 50
                radius: 5
                border.width: 1
                border.color: "#040f13"
                color: model.accent ? accent_beat_color : model.color

                function play() {

                    hi_hat_sound.play();

                }

                MouseArea {

                    id: hat_mouse_area
                    hoverEnabled: true
                    anchors.fill: parent

                    onClicked: {

                        model.accent = !model.accent;

                    }

                }

                layer.enabled: model.accent
                layer.effect: MultiEffect {

                    id: hat_shadow
                    blurEnabled: true
                    blurMax: 30
                    blur: 0.7
                    saturation: 0.5
                    contrast: 0.3

                }

                SoundEffect {

                    id: hi_hat_sound
                    source: "qrc:/Sounds/hat.wav"
                    volume: 100

                }

            }

            anchors.verticalCenter: hat_rectangle.verticalCenter
            anchors.left: hat_rectangle.right
            anchors.leftMargin: 10

        }

        Rectangle {

            id: kick_rectangle
            width: 150
            height: 50
            radius: 5
            border.width: 1
            border.color: instrument_text_color
            color: instrument_rect_color

            Text {

                id: kick_text
                text: "Kick"
                color: instrument_text_color
                font.pointSize: 14

                anchors.centerIn: parent

            }

            anchors.left: parent.left
            anchors.top: hat_rectangle.bottom
            anchors.leftMargin: tuplets_type === "quintuplets" ? 110 : 10
            anchors.topMargin: 5

        }

        ListView {

            id: kick_view
            model: tuplets_type === "quintuplets" ? quintuplets_kick_model : septuplets_kick_model
            width: 850
            height: 50
            spacing: 5
            orientation: ListView.Horizontal
            delegate: Rectangle {

                id: kick_delegate
                width: 25
                height: 50
                radius: 5
                border.width: 1
                border.color: "#040f13"
                color: model.accent ? accent_beat_color : model.color

                function play() {

                    kick_sound.play();

                }

                MouseArea {

                    id: kick_mouse_area
                    hoverEnabled: true
                    anchors.fill: parent

                    onClicked: {

                        model.accent = !model.accent;

                    }

                }

                layer.enabled: model.accent
                layer.effect: MultiEffect {

                    id: kick_shadow
                    blurEnabled: true
                    blurMax: 30
                    blur: 0.7
                    saturation: 0.5
                    contrast: 0.3

                }

                SoundEffect {

                    id: kick_sound
                    source: "qrc:/Sounds/kick.wav"
                    volume: 100

                }

            }

            anchors.verticalCenter: kick_rectangle.verticalCenter
            anchors.left: kick_rectangle.right
            anchors.leftMargin: 10

        }

        Rectangle {

            id: snare_rectangle
            width: 150
            height: 50
            radius: 5
            border.width: 1
            border.color: instrument_text_color
            color: instrument_rect_color

            Text {

                id: snare_text
                text: "Snare"
                color: instrument_text_color
                font.pointSize: 14

                anchors.centerIn: parent

            }

            anchors.left: parent.left
            anchors.top: kick_rectangle.bottom
            anchors.topMargin: 5
            anchors.leftMargin: tuplets_type === "quintuplets" ? 110 : 10

        }

        ListView {

            id: snare_view
            model: tuplets_type === "quintuplets" ? quintuplets_snare_model : septuplets_snare_model
            width: 850
            height: 50
            spacing: 5
            orientation: ListView.Horizontal

            delegate: Rectangle {

                id: snare_delegate
                width: 25
                height: 50
                radius: 5
                border.width: 1
                border.color: "#040f13"
                color: model.accent ? accent_beat_color : model.color

                function play() {

                    snare_sound.play();

                }

                MouseArea {

                    id: snare_mouse_area
                    hoverEnabled: true
                    anchors.fill: parent

                    onClicked: {

                        model.accent = !model.accent;

                    }

                }

                layer.enabled: model.accent
                layer.effect: MultiEffect {

                    id: snare_shadow
                    blurEnabled: true
                    blurMax: 30
                    blur: 0.7
                    saturation: 0.5
                    contrast: 0.3

                }

                SoundEffect {

                    id: snare_sound
                    source: "qrc:/Sounds/snare.wav"
                    volume: 100

                }

            }

            anchors.verticalCenter: snare_rectangle.verticalCenter
            anchors.left: snare_rectangle.right
            anchors.leftMargin: 10

        }

        Rectangle {

            id: clap_rectangle
            width: 150
            height: 50
            radius: 5
            border.width: 1
            border.color: instrument_text_color
            color: instrument_rect_color

            Text {

                id: clap_text
                text: "Clap"
                color: instrument_text_color
                font.pointSize: 14

                anchors.centerIn: parent

            }

            anchors.left: parent.left
            anchors.top: snare_rectangle.bottom
            anchors.topMargin: 5
            anchors.leftMargin: tuplets_type === "quintuplets" ? 110 : 10

        }

        ListView {

            id: clap_view
            model: tuplets_type === "quintuplets" ? quintuplets_clap_model : septuplets_clap_model
            width: 850
            height: 50
            spacing: 5
            orientation: ListView.Horizontal

            delegate: Rectangle {

                id: clap_delegate
                width: 25
                height: 50
                radius: 5
                border.width: 1
                border.color: "#040f13"
                color: model.accent ? accent_beat_color : model.color

                function play() {

                    clap_sound.play();

                }

                MouseArea {

                    id: clap_mouse_area
                    hoverEnabled: true
                    anchors.fill: parent

                    onClicked: {

                        model.accent = !model.accent;

                    }

                }

                layer.enabled: model.accent
                layer.effect: MultiEffect {

                    id: clap_shadow
                    blurEnabled: true
                    blurMax: 30
                    blur: 0.7
                    saturation: 0.5
                    contrast: 0.3

                }

                SoundEffect {

                    id: clap_sound
                    source: "qrc:/Sounds/clap2.wav"
                    volume: 100

                }

            }

            anchors.verticalCenter: clap_rectangle.verticalCenter
            anchors.left: clap_rectangle.right
            anchors.leftMargin: 10

        }

    }

}
