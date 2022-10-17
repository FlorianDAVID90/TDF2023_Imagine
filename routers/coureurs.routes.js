const coureursController = require('../controllers/coureurs.controller')
var express = require("express");
var router = express.Router();

//router.get('/remplacement/coureur:id_to_:idNew', coureursController.remplaceCoureur)
router.get("/", coureursController.list)
router.get('/coureur-:id/:prenom-:nom', coureursController.showCoureur)

module.exports = router;