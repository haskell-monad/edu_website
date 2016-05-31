//写cookies函数
function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
   var Days = 1; //此 cookie 将被保存 30 天
   var exp  = new Date();    //new Date("December 31, 9998");
   exp.setTime(exp.getTime() + Days*24*60*60*1000);
   document.cookie = name + "="+ encodeURIComponent(value) + ";expires=" + exp.toGMTString();
}
function getCookie(name)//取cookies函数
{
   var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
   if(arr != null) return decode(decodeURIComponent(arr[2])); return null;
}
/*function delCookie(name)//删除cookie
{
   var exp = new Date();
   exp.setTime(exp.getTime() - 1);
   var cval=getCookie(name);
   if(cval!=null) document.cookie= name + "=;expires="+exp.toGMTString();
}*/
function deleteCookie(name) {
	document.cookie = name + "="
			+ ";expires=Thu, 01-Jan-1970 00:00:01 GMT";
	
}
function deleteCookie(name, path) {
	document.cookie = name + "="
			+ ";"+path+"expires=Thu, 01-Jan-1970 00:00:01 GMT";
	
}
function decode(str) {
    return str.replace(/&#(x)?([^&]{1,5});?/g,
    function(a, b, c) {
        return String.fromCharCode(parseInt(c, b ? 16 : 10));
    });
}
