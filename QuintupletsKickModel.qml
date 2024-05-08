import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: quintuplets_kick_model

    Component.onCompleted: {

        quintuplets_kick_model.append({"accent" : true});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});

        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});

        quintuplets_kick_model.append({"accent" : true});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});

        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});
        quintuplets_kick_model.append({"accent" : false});

    }

}
