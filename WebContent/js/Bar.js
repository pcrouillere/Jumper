function Bar (pParameters) {
	JsHtmlObject.call(this, null, "div", null);
	this.addClass("RecommandationBar");
	this.addClass("container-fluid");
	
	document.getElementById("barWrapper").appendChild(this.getHtmlObject());
	
	this.cParameters = pParameters;
	this.cThumbnailContainer;
	this.addContainer();
	this.addArrow(LEFT);this.addArrow(RIGHT);
	
	var t = this;
	Hammer(this.getHtmlObject(),{swipe_velocity: 0.3}).on("swiperight", function(e) {
		t.move(LEFT);
	});
	Hammer(this.getHtmlObject(),{swipe_velocity: 0.3}).on("swipeleft", function(e) {
		t.move(RIGHT);
	});
};
Bar.prototype = new JsHtmlObject();
Bar.prototype.constructor = Bar;

Bar.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Bar.prototype.addContainer = function(pClassName) {
	this.cThumbnailContainer = new ThumbnailContainer(this,this.cParameters);
};

Bar.prototype.addArrow = function(pSens) {
	var arrow = new Arrow(this,pSens);
	if(pSens=="Right"){
		$(this.getHtmlObject()).append(arrow.getHtmlObject());
	} else {
		$(this.getHtmlObject()).prepend(arrow.getHtmlObject());
	}
};

Bar.prototype.move = function(pSens) {
	this.cThumbnailContainer.move(pSens);
};

