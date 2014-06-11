<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="dao.*,java.util.List, java.util.Map, java.util.Set,java.util.Iterator "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%	List<Url> listUrls = (List<Url>) request.getAttribute("listUrls"); %>
<% Tag tag = (Tag) request.getAttribute("tag"); %>

<script>
function removeUrlFromTag(urlId, tagId){
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
		if (xhr_obj.readyState == 4 && xhr_obj.status==200) {
			location.reload();
		}
		if (xhr_obj.readyState == 4 && xhr_obj.status!=200) {
			alert("une erreur est survenue lors de la suppression");			
		}
	};
	xhr_obj.open('GET', 'http://localhost:8080/Jump/?page=removeurlfromtag&urlid='+urlId+'&tagid='+tagId, true);
	xhr_obj.send(null);
}

function removeUrlFromBdd(urlId){
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
		if (xhr_obj.readyState == 4 && xhr_obj.status==200) {
			location.reload();
		}
		if (xhr_obj.readyState == 4 && xhr_obj.status!=200) {
			alert("une erreur est survenue lors de la suppression");			
		}
	};
	xhr_obj.open('GET', 'http://localhost:8080/Jump/?page=removeurlfrombdd&urlid='+urlId, true);
	xhr_obj.send(null);
}

function addVisitToUrl(id){ 
	if (window.XMLHttpRequest) { 
	httpRequest = new XMLHttpRequest(); 

	} 
	else if (window.ActiveXObject) { 
	httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
	}	
	if (!httpRequest) { 
	alert('Abandon :Impossible de crÃ©er une instance XMLHTTP'); 
	return false; 
	} 

	httpRequest.onreadystatechange = function() { 
	};
	
	httpRequest.open("GET", "?page=addvisit&id="+id, false); 
	httpRequest.send(null);  
	}
</script>

<section>
	<ul id="menu_horizontal">
		<li><a href="?page=tableaubord"><%=nbTags.intValue()%> tags</a></li>
		<li><a href="?page=accueil"><%=nbUrls.intValue()%> favoris</a></li>
		<li><a href="?page=ajoutertag"><%=nbUntaggedUrls.intValue()%> favoris a trier</a></li>
	</ul>
	<div id="content_page">
	<table class="tagbyid">
	<caption><%=tag.gettName() %></caption>
	<% Iterator urlIt = listUrls.iterator();
		while(urlIt.hasNext()){
			Url url = (Url) urlIt.next();
			String imgSrc = "http://www.google.com/s2/favicons?domain=" + url.getuUri();
			%>
			<tr>
				<td>
					<a href="<%=url.getuUri()%>" target='_blank' onclick='addVisitToUrl(<%=url.getuId()%>)'><img width="20" height="20" src="<%=imgSrc %>"></a>
				</td>
				<td>
					<a href="<%=url.getuUri()%>" target='_blank' onclick='addVisitToUrl(<%=url.getuId()%>)'><%=url.getuTitle() %></a>
					<% List<Tag> listTags = url.getTags();
					Iterator tagIt = listTags.iterator();
					String listTagsString = "";%>
				</td> <%
					while(tagIt.hasNext()){
						Tag urlTag = (Tag) tagIt.next();
						if (listTagsString =="") {
							listTagsString += "<a href=\"?page=tagbyid&id=" + urlTag.getTid() + "\">" + urlTag.gettName() + "</a>";
						}
						else {
							listTagsString = listTagsString + ", " + "<a href=\"?page=tagbyid&id=" + urlTag.getTid() + "\">" + urlTag.gettName() + "</a>";
						}
					}%>
				<td><%=listTagsString %>
				</td>
				<td>
					<input type="image" src="/Jump/image?src=Remove2.png" class="bouton_del" onclick="removeUrlFromTag(<%=url.getuId()%>,<%=tag.getTid()%>)"/>
				</td>
				<td>
					<a href="?page=ajoutertagurl&id=<%=url.getuId()%>"><img src="/Jump/image?src=add.png"/></a>
				</td>
				<td>
					<input type="image" src="/Jump/image?src=Bin.png" class="bouton_del" onclick="removeUrlFromBdd(<%=url.getuId()%>)"/>
				</td>
			</tr> <%
		}
		%>
	</table>
	<a class="bouton_back" href="?page=tableaubord"><img width="30" height="30" src="/Jump/image?src=back.png" /></a>
	</div>
	</section>