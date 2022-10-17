const etapeControllers = require("../controllers/etapes.controller");
const express = require('express');
const router = express.Router();

router.get("/", etapeControllers.list);

router.get("/etape-:id", etapeControllers.showEtape)


module.exports = router;