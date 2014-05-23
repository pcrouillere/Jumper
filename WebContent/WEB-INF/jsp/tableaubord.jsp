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

<section>
	<ul id="menu_horizontal">
		<li><%=nbTags.intValue()%> tags</li>
		<li><%=nbUrls.intValue()%> favoris</li>
		<li><%=nbUntaggedUrls.intValue()%> favoris a trier</li>
	</ul>
	<div id="content_page">
		<div class="row">
		<table>
		<td>
		<% for(Map.Entry<Tag, List<Url>> entry : mapTagUrls.entrySet()){
			%> <tr> <%
			Tag tag = entry.getKey();
			List<Url> listUrls = entry.getValue();
			%><%= tag.gettName() %> <%
			Iterator listIterator = listUrls.iterator();
			while(listIterator.hasNext()){
				Url u = (Url) listIterator.next();
				String imgSrc = "http://www.google.com/s2/favicons?domain=" + u.getuUri();
				%><a href="<%=u.getuUri() %>"><img src=<%=imgSrc %> ></a><%
			}%>
			</tr> 
			<% 
		} %>
		</td>
		</table>
		</div>
		
	</div>

</section>