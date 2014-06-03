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
	alert("url : "+urlId+" tag : "+tagId);
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

</script>
<section>
	<ul id="menu_horizontal">
		<li><%=nbTags.intValue()%> tags</li>
		<li><%=nbUrls.intValue()%> favoris</li>
		<li><%=nbUntaggedUrls.intValue()%> favoris a trier</li>
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
					<a href="<%=url.getuUri()%>"><img width="20" height="20" src="<%=imgSrc %>"></a>
				</td>
				<td>
					<a href="<%=url.getuUri()%>"><%=url.getuTitle() %></a>
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
					<input type="image" src="/Jump/image?src=DeleteButton.png" class="bouton_del" onclick="removeUrlFromTag(<%=url.getuId()%>,<%=tag.getTid()%>)"/>
				</td>
			</tr> <%
		}
		%>
	</table>
	</div>
	</section>