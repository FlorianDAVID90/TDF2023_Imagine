const reposControllers = require("../controllers/repos.controllers");
const express = require('express');
const router = express.Router();

router.get("/", reposControllers.list);

router.get("/repos-:id", reposControllers.showRepos)


module.exports = router;