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


<section>
	<ul id="menu_horizontal">
		<li><%=nbTags.intValue()%> tags</li>
		<li><%=nbUrls.intValue()%> favoris</li>
		<li><%=nbUntaggedUrls.intValue()%> favoris a trier</li>
	</ul>
	<div id="content_page">
	<h2><%=tag.gettName() %></h2>
	<% Iterator urlIt = listUrls.iterator();
		while(urlIt.hasNext()){
			Url url = (Url) urlIt.next();
			%> <td><%=url.getuTitle() %></td> <%
		}
		%>
	</div>
	</section>