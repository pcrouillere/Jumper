// --------------------------------------------------------------
// --------------- ThumbnailInfoTagContainer CLASS ----------------
// --------------------------------------------------------------

function ThumbnailInfoTagContainer (pParent,pListeTags){
	JsHtmlObject.call(this, pParent, "div",null);
	
	this.cListeTags = pListeTags;
	
	this.addClass("ThumbnailTagContainer");
	this.addClass("container-fluid");
	
	this.addAllTags();
	
};
ThumbnailInfoTagContainer.prototype = new JsHtmlObject();
ThumbnailInfoTagContainer.prototype.constructor = ThumbnailInfoTagContainer;

ThumbnailInfoTagContainer.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfoTagContainer.prototype.initTag = function(pTag) {
	//var p = document.createElement("p");
	
	return '<button type="button" class="btn">#'+pTag+'</button>';
};

ThumbnailInfoTagContainer.prototype.addAllTags = function() {
	for(i=0,len = this.cListeTags.length;i<len;i++){
		this.getHtmlObject().innerHTML += this.initTag(this.cListeTags[i])+"  ";
	}
};


