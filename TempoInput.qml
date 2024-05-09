import QtQuick
import QtQuick.Effects
import QtMultimedia
import QtQuick.Controls


Rectangle {

    id: tempo_rectangle
    width: 70
    height: 70
    radius: 10
    color: even_quarter_color


    TextInput {

        id: tempo_input
        text: "80"
        font.family: tempo_font.name
        font.pixelSize: 60
        cursorVisible: false
        focus: true
        anchors.centerIn: parent

        onTextChanged: {

            tempo = parseInt(tempo_input.text);

        }

        Component.onCompleted: {

            tempo = parseInt(tempo_input.text);

        }

    }

}
