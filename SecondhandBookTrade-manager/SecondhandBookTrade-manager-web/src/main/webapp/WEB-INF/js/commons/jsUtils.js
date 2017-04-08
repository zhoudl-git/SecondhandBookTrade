/** 返回一个去掉首尾空格的数字 */
trimNumber=function (numStr){
	numStr = trimString(numStr);
	if(numStr==""){return 0;}
	else if(isNaN(parseFloat(numStr))){return 0;}
	else{return parseFloat(numStr);}
};
/** 返回一个去掉首尾空格的字符串 */
trimString=function (str){
	return (str==undefined || str==null) ? "" : (""+str).trim();
};