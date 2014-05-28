function currentTab() {
    chrome.tabs.getSelected(null, function(tab) {
		alert(tab.url);
	});	
 }
document.getElementById('ajout').addEventListener("click", currentTab);