
var selectedpiece= [];
var ovals = [];

 var canvas = document.getElementById('layer1');
      var context = canvas.getContext('2d');
      var canvas2 = document.getElementById('layer2');
      var context2 = canvas2.getContext('2d');
      var canvas3 = document.getElementById('layer3');
      var context3 = canvas3.getContext('2d');
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
        fontSize: 24,
        text: '',
        fill: 'black'
      });
      layer.add(text);




function Tagoval(tag,x_por,y_por,rot,rw_por,hw_ratio) {
  this.selected=false;
  this.mouseon=false;
  this.tag=tag;
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
	          context.lineWidth = 5;
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
        fill: 'black',
      });
	  
	  text.draggable(true);
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
	      stroke: 'blue',
	      strokeWidth: 4,


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
		writeMessagedyn(this.x()+' '+this.y());
		
      });
	  
	  group.add(text);
	  group.add(ovalshape);
	  layer.add(group);
	}
	
	function drawalldynoval(ovals,layer,stage){
		for(i in ovals){
			drawdynoval(ovals[i],layer,stage,stage.width(),stage.height());
			
		}
	}
	  
	  
	  
     
	  /*            
	   * create a triangle shape by defining a
	   * drawing function which draws a triangle
	   */
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
			
			
	
			});
			
	  stage.add(layer);
		
	  layer.on('mousemove', function(){
		var mousePos = stage.getPointerPosition();
        var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y;
		writeMessagedyn(message);
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
      
ovals.push(new Tagoval("#Force",0.5,0.5,Math.PI/3,0.2,1));
ovals.push(new Tagoval("#Beauty",0.5,0.5,Math.PI*2/3,0.2,1));
ovals.push(new Tagoval("#Time",0.5,0.5,Math.PI*2/3,0.2,1));
ovals.push(new Tagoval("#Intelligence",0.5,0.5,Math.PI/3,0.2,1));
drawalldynoval(ovals,layer,stage);
drawovals(ovals, document.getElementById('layer1'));