function currentTab() {
    chrome.tabs.getSelected(null, function(tab) {
		chrome.cookies.get({ url: 'http://localhost:8080/Jump/', name: 'userId' },
		  function (cookie) {
			if (cookie) {
			  alert(tab.url);
			  var url = tab.url;
			  var title = tab.title;
			  var userid = cookie.value;
			  success = file('http://localhost:8080/Jump/?page=addurl&id='+userid+'&url='+url+'&nomUrl='+title);
			  console.log("success",sucess);
			  if(success == 1) alert("url ajouté");
			  else alert("error ajout");
			}
			else {
			  alert('Can\'t get cookie! Check the name!');
			}
		});
	});	
 }
 
 
function file(fichier)
{
	if(window.XMLHttpRequest){
		xhr_object = new XMLHttpRequest();
		}
	else { 
		return(false);
	}
	alert(2);
	xhr_object.open("GET", fichier, true);
	xhr_object.send();
	if(xhr_object.readyState == 4){
		return (xhr_object.responseText);
	}
	else {
		return(false);
	}
}
	 
document.getElementById('ajout').addEventListener("click", currentTab);