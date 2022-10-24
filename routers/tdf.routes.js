var express = require("express");
var router = express.Router();

router.get("/applications-mobiles", (req, res) => {
    let etapes = require("../services/etapes.services").get_allEtapes()
    let equipes = require("../services/equipes.services").get_allEquipes();
    return res.render('show_applications.pug', {etapes, equipes})
})

module.exports = router;