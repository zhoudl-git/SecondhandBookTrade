/**
 * 返回一个去掉首尾空格的数字
 * @param numStr
 * @returns
 */
trimNumber = function (numStr){
	numStr = trimString(numStr);
	if(numStr == ""){
		return 0;
	}else if(isNaN(parseFloat(numStr))){
		return 0;
	}else{
		return parseFloat(numStr);
	}
};
/**
 * 返回一个去掉首尾空格的字符串
 * @param str
 * @returns
 */
trimString = function (str){
	return (str == undefined || str == null) ? "" : (""+str).trim();
};
/**
 * 分到元的转换
 * @param num
 * @returns {Number}
 */
fen2yuan = function (num){
	num = num*0.01;//分到元
	num += '';//转成字符串
	var reg=num.indexOf('.') >-1 ? /(\d{1,3})(?=(?:\d{3})+\.)/g : /(\d{1,3})(?=(?:\d{3})+$)/g;//千分符的正则
	num = num.replace(reg, '$1,');//千分位格式化
	return num;
}
/**
 * LigerUIGrid 所需JSON数据格式转换
 * @param jsonObj 
 * @returns {___anonymous784_785}
 */
ligerUIDataGrid = function(jsonObj){
	var tempJsonObj = {};
	tempJsonObj.Rows = jsonObj.rows;
	tempJsonObj.total = jsonObj.total;
	return tempJsonObj;
}
/**
 * 将json的key值转为大写
 * @param jsonObj
 * @returns
 */
upperJSONKey = function (jsonObj){  
    for (var key in jsonObj){  
        jsonObj["\""+key.toUpperCase()+"\""] = jsonObj[key];  
        delete(jsonObj[key]);  
    }  
    return jsonObj;  
}  
/*时间戳转换成日期格式  重写toLocaleString()方法*/
Date.prototype.toLocaleString = function() {
    return this.getFullYear() + "年" + (this.getMonth() + 1) + "月" + this.getDate() + "日 " + this.getHours() + "点" + this.getMinutes() + "分" + this.getSeconds() + "秒";
};
//===========Cookie操作函数开始=============
function setCookie(name,value) { 
	var Days = 1; 
	var exp = new Date(); 
	exp.setTime(exp.getTime() + 60*60*1000); 
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
} 
//读取COOKIES 
function getCookie(name) { 
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)"); 
	if(arr=document.cookie.match(reg)) return unescape(arr[2]); 
	else return null; 
}
//删除COOKIES 
function delCookie(name) { 
	var exp = new Date(); 
	exp.setTime(exp.getTime() - 1); 
	var cval=getCookie(name); 
	if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
} 
//===========Cookie操作函数结束============