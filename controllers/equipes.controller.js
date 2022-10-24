const equipesServices = require("../services/equipes.services");
const equipesJSON = require("../json/equipe.json");


function detectError(req, res, error, results) {
    if (error) {
        console.log(error);
        return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
    }
    return res.status(200).send({success: 1, data: results});
}

exports.list = (req,res) => {
    let service = new equipesServices.AllEquipes();
    service.list((error, results) => detectError(req, res, error, results)).then();
}

exports.showEquipe = (req, res) => {
    let service = new equipesServices.AllEquipes();
    service.list((error, results) => {
        if (error) {
            console.log(error);
            return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
        }
        let idAbr;
        equipesJSON["equipe"].forEach((equipe) => {
            if("" + req.params['abr'] === "" + equipe["abrev_equipe"])
                idAbr = equipe["id_equipe"];
        })

        let etapes = require('../services/etapes.services').get_allEtapes();
        let equipes = new equipesServices.get_allEquipes();
        let coureurs = require('../services/coureurs.services').getCoureursFromEquipe(idAbr);
        let remplacants = require('../services/coureurs.services').getRemplacantsFromEquipe(idAbr);

        let equipe = results[idAbr - 1], last_equipe = results[22], first_equipe = results[0]
        let prev_equipe = results[idAbr - 2], next_equipe = results[idAbr]

        return res.render('show_equipe.pug', {etapes, equipes, coureurs, remplacants, equipe,
                                            last_equipe, first_equipe, prev_equipe, next_equipe})
    }).then();
}