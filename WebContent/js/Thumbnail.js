function Thumbnail (pParent,pThumbNb,pParameters){
	JsHtmlObject.call(this, pParent, "div", "thumb"+pThumbNb);
	
	this.getHtmlObject().style.width = (100/MAX_DISPLAYED_THUMBNAILS)+"%";
	
	this.cThumbId = pThumbNb;
	this.cListeTags = new Array();	
	this.cUrl;
	this.cImage;
	this.cInfo;
	this.cButton;
	this.cParameters = this.parseParameters(pParameters);
	this.addClass("Thumbnail");
	this.addClass("container-fluid");
	
	this.addImage();
	this.addInfo();
	this.addButton();
	this.getHtmlObject().ondrop = function(e) {
		drop(e);
	};
	this.getHtmlObject().ondragover = function(e) {
		allowDrop(e);
	};

	var att = document.createAttribute("url");
	this.getHtmlObject().setAttributeNode(att);
	this.getHtmlObject().url = this.cUrl;
};
Thumbnail.prototype = new JsHtmlObject();
Thumbnail.prototype.constructor = Thumbnail;

Thumbnail.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Thumbnail.prototype.addImage = function() {
	this.cImage = new ThumbnailImage(this,this.cUrl);
	this.getHtmlObject().appendChild(this.cImage.getHtmlObject());
};

Thumbnail.prototype.addInfo = function() {
	this.cInfo = new ThumbnailInfo(this,this.cUrl,this.cListeTags);
	this.getHtmlObject().appendChild(this.cInfo.getHtmlObject());
};

Thumbnail.prototype.addButton = function() {
	this.cButton = new ThumbnailButton(this);
	this.getHtmlObject().appendChild(this.cButton.getHtmlObject());
};

Thumbnail.prototype.parseParameters = function(pParam) {
	var param = JSON.parse(pParam).parameters;
	this.cUrl = param[0][this.cThumbId][0].url;
	/*var tags = param[0][this.cThumbId][1].tags;
	for(i=0,len=tags.length;i<len;i++){
		this.cListeTags.push(tags[i][i]);
	}*/
};