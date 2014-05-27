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
		<table class="alltag">
		<%int i = mapTagUrls.size();
		int count_tag =0;
		int count_url =0;
		for(Map.Entry<Tag, List<Url>> entry : mapTagUrls.entrySet()){
			Tag tag = entry.getKey();
			List<Url> listUrls = entry.getValue();
			Iterator listIterator = listUrls.iterator();
			if (listUrls.size()!=0) {
			if(count_tag%4==0){
				%><tr><%
			}
	
			
			%><td><table class="onetag"><caption><a href="?page=tagbyid&id=<%= tag.getTid()%>"><%=tag.gettName() %></a></caption><%
			count_tag++;
			while(listIterator.hasNext()){
				if(count_url%3==0)
				{%><td><%}
				count_url++;
				Url u = (Url) listIterator.next();
				String imgSrc = "http://www.google.com/s2/favicons?domain=" + u.getuUri();
				%><a href="<%=u.getuUri() %>"><img src=<%=imgSrc %> width="40" height="40" ></a><%
				if(count_url%3==0)
				{%></td><%}
			}
			count_url=0;
			
			if(count_tag%4==0){
				%></tr><%
			}%></table></td><%
			
			}
		}%>
		</table>				
		

		</div>
		
</section>