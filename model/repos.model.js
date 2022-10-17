const strftime = require("strftime");

class Repos {
    constructor(id, libelle, ville, date, desc, endroits, img) {
        this.id_repos = id;
        this.libelle_repos = libelle
        this.ville_repos = ville;
        this.date_repos = "" + strftime('%d/%m/%Y', new Date(date));
        this.description = desc;
        this.endroits_visit = endroits;
        this.img_repos = img;
    }

    // GETTERS
    get idRepos(){return this.id_repos;}
    get libelleRepos() { return this.libelle_repos; }
    get nomVilleRepos() {return this.ville_repos;}
    get dateRepos() { return this.date_repos; }
    get descriptionRepos() { return this.description; }
    get endroitsVisit() { return this.endroits_visit; }
    get imgRepos() { return this.img_repos; }

    get JSON() {
        return JSON.stringify({
            id_repos: this.idRepos,
            libelle_repos: this.libelleRepos,
            ville_repos: this.nomVilleRepos,
            date_repos: this.dateRepos,
            description: this.descriptionRepos,
            endroits_visit: this.endroitsVisit,
            img_repos: this.imgRepos
        });
    }

    //SETTERS
    set idRepos(id){ this.id_repos = id;}
    set libelleRepos(lib) { this.libelle_repos = lib; }
    set nomVilleRepos(libelle) { this.ville_repos = libelle;}
    set dateRepos(date) { this.date_repos = date; }
    set descriptionRepos(desc) { this.description = desc; }
    set endroitsVisit(endr) { this.endroits_visit = endr; }
    set imgRepos(img) { this.img_repos = img; }

    static fromJSON(json){
        const data = JSON.parse(JSON.stringify(json));
        if (typeof data !== 'object'
            || !data.hasOwnProperty("id_repos")
            || (typeof data.id_repos !== 'string' && typeof data.id_repos !== 'number')
            || !data.hasOwnProperty("libelle_repos")
            || typeof data.libelle_repos !== 'string'
            || !data.hasOwnProperty("ville_repos")
            || typeof data.ville_repos !== 'string'
            || !data.hasOwnProperty("date_repos")
            || typeof data.date_repos !== 'string'
            || !data.hasOwnProperty("description")
            || typeof data.description !== 'string'
            || !data.hasOwnProperty("endroits_visit")
            || typeof data.endroits_visit !== 'object'
            || !data.hasOwnProperty("img_repos")
            || typeof data.img_repos !== 'string'){
            throw new Error(`Not a Repos: ${json}`);
        }

        return new Repos(data.id_repos, data.libelle_repos, data.ville_repos, data.date_repos,
                        data.description, data.endroits_visit, data.img_repos);
    }
}

module.exports = {
    Repos: Repos
}