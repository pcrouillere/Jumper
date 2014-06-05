function ThumbnailInfoTitle (pParent,pText){
	JsHtmlObject.call(this, pParent, "div",null);
	this.cOriginalUrl = pText;
	this.cText = this.parseTitle(pText);
	this.cTitle;
	
	this.addClass("ThumbnailInfoTitle");
	this.addClass("container-fluid");
	
	this.addText(this.cText);
};
ThumbnailInfoTitle.prototype = new JsHtmlObject();
ThumbnailInfoTitle.prototype.constructor = ThumbnailInfoTitle;

ThumbnailInfoTitle.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfoTitle.prototype.addText = function(pText) {
	title = document.createElement('h4');
	link = document.createElement('a');
	link.innerHTML = pText;
	link.href = this.cOriginalUrl;
	link.target = "_blank";
	title.appendChild(link);
	this.getHtmlObject().appendChild(title);
};

ThumbnailInfoTitle.prototype.parseTitle = function(url) {
	return parseUri(url).host;
};

