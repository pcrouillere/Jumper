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
<script src="./js/insertAllJsInDom.js"></script>

	<div id="content_page">
		<div class="head_content_page">
			<h1>Ajouter des tags</h1>
			<div id="how_to_do">
					<div class="alert alert-info"><p>Drop all tags you want over the link</p></div>
			</div>
		</div>				
		<!-- This part should be loaded from Database, this is just an exemple -->
		<script>
		
		var container = new ThumbnailContainer(null,null);
		$('#content_page').prepend(container.getHtmlObject());
		</script>
		<% 
			int i=0;
			while ( i<urls.size())
			{
		%>
		<script>
		var count = String(<%=i%>);
		var url = "<%=urls.get(i).getuUri()%>";
		count = '"'+count+'"';
		console.log(url);
		url = '"'+url+'"';
		//console.log(j);
		var parameters = '{"parameters":['+
		'{'+count+':[{"url":'+url+'}]}'+
		']}';
			container.addThumbnail(parameters);
		</script>
		<% 
				i++;
			}
		%>
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
<script src="./js/atscript.js"></script>
