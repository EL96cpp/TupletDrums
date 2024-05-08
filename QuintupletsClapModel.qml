import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: quintuplets_clap_model

    Component.onCompleted: {

        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});

        quintuplets_clap_model.append({"accent" : true, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});

        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : odd_quarter_color});

        quintuplets_clap_model.append({"accent" : true, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_clap_model.append({"accent" : false, "color" : even_quarter_color});

    }

}
