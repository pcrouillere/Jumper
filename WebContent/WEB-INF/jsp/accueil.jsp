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
				<li><%= nbUntaggedUrls.intValue() %> favoris à  trier</li>
		</ul>
					<table> 
						<tr>
							<td>
									<img src="<c:url value="/img/apercu_site/ent.png"/>"/>
									<p>Ent</p>
							</td>
						    <td>
									<img src="<c:url value="/img/apercu_site/deezer.jpg"/>"/>
									<p>Deezer</p>
							</td>	
						    <td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
						    </td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
					    </tr>
					    <tr>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
					    </tr>
					</table>
					
				</div>
				<!-- implementï¿½ votre code ici -->
			
			</section>
			<!--Si votre page contient une tab (ex: liste des tags), penser a utiliser la balise <aside>, elle fait pour ce genre de fonctionnalitï¿½-->