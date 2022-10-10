const db = require("./db");
const express = require("express");
const ejs = require('ejs');
const strftime = require('strftime');
const {JSON} = require("mysql/lib/protocol/constants/types");
const appError = require("./utils/appError")

require("dotenv").config();
const tdf = express();

//db.connect('localhost','flodavid','#Apoal75','tdf2023_html');

tdf.use(express.json());
tdf.use(express.urlencoded({ extended: true }))
tdf.use(express.static(`${__dirname}/public`))

tdf.set('views', `${__dirname}/views/`)
tdf.set('view engine','pug');
tdf.engine("pug",ejs.renderFile);

function get_allEtapes() {
    const etapesJSON = require("./json/etape.json");
    const villesJSON = require("./json/ville.json")
    let etapes = [];
    for(let i = 0; i < 21; i++) {
        const date = strftime('%d/%m/%y',etapesJSON.etape[i].date_etape);
        const libelle = JSON.parse(etapesJSON.etape[i].libelle_etape);
        const villes = JSON.parse(villesJSON.ville_depart[i].libelle_ville_depart) + " > " + JSON.parse(villesJSON.ville_arrivee[i].libelle_ville_arrivee)
        const long = JSON.parse(etapesJSON.etape[i].longueur) + " km";

        let type_etape = "";
        for(let j = 0; j < 6; j++) {
            if(j === JSON.parse(etapesJSON.etape[i].id_type_etape)) {
                type_etape = JSON.parse(etapesJSON.type_etape[j].libelle_type_etape);
            }
        }

        etapes.push(date + " | " + libelle + " | " + villes + " | " + long + " | " + type_etape)
    }
    return etapes;
}

function get_allEquipes() {
    const equipesJSON = require("./json/equipe.json");
    let maillots = [];
    let names = [];
    let abrevs = [];

    for(let i = 0; i < 22; i++) {
        names.push(JSON.parse(equipesJSON.equipe[i].nom_equipe));
        maillots.push(JSON.parse(equipesJSON.equipe[i].img_maillot_equipe));
        abrevs.push(JSON.parse(equipesJSON.equipe[i].abrev_equipe))
    }

    let equipes = [];
    equipes.push(names,maillots,abrevs);
    return equipes;
}

tdf.get('/', (req, res) => {
    const etapes = get_allEtapes();
    const equipes = get_allEquipes();
    res.render('layout.pug', etapes, equipes);
});

tdf.get('/carte-TDF-2023', (req, res) => {
    res.render('show_carte.html');
});

tdf.all("*",(req, res, next) => {
    throw new appError(`Requested URL ${req.path} not found !`, 404);
})

const port = process.env.PORT
tdf.listen(port, () => {
    console.log(`Listen to port ${port}`)
});
