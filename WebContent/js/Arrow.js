function Arrow (pParent,pSens){
	JsHtmlObject.call(this, pParent, "div", "arrow"+pSens);
	var t = this;
	
	this.cSens = pSens;
	
	this.addClass("Arrow");
	this.getHtmlObject().style.height = $(pParent.getHtmlObject()).innerHeight()+"px";
	this.addGlyph();
	
	$(this.getHtmlObject()).on("click",function(){
		t.getParent().move(t.cSens)
	});
};
Arrow.prototype = new JsHtmlObject();
Arrow.prototype.constructor = Arrow;

Arrow.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Arrow.prototype.addGlyph = function() {
	var glyph = document.createElement('span');
	glyph.classList.add("glyphicon");
	if(this.cSens == "Right"){
		glyph.classList.add("glyphicon-chevron-right");
	}else{
		glyph.classList.add("glyphicon-chevron-left");
	}
	//glyph.style.top = $(this.getHtmlObject()).innerHeight()/2-20+"px";
	this.getHtmlObject().appendChild(glyph);
};


