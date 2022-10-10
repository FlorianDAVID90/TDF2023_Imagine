const fs = require("fs");
var mysql = require('mysql');
const chalk = require("chalk");
let connex_db;

const connect = (host,user,passwd,database) => {
    connex_db = mysql.createConnection({
        host     : host,
        user     : user,
        password : passwd,
        database : database
    });

    if(connex_db != null) {
        console.log(chalk.green(`Database ${database} connected`));
    } else {
        console.log(chalk.red(`Database not connected`));
    }
}

const getDB = () => {
    return connex_db;
}

module.exports = {
    connect: connect,
    getDB: getDB
}