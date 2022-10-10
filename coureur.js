const fs = require("fs");
const db = require("./db");
const chalk = require("chalk");

const addCoureur = (nom, prenom, dateNaissance, idPays, idEquipe) => {
    const coureurAj = {idCoureur: idCoureur, nom: nom, prenom: prenom, dateNaissance: dateNaissance,
                        imgCoureur: imgCoureur, idPays: idPays, idEquipe: idEquipe}
    db.getDB().query(`INSERT INTO COUREUR SET?`, coureurAj, (err, lignes) => {
        if(err)
            throw err;

        console.log(lignes);
    });
    console.log(chalk.green("Coureur ajouté ! \n"),coureur);
}

const lireCoureur = (num) => {
    const coureur = db.getDB().query(`SELECT * FROM COUREUR WHERE id_coureur = ${num}`, (err, lignes) => {
        if(err)
            throw err;

        console.log(lignes);
    });
    console.log(coureur);
}

module.exports = {
    addCoureur: addCoureur,
    lireCoureur: lireCoureur
}