import QtQuick
import QtQuick.Effects
import QtMultimedia

ListModel {

    id: quintuplets_hat_model

    Component.onCompleted: {

        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});

        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});

        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});

        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : false});
        quintuplets_hat_model.append({"accent" : true});
        quintuplets_hat_model.append({"accent" : false});

    }

}
