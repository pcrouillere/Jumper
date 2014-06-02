function openSite() {
       var index_url = "http://localhost:8080/Jump/?page=accueil";
       chrome.tabs.create({
       url: index_url
    });
 }
document.getElementById('site').addEventListener("click", openSite);