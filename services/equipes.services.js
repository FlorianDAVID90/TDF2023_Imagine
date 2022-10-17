const equipesModel = require("../model/equipes.model")
const dataEquipes = require("../json/equipe.json")
const equipesJSON = require("../json/equipe.json");

class AllEquipes extends equipesModel.Equipe {
    async list(callback) {
        const equipes = await this.readAllEquipes();
        if(equipes.length === 0) {
            return callback([]);
        }

        let res = [];
        equipes.forEach((equipe) => {
            res.push(JSON.parse(equipe.JSON));
        });
        return callback(null,res);
    }

    async readAllEquipes() {
        try {
            const equipes = [];
            dataEquipes["equipe"].forEach((equipe) => {
                equipes.push(equipesModel.Equipe.fromJSON(equipe));
            })
            return equipes;
        } catch(e) {
            console.log(e);
            return [];
        }
    }
}

function get_allEquipes() {
    let equipes = [];

    equipesJSON["equipe"].forEach((eq) => {
        equipes.push({
            id_equipe: eq["id_equipe"],
            nom_equipe: eq["nom_equipe"],
            abrev_equipe: eq["abrev_equipe"],
            img_equipe: eq["img_equipe"],
            img_maillot_equipe: eq["img_maillot_equipe"],
            id_pays: eq["id_pays"]
        });
    })
    return equipes;
}

module.exports = {
    AllEquipes: AllEquipes,
    get_allEquipes: get_allEquipes
}