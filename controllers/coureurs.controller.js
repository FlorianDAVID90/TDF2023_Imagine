const coureursServices = require('../services/coureurs.services')
const etapeServices = require("../services/etapes.services");
let etapes = new etapeServices.get_allEtapes()
let equipes = require("../services/equipes.services").get_allEquipes();
const coureursJSON = require('../json/coureur.json')

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

        const index = results.findIndex(cour => "" + cour["id_coureur"] === "" + req.params.id)

        let coureur = results[index]
        let last_coureur = results[results.length - 1], first_coureur = results[0]
        let prev_coureur = results[index - 1], next_coureur = results[index + 1]

        return res.render('show_coureur.pug', {etapes, equipes, coureur, last_coureur, first_coureur, prev_coureur, next_coureur})
    }).then();
}

/*exports.remplaceCoureur = (req,res) => {
    coureursServices.remplaceCoureur(req.params.idCoureur, req.params.id, (error, results) => detectError(req, res, error, results));
}*/