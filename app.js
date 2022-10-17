const express = require("express");
const appError = require("./utils/appError")

const etapesJSON = require("./json/etape.json");

const etapesRouter = require('./routers/etapes.routes')
const equipesRouter = require('./routers/equipes.routes')
const reposRouter = require('./routers/repos.routes')
const coureursRouter = require('./routers/coureurs.routes')

require("dotenv").config();
const tdf = express();

tdf.use(express.json());
tdf.use(express.urlencoded({ extended: true }))
tdf.use(express.static(`${__dirname}/public`))

tdf.use('/etapes', etapesRouter)
tdf.use('/equipes', equipesRouter)
tdf.use('/repos', reposRouter)
tdf.use('/coureurs', coureursRouter)

tdf.set('views', `${__dirname}/views/`)
tdf.set('view engine','pug');

let etapes = require('./services/etapes.services').get_allEtapes();
let equipes = require('./services/equipes.services').get_allEquipes();
let repos = require('./services/repos.services').get_allRepos();

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
