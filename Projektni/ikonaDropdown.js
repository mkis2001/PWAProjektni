document.getElementById("prijava").onclick = function(){
    document.getElementById("prijavaContent").style.cssText = "display:block;"
}

window.onclick = function(event) {
    if (!event.target.matches('#prijava')) {
        document.getElementById("prijavaContent").style.cssText = "Display:none;"
    }
}