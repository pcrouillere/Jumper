// --------------------------------------------------------------
// --------------- ThumbnailContainer CLASS ----------------
// --------------------------------------------------------------

function ThumbnailContainer (pParent){
	JsHtmlObject.call(this, null, "div", null);
	
	this.cThumbnails = new Array();
	this.cNbThumbnails = 0;
	this.cCurrentFirstThumbnails = 0;
	
	this.addClass("ThumbnailContainer");
	this.addClass("container-fluid");
	//this.addThumbnail();
};
ThumbnailContainer.prototype = new JsHtmlObject();
ThumbnailContainer.prototype.constructor = ThumbnailContainer;

ThumbnailContainer.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailContainer.prototype.move = function(pSens) {
	if(pSens == RIGHT && this.cCurrentFirstThumbnails > 0) {
		this.removeThumbnail(this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS-1);
		this.appendThumbnail(pSens,this.cCurrentFirstThumbnails-1);
		this.cCurrentFirstThumbnails--;
	} else if(pSens == LEFT && this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS < this.cNbThumbnails){
		this.removeThumbnail(this.cCurrentFirstThumbnails);
		this.appendThumbnail(pSens,this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS);
		this.cCurrentFirstThumbnails++;
	}
};

ThumbnailContainer.prototype.removeThumbnail = function(index) {
	$(this.cThumbnails[index].getHtmlObject()).remove();
};

ThumbnailContainer.prototype.appendThumbnail = function(pSens,index) {
	if(pSens == RIGHT) {
		$(this.getHtmlObject()).prepend(this.cThumbnails[index].getHtmlObject());
	} else {
		$(this.getHtmlObject()).append(this.cThumbnails[index].getHtmlObject());
	}
};

ThumbnailContainer.prototype.addThumbnail = function(param) {
	var thumb = new Thumbnail(this,this.cNbThumbnails,param);
	this.cThumbnails.push(thumb);
	if(this.cNbThumbnails >= MAX_DISPLAYED_THUMBNAILS) {
		this.getHtmlObject().removeChild(thumb.getHtmlObject());
	}
	this.cNbThumbnails++;
};

