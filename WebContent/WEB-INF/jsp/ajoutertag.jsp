<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>
<%
	List<Url> urls = (List<Url>) request.getAttribute("untaggedurls");
%>
<!--Les section, c'est la partie coeur, c'est la ou on doit developper les differentes fonctionnalitées -->

<section>
	<div id="content_page">
		<div class="head_content_page">
			<h1>Ajouter des tags</h1>
			<div id="how_to_do">
					<div class="alert alert-info"><p>Drop all tags you want over the link</p></div>
			</div>
		</div>				
		<div id="all_links">
		<!-- This part should be loaded from Database, this is just an exemple -->
		<% 
			int i=0;
			while ( i<urls.size())
			{
		%>
			<div class="row" id="<%="link_"+String.valueOf(i+1)%>">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<c:url value="<%= urls.get(i).getuUri() %>"/>" ondrop="drop(event)" ondragover="allowDrop(event)" id="<%=String.valueOf(i+1)%>" class="img-thumbnail"/>
						<div class="caption">
							<p><%= urls.get(i).getuTitle()%></p>
							<p><a href="#" class="btn btn-primary" role="button" id="<%=String.valueOf(i+1)%>"  onclick="done_callback(event)">Done</a></p>
						</div>
					</div>
				</div>
			</div>
		<% 
				i++;
			}
		%>
	</div>
</div>
<aside>
	<div id="tag_list">
		<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Liste des tags</h3>
			  </div>
			    <div class="panel-body" style="height:283px;">
					<div id="tag_names"/>									
						<!-- Load all tag names from the database here -->		
						<%
							i=0;
							while(i<tags.size())
							{
						%>
						<p draggable="true" ondragstart="drag(event,'<%=tags.get(i).gettName()%>')" id=<%=tags.get(i).gettName()%>><%= "#"+tags.get(i).gettName() %></p>		
						<%
								i++;
							}
						%>			
					</div>
				</div>
			</div>
		<div id="input_tag">
			<div class="input-group">
			  <span class="input-group-addon">Add tags</span>
			  <input type="text" class="form-control" placeholder="Tag name" id="tag_name">
			</div>
		</div>
	</div>
	</aside>			
</section>
<script src="./js/atscript.js"> </script>
<script src="./js/Sender.js"> </script>
