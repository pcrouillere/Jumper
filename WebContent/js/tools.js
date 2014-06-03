/**
 * return true if the value given is null or undefined
 * @function
 * @global
 * @param {Object} pValue a value
 * @return {Boolean} true if value is null or undefined
 */
function IS_NULL(pValue) {
	return (pValue == null || (( typeof pValue) == 'undefined'));
}

/**
 * return false if the value given is null or undefined
 * @function
 * @global
 * @param {Object} pValue a value
 * @return {Boolean} false if value is null or undefined
 */
function IS_NOT_NULL(pValue) {
	return (pValue != null && (( typeof pValue) != 'undefined') );
}
/**
 * return the initial position of the slider
 * @function
 * @global
 * @return {Number}
 */
function getCoordonateXY(element) {
	var rect = element.getBoundingClientRect();
	return { top: rect.top, right: rect.right , bottom: rect.bottom, left: rect.left };
}
/**
 * return the initial position of the slider
 * @function
 * @global
 * @return {Number}
 */
function getSliderStartPosition(pSlider,pAxis) {
	var handleOffset = -$($(pSlider.getHtmlObject()).children()[0]).innerWidth()/2;
	if(pAxis == "x"){
		return getCoordonateXY(pSlider.getHtmlObject()).left + handleOffset;
	} else {
		return getCoordonateXY(pSlider.getHtmlObject()).bottom + handleOffset;
	}
}
/**
 *
 * @function
 * @global
 */
function setCurrentTimeOnVideo(BarRange, BarValue, VideoDuration) {
	return Math.floor((BarValue / BarRange) * VideoDuration*100)/100;
}
/**
 * getLessVars parses your LESS variables to Javascript (provided you make a dummy node in LESS)
 * @param {String} id The CSS-id your variables are listed under.
 * @param {Boolean} [parseNumbers=true] Try to parse units as numbers.
 * @return {Object} A value object containing your LESS variables.
 * @example
 * LESS:
 * 	&#64;myLessVariable: 123px;
 * 	#dummyLessId { width: @myLessVariable; }
 * Javascript:
 * 	GET_LESS_VARIABLES('dummyLessId');
 * returns:
 * 	{myLessVariable:123}
 */
function GET_LESS_VARIABLES(id, parseNumbers) {
	var bNumbers = parseNumbers === undefined ? true : parseNumbers, oLess = {}, rgId = /\#\w+/, rgKey = /\.(\w+)/, rgUnit = /[a-z]+$/, aUnits = 'em,ex,ch,rem,vw,vh,vmin,cm,mm,in,pt,pc,px,deg,grad,rad,turn,s,ms,Hz,kHz,dpi,dpcm,dppx'.split(','), rgValue = /:\s?(.*)\s?;\s?\}/, rgStr = /^'([^']+)'$/, sId = '#' + id, oStyles = document.styleSheets;
	for (var i = 0, l = oStyles.length; i < l; i++) {
		var oRules = oStyles[i].cssRules;
		for (var j = 0, k = oRules.length; j < k; j++) {
			var sRule = oRules[j].cssText, aMatchId = sRule.match(rgId);
			if (aMatchId && aMatchId[0] == sId) {
				var aKey = sRule.match(rgKey), aVal = sRule.match(rgValue);
				if (aKey && aVal) {
					var sKey = aKey[1], oVal = aVal[1], aUnit, aStr;
					if (bNumbers && ( aUnit = oVal.match(rgUnit)) && aUnits.indexOf(aUnit[0]) !== -1) {
						oVal = parseFloat(oVal);
					} else if ( aStr = oVal.match(rgStr)) {
						oVal = aStr[1];
					}
					oLess[sKey] = oVal;
				}
			}
		}
	}
	return oLess;
}

