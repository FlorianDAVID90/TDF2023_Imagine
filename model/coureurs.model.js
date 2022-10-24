const strftime = require("strftime");
const paysJSON = require("../json/pays.json");
const equipesJSON = require("../json/equipe.json");

class Coureur {
    constructor(id, nom, prenom, date, img, isPre, idPays, idEquipe) {
        this.id_coureur = id;
        this.nom_coureur = nom;
        this.prenom_coureur = prenom;
        this.date_naissance = strftime('%d/%m/%Y', new Date(date));
        this.img_coureur = img;
        this.est_present = isPre;
        this.id_pays = idPays;
        this.id_equipe = idEquipe;
    }

    // GETTERS
    get idCoureur(){return this.id_coureur;}
    get nomCoureur() { return this.nom_coureur; }
    get prenomCoureur() {return this.prenom_coureur;}
    get dateNaissance() { return this.date_naissance; }
    get imgCoureur() { return this.img_coureur; }
    get estPresent() { return this.est_present; }
    get idPays() { return this.id_pays; }
    get idEquipe() { return this.id_equipe; }

    get JSON() {
        return JSON.stringify({
            id_coureur: this.idCoureur,
            nom_coureur: this.nomCoureur,
            prenom_coureur: this.prenomCoureur,
            date_naissance: this.dateNaissance,
            img_coureur: this.imgCoureur,
            est_present: this.estPresent,
            pays_coureur: paysJSON["pays"][this.idPays - 1]["nom_pays"],
            drapeau_svg: paysJSON["pays"][this.idPays - 1]["drapeau_svg"],
            equipe: equipesJSON["equipe"][this.idEquipe - 1]["nom_equipe"]
        });
    }

    //SETTERS
    set idCoureur(id){ this.id_coureur = id;}
    set nomCoureur(lib) { this.nom_coureur = lib; }
    set prenomCoureur(libelle) { this.prenom_coureur = libelle;}
    set dateNaissance(date) { this.date_naissance = date; }
    set imgCoureur(desc) { this.img_coureur = desc; }
    set estPresent(bool) { this.est_present = bool; }
    set idPays(endr) { this.id_pays = endr; }
    set idEquipe(img) { this.id_equipe = img; }

    static fromJSON(json){
        const data = JSON.parse(JSON.stringify(json));
        if (typeof data !== 'object'
            || !data.hasOwnProperty("id_coureur")
            || (typeof data.id_coureur !== 'string' && typeof data.id_coureur !== 'number')
            || !data.hasOwnProperty("nom_coureur")
            || typeof data.nom_coureur !== 'string'
            || !data.hasOwnProperty("prenom_coureur")
            || typeof data.prenom_coureur !== 'string'
            || !data.hasOwnProperty("date_naissance")
            || typeof data.date_naissance !== 'string'
            || !data.hasOwnProperty("img_coureur")
            || typeof data.img_coureur !== 'string'
            || !data.hasOwnProperty("est_present")
            || (typeof data.est_present !== 'string' && typeof data.est_present !== 'boolean')
            || !data.hasOwnProperty("id_pays")
            || (typeof data.id_pays !== 'string' && typeof data.id_pays !== 'number')
            || !data.hasOwnProperty("id_equipe")
            || (typeof data.id_equipe !== 'string' && typeof data.id_equipe !== 'number')){
            throw new Error(`Not a Coureur: ${json}`);
        }

        return new Coureur(data.id_coureur, data.nom_coureur, data.prenom_coureur, data.date_naissance,
                            data.img_coureur, data.est_present, data.id_pays, data.id_equipe);
    }
}

module.exports = {
    Coureur: Coureur
}