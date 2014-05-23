<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
	import="dao.*,java.util.List, java.util.Map, java.util.Set,java.util.Iterator "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% List<Tag> tags = (List<Tag>) request.getAttribute("tags"); %>
<% List<Url> urls = (List<Url>) request.getAttribute("urls"); %>
<% Integer nbTags = (Integer) request.getAttribute("nbTags");  %>
<% Integer nbUrls = (Integer) request.getAttribute("nbUrls"); %>
<% Integer nbUntaggedUrls = (Integer) request.getAttribute("nbUntaggedUrls"); %>
<% Map<Tag, List<Url>> mapTagUrl =(Map<Tag, List<Url>>) request.getAttribute("map");  %>

	<section>
		<ul id="menu_horizontal">
				<li><%= nbTags.intValue() %> tags</li>
				<li><%= nbUrls.intValue() %> favoris</li>
				<li>2 favoris à trier</li>
		</ul>
		<div id="content_page">
		
		
			<div class="row">

			<%
				Set<Tag> cles = mapTagUrl.keySet();
				Iterator<Tag> it = cles.iterator();
				while (it.hasNext()){
					{out.println("<div class=\"col-xs-6 col-md-3\">");}
					{out.println("<div class=\"jumbotron\">");}
					Tag t = it.next(); // tu peux typer plus finement ici
					{out.println(t.toString());}
			   		List<Url> valeur = mapTagUrl.get(t); // tu peux typer plus finement ici
			   		for(int i=0; i<valeur.size();i++){
			   			Url u = valeur.get(i);
			   			{out.println(u.toString());}
			   		}
			   		{out.println("<\\div>");}
			   		{out.println("<\\div>");}
				}
			%>
			</div>
		</div>
	
	</section>
