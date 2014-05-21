<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="dao.*,java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% List<Tag> tags = (List<Tag>) request.getAttribute("tags"); %>
<% List<Url> urls = (List<Url>) request.getAttribute("urls"); %>
<% Integer nbTags = (Integer) request.getAttribute("nbTags");  %>
<% Integer nbUrls = (Integer) request.getAttribute("nbUrls"); %>
<% Integer nbUntaggedUrls = (Integer) request.getAttribute("nbUntaggedUrls"); %>
 
	<section>
		<ul id="menu_horizontal">
				<li><%= nbTags.intValue() %> tags</li>
				<li><%= nbUrls.intValue() %> favoris</li>
				<li><%= nbUntaggedUrls.intValue() %> favoris ра trier</li>
		</ul>
					<table> 
						<tr>
						<%
						if (urls!=null){
							for(int i=0; i<=1; i++) {
								Url u = urls.get(i);
								String uri = u.getuUri();
								%><td><p><%= uri %></td></p><%} }%>
					</table>
					
				</div>
			
			</section>
