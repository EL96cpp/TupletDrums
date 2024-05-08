import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: septuplets_clap_model

    Component.onCompleted: {

        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});

        septuplets_clap_model.append({"accent" : true, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});

        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});

        septuplets_clap_model.append({"accent" : true, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});

    }

}
