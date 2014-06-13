
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="dao.*,java.util.List, java.util.Map, java.util.Set,java.util.Iterator "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
	List<Url> urls = (List<Url>) request.getAttribute("urls");

%>

  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    
    
  <section>
				
			<script>
		
			
			var Drag = {

					obj : null,

					init : function(o, oRoot, minX, maxX, minY, maxY, bSwapHorzRef, bSwapVertRef, fXMapper, fYMapper)
					{
						o.onmousedown	= Drag.start;

						o.hmode			= bSwapHorzRef ? false : true ;
						o.vmode			= bSwapVertRef ? false : true ;

						o.root = oRoot && oRoot != null ? oRoot : o ;

						if (o.hmode  && isNaN(parseInt(o.root.style.left  ))) o.root.style.left   = "0px";
						if (o.vmode  && isNaN(parseInt(o.root.style.top   ))) o.root.style.top    = "0px";
						if (!o.hmode && isNaN(parseInt(o.root.style.right ))) o.root.style.right  = "0px";
						if (!o.vmode && isNaN(parseInt(o.root.style.bottom))) o.root.style.bottom = "0px";

						o.minX	= typeof minX != 'undefined' ? minX : null;
						o.minY	= typeof minY != 'undefined' ? minY : null;
						o.maxX	= typeof maxX != 'undefined' ? maxX : null;
						o.maxY	= typeof maxY != 'undefined' ? maxY : null;

						o.xMapper = fXMapper ? fXMapper : null;
						o.yMapper = fYMapper ? fYMapper : null;

						o.root.onDragStart	= new Function();
						o.root.onDragEnd	= new Function();
						o.root.onDrag		= new Function();
					},

					start : function(e)
					{
						var o = Drag.obj = this;
						e = Drag.fixE(e);
						var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
						var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
						o.root.onDragStart(x, y);

						o.lastMouseX	= e.clientX;
						o.lastMouseY	= e.clientY;

						if (o.hmode) {
							if (o.minX != null)	o.minMouseX	= e.clientX - x + o.minX;
							if (o.maxX != null)	o.maxMouseX	= o.minMouseX + o.maxX - o.minX;
						} else {
							if (o.minX != null) o.maxMouseX = -o.minX + e.clientX + x;
							if (o.maxX != null) o.minMouseX = -o.maxX + e.clientX + x;
						}

						if (o.vmode) {
							if (o.minY != null)	o.minMouseY	= e.clientY - y + o.minY;
							if (o.maxY != null)	o.maxMouseY	= o.minMouseY + o.maxY - o.minY;
						} else {
							if (o.minY != null) o.maxMouseY = -o.minY + e.clientY + y;
							if (o.maxY != null) o.minMouseY = -o.maxY + e.clientY + y;
						}

						document.onmousemove	= Drag.drag;
						document.onmouseup		= Drag.end;

						return false;
					},

					drag : function(e)
					{
						e = Drag.fixE(e);
						var o = Drag.obj;

						var ey	= e.clientY;
						var ex	= e.clientX;
						var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
						var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
						var nx, ny;

						if (o.minX != null) ex = o.hmode ? Math.max(ex, o.minMouseX) : Math.min(ex, o.maxMouseX);
						if (o.maxX != null) ex = o.hmode ? Math.min(ex, o.maxMouseX) : Math.max(ex, o.minMouseX);
						if (o.minY != null) ey = o.vmode ? Math.max(ey, o.minMouseY) : Math.min(ey, o.maxMouseY);
						if (o.maxY != null) ey = o.vmode ? Math.min(ey, o.maxMouseY) : Math.max(ey, o.minMouseY);

						nx = x + ((ex - o.lastMouseX) * (o.hmode ? 1 : -1));
						ny = y + ((ey - o.lastMouseY) * (o.vmode ? 1 : -1));

						if (o.xMapper)		nx = o.xMapper(y)
						else if (o.yMapper)	ny = o.yMapper(x)

						Drag.obj.root.style[o.hmode ? "left" : "right"] = nx + "px";
						Drag.obj.root.style[o.vmode ? "top" : "bottom"] = ny + "px";
						Drag.obj.lastMouseX	= ex;
						Drag.obj.lastMouseY	= ey;

						Drag.obj.root.onDrag(nx, ny);
						return false;
					},

					end : function()
					{
						document.onmousemove = null;
						document.onmouseup   = null;
						Drag.obj.root.onDragEnd(	parseInt(Drag.obj.root.style[Drag.obj.hmode ? "left" : "right"]), 
													parseInt(Drag.obj.root.style[Drag.obj.vmode ? "top" : "bottom"]));
						Drag.obj = null;
					},

					fixE : function(e)
					{
						if (typeof e == 'undefined') e = window.event;
						if (typeof e.layerX == 'undefined') e.layerX = e.offsetX;
						if (typeof e.layerY == 'undefined') e.layerY = e.offsetY;
						return e;
					}
				};
			
			
			
			    Colors = {};
			    Colors.names = {
			    		blacktag: "#4A8B87",
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

<style>

	body
	{
        margin: 0px;
        padding: 0px;
    }

	.ui-autocomplete {
	    z-index: 100 !important;
	}
	
	#content_page
	{
		height:auto;
		margin:auto;
		display:inline-block;
	}
	
	a{
		color : grey;
		text-decoration : none;	
	}
	a:hover{
		color : #C5252B;
		text-decoration : none;
	}
	
	a:visited{
		color : #COCOCO;
		text-decoration : none;
	}
	#graphesearch{
	    position:absolute;
	    border-radius: 20px;
	    border:2px solid #C0C0C0;
		padding : 10px;
		display:block;
		top:106px;
		right:4px;
	}
	
	#graphics{
	 	position: relative;
	 	width:100%;
		height:450px; 
	} 
	
	#caption{
		background-color: #4A8B87;
		-webkit-border-radius: 20px 20px 0 0;
		-moz-border-radius: 20px 20px 0 0;
		border-radius: 20px 20px 0 0;
		color: #fff;
		font-size: 15px;
		padding: 15px 15px;
		width : 75%;
	}
	
	#list_resultats{
		overflow-y :scroll;  
		overflow-x :hidden; 
		position : relative;
		width : 78%;
		height:540px;
	}
	
	
	#butJump {
	    border-radius: 8px;
	    width: 500px;
	    height:40px;
	    font-size : bold;
	   	top: -10;
	    color: white; 
	    background-color: #4A8B87; 
	}

   
	#handle {
		margin:2px;
		padding:2px;
		width: 98%;
		color:white;
		background-color: navy;
		font-weight: bold;
		 z-index:0;
	}
		
	table{
		width : 100%;
	}
	table td{
		padding : 10px;
		width : 33%
	}
	
	
	#tag_name{
		width : 100%;
		color : #C0C0C0;
		text-decoration: none;
		border:2px solid #C0C0C0;
		border-radius:5px;
		box-shadow:2px 2px 3px #eee inset;
	}
	
	.mCanvas1{
		width:100%; 
		height:100% ;
		display:none;
		 z-index: 1;
      }
   
   .mCanvas2{
       position: absolute;
	   width:100%; 
	   height:100% ;
	   top:0px;
	   left:0px;
	   z-index: 0;
	}
	.mCanvas3{
	    position: absolute;
		width:100%; 
		height:100% ;
		top:0px;
		left:0px;
	    z-index: 1;
	}
		.mCanvas4{
		position: absolute;
		width:100%; 
		height:100% ;
		top:0px;
		left:0px;
	    z-index: 2;
	}
	
		.mCanvas5{
		 position: absolute; 
		 width:100%; 
		 height:100% ;
         top:0px;
		 left:0px;
	     z-index: 4;
	}
	
	.mCanvas6{
	    position: absolute;
		width:100%; 
		height:100%;
		top:0px;
		left:0px;
	    z-index: 3;
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
			<div id="caption">Resultats</div>
			<div id ="list_resultats">	
		
			</div>	
			<div id="graphesearch">
			<!--  <div id="handle">Handle</div>-->
				<div>
						<input type="text" placeholder="add tags" id="tag_name" style="z-index:0;">
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
				
				</div>
				<div id="graphics" >
					  <canvas id="tempCanvas" class="mCanvas1" ></canvas>
					  <canvas id="layer2" class="mCanvas2" ></canvas>
					  <canvas id="layer3" class="mCanvas3" ></canvas>
					  <canvas id="layer1" class="mCanvas4" ></canvas>
					  <div id="container" class="mCanvas5"></div>
					  <canvas id="trush" class="mCanvas6" ></canvas>
			   </div>
				 <div> 
				    <input  type="button" name ="Jump" onclick="searchTag()" id="butJump">
				</div> 
			</div>
	</div> 


<script type="text/javascript">
var theHandle = document.getElementById("handle");
var theRoot = document.getElementById("graphesearch");
Drag.init(theHandle, theRoot);
</script>
	
	
</section>
	  
     <script  type="text/javascript" src="http://d3lp1msu2r81bx.cloudfront.net/kjs/js/lib/kinetic-v5.0.2.min.js"></script>
   	 <script  type="text/javascript" defer="defer">

   					var selectedpiece= [];
   					var ovals = [];
					var trush_ratio=90/100;
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
						  var graphics=document.getElementById('graphics'); 
   					      var canvas = document.getElementById('layer1');
   					      var context = canvas.getContext('2d');
   					      var canvas2 = document.getElementById('layer2');
   					      var context2 = canvas2.getContext('2d');
   					      var canvas3 = document.getElementById('layer3');
   					      var context3 = canvas3.getContext('2d');
   					      var canvas4 = document.getElementById('trush');
   					      var context4 = canvas4.getContext('2d');
   					      canvas.width=graphics.offsetWidth;
				          canvas.height=graphics.offsetHeight; 
				          canvas2.width=graphics.offsetWidth;
					      canvas2.height=graphics.offsetHeight; 
					      canvas3.width=graphics.offsetWidth;
					      canvas3.height=graphics.offsetHeight; 
					      canvas4.width=graphics.offsetWidth;
					      canvas4.height=graphics.offsetHeight; 
					      document.getElementById('tempCanvas').width=graphics.offsetWidth;
					      document.getElementById('tempCanvas').height=graphics.offsetHeight;
   						  var stage = new Kinetic.Stage({
   						      container: 'container',
   						      width: document.getElementById('graphics').offsetWidth,
   						      height: document.getElementById('graphics').offsetHeight
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
   								if(piece.length==ovals.length){
   									for(var i in piece){
   										ovals[i].mouseon=piece[i];
   									}
   									drawpiece(ovals,canvas,'#C5252B');
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
   								   searchTag(); 
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
   							  color = typeof color !== 'undefined' ? color : '#C5252B';
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
   						   color = typeof color !== 'undefined' ? color : '#C5252B';
   						      
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
   						  	if(text.x()+group.x()>width*trush_ratio && text.y()+group.y()>height*trush_ratio){
   						  		group.remove(); 
   						  		deleteovalbytag(ovals,selectedpiece,text.getAttr("text"));
   						  		drawovals(ovals, document.getElementById('layer1'));
   								drawallpieces(selectedpiece,ovals,canvas3);
   								//writeMessagedyn(allpiecestostring(ovals,selectedpiece));
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
   								//writeMessagedyn(allpiecestostring(ovals,selectedpiece));
   								
   								});
   								
   						  stage.add(layer);
   							
   						  layer.on('mousemove', function(){
   							var mousePos = stage.getPointerPosition();
   					        var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y+','+canvas4.width+','+canvas4.height+','+canvas4.style.width+','+canvas4.style.heigth;
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
   					img.onload = function() { context4.drawImage(img,canvas4.width*trush_ratio, canvas4.height*trush_ratio,canvas4.width*(1-trush_ratio),canvas4.height*(1-trush_ratio));};
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
									var test = result.replace(/(\r\n|\n|\r)/gm,"");
									if(test!="!!!"){
										var listSites = result.split('\n');
										textResult = "";
										textResult += "<table>";
										var i = 0;
										//textResult +="<caption>Resultat</caption>";
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
									}else{
										textResult = "";
										textResult += "<table>";
										textResult +="<p>Pas de resultat</p>";
										textResult += "</table>";
									}
								
									document.getElementById('list_resultats').innerHTML = textResult;
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
									/*var span=document.createElement('p');
									span.draggable="true";
									span.ondragstart="drag(event)";
									var newlinktext=document.createTextNode("#"+element.value);
									span.appendChild(newlinktext);
									var tag_names= document.getElementById("tag_names");
									tag_names.appendChild(span);*/	
											
									var ovalnew=new Tagoval("#"+element.value,0.5,0.5,2*Math.PI*Math.random(),0.2,0.5,Colors.random().rgb);
									addoval(ovals,selectedpiece,ovalnew);
									drawdynoval(ovalnew,layer,stage,stage.width(),stage.height());
									drawovals(ovals, document.getElementById('layer1'));
									drawallpieces(selectedpiece,ovals,canvas3);
									//writeMessagedyn(allpiecestostring(ovals,selectedpiece));

									layer.draw();
									element.value="";
								}
							}
						},false);

					</script>
