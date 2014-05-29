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
				</td>
			</tr> <%
		}
		%>
	</table>
	</div>
	</section>