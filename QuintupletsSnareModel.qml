import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: quintuplets_snare_model

    Component.onCompleted: {

        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});

        quintuplets_snare_model.append({"accent" : true});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});

        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});

        quintuplets_snare_model.append({"accent" : true});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});
        quintuplets_snare_model.append({"accent" : false});

    }

}
