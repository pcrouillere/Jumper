

var jsList = new Array(
	"JsHtmlObject.js",
	"tools.js",
	"init.js",
	"constants.js",
	"Sender.js",
	"Bar.js",
	"Thumbnail.js",
	"ThumbnailContainer.js",
	"ThumbnailImage.js",
	"ThumbnailInfo.js",
	"ThumbnailInfoTitle.js",
	"ThumbnailInfoTagContainer.js",
	"Arrow.js");

var libs=["less.js","parseUri.js"];
		
for (var i = 0, len = libs.length; i < len; i++) {
	document.write("<script type='text/javascript' src='./lib/" + libs[i] + "'></script>");
}

for (var i = 0, len = jsList.length; i < len; i++) {
	document.write("<script type='text/javascript' src='js/" + jsList[i] + "'></script>");
}