# 易考通写死projectid

### login.js
```plain
var YsAccount="";
var YsPwd="";
var cookieName = "LoginName";
var cookiePwd = "pwd";
var cookieCookie = "cbCookie";
$(function () {
autoLogin();
    var LoginName = $.cookie(cookieName);
    var pwd = $.cookie(cookiePwd);
    var cbCookie = $.cookie(cookieCookie);
    $("#username").val(LoginName);
    $("#password").data("pwd", "");
    if (pwd != null && pwd != "null") {
        $("#password").data("pwd", pwd);
        $("#password").val("******");
    }
    if (cbCookie != false && cbCookie != "false") {
        $(".getYZM").attr("checked", true);
    }


    $("#password").change(function () {
        $(this).data("pwd", $(this).val());
    });
});
///游客登录
function Logon_youke() {
    $.ajax({
        Type: "post",
        dataType: "text",
        url: '/Login/AjaxLogin_youke',
        data: {},
        success: function (data) {
            if (data == "1") {
                location.href = "/HB_Competition";
            }
            else if (data == "88") {
                layer.msg('请一分钟后再试');
            } else if (data == "888") {
                layer.msg('每天只允许200次试用登录');
            } else {
                layer.msg('请稍后再试');
            }
        }
    })
}
function autoLogin() {
   if (getUrl('stype')=='1')
	{
		YsAccount=getUrl("YsAccount");
		YsPwd=getUrl("YsPwd");
		Logon();
	}

}

function getkeystr(str) {
    var b = ["___", "__$", "_$_", "_$$", "$__", "$_$", "$$_", "$$$", "$___", "$__$", "$_$_", "$_$$", "$$__", "$$_$", "$$$_", "_$$$$$_", "_$$$$$$_", "_$$$$$$$_", "_$$$$$$$$_", "_$$$$$$$$$_"];
    var key = $("#key").val();
    var key1 = parseInt(key.substr(key.substr(3, 1), 1));
    var enstr = "";
    var end = 9;
    if (end > str.length) {
        end = str.length;
    }
    for (var i = 0; i < end; i++) {
        enstr = enstr + b[key1 + i] + str.substr(i, 1);
    }
    return enstr;
   
}

function getUrl(name="") {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0; i < strs.length; i ++) {
            theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
        }
    }
   if(name == ""){
      return theRequest;
   }
   else{
      return theRequest[name]?uncompileStr(theRequest[name]):'';
   }
}

//字符串进行解密
function uncompileStr(code) {
    code = unescape(code);
    var c = String.fromCharCode(code.charCodeAt(0) - code.length);
    for (var i = 1; i < code.length; i++) {
        c += String.fromCharCode(code.charCodeAt(i) - c.charCodeAt(i - 1));
    }
    return c;
}
function Logon(type) {
	 var LoginName="";
    var UserPwd="";
    
     if(YsAccount!=""&&YsPwd!="")
	{
		 LoginName = YsAccount;
         UserPwd = YsPwd;
	}
	else
	{
         LoginName = $.trim($("#username").val());
         UserPwd = $("#password").data("pwd");
	}
	var oldLoginName=LoginName;
	var oldUserPwd=UserPwd;
    //var LoginName = $.trim($("#username").val());
    if (LoginName == "") {
        layer.msg("用户名不能为空");
        $("#username").focus();
        return;
    }

 UserPwd = getkeystr(UserPwd);
    LoginName = getkeystr(LoginName);
	
    //var UserPwd = $.trim($("#password").val());
    //var UserPwd = $("#password").data("pwd");
    if (UserPwd == "") {
        layer.msg("密码不能为空");
        $("#password").focus();
        return;
    }

    var isSaveCookie;
    var cookies = $("input[type='checkbox']").is(':checked');

    if (cookies == false) {
        isSaveCookie = 0;
    }
    else {
        isSaveCookie = 1;
    }
    var myDate = new Date();
    var times = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate();
    // ========== 核心修改1：将ProjectIdAll固定为6 ==========
    var fixedProjectId = 6; 
    $.ajax({
        Type: "post",
        url: '/Login/AjaxLogin',
        dataType: "text", cache: false,
        contentType: "application/json; charset=utf-8",
        // 替换$("#ProjectIdAll").val()为固定值6
        data: { 'LoginName': LoginName, 'UserPwd': UserPwd, 'isSaveCookie': encodeURIComponent(isSaveCookie), 'ProjectIdAll': fixedProjectId,'datenow':encodeURIComponent(times)  },
        success: function (data) {
            var obj = data.split('#');
            $.cookie(cookieName, oldLoginName, { expires: 7 });
            $.cookie(cookieCookie, cookies, { expires: 7 });
            if (cookies) {
                $.cookie(cookiePwd, oldUserPwd, { expires: 7 });
            } else {
                $.cookie(cookiePwd, null);
            }
            if (obj[0] == "1") {//管理员
                location.href = "/Admin/SystemPermissions";
            } else if (obj[0] == "2") {//讲师
                location.href = "/Admin/T_StudentManage";
            } else if (obj[0] == "3") {//学员  
                if (obj.length > 1) {
                    if (obj[1].indexOf("1") >= 0) {
                        //1 是易考通
                        if ($("#ISQUKL").val() == "1") {
                            if (obj[2] == "1") {
                                location.href = "/HB_Competition";
                            } else {
                                location.href = "/Student"; //修改用户信息
                            }
                        } else {
                            //2是区块链
                            location.href = "/QKLHome";
                        }
                        return;
                    }
                    if (obj[1].indexOf("2") >= 0) {
                        location.href = "/SG_Competition";
                        return;
                    }
                    if (obj[1].indexOf("3") >= 0) {
                        location.href = "/FH_Management";
                        return;
                    }
                    if (obj[1].indexOf("4") >= 0) {
                        location.href = "/Bill_Competition/GrowthProcess";
                        return;
                    }
                }

            } else if (obj[0] == "4") {//裁判
                //location.href = "/Judge";//之前的老地址
                location.href = "/RefereeList";

            } 
			  else if (obj[0] == "-90") {
                layer.msg("输入非法，请联系管理员！", function () { });
            }
			else if (obj[0] == "5") {//移动端评委
                layer.msg("评委账号只能在移动端登录！");
                return;
            } else if (obj[0] == "8") {//超级管理员
                location.href = "/Admin/ProjectManagement/Index";
            } else if (obj[0] == "-3") {
                layer.msg("账号已被锁定或冻结！");
                return;
            } else if (obj[0] == "-9") {
                layer.msg("系统初始化错误，请联系供应商！", function () { });
                return;
            } else if (obj[0] == "-999") {
                layer.msg('系统已过期，请联系供应商！', function () { });
                return;
            } else if (obj[0] == "-88") {
                layer.msg('使用时间到期，请联系供应商！', function () { });
                return;
            } else {
               // $("#password").val("");
                //$("#password").focus();
                //layer.msg("账号或密码错误！");
if(LoginName.length==5 && LoginName!='admin'){
                LoginName= 'S001' + LoginName.substr(1,4)
             }
  $.ajax({
        Type: "post",
        url: '/Login/AjaxLogin',
        dataType: "text", cache: false,
        contentType: "application/json; charset=utf-8",
        // ========== 核心修改2：二次请求也固定ProjectId为6 ==========
        data: { 'LoginName': encodeURIComponent(LoginName), 'UserPwd': UserPwd, 'isSaveCookie': encodeURIComponent(isSaveCookie), 'ProjectIdAll': fixedProjectId,'datenow':encodeURIComponent(times)  },
        success: function (data) {
            var obj = data.split('#');
            $.cookie(cookieName, LoginName, { expires: 7 });
            $.cookie(cookieCookie, cookies, { expires: 7 });
            if (cookies) {
                $.cookie(cookiePwd, UserPwd, { expires: 7 });
            } else {
                $.cookie(cookiePwd, null);
            }
            if (obj[0] == "1") {//管理员
                location.href = "/Admin/SystemPermissions";
            } else if (obj[0] == "2") {//讲师
                location.href = "/Admin/T_StudentManage";
            } else if (obj[0] == "3") {//学员  
                if (obj.length > 1) {
                    if (obj[1].indexOf("1") >= 0) {
                        //1 是易考通
                        if ($("#ISQUKL").val() == "1") {
                            if (obj[2] == "1") {
                                location.href = "/HB_Competition";
                            } else {
                                location.href = "/Student"; //修改用户信息
                            }
                        } else {
                            //2是区块链
                            location.href = "/QKLHome";
                        }
                        return;
                    }
                    if (obj[1].indexOf("2") >= 0) {
                        location.href = "/SG_Competition";
                        return;
                    }
                    if (obj[1].indexOf("3") >= 0) {
                        location.href = "/FH_Management";
                        return;
                    }
                    if (obj[1].indexOf("4") >= 0) {
                        location.href = "/Bill_Competition/GrowthProcess";
                        return;
                    }
                }

            } else if (obj[0] == "4") {//裁判
                //location.href = "/Judge";//之前的老地址
                location.href = "/RefereeList";

            } else if (obj[0] == "5") {//移动端评委
                layer.msg("评委账号只能在移动端登录！");
                return;
            } else if (obj[0] == "8") {//超级管理员
                location.href = "/Admin/ProjectManagement/Index";
            } else if (obj[0] == "-3") {
                layer.msg("账号已被锁定或冻结！");
                return;
            } else if (obj[0] == "-9") {
                layer.msg("系统初始化错误，请联系供应商！", function () { });
                return;
            } else if (obj[0] == "-999") {
                layer.msg('系统已过期，请联系供应商！', function () { });
                return;
            } else if (obj[0] == "-88") {
                layer.msg('使用时间到期，请联系供应商！', function () { });
                return;
            } else {
                $("#password").val("");
                $("#password").focus();
                layer.msg("账号或密码错误！");
            }

        }

    });
            }

        }

    });
}

document.onkeydown = function () {
    if (event.keyCode == 13) {
        if ($("#password").val() != "******") {
            $("#password").data("pwd", $("#password").val());
        }
        Logon('1');
    }
};

function GetCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) {
        return unescape(arr[2]);
    }
    return null;
}
```



> 更新: 2025-12-31 11:09:37  
> 原文: <https://www.yuque.com/lixinsi/hntyk2/qxkxy4gpv7ttxuyk>