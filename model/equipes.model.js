const paysJSON = require('../json/pays.json')

class Equipe {
    constructor(id, nom, abr, img, maillot, idPays) {
        this.id_equipe = id;
        this.nom_equipe = nom;
        this.abrev_equipe = abr;
        this.img_equipe = img;
        this.img_maillot_equipe = maillot;
        this.id_pays = idPays;
    }

    // GETTERS
    get idEquipe(){return this.id_equipe;}
    get nomEquipe() {return this.nom_equipe;}
    get abrevEquipe() { return this.abrev_equipe; }
    get imgEquipe() { return this.img_equipe; }
    get maillotEquipe() { return this.img_maillot_equipe; }
    get idPays() { return this.id_pays; }

    get JSON() {
        return JSON.stringify({
            id_equipe: this.idEquipe,
            nom_equipe: this.nomEquipe,
            abrev_equipe: this.abrevEquipe,
            img_equipe: this.imgEquipe,
            img_maillot_equipe: this.maillotEquipe,
            nom_pays: paysJSON["pays"][this.idPays - 1]["nom_pays"],
            drapeau_svg: paysJSON["pays"][this.idPays - 1]["drapeau_svg"]
        });
    }

    //SETTERS
    set idEquipe(id){ this.id_equipe = id;}
    set nomEquipe(name) { this.nom_equipe = name;}
    set abrevEquipe(abr) { this.abrev_equipe = abr; }
    set imgEquipe(img) { this.img_equipe = img; }
    set maillotEquipe(maillot) { this.img_maillot_equipe = maillot; }
    set idPays(idPays) { this.id_pays = idPays; }

    static fromJSON(json){
        const data = JSON.parse(JSON.stringify(json));
        if (typeof data !== 'object'
            || !data.hasOwnProperty("id_equipe")
            || (typeof data.id_equipe !== 'string' && typeof data.id_equipe !== 'number')
            || !data.hasOwnProperty("nom_equipe")
            || typeof data.nom_equipe !== 'string'
            || !data.hasOwnProperty("abrev_equipe")
            || typeof data.abrev_equipe !== 'string' && typeof data.abrev_equipe !== 'number'
            || !data.hasOwnProperty("img_equipe")
            || (typeof data.img_equipe !== 'string')
            || !data.hasOwnProperty("img_maillot_equipe")
            || typeof data.img_maillot_equipe !== 'string'
            || !data.hasOwnProperty("id_pays")
            || (typeof data.id_pays !== 'string' && typeof data.id_pays !== 'number')){
            throw new Error(`Not a Equipe : ${json}`);
        }

        return new Equipe(data.id_equipe, data.nom_equipe, data.abrev_equipe, data.img_equipe,
            data.img_maillot_equipe, data.id_pays);
    }
}

module.exports = {
    Equipe: Equipe
}