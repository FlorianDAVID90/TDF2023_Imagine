const strftime = require("strftime");
const reposModel = require('../model/repos.model')
const reposJSON = require("../json/repos.json");

class AllRepos extends reposModel.Repos {
    async list(callback) {
        const repos = await this.readAllRepos();
        if(repos.length === 0) {
            return callback([]);
        }

        let res = [];
        repos.forEach((jRepos) => {
            res.push(JSON.parse(jRepos.JSON));
        });
        return callback(null,res);
    }

    async readAllRepos() {
        try {
            const repos = [];
            reposJSON["repos"].forEach((jRepos) => {
                repos.push(reposModel.Repos.fromJSON(jRepos));
            })
            return repos;
        } catch(e) {
            console.log(e);
            return [];
        }
    }
}

function get_allRepos() {
    let repos = [];

    reposJSON["repos"].forEach((jR) => {
        repos.push({
            id_repos: jR["id_repos"],
            libelle_repos: jR["libelle_repos"],
            ville_repos: jR["ville_repos"],
            date_repos: strftime('%d/%m/%Y',new Date(jR["date_repos"])),
            description: jR["description"],
            endroits_visit: jR["endroits_visit"],
            img_repos: jR["img_repos"]
        })
    });
    return repos;
}

module.exports = {
    AllRepos: AllRepos,
    get_allRepos: get_allRepos
}