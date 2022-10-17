const strftime = require("strftime");
const coureursModel = require('../model/coureurs.model')
const coureursJSON = require("../json/coureur.json");
const paysJSON = require("../json/pays.json")

class AllCoureurs extends coureursModel.Coureur {
    async list(callback) {
        const coureurs = await this.readAllCoureurs();
        if(coureurs.length === 0) {
            return callback([]);
        }

        let res = [];
        coureurs.forEach((cour) => {
            res.push(JSON.parse(cour.JSON));
        });
        return callback(null,res);
    }

    async readAllCoureurs() {
        try {
            const coureurs = [];
            coureursJSON["coureur"].forEach((cour) => {
                coureurs.push(coureursModel.Coureur.fromJSON(cour));
            })
            return coureurs;
        } catch(e) {
            console.log(e);
            return [];
        }
    }
}

function getCoureursFromEquipe(id) {
    let coureurs = [];

    coureursJSON["coureur"].forEach((cour) => {
        if("" + cour["id_equipe"] === "" + id) {
            coureurs.push({
                id_coureur: cour["id_coureur"],
                nom_coureur: cour["nom_coureur"],
                prenom_coureur: cour["prenom_coureur"],
                date_naissance: strftime('%d/%m/%Y', new Date(cour["date_naissance"])),
                img_coureur: cour["img_coureur"],
                drapeau_svg: paysJSON["pays"][cour["id_pays"] - 1]["drapeau_svg"]
            });
        }
    })

    return coureurs;
}

function getRemplacantsFromEquipe(id) {
    let coureurs = [];

    coureursJSON["remplacant"].forEach((cour) => {
        if("" + cour["id_equipe"] === "" + id) {
            coureurs.push({
                id_coureur: cour["id_coureur"],
                nom_coureur: cour["nom_coureur"],
                prenom_coureur: cour["prenom_coureur"],
                date_naissance: strftime('%d/%m/%Y', new Date(cour["date_naissance"])),
                img_coureur: cour["img_coureur"],
                drapeau_svg: paysJSON["pays"][cour["id_pays"] - 1]["drapeau_svg"]
            });
        }
    })

    return coureurs;
}

/*const remplaceCoureur = (id, idNew, callback) => {
    const coureurWithId = coureursJSON.coureur[id];
    const coureurWithIdNew = coureursJSON.remplacant[idNew];
    const dataJSON = dataBuffer.toString();
    return callback(null, JSON.parse(dataJSON))
}

const abandon = (id) => {
    const coureurAb = dataCoureurJSON.coureur[id];
    coureurAb["est_present"] = false;
}*/

module.exports = {
    AllCoureurs: AllCoureurs,
    //remplaceCoureur: remplaceCoureur,
    //abandonne: abandon,
    getCoureursFromEquipe: getCoureursFromEquipe,
    getRemplacantsFromEquipe: getRemplacantsFromEquipe
}