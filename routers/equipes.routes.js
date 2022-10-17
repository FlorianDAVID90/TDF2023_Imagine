const equipeControllers = require("../controllers/equipes.controller");
const express = require('express');
const router = express.Router();

router.get("/", equipeControllers.list);

router.get("/equipe/:abr", equipeControllers.showEquipe);


module.exports = router;