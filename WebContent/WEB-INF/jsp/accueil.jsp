<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="dao.*,java.util.List"%>
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
<script>
function addVisitToUrl(id){ 
	if (window.XMLHttpRequest) { 
	httpRequest = new XMLHttpRequest(); 

	} 
	else if (window.ActiveXObject) { 
	httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
	}	
	if (!httpRequest) { 
	alert('Abandon :Impossible de créer une instance XMLHTTP'); 
	return false; 
	} 

	httpRequest.onreadystatechange = function() { 
	};
	
	httpRequest.open("GET", "?page=addvisit&id="+id, false); 
	httpRequest.send(null);  
	}

function searchSite(){
	var part = document.getElementById("rech_rapide").value;
	xhr_obj = new XMLHttpRequest();
	xhr_obj.onreadystatechange = function() {
		if (xhr_obj.readyState == 4 && xhr_obj.responseText) {
				var result = xhr_obj.responseText;
				var listSites = result.split('\n');
				var textResult = "<table>";
				var i = 0;
				for (var j = 0; j <= (listSites.length/3); j++) {
					textResult +="<tr>" ;
					for(var k =0; k<=2; k++){
						if(i<listSites.length-1){
							listSites[i] = listSites[i].split(' $$$ ');
							textResult +="<td>" ;
							textResult += "<img src = 'http://img.bitpixels.com/getthumbnail?code=43419&url="+listSites[i][0]+"'>";
							textResult +="<a href='"+listSites[i][0]+"' target='_blank' onclick='addVisitToUrl("+listSites[i][2]+")'>" ;
							textResult +="<p>"+listSites[i][1]+"</p></a>";
							textResult +="</td>" ;
						}
						i++;
					}
					textResult +="</tr>" ;
				}
				textResult += "</table>";
				document.getElementById('list_sites').innerHTML = textResult;
		}
	};
	xhr_obj.open('GET', 'http://localhost:8080/Jump/search?part='+part, true);
	xhr_obj.send(null);
}
</script>

<div class="accueil2">
<section>
	<ul id="menu_horizontal">
	<%if(nbTags!=null && nbUrls!=null && nbUntaggedUrls!=null) {%>
		<li><a href="?page=tableaubord"><%=nbTags.intValue()%> tags</a></li>
		<li><a href="?page=accueil"><%=nbUrls.intValue()%> favoris</a></li>
		<li><a href="?page=ajoutertag"><%=nbUntaggedUrls.intValue()%> favoris a trier</a></li>
	<%} %>
	</ul>
	<div>
		<input type ="text" id="rech_rapide" placeholder="Rechercher" onkeyup = "searchSite()"/>	
	</div>
	
	<div class="accueil" id ="list_sites">
	<table>
		<%
			if (urls != null) {
				for (int i = 0; i <= 1; i++) {
		%>
		<tr>
			<%
				for (int j = 0; j <= 2; j++) {
							if (urls.get(i + j) != null) {
								Url u = urls.get(i + j);
			%>
			<td>
				<img src = "http://img.bitpixels.com/getthumbnail?code=43419&url=<%=u.getuUri() %>">
				<a href="<%=u.getuUri() %>" target="_blank" onclick="addVisitToUrl(<%=u.getuId()%>)"><p><%=u.getuTitle()%></p></a>
			</td>

			<%
				}
				}
			%>
		</tr>
		<%
			}
			}
		%>

	</table>
	</div>
</section>
</div>