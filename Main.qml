import QtQuick
import QtQuick.Effects
import QtMultimedia

Window {

    id: main_window
    width: 1280
    height: 800
    visible: true
    title: qsTr("Tuplet Drums")

    property bool playing: false

    property string accent_beat_color: "#FF5100"
    property string odd_quarter_color: "#92cbdf"
    property string even_quarter_color: "#BACFE2"


    Image {

        id: background_image
        source: "qrc:/Images/background.jpg"
        anchors.fill: parent

    }


    Timer {

        id: quintuplet_timer
        interval: 100
        running: main_window.playing
        repeat: true

        property int current_beat

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


            ++current_beat;

            if (current_beat == 28) {

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

    Rectangle {

        id: drum_kit_rectangle
        width: parent.width/1.5
        height: parent.height/1.5
        radius: 10
        color: "#001C31"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: logo_text.bottom
        anchors.topMargin: logo_text.paintedHeight/4

        Rectangle {

            id: play_rectangle
            width: 40
            height: 40

            color: main_window.playing ? "#7cc0d8" : "#134b5f"

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 30

            MouseArea {

                id: play_button_mouse_area
                hoverEnabled: true
                anchors.fill: parent

                onClicked: {

                    main_window.playing = !main_window.playing;
                    quintuplet_timer.current_beat = 0;

                    if (quintuplet_timer.running) {

                        quintuplet_timer.stop();

                    } else {

                        quintuplet_timer.start();

                    }

                }

            }

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

        SeptupletsHatModel {
            id: septuplets_hat_model
        }

        SeptupletsKickModel {
            id: septuplets_kick_model
        }

        SeptupletsSnareModel {
            id: septuplets_snare_model
        }


        ListView {

            id: hat_view
            model: septuplets_hat_model
            width: 850
            height: 60
            spacing: 5
            orientation: ListView.Horizontal
            delegate: Rectangle {

                id: hat_delegate
                width: 10
                height: 30
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
                    source: "qrc:/Sounds/Hihat/hat.wav"
                    volume: 100

                }

            }

            anchors.centerIn: parent

        }

        ListView {

            id: kick_view
            model: septuplets_kick_model
            width: 850
            height: 60
            spacing: 5
            orientation: ListView.Horizontal
            delegate: Rectangle {

                id: kick_delegate
                width: 10
                height: 30
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
                    source: "qrc:/Sounds/Kick/kick.wav"
                    volume: 100

                }

            }

            anchors.horizontalCenter: hat_view.horizontalCenter
            anchors.top: hat_view.bottom

        }

        ListView {

            id: snare_view
            model: septuplets_snare_model
            width: 850
            height: 60
            spacing: 5
            orientation: ListView.Horizontal


            delegate: Rectangle {

                id: snare_delegate
                width: 10
                height: 30
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
                    source: "qrc:/Sounds/Snare/snare.wav"
                    volume: 100

                }

            }

            anchors.horizontalCenter: hat_view.horizontalCenter
            anchors.top: kick_view.bottom

        }


    }

}
