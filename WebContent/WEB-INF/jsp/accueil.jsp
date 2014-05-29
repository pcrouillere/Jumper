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
	}	
	httpRequest.open("GET", "?page=addvisit&id="+id, false); 
	httpRequest.send(null);  
	} 
</script>

<div class="accueil2">
<section>
	<ul id="menu_horizontal">
		<li><%=nbTags.intValue()%> tags</li>
		<li><%=nbUrls.intValue()%> favoris</li>
		<li><%=nbUntaggedUrls.intValue()%> favoris a trier</li>
	</ul>
	<div class="accueil">
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