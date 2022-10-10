const fs = require('fs');
const dataBuffer = fs.readFileSync("./json/coureur.json");

const changeCoureur = (id) => {
    const dataJSON = dataBuffer.toString();
    return JSON.parse(dataJSON)
}

const abandon = (id) => {
    const dataCoureurJSON = require("./json/coureur.json");
    const coureur = JSON.parse(dataCoureurJSON.coureur[id].text);
}