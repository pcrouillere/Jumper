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
				<li>2 favoris à trier</li>
		</ul>
		<div id="content_page">
		
		
			<div class="row">

			<c:forEach items="${tags}" var="tag" varStatus="boucle">
				<div class="col-xs-6 col-md-3">
					<div class="jumbotron">
					<p> ${ tag }</p>
					</div>    					
						</div>            			
      			</c:forEach>
		</div>
		</div>
	
	</section>
