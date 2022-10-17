const finalDate = new Date(2023, 7, 1, 12,0,0); //Date grand départ le 1er juillet 2023
var actualDate = new Date();

let temps = (finalDate.getTime() - actualDate.getTime()) / 1000;
let daysNow = Math.round(temps/86400);

const dayElement = document.getElementById("cd-days")
const timerElement = document.getElementById("timer")

setInterval(() => {
    let days = daysNow;
    let hours = parseInt((temps / 3600) % 24,10)
    let minutes = parseInt((temps / 60) % 60, 10)
    let secondes = parseInt(temps % 60, 10)

    hours = hours < 10 ? "0" + hours : hours
    minutes = minutes < 10 ? "0" + minutes : minutes
    secondes = secondes < 10 ? "0" + secondes : secondes

    if(temps <= 0) {
        if(daysNow <= 0) {
            temps = 0;
            daysNow = 0;
        } else {
            temps = 86399
            daysNow--;
            dayElement.innerText = "H - "
        }
    } else {
        temps--;
        dayElement.innerText = `J - ${days}`
    }
    timerElement.innerText = `${hours}:${minutes}:${secondes}`
}, 1000)