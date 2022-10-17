const coureursServices = require('../services/coureurs.service')
const equipesServices = require("../services/equipes.services");
const coureursJSON = require("../json/coureur.json");

function detectError(req, res, error, results) {
    if (error) {
        console.log(error);
        return res.status(400).send({success: 0, data: error});
    }
    return res.status(200).send({success: 1, data: results});
}

exports.list = (req,res) => {
    let service = new coureursServices.AllCoureurs();
    service.list((error, results) => detectError(req, res, error, results)).then();
}

exports.showCoureur = (req, res) => {
    let service = new coureursServices.AllCoureurs();
    service.list((error, results) => {
        if (error) {
            console.log(error);
            return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
        }
        return res.status(400).send(`<h1 style="color: green">Yes ${{success: 1, data: results}}</h1>`);
        /*let idAbr;
        equipesJSON["equipe"].forEach((equipe) => {
            if("" + req.params['abr'] === "" + equipe["abrev_equipe"])
                idAbr = equipe["id_equipe"];
        })

        let etapes = require('../services/etapes.services').get_allEtapes();
        let equipes = new equipesServices.get_allEquipes();
        let coureurs = require('../services/coureurs.service').getCoureursFromEquipe(idAbr);
        let remplacants = require('../services/coureurs.service').getRemplacantsFromEquipe(idAbr);

        let equipe = results[idAbr - 1], last_equipe = results[22], first_equipe = results[0]
        let prev_equipe = results[idAbr - 2], next_equipe = results[idAbr]

        return res.render('show_coureur.pug', {etapes, equipes, coureurs, remplacants, equipe,
            last_equipe, first_equipe, prev_equipe, next_equipe})*/
    }).then();
}

/*exports.remplaceCoureur = (req,res) => {
    coureursServices.remplaceCoureur(req.params.idCoureur, req.params.id, (error, results) => detectError(req, res, error, results));
}*/