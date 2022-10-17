const strftime = require("strftime");
const dataEtapes = require('../json/etape.json');
const etapesModel = require("../model/etapes.model");
const etapesJSON = require("../json/etape.json");
const villesJSON = require("../json/ville.json");
const typeEtapesJSON = require("../json/type_etape.json");

class AllEtapes extends etapesModel.Etape {
    async list(callback) {
        const etapes = await this.readAllEtapes();
        if(etapes.length === 0) {
            return callback([]);
        }

        let res = [];
        etapes.forEach((etape) => {
            res.push(JSON.parse(etape.JSON));
        });
        return callback(null,res);
    }

    async readAllEtapes() {
        try {
            const etapes = [];
            dataEtapes["etape"].forEach((etape) => {
                etapes.push(etapesModel.Etape.fromJSON(etape));
            })
            return etapes;
        } catch(e) {
            console.log(e);
            return [];
        }
    }
}

function get_allEtapes() {
    let etapes = [];
    let typeEtape, villeDepart, villeArrivee;

    etapesJSON["etape"].forEach((etape) => {
        typeEtapesJSON["type_etape"].forEach((type) => {
            if(type["id_type_etape"] === etape["id_type_etape"])
                typeEtape = type["libelle_type_etape"]
        })
        villesJSON["ville_depart"].forEach((dep) => {
            if(dep["id_ville_depart"] === etape["id_ville_depart"])
                villeDepart = dep["libelle_ville_depart"]
        })
        villesJSON["ville_arrivee"].forEach((arr) => {
            if(arr["id_ville_arrivee"] === etape["id_ville_arrivee"])
                villeArrivee = arr["libelle_ville_arrivee"]
        })
        etapes.push({
            id_etape: etape["id_etape"],
            libelle_etape: etape["libelle_etape"],
            longueur: etape["longueur"],
            date_etape: strftime('%d/%m/%Y', new Date(etape["date_etape"])),
            descriptif: etape["descriptif"],
            type_etape: typeEtape,
            villes: villeDepart + " > " + villeArrivee
        })
    });
    return etapes;
}

module.exports = {
    AllEtapes: AllEtapes,
    get_allEtapes: get_allEtapes,
}