function currentTab() {
    chrome.tabs.getSelected(null, function(tab) {
		alert(tab.url);
		//alert(tab.title);
		chrome.cookies.get({ url: 'http://localhost:8080/Jump/', name: 'JSESSIONID' },
		  function (cookie) {
			if (cookie) {
			  alert(cookie.value);
			  /*sucess = file('insertUrl.php?id=1&url='+tab.url+'&nomUrl='+tab.title));
			  if(sucess== 2) alert("url ajouté");
			  else(sucess == 1) alert("error ajout");*/
			}
			else {
			  alert('Can\'t get cookie! Check the name!');
			}
		});
	});	
 }
 
 
function file(fichier)
{
	if(window.XMLHttpRequest) // FIREFOX
	xhr_object = new XMLHttpRequest();
	else return(false);
	xhr_object.open("GET", fichier, true);
	xhr_object.send();
	if(xhr_object.readyState == 4) return (xhr_object.responseText);
	else return(false);
}
	 
document.getElementById('ajout').addEventListener("click", currentTab);