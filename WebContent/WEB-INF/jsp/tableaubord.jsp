<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="dao.*,java.util.List, java.util.Map, java.util.Set,java.util.Iterator "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>
<%
	List<Url> urls = (List<Url>) request.getAttribute("urls");
%>
<%
	Integer nbTags = (Integer) request.getAttribute("nbTags");
%>
<%
	Integer nbUrls = (Integer) request.getAttribute("nbUrls");
%>
<%
	Integer nbUntaggedUrls = (Integer) request
			.getAttribute("nbUntaggedUrls");
%>
<%
	Map<Tag, List<Url>> mapTagUrls = (Map<Tag, List<Url>>) request
			.getAttribute("mapTagUrls");
%>
<script type="text/javascript">
var data = new Array();


//!!!!!!!!!!!!!!!!!!!! CONFIGURATION !!!!!!!!!!!!!!!!!!!!!!!!
var width = 1100;
var nbColomn = 4; // PAS MOINS QUE 4 !
var headerSize = 150;
var leftSize = 100;
var margin = 10;
var size = 180;
var selection = true;
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

var i;

/*************************/
/*                       */
/*     Drag and Drop     */
/*                       */
/*************************/

var startX  = 0;			/* position de départ de la souris */
var startY  = 0;

var offsetX = 0;			/* position de la cible            */
var offsetY = 0;

var target  = null;			/* objet cible que l'on déplace    */
var targetChild  = null;
var zIndex  = null;			/* mettre l'objet par dessus       */

function setCookie(sName, sValue) {
    var today = new Date(), expires = new Date();
    expires.setTime(today.getTime() + (365*24*60*60*1000));
    document.cookie = sName + "=" + encodeURIComponent(sValue) + ";expires=" + expires.toGMTString();
}

function getCookie(sName) {
    var oRegex = new RegExp("(?:; )?" + sName + "=([^;]*);?");

    if (oRegex.test(document.cookie)) {
            return decodeURIComponent(RegExp["$1"]);
    } else {
            return null;
    }
}

function changeOrderTag(){
	var tmp = "";
	for(i = 0;i < data.length; i++){
		tmp += data[i] + ",";
	}
	setCookie("orderTag",tmp); 
}


var Down = function(e)
{
	e           = e        || window.event;
	target = e.target || e.srcElement;

	var test = false;
	if (target.className == "drag")
	{
		test = true;
	}
	targetChild = target;
	if (target.tagName.toLowerCase() == "caption"){
		target = target.parentNode;
	}

	if (test)
	{
		if (window.event){
			startX = e.clientX;
			startY = e.clientY;
		}
		else{
			startX = e.pageX;
			startY = e.pageY;
		}

		offsetX = ((target.style.left) ? parseInt(target.style.left) : 0);
		offsetY = ((target.style.top)  ? parseInt(target.style.top)  : 0);
	
		zIndex              = (target.style.zIndex) ? target.style.zIndex : 1;
		target.style.zIndex = 100;
		document.getElementById("selection").style.border = "2px solid grey";
		document.getElementById("selection").style.width  = (target.clientWidth - 2) + "px";
		document.getElementById("selection").style.height  = (target.clientHeight - 1) + "px";

		document.body.focus();
		document.onmousemove = Move;
		if (document.all){
			document.onselectstart   = function () { return false; };
			target.ondragstart  = function () { return false; };
		}

		return false;
	}else{ target = null;}
}

var Up = function (e)
{
	e           = e        || window.event;
	if (target)
	{
		if (document.all)
		{
			document.onselectstart  = null;
			target.ondragstart = null;
		}
		var posX = e.clientX;// - leftSize;
		var posY = e.clientY ;//- headerSize;
		posX = Math.floor((offsetX + posX - startX) / (width/nbColomn)) * (width/nbColomn);
		posY = Math.floor((offsetY + posY - startY) / (width/nbColomn)) * (width/nbColomn);
		if (	posY >= 0 &&
			posX >= 0 &&
			posX <= width &&
			posY <= document.getElementsByClassName("drag").length/nbColomn * width /nbColomn &&
			Math.floor(posY/(width/nbColomn)) * nbColomn + Math.floor(posX/(width/nbColomn)) <  document.getElementsByClassName("drag").length &&
			Math.floor(posY/(width/nbColomn)) * nbColomn + Math.floor(posX/(width/nbColomn)) >= 0){

			target.style.left = posX + leftSize + "px";
			target.style.top  = posY + headerSize + "px";
			document.getElementById(data[Math.floor(posY/(width/nbColomn))*nbColomn + Math.floor(posX/(width/nbColomn))]).style.left =  Math.floor((offsetX - leftSize) / (width/nbColomn)) * (width/nbColomn) + leftSize + "px";
			document.getElementById(data[Math.floor(posY/(width/nbColomn))*nbColomn + Math.floor(posX/(width/nbColomn))]).style.top =  Math.floor((offsetY - headerSize) / (width/nbColomn)) * (width/nbColomn) + headerSize + "px";

			data[Math.floor(offsetY/(width/nbColomn))*nbColomn + Math.floor(offsetX/(width/nbColomn))] = data[Math.floor(posY/(width/nbColomn))*nbColomn + Math.floor(posX/(width/nbColomn))];
			data[Math.floor(posY/(width/nbColomn))*nbColomn + Math.floor(posX/(width/nbColomn))] = target.id;
			changeOrderTag();
		}
		else{
			target.style.left =  Math.floor((offsetX) / (width/nbColomn)) * (width/nbColomn) + leftSize + "px";
			target.style.top =  Math.floor((offsetY) / (width/nbColomn)) * (width/nbColomn) + headerSize + "px";
		}
             document.getElementById("selection").style.border = "none";
		target.style.zIndex = zIndex;
		document.onmousemove     = null;
		target              = null;
	}
}

var Move = function (e)
{
	e = e || window.event;
	
	if (window.event){
		var posX = e.clientX - leftSize;
		var posY = e.clientY - headerSize;
	}
	else{
		var posX = e.pageX - leftSize;
		var posY = e.pageY - headerSize;
	}



	var posX_tmp = Math.floor((offsetX + posX - startX) / (width/nbColomn)) * (width/nbColomn);
     var posY_tmp = Math.floor((offsetY + posY - startY) / (width/nbColomn)) * (width/nbColomn);
	if (selection){
     	if(posY_tmp < 0 ||
			posX_tmp < 0 ||
			posX_tmp >= width ||
			posY_tmp >= (document.getElementsByClassName("drag").length/nbColomn) * width /nbColomn ||
			Math.floor(posY/(width/nbColomn)) * nbColomn + Math.floor(posX/(width/nbColomn)) >= document.getElementsByClassName("drag").length){
			document.getElementById("selection").style.left = -1000 + "px";
			document.getElementById("selection").style.top  = -1000 + "px";
     	}else{
			document.getElementById("selection").style.left = posX_tmp + leftSize + "px";
			document.getElementById("selection").style.top  = posY_tmp + headerSize + "px";
		}
	}
	
	target.style.left = (offsetX + posX - startX) + leftSize + "px";
	target.style.top  = (offsetY + posY - startY) + headerSize + "px";
}


window.onload = function ()
{
	loadPage();
}


function loadPage()
{
	var j = 0;
	document.onmousedown = Down;
	document.onmouseup   = Up;
	var reg=new RegExp("[ ,]+", "g");
	var data_tmp = new Array();
	var tmp = getCookie("orderTag");
	if (getCookie("orderTag") != null)
		data_tmp = getCookie("orderTag").split(reg);
	
	for (i = 0; i < data_tmp.length; i++){
		if (document.getElementById(data_tmp[i]) != null){
		data[j] = data_tmp[i];

		j++;
		}
		}
		for (i = 0; i < document.getElementsByClassName("drag").length ; i++){
		if (data.indexOf(document.getElementsByClassName("drag")[i].parentNode.id) == -1){
		data[j] = document.getElementsByClassName("drag")[i].parentNode.id;
		j++;
		}
		}

	for(i = 0; i < document.getElementsByClassName("drag").length ; i++){
		document.getElementById(data[i]).style.clientWidth = width / nbColomn + "px";
		document.getElementById(data[i]).style.top =  (Math.floor(i/nbColomn)*(width/nbColomn)) + headerSize + "px";
		document.getElementById(data[i]).style.left =  (i%nbColomn*(width/nbColomn)) + leftSize + "px";
		document.getElementById(data[i]).style.margin =  margin + "px";
	}
     maDiv = document.createElement("div");
     maDiv.id = 'selection';
	 maDiv.style.margin = margin + "px";
	 maDiv.style.top = -1000 + "px";
     maDiv.style.position = "absolute";
     document.body.appendChild(maDiv);
     document.getElementById("content_page").style.height = (Math.floor(document.getElementsByClassName("drag").length / nbColomn) +1) * width/nbColomn + "px";

}


function searchTag(){
	var part = document.getElementById("rech_rapide").value;
	if (window.XMLHttpRequest) { 
		xhr_obj = new XMLHttpRequest(); 
	}
	else if (window.ActiveXObject) { 
		xhr_obj = new ActiveXObject("Microsoft.XMLHTTP"); 
	}	
	if (!xhr_obj) { 
		alert('Abandon :Impossible de créer une instance XMLHTTP'); 
		return false; 
	} 
	xhr_obj.onreadystatechange = function() {
		if (xhr_obj.readyState == 4 && xhr_obj.responseText) {
				var result = xhr_obj.responseText;
				var listTags = result.split('\n');
				var textResult = '';
				var i = 0;
				for (var j = 0; j <= (listTags.length/nbColomn); j++) {
					
					for(var k =0; k<nbColomn; k++){
						if(i<listTags.length-1){
							listTags[i] = listTags[i].split(' $$$ ');
							if(listTags[i].length>2){
								textResult +='<table class="onetag" id ="'+listTags[i][0]+'" >' ;
								textResult += '<caption class="drag"><a href="?page=tagbyid&id='+listTags[i][0]+'">'+listTags[i][1]+'</a></caption>';
								textResult+="<br>";
								var counturl=0;
								for(var l =2; l<10; l++){
									if(counturl%4 ==0) textResult +="<tr>" ;
									counturl++;
									textResult +="<td width='40' height='40'>" ;
									if(l<listTags[i].length){
										textResult+='<a href="'+ listTags[i][l] +'"><img src="http://www.google.com/s2/favicons?domain='+ listTags[i][l]+'" width="40" height="40" ></a>';
									}
									textResult +="</td>" ;
									if(counturl%4 ==0) textResult +="</tr>" ;
								}
							}
						}
						i++;
					}
					textResult +="</tr>" ;
				}
				textResult += "</table>";
				document.getElementById('content_page').innerHTML = textResult;
				loadPage();
		}
	};
	xhr_obj.open('GET', 'http://localhost:8080/Jump/searchtag?part='+part, true);
	xhr_obj.send(null);
}
</script>
<section>
	<ul id="menu_horizontal">
		<li><%=nbTags.intValue()%> tags</li>
		<li><%=nbUrls.intValue()%> favoris</li>
		<li><%=nbUntaggedUrls.intValue()%> favoris a trier</li>
	</ul>
	<div>
		<input type ="text" id="rech_rapide" placeholder="Rechercher" onkeyup = "searchTag()"/>	
	</div>
	
	<div id="content_page">
		<%int i = mapTagUrls.size();
		int count_tag =0;
		int count_url =0;
		for(Map.Entry<Tag, List<Url>> entry : mapTagUrls.entrySet()){
			Tag tag = entry.getKey();
			List<Url> listUrls = entry.getValue();
			Iterator listIterator = listUrls.iterator();
			if (listUrls.size()!=0) {
		
			%><table class="onetag" id="<%=tag.getTid() %>"><caption class="drag"><a href="?page=tagbyid&id=<%= tag.getTid()%>"><%=tag.gettName() %></a></caption><%
			count_tag++;
			while(listIterator.hasNext()){
				if(count_url%4==0)
				{%><tr><%}
				count_url++;
				Url u = (Url) listIterator.next();
				String imgSrc = "http://www.google.com/s2/favicons?domain=" + u.getuUri();
				%><td><a href="<%=u.getuUri() %>"><img src=<%=imgSrc %> width="40" height="40" ></a></td><%
				if(count_url%4==0)
				{%></tr><%}
			}
			for (int j = count_url; j < 8; j++){
				if(count_url%4==0)
				{%><tr><%}
				count_url++;
				%><td width="40" height="40"></td><%
				if(count_url%4==0)
				{%></tr><%}
			}
			count_url=0;
			
			%></table><%
			
			}
		}%>	

		</div>
		
</section>