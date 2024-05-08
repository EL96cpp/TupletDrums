import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: quintuplets_snare_model

    Component.onCompleted: {

        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});

        quintuplets_snare_model.append({"accent" : true, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});

        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : odd_quarter_color});

        quintuplets_snare_model.append({"accent" : true, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});
        quintuplets_snare_model.append({"accent" : false, "color" : even_quarter_color});

    }

}
