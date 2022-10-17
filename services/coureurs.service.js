const strftime = require("strftime");
const dataCoureurJSON = require("../json/coureur.json");
const coureursJSON = require("../json/coureur.json")
const paysJSON = require('../json/pays.json')

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

const remplaceCoureur = (id, idNew, callback) => {
    const coureurWithId = dataCoureurJSON.coureur[id];
    const coureurWithIdNew = dataCoureurJSON.remplacant[idNew];
    const dataJSON = dataBuffer.toString();
    return callback(null, JSON.parse(dataJSON))
}

const abandon = (id) => {
    const coureurAb = dataCoureurJSON.coureur[id];
    coureurAb["est_present"] = false;
}

module.exports = {
    remplaceCoureur: remplaceCoureur,
    abandonne: abandon,
    getCoureursFromEquipe: getCoureursFromEquipe,
    getRemplacantsFromEquipe: getRemplacantsFromEquipe
}