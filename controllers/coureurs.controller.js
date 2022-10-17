const coureursServices = require('../services/coureurs.service')

function detectError(req, res, error, results) {
    if (error) {
        console.log(error);
        return res.status(400).send({success: 0, data: error});
    }
    return res.status(200).send({success: 1, data: results});
}

exports.remplaceCoureur = (req,res) => {
    coureursServices.remplaceCoureur(req.params.idCoureur, req.params.id, (error, results) => detectError(req, res, error, results));
}