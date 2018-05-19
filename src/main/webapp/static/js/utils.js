
/**
 * @description: 日期格式化
 * @param : 格式类型  例：yyyy-MM-dd
 * @example:
 * var date = new Date().format("yyyy-MM-dd");
 * console.info(date);
 * 控制台输出：2016-05-10
 * @author: zhaxianhe
 * @createtime: 2016年5月10日下午2:28:47
 */
Date.prototype.format = function(fmt){
  var o = {
    "M+" : this.getMonth() + 1,               //月份
    "d+" : this.getDate(),                    //日
    "H+" : this.getHours(),                   //小时
    "m+" : this.getMinutes(),                 //分
    "s+" : this.getSeconds(),                 //秒
    "q+" : Math.floor((this.getMonth()+3)/3), //季度
    "S"  : this.getMilliseconds()             //毫秒
  };
  if(/(y+)/.test(fmt)){
	  fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  }
  for(var k in o){
	  if(new RegExp("(" + k + ")").test(fmt)){
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	  }
  }
  return fmt;
}

isNot = {
    "0":"否",
    "1":"是"
}

/**
 * 用户状态回显
 */
userState={
	"1":"启用",
	"-1":"禁用"
};
baseState={
    "0":"新增",
    "1":"发布",
    "2":"作废"
}
articleType = {
    "0":"技术文章",
    "1":"技术杂谈"
}
/**
 * 格式化日期
 * @param value
 * @param rowData
 * @param rowIndex
 * @returns
 */
function dateFormatter(value, rowData, rowIndex){
	if(value == null || value == "" || value==undefined){
		return "";
	}	
	return new Date(value).format("yyyy-MM-dd HH:mm:ss");
};

/**
 * 是or否 格式化
 * @param value
 * @param rowData
 * @param rowIndex
 * @returns {*}
 */
function isNotFormatter(value, rowData, rowIndex){
    return isNot[value];
}
/**
 * 用户状态格式化
 * @param value
 * @param rowData
 * @param rowIndex
 * @returns
 */
function userStateFormatter(value, rowData, rowIndex){
	return userState[value];
}
/**
 * 基础状态格式化
 * @param value
 * @param rowData
 * @param rowIndex
 * @returns
 */
function baseStateFormatter(value, rowData, rowIndex){
    return baseState[value];
}

/**
 * 文章类型回显
 * @param value
 * @param rowData
 * @param rowIndex
 * @returns {*}
 */
function articleTypeFormatter(value, rowData, rowIndex){
    return articleType[value];
};
