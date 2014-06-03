// --------------------------------------------------------------
// --------------- ThumbnailInfo CLASS ----------------
// --------------------------------------------------------------

function ThumbnailInfo (pParent,pUrl,pListeTags){
	JsHtmlObject.call(this, pParent, "div",null);
	this.cListeTags = pListeTags;
	this.cUrl = pUrl;
	this.cInfoTitle;
	this.cInfoTags;
	
	this.addClass("ThumbnailInfo");
	this.addClass("container-fluid");
	
	this.addTitle(this.cUrl);
	this.addTags();
};
ThumbnailInfo.prototype = new JsHtmlObject();
ThumbnailInfo.prototype.constructor = ThumbnailInfo;

ThumbnailInfo.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfo.prototype.addTitle = function(pTitle) {
	this.cInfoTitle = new ThumbnailInfoTitle(this,pTitle);
	this.getHtmlObject().appendChild(this.cInfoTitle.getHtmlObject());
};

ThumbnailInfo.prototype.addTags = function() {
	this.cInfoTags = new ThumbnailInfoTagContainer(this,this.cListeTags);
	this.getHtmlObject().appendChild(this.cInfoTags.getHtmlObject());
};

ThumbnailInfo.prototype.getTitle = function() {
	return this.cInfoTitle;
};



