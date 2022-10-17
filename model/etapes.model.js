const typeEtapesJSON = require('../json/type_etape.json')
const villesJSON = require('../json/ville.json')

class Etape {
    constructor(id, libelle, long, date, description, idType) {
        this.id_etape = id;
        this.libelle_etape = libelle;
        this.longueur = long;
        this.date_etape = date;
        this.descriptif = description;
        this.id_type_etape = idType;
        this.id_ville_depart = id;
        this.id_ville_arrivee = id;
    }

    // GETTERS
    get idEtape(){return this.id_etape;}
    get libelleEtape() {return this.libelle_etape;}
    get longueurEtape() { return this.longueur; }
    get dateEtape() { return this.date_etape; }
    get descriptifEtape() { return this.descriptif; }
    get idTypeEtape() { return this.id_type_etape; }
    get idVilleDepart() { return this.id_ville_depart; }
    get idVilleArrivee() { return this.id_ville_arrivee; }

    get JSON() {
        return JSON.stringify({
            id_etape: this.idEtape,
            libelle_etape: this.libelleEtape,
            longueur: this.longueurEtape,
            date_etape: this.dateEtape,
            descriptif: this.descriptifEtape,
            type_etape: typeEtapesJSON["type_etape"][this.idTypeEtape - 1]["libelle_type_etape"],
            villes: villesJSON["ville_depart"][this.idVilleDepart - 1]["libelle_ville_depart"] + " > " +
                    villesJSON["ville_arrivee"][this.idVilleArrivee - 1]["libelle_ville_arrivee"]
        });
    }

    //SETTERS
    set idEtape(id){ this.id_etape = id;}
    set libelleEtape(libelle) { this.libelle_etape = libelle;}
    set longueurEtape(long) { this.longueur = long; }
    set dateEtape(date) { this.date_etape = date; }
    set descriptifEtape(desc) { this.descriptif = desc; }
    set idTypeEtape(idType) { this.id_type_etape = idType; }
    set idVilleDepart(idDepart) { this.id_ville_depart = idDepart; }
    set idVilleArrivee(idArrivee) { this.id_ville_arrivee = idArrivee; }

    static fromJSON(json){
        const data = JSON.parse(JSON.stringify(json));
        if (typeof data !== 'object'
            || !data.hasOwnProperty("id_etape")
            || (typeof data.id_etape !== 'string' && typeof data.id_etape !== 'number')
            || !data.hasOwnProperty("libelle_etape")
            || typeof data.libelle_etape !== 'string'
            || !data.hasOwnProperty("longueur")
            || (typeof data.longueur !== 'string' && typeof data.longueur !== 'number')
            || !data.hasOwnProperty("date_etape")
            || (typeof data.date_etape !== 'string')
            || !data.hasOwnProperty("descriptif")
            || typeof data.descriptif !== 'string'
            || !data.hasOwnProperty("id_type_etape")
            || (typeof data.id_type_etape !== 'string' && typeof data.id_type_etape !== 'number')
            || !data.hasOwnProperty("id_ville_depart")
            || (typeof data.id_ville_depart !== 'string' && typeof data.id_ville_depart !== 'number')
            || !data.hasOwnProperty("id_ville_arrivee")
            || (typeof data.id_ville_arrivee !== 'string' && typeof data.id_ville_arrivee !== 'number')){
            throw new Error(`Not a Etape: ${json}`);
        }

        return new Etape(data.id_etape, data.libelle_etape, data.longueur, data.date_etape,
            data.descriptif, data.id_type_etape);
    }
}

module.exports = {
    Etape: Etape
}