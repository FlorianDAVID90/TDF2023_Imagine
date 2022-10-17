const express = require("express");
const strftime = require('strftime');
const appError = require("./utils/appError")

const etapesJSON = require("./json/etape.json");
const typeEtapesJSON = require("./json/type_etape.json")
const villesJSON = require("./json/ville.json")
const equipesJSON = require("./json/equipe.json");

const etapesRouter = require('./routers/etapes.routes')
const equipesRouter = require('./routers/equipes.routes')

require("dotenv").config();
const tdf = express();

tdf.use(express.json());
tdf.use(express.urlencoded({ extended: true }))
tdf.use(express.static(`${__dirname}/public`))

tdf.use('/etapes', etapesRouter)
tdf.use('/equipes', equipesRouter)
//tdf.use('/coureurs', coureursRouter)

tdf.set('views', `${__dirname}/views/`)
tdf.set('view engine','pug');

let etapes = require('./services/etapes.services').get_allEtapes();
let equipes = require('./services/equipes.services').get_allEquipes();
let repos = []
villesJSON["ville_repos"].forEach((jRepos) => {
    repos.push({
        id_repos: jRepos["id_ville_repos"],
        nom_ville_repos: jRepos["nom_ville_repos"],
        date_repos: strftime('%d/%m/%Y', new Date(jRepos["date_repos"]))
    });
})

tdf.get('/', (req, res) => {
    res.render('layout.pug', { etapes, equipes });
});

tdf.get('/carte-TDF-2023', (req, res) => {
    let nbKm = 0;
    etapesJSON["etape"].forEach((etape) => {
        nbKm += etape["longueur"];
    })
    let dateDebut = "01/07/2023", dateFin = "24/07/2023";
    let dates = dateDebut + " > " + dateFin
    res.render('show_carte.pug', { etapes, equipes, repos, nbKm, dates });
});

tdf.all("*",(req, res, next) => {
    throw new appError(`Requested URL ${req.path} not found !`, 404);
})

const port = process.env.PORT
tdf.listen(port, () => {
    console.log(`Listen to port ${port}`)
});
