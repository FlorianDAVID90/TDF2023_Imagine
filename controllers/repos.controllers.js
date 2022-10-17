require("dotenv").config();
const reposServices = require("../services/repos.services");
const colsJSON = require("../json/col.json")

function detectError(req, res, error, results) {
    if (error) {
        console.log(error);
        return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
    }
    return res.status(200).send({success: 1, data: results});
}

exports.list = (req,res) => {
    let service = new reposServices.AllRepos();
    service.list((error, results) => detectError(req, res, error, results)).then();
}

exports.showRepos = (req, res) => {
    let service = new reposServices.AllRepos();
    let etapes = require("../services/etapes.services").get_allEtapes();
    let equipes = require("../services/equipes.services").get_allEquipes();

    service.list((error, results) => {
        if (error) {
            console.log(error);
            return res.status(400).send(`<h1 style="color: green">ERROR 400: ${{success: 0, data: error}}</h1>`);
        }
        let jRepos = results[req.params.id - 1]
        return res.render('show_repos.pug', {etapes, equipes, jRepos})
    }).then();
}