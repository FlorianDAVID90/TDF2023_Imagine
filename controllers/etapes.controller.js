require("dotenv").config();
const etapeServices = require("../services/etapes.services");
const colsJSON = require("../json/col.json")

function detectError(req, res, error, results) {
    if (error) {
        console.log(error);
        return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
    }
    return res.status(200).send({success: 1, data: results});
}

exports.list = (req,res) => {
    let service = new etapeServices.AllEtapes();
    service.list((error, results) => detectError(req, res, error, results)).then();
}

exports.showEtape = (req, res) => {
    let service = new etapeServices.AllEtapes();
    let etapes = new etapeServices.get_allEtapes()
    let equipes = require("../services/equipes.services").get_allEquipes();
    let cols = [], idS = [];
    colsJSON["col"].forEach((col) => {
        if("" + col["id_etape"] === ("" + req.params.id)) {
            cols.push(col);
            idS.push(col["id_col"])
        }
    });

    service.list((error, results) => {
        if (error) {
            console.log(error);
            return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
        }
        let etape = results[req.params.id - 1]
        let min_col_id = Math.min(...idS);
        return res.render('show_etape.pug', {etapes, equipes, cols, etape, min_col_id})
    }).then();
}