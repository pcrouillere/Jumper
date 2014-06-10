
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="dao.*,java.util.List, java.util.Map, java.util.Set,java.util.Iterator "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
	List<Url> urls = (List<Url>) request.getAttribute("urls");

%>





<html>
  <head>
    <style>
      body {
        margin: 0px;
        padding: 0px;
      }
    </style>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    
    
  </head>
  <body>
				
			<script>
		
			    Colors = {};
			    Colors.names = {
			        aqua: "#00ffff",
			        azure: "#f0ffff",
			        beige: "#f5f5dc",
			        black: "#000000",
			        blue: "#0000ff",
			        brown: "#a52a2a",
			        cyan: "#00ffff",
			        darkblue: "#00008b",
			        darkcyan: "#008b8b",
			        darkgrey: "#a9a9a9",
			        darkgreen: "#006400",
			        darkkhaki: "#bdb76b",
			        darkmagenta: "#8b008b",
			        darkolivegreen: "#556b2f",
			        darkorange: "#ff8c00",
			        darkorchid: "#9932cc",
			        darkred: "#8b0000",
			        darksalmon: "#e9967a",
			        darkviolet: "#9400d3",
			        fuchsia: "#ff00ff",
			        gold: "#ffd700",
			        green: "#008000",
			        indigo: "#4b0082",
			        khaki: "#f0e68c",
			        lightblue: "#add8e6",
			        lightcyan: "#e0ffff",
			        lightgreen: "#90ee90",
			        lightgrey: "#d3d3d3",
			        lightpink: "#ffb6c1",
			        lightyellow: "#ffffe0",
			        lime: "#00ff00",
			        magenta: "#ff00ff",
			        maroon: "#800000",
			        navy: "#000080",
			        olive: "#808000",
			        orange: "#ffa500",
			        pink: "#ffc0cb",
			        purple: "#800080",
			        violet: "#800080",
			        silver: "#c0c0c0",
			        yellow: "#ffff00"
			    };
			    Colors.random = function() {
			        var result;
			        var count = 0;
			        for (var prop in this.names)
			            if (Math.random() < 1/++count)
			               result = prop;
			        return { name: result, rgb: this.names[result]};
			    };
			   
			
			
			
			</script>
	  
	  <section>
	  
<section>

<style>
.ThumbnailContainer
{
	width:100%;
    margin : 0 auto;
}

.Thumbnail
{
	display: inline-block;
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out; 
    width:170 px;
}

.ThumbnailImage
{
	margin-left: auto;
    margin-right: auto;
}

.ThumbnailInfo:hover, .ThumbnailInfo:focus, .ThumbnailInfo.active
{
    border-color: #428bca;
}
.frame
{
	overflow:hidden;
	width:100%;
	height:100%;
	position:relative;
	-webkit-transform-origin: 0 0;
	overflow: hidden;
	scale:0.001;
}

.ThumbnailInfo
{
	width:100%;
	height:25%;
	border-top:1px solid red;
}

.ThumbnailInfoTitle
{
	padding: 9px;
    color: #4A8B87;
}

.container-fluid
{
  padding-left: 0px;
  padding-right: 0px;
}

.btn 
{
	  padding: 0px;
}

.ThumbnailTagContainer
{
    height:60%;
    margin:0 auto;
}


button {
    color: #fff;
    background-color: #4A8B87;
    border-color: #4A8B87;
}
button:hover, button:focus, button:active, button.active, .open .dropdown-toggle.button {
    color: #fff;
    background-color: #3276b1;
    border-color: #285e8e;
}
button:active, button.active, .open .dropdown-toggle.button{
    background-image: none;
}
button.disabled, .button[disabled], fieldset[disabled] .button, .button.disabled:hover, .button[disabled]:hover, fieldset[disabled] .btn-primary:hover, .btn-primary.disabled:focus, .btn-primary[disabled]:focus, fieldset[disabled] .btn-primary:focus, .btn-primary.disabled:active, .btn-primary[disabled]:active, fieldset[disabled] .btn-primary:active, .btn-primary.disabled.active, .btn-primary[disabled].active, fieldset[disabled] .btn-primary.active {
    background-color: #428bca;
    border-color: #357ebd;
}
button.badge {
    color: #428bca;
    background-color: #fff;
}

#all_links
{
	width:100%;
	height:380px;
	position:relative;
	margin:0 auto;
}

.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.panel-default {
    border-color: #ddd;
}
.panel-default>.panel-heading {
    color: #333;
    background-color: #4A8B87;
    border-color: #ddd;
}
.panel-default>.panel-heading+.panel-collapse .panel-body {
    border-top-color: #ddd;
}
.panel-default>.panel-footer+.panel-collapse .panel-body {
    border-bottom-color: #ddd;
}
.panel-body {
  padding: 15px;
}
.panel-heading {
  padding: 6px 15px;
  border-bottom: 2px solid transparent;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

.panel-title {
  margin-top: 20;
  margin-bottom: 0;
  font-size: 16px;
  color: white;
}
.panel-title > a {
  color: inherit;
}

.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
}
.input-group[class*=col-] {
    float: none;
    padding-left: 0;
    padding-right: 0;
}
.input-group .form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 86%;
    margin-bottom: 0;
}

.input-group-addon, .input-group-btn, .input-group .form-control {
    display: table-cell;
}

.input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child), .input-group .form-control:not(:first-child):not(:last-child) {
    border-radius: 0;
}

.input-group-addon, .input-group-btn {
    width: 1%;
    white-space: nowrap;
    vertical-align: middle;
}
.input-group-addon {
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: white;
    text-align: center;
    background-color: #4A8B87;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.input-group-addon input[type=radio], .input-group-addon input[type=checkbox] {
    margin-top: 0;
}

.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group>.btn, .input-group-btn:first-child>.dropdown-toggle, .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle), .input-group-btn:last-child>.btn-group:not(:last-child)>.btn {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
}

.input-group-addon:first-child {
    border-right: 0;
}

.input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group>.btn, .input-group-btn:last-child>.dropdown-toggle, .input-group-btn:first-child>.btn:not(:first-child), .input-group-btn:first-child>.btn-group:not(:first-child)>.btn {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}

.input-group-addon:last-child {
    border-left: 0;
}

.input-group-btn {
    position: relative;
    font-size: 0;
    white-space: nowrap;
}

.input-group-btn>.btn {
    position: relative;
}
.input-group-btn>.btn+.btn {
    margin-left: -1px;
}
.input-group-btn>.btn:hover, .input-group-btn>.btn:focus, .input-group-btn>.btn:active {
    z-index: 2;
}
.input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group {
    margin-right: -1px;
}
.input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group {
    margin-left: -1px;
}

.form-control {
    display: block;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

#tag_names
{
	display : block;
	width: 500px;
	height:450px;
	right: 0px;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
}
#tag_names:first-child {
    border-top-right-radius: 4px;
    border-top-left-radius: 4px;
}
#tag_names:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
}
#tag_names p {
    color: #555;
}

#tag_names p:hover, #tag_names p:focus {
    text-decoration: white;
    text-color:white;
    background-color: #4A8B87;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
    border-top-right-radius: 4px;
    border-top-left-radius: 4px;
}
.ui-autocomplete {
    z-index: 100 !important;
}

input[type=button] {
    border-radius: 8px;
  
    width: 500px;
    height:40px;
    font-family: Tahoma;
    background: #f4f4f4;
    /* Old browsers */
    background: -moz-linear-gradient(top, #f4f4f4 1%, #ededed 100%);
    /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(1%, #f4f4f4), color-stop(100%, #ededed));
    /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top, #f4f4f4 1%, #ededed 100%);
    /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top, #f4f4f4 1%, #ededed 100%);
    /* Opera 11.10+ */
    background: -ms-linear-gradient(top, #f4f4f4 1%, #ededed 100%);
    /* IE10+ */
    background: linear-gradient(to bottom, #f4f4f4 1%, #ededed 100%);
    /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f4f4f4', endColorstr='#ededed', GradientType=0);
    /* IE6-9 */
    top: -10;
   font-weight: bold;
    font-face: 'Comic Sans MS';
     font-size: 50; 
     color: blue; 
     background-color: #FFFFC0; 
     border: 3pt ridge lightgrey" ;
     
    
}

</style>


<script>
function addVisitToUrl(id){ 
	if (window.XMLHttpRequest) { 
	httpRequest = new XMLHttpRequest(); 

	} 
	else if (window.ActiveXObject) { 
	httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
	}	
	if (!httpRequest) { 
	alert('Abandon :Impossible de crÃ©er une instance XMLHTTP'); 
	return false; 
	} 

	httpRequest.onreadystatechange = function() { 
	};
	
	httpRequest.open("GET", "?page=addvisit&id="+id, false); 
	httpRequest.send(null);  
	}


</script>



	  
	<div id="content_page">
		<div class="accueil" id ="list_sites">	
			
		</div>
	</div>
	<aside>
		<div id="tag_list">
			<div class="panel panel-default" style="position:absolute; left: -300px; height:568px ">
				  <div class="panel-heading">
				  <h3 class="panel-title">
				  	 <input type="text" class="form-control" placeholder="nom du tag" id="tag_name" >
				<script>
					var alltags=[];
				</script>
				<% 
				int i=0;
				while ( i<tags.size())
				{
				%>
				<script>
				  alltags.push("<%= tags.get(i).gettName()%>");
				</script>
				 <% 
				 ++i;
				}
				%>
				<script>
				$( "#tag_name" ).autocomplete({
  				source: alltags
  				,autoFocus: true});
				</script>
				</h3>
				     </div>
				    <div class="panel-body" style="height:550px; width: 500px;">
						<div id="tag_names" style="height:510px"/>	
														
						
		<div style="position: relative;">
  <canvas id="tempCanvas" width="500" height="500" style="display:none;"></canvas>
  <canvas id="layer2" width="500" height="500" 
   style="position: absolute; left: 0px; top: 0px; z-index: 0;"></canvas>
  <canvas id="layer3" width="500" height="500" 
   style="position: absolute; left: 0px; top: 0px; z-index: 1;"></canvas>
  <canvas id="layer1" width="500" height="500" 
   style="position: absolute; left: 0px; top: 0px; z-index: 2;"></canvas>
  <div id="container"  style="position: absolute; left: 0px; top: 0px; z-index: 4;"></div>
  <canvas id="trush"  width="500" height="500" 
   style="position: absolute; left:0px ; top:0px; z-index: 3;"></canvas>
  
						</div>
					</div>
				</div>
			<div id="input_tag">
				<div class="input-group"> 
			    <input  type="button" name ="Jump" value="Jump" onclick="searchTag()" style="position: absolute; top: 250px;left: 0px ;width:528px; ">
				
				</div>
			</div>
		</div>
		</aside>			
</section>
	  
      
	


     <script  type="text/javascript" src="http://d3lp1msu2r81bx.cloudfront.net/kjs/js/lib/kinetic-v5.0.2.min.js"></script>
   	 <script  type="text/javascript" defer="defer">

   					var selectedpiece= [];
   					var ovals = [];

   					function addoval(ovals,selectedpiece,oval){
   						ovals.push(oval); 
   						for(i in selectedpiece){
   							selectedpiece[i].push(false);
   						}
   					}

   					function deleteoval(ovals,selectedpiece,i){
   						ovals.splice(i, 1);
   						for(j in selectedpiece){
   							selectedpiece[j].splice(i, 1);
   							if(selectedpiece[j].length==0)
   								selectedpiece.splice(j, 1);
   						}
   					}
   					
   					function deleteovalbytag(ovals,selectedpiece,tag){
   						var j=-1;
   						for(i in ovals){
   						
   							if(ovals[i].gettag()==tag){
   								j=i;
   							}
   						}
   						if(j!=-1)
   							deleteoval(ovals,selectedpiece,j);
   					}


   					function allpiecestostring(ovals, selectedpiece){
   						var request; 
   						request="{";
   						for(i in selectedpiece){
   							request+="[";
   							for(j in selectedpiece[i]){
   								if(selectedpiece[i][j]){
   									var taginrequest=ovals[j].tag.replace('#','');
   									request+=("("+taginrequest+")");
   								}	
   								else {
   									var taginrequest=ovals[j].tag.replace('#','');
   									request+=("(!"+taginrequest+")");
   								}
   									
   							}
   							request+="]";
   						}
   						request+="}";
   						return request;
   					}

   					      var canvas = document.getElementById('layer1');
   					      var context = canvas.getContext('2d');
   					      var canvas2 = document.getElementById('layer2');
   					      var context2 = canvas2.getContext('2d');
   					      var canvas3 = document.getElementById('layer3');
   					      var context3 = canvas3.getContext('2d');
   					      var canvas4 = document.getElementById('trush');
   					      var context4 = canvas4.getContext('2d');
   					      
   					      
   					      
   						  var stage = new Kinetic.Stage({
   						      container: 'container',
   						      width: 500,
   						      height: 500
   						  });
   						  
   						  
   						  var layer = new Kinetic.Layer();
   						     var backgroud = new Kinetic.Rect({
   					        x: 0,
   					        y: 0,
   					        width: stage.width(),
   					        height: stage.height(),
   					        fill: 'green',
   							opacity:0
   					      });
   						  layer.add(backgroud);
   					     backgroud.draggable(false);
   					     var text = new Kinetic.Text({
   					        x: 10,
   					        y: 10,
   					        fontFamily: 'Calibri',
   					        fontSize: 11,
   					        text: '',
   					        fill: 'black'
   					      });
   					      layer.add(text);




   					function Tagoval(tag,x_por,y_por,rot,rw_por,hw_ratio,color) {
   					  this.selected=false;
   					  this.mouseon=false;
   					  this.tag=tag;
   					  this.color=color;
   					  this.x_por=x_por;
   					  this.y_por=y_por;
   					  this.rot=rot;
   					  this.rw_por=rw_por;
   					  this.hw_ratio=hw_ratio;
   					}

   					Tagoval.prototype = {
   					  getFocs: function(){
   								var a=Math.max(this.rw_por,this.rw_por*this.hw_ratio);
   								var b=Math.min(this.rw_por,this.rw_por*this.hw_ratio);
   							    var c=Math.sqrt(a*a-b*b);
   								var foc1={x:this.x_por,y:this.y_por};
   								var foc2={x:this.x_por,y:this.y_por};
   								foc1.x+=c*Math.cos(this.rot);
   							    foc1.y+=c*Math.sin(this.rot);
   								foc2.x-=c*Math.cos(this.rot);
   							    foc2.y-=c*Math.sin(this.rot);
   								return [foc1,foc2];
   							  }
   						,
   						update: function (newx, newy){
   									this.x_por=newx;
   									this.y_por=newy;
   									drawovals(ovals, document.getElementById('layer1'));
   									
   									drawallpieces(selectedpiece,ovals,canvas3);
   							  }
   						,
   						gettag: function (){return this.tag;}
   					};





   					function writeMessage(canvas, message) {
   					        var context = canvas.getContext('2d');
   					        context.clearRect(0, 0, canvas.width/2, canvas.height/10);
   					        context.font = '18pt Calibri';
   					        context.fillStyle = 'black';
   					        context.fillText(message, 10, 25);
   					      }
   					      function getMousePos(canvas, evt) {
   					        var rect = canvas.getBoundingClientRect();
   					        return {
   					          x: evt.clientX - rect.left,
   					          y: evt.clientY - rect.top
   					        };
   					      }
   					     
   					   
   					   
   					   function pieceIdentic(piece1,piece2){
   							if(piece1.length==piece2.length){
   								var identic=true;
   								for(var i in piece1){
   									identic=(piece1[i]==piece2[i])&&identic;
   								}
   								return identic;
   							}
   							else
   							return false;
   					   }
   					     function addpiece(selectedpiece,piece){
   							var repeated = false; 
   							for(var i in selectedpiece){
   								if(pieceIdentic(selectedpiece[i],piece))
   									repeated=true;
   							}
   							if(!repeated){
   								selectedpiece.push(piece);
   							}
   							return repeated;
   					     }
   					   
   							function drawpiece2(piece,ovals,canvas){
   								if(piece.length=ovals.length){
   									for(var i in piece){
   										ovals[i].mouseon=piece[i];
   									}
   									drawpiece(ovals,canvas,'red');
   								}
   								
   							}
   							
   							function convertCanvasToImage(canvas) {
   							var image = new Image();
   							image.src = canvas.toDataURL("image/png");
   							return image;
   					}
   							function drawallpieces(selectedpiece,ovals,canvass){
   								   var tempCanvas = document.getElementById('tempCanvas');
   								   var tempContext = tempCanvas.getContext('2d');
   								   var contexts = canvass.getContext('2d');
   								   tempContext.clearRect(0, 0, tempCanvas.width, tempCanvas.height);
   								   contexts.clearRect(0, 0, canvass.width, canvass.height);
   								   // add the layer to the stage
   								    var layer = new Kinetic.Layer();
   								   for(var i in selectedpiece){
   									  drawpiece2(selectedpiece[i],ovals,tempCanvas);
   									  contexts.drawImage(tempCanvas,0,0);
   								   }   
   							}
   							
   							function deletepiece(selectedpiece,piece){
   								for(var i = selectedpiece.length - 1; i >= 0; i--) {
   									if(pieceIdentic(selectedpiece[i],piece)) {
   										selectedpiece.splice(i, 1);
   									}
   								}
   							}

   						  function isInside(point,oval){
   							return (Math.sqrt((Math.pow((oval.getFocs()[0].x-point.x),2)+
   							Math.pow((oval.getFocs()[0].y-point.y),2)))
   							+
   							Math.sqrt((Math.pow((oval.getFocs()[1].x-point.x),2)+
   							Math.pow((oval.getFocs()[1].y-point.y),2)))<2*Math.max(oval.rw_por,oval.rw_por*oval.hw_ratio));
   						  }
   						  
   						 
   						 
   						  
   						  function drawovals(ovals, canvas) {
   						      var context = canvas.getContext('2d');
   							  context.clearRect(0, 0, canvas.width, canvas.height);
   						      for (var i in ovals) {
   							     
   						          context.save();
   						          var centerX = canvas.width * ovals[i].x_por;
   						          var centerY = canvas.height * ovals[i].y_por;
   								  context.translate(centerX,centerY);
   						          context.rotate(ovals[i].rot);
   						          context.scale(1, ovals[i].hw_ratio);
   						          context.beginPath();
   						          context.arc(0, 0, ovals[i].rw_por * canvas.width, 0, 2 * Math.PI, false);
   						          context.closePath();
   						          context.restore();
   						          context.lineWidth = 2;
   						          context.strokeStyle = 'black';
   						          context.stroke();
   								  context.restore();
   						      }
   						  }

   						  
   						  	function drawandfill(oval, canvas,color) {
   							  color = typeof color !== 'undefined' ? color : 'red';
   						      var context = canvas.getContext('2d');
   					              context.save();
   						          var centerX = canvas.width * oval.x_por;
   						          var centerY = canvas.height * oval.y_por;
   								  context.translate(centerX,centerY);
   						          context.rotate(oval.rot);
   						          context.scale(1, oval.hw_ratio);
   						          context.beginPath();
   						          context.arc(0, 0, oval.rw_por * canvas.width, 0, 2 * Math.PI, false);
   								  context.fillStyle = color;
   								  context.fill();
   								  context.restore();
   						  }
   						  
   						   function drawpiece(ovals,canvas,color){
   						   color = typeof color !== 'undefined' ? color : 'red';
   						      
   						    context=canvas.getContext('2d');
   							context.save();
   							context.clearRect(0, 0, canvas.width, canvas.height);
   						
   						
   							for(var i in ovals){
   								if(ovals[i].mouseon==true){
   									drawandfill(ovals[i], canvas,color); 
   									context.globalCompositeOperation='destination-in';
   								}
   							}
   						    
   							context.beginPath();
   					        context.rect(0, 0,canvas.width, canvas.height);
   					        context.fillStyle = color;
   					        context.fill();
   							
   							
   							for(var i in ovals){
   								if(ovals[i].mouseon!=true){
   									context.globalCompositeOperation='destination-out';
   									drawandfill(ovals[i], canvas,color);
   								}
   							}
   						
   							context.restore();
   						}

   						  function writeMessagedyn(message) {
   					        text.setText(message);
   					        layer.draw();
   					      }

   					function drawdynoval(oval,layer,stage,width,height){

   						var group = new Kinetic.Group({
   							draggable: true,
   							
   						});
   						group.model=oval;
   					    group.x(oval.x_por*width);
   						group.y(oval.y_por*height);

   					    var text = new Kinetic.Text({
   					        x:oval.rw_por*width*Math.cos(oval.rot),
   					        y:oval.rw_por*width*Math.sin(oval.rot),
   					        fontFamily: 'Calibri',
   					        fontSize: 24,
   					        text: oval.tag,
   					        fill: oval.color
   					      });
   						  
   						  text.draggable(true);
   						  
   						  
   						  text.on('dragend', function() {
   						  	if(text.x()+group.x()>450 && text.y()+group.y()>450){
   						  		group.remove(); 
   						  		deleteovalbytag(ovals,selectedpiece,text.getAttr("text"));
   						  		drawovals(ovals, document.getElementById('layer1'));
   								drawallpieces(selectedpiece,ovals,canvas3);
   								writeMessagedyn(allpiecestostring(ovals,selectedpiece));
   								layer.draw();
   						  	};
   					      });
   						  
   						  var ovalshape = new Kinetic.Shape({
   						      sceneFunc: function (context) {
   						          context.beginPath();
   						          context.save();
   						          context.rotate(oval.rot);
   						          context.scale(1, oval.hw_ratio);
   						          context.arc(0, 0, oval.rw_por*width, 0, 2 * Math.PI, !1);
   						          context.restore();
   						          context.closePath();
   						          // KineticJS specific context method
   						          context.fillStrokeShape(this);
   						      },
   						      x: 0,
   						      y: 0,
   						      stroke: oval.color,
   						      strokeWidth: 3
   						  });
   						  //ovalshape.draggable(true);
   						  
   						  group.on('mouseover', function () {
   						      document.body.style.cursor = 'pointer';
   						  });
   						  group.on('mouseout', function () {
   						      document.body.style.cursor = 'default';
   						  });
   					      group.on('dragend', function() {
   						      this.model.update(this.x()/width,this.y()/height);
   					      });
   						  
   						  group.add(ovalshape);
   						group.add(text);
   						  layer.add(group);
   						}
   						
   						function drawalldynoval(ovals,layer,stage){
   							  
   							
   							for(i in ovals){
   								drawdynoval(ovals[i],layer,stage,stage.width(),stage.height());
   							}
   						
   						}
   						
   						   layer.on('click', function(){
   								 var canvas3 = document.getElementById('layer3');
   					        var context3 = canvas3.getContext('2d');
   							
   								var mousePos = stage.getPointerPosition();
   								//context3.save();
   								
   								var piece=[];
   								for(var i in ovals){
   									if(isInside({x:mousePos.x/canvas3.width,y:mousePos.y/canvas3.height},ovals[i])){
   										piece.push(true);
   									}
   									else{
   										piece.push(false);
   									}
   								}
   								if(addpiece(selectedpiece,piece)){
   									deletepiece(selectedpiece,piece);
   								}
   							
   								drawallpieces(selectedpiece,ovals,canvas3);
   								//context3.restore();
   								writeMessagedyn(allpiecestostring(ovals,selectedpiece));
   								
   								});
   								
   						  stage.add(layer);
   							
   						  layer.on('mousemove', function(){
   							var mousePos = stage.getPointerPosition();
   					        var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y;
   							//writeMessagedyn(message);
   							context2.save();
   							context2.clearRect(0, 0, canvas2.width, canvas2.height); 
   							for(var i in ovals){
   								if(isInside({x:mousePos.x/canvas2.width,y:mousePos.y/canvas2.height},ovals[i])){
   									ovals[i].mouseon=true; 
   								}
   								else{
   									ovals[i].mouseon=false;
   								}
   							}
   							drawpiece(ovals,canvas2,'#F5F5F5');
   					        context2.restore();
   					      }, false);
   					      
   					var img = new Image();
   					img.onload = function() { context4.drawImage(img,450, 450,50,50);};
   					img.src = 'http://wcdn1.dataknet.com/static/resources/icons/set20/f02a629829e9.png';
   					layer.draw();
   					
   					
   					
   					 </script>
					<script>
					function searchTag(){
						var req = allpiecestostring(ovals,selectedpiece);
						if (window.XMLHttpRequest) { 
							xhr_obj = new XMLHttpRequest(); 
						}
						else if (window.ActiveXObject) { 
							xhr_obj = new ActiveXObject("Microsoft.XMLHTTP"); 
						}	
						if (!xhr_obj) { 
							alert('Abandon :Impossible de créer une instance XMLHTTP'); 
							return false; 
						} 
						xhr_obj.onreadystatechange = function() {
							if (xhr_obj.readyState == 4 && xhr_obj.responseText) {
									var result = xhr_obj.responseText;
									var textResult = "";
									if(result!="!!!"){
										var listSites = result.split('\n');
										textResult = "<aside>";
										textResult += "<table>";
										var i = 0;
										for (var j = 0; j <= (listSites.length/3); j++) {
											textResult +="<tr>" ;
											for(var k =0; k<=2; k++){
												if(i<listSites.length-1){
													listSites[i] = listSites[i].split(' $$$ ');
													textResult +="<td>" ;
													textResult += "<img src = 'http://img.bitpixels.com/getthumbnail?code=43419&url="+listSites[i][0]+"'>";
													textResult +="<a href='"+listSites[i][0]+"' target='_blank' onclick='addVisitToUrl("+listSites[i][2]+")'>" ;
													textResult +="<p>"+listSites[i][1]+"</p></a>";
													textResult +="</td>" ;
												}
												i++;
											}
											textResult +="</tr>" ;
										}
										textResult += "</table>";
										textResult += "</aside>";
									}
									document.getElementById('list_sites').innerHTML = textResult;
							}
						};
						xhr_obj.open('GET', 'http://localhost:8080/Jump/advancedsearch?req='+req, true);
						xhr_obj.send(null);
					}
					</script>


					<script language="javascript" type="text/javascript">
						//Create new tag in the list
						var element= document.getElementById("tag_name");
						var count=1;
						element.addEventListener('keypress',function(e){
							//ajouter les tags dans la tag_list
							if(element.value!="")
							{
								//check if the user has pressed enter
								var key = e.which || e.keycode;
								if(key==13)
								{
									
									
									
									var ovalnew=new Tagoval("#"+element.value,0.5,0.5,2*Math.PI*Math.random(),0.2,0.5,Colors.random().rgb);
									addoval(ovals,selectedpiece,ovalnew);
									drawdynoval(ovalnew,layer,stage,stage.width(),stage.height());
									drawovals(ovals, document.getElementById('layer1'));
									drawallpieces(selectedpiece,ovals,canvas3);
									writeMessagedyn(allpiecestostring(ovals,selectedpiece));
									layer.draw();
									element.value="";
								}
							}
						},false);
					</script>
  </body>
</html>