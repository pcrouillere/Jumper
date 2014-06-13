function currentTab() {
    chrome.tabs.getSelected(null, function(tab) {
		chrome.cookies.get({ url: 'http://localhost:8080/Jump/', name: 'userId' },
		  function (cookie) {
			if (cookie) {
			  //alert(tab.url);
			  var url = tab.url;
			  var title = tab.title;
			  var userid = cookie.value;
			  var success = file('http://localhost:8080/Jump/?page=addurl&id='+userid+'&url='+url+'&nomUrl='+title);
			  if(success == 201) alert("Cette URL fait deja  parti de vos favoris");
			  if(success == 400) alert("Une erreur est survenue lors de l'ajout de l'URL");
			}
			else {
			  alert('Attention tu n\'es pas loggee !');
			}
		});
	});	
 }
 
 
function file(fichier)
{
	xhr_object = new XMLHttpRequest();
	xhr_object.onreadystatechange  = function() 
    { 
       if(xhr_object.readyState  == 4)
       {
        if(xhr_object.status == 200) {}
        else
            alert("Une erreur est survenue lors de l'ajout de l'URL");
        }
    }; 
	xhr_object.open("GET", fichier, true);
	xhr_object.send();
}
	 
document.getElementById('ajout').addEventListener("click", currentTab);