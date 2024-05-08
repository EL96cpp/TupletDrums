import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: septuplets_hat_model

    Component.onCompleted: {

        septuplets_hat_model.append({"accent" : true, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : true, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});

        septuplets_hat_model.append({"accent" : true, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : true, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});

        septuplets_hat_model.append({"accent" : true, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : true, "color" : odd_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : odd_quarter_color});

        septuplets_hat_model.append({"accent" : true, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : true, "color" : even_quarter_color});
        septuplets_hat_model.append({"accent" : false, "color" : even_quarter_color});

    }

}
