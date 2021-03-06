<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/all.css" rel="stylesheet" type="text/css" />
<link href="/css/faq.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/js/jquery/jquery-1.10.1.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
<script type="text/javascript" src="/js/base/operation/shop/shop.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/pagination/jquery.pagination.js"></script>
<link type="text/css" rel="stylesheet" href="/js/testJSP/js/validate/css/validate.css" /> 
<script src="/js/testJSP/js/validate/talent-validate-all.js" language="javascript"></script>
<link type="text/css" rel="stylesheet" href="/js/testJSP/js/validate/css/validate.css" /> 
<script type="text/javascript" src="/js/sys_util.js"></script>
<script type="text/javascript" src="js/_head.js"></script>
<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
</script>
<title>淘竹马解除第三方绑定</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="register-title">
	<div class="register-txt">淘竹马<span class="register-txt02">解除第三方绑定</span></div>
</div>

<div class="retrieve-form" style="height: 500px;">
	<div class="retrieve-form-title"><img src="images/retrieve_03.jpg" alt="" width="17" height="17" />请输入您的手机，方便我们开始为您进行服务：</div>
	<form action="doRerandTaobao.do" method="post" id="from1">
	<table border="0" cellpadding="0" cellspacing="0" class="retrieve-form-table">
	<br>
    	<tr>
        	<td class="register-form-tableTxt">登录号码</td>
            <td><input id="loginname" name="sysloginPojo.loginname" type="text" class="retrieve-form-tableInput" style="float:left"/><span id="loginname_Msg"></span></td>
        </tr>
        <tr>
        	<td class="register-form-tableTxt" >验证码</td>
            <td><input id="verifyCode" name="verifyCode" type="text" class="retrieve-form-tableInput02" style="float:left"/>&nbsp&nbsp<input
						id="JS-vcodebtn" type="button" value="获取验证码"
						class="register-form-tableButton" onclick="sendverify();"/><span id="JS-vcodelabel" style="display:none;" class="send-info"><em class="red">59</em>秒后 重新发送</span><span id="authcode"></span></td>
            <td class="retrieve-form-change">请输入收到的验证码</td>
        </tr>
      
    </table>
     </form>
     <br>
     <br>
     <br>
     <br>
     <div class="rebrand-taobao-register_button" id="sbutton_taobao" >解除淘宝账号绑定</div>
     <div class="rebrand-qq-register_button" id="sbutton_qq">解除QQ账号绑定</div>
</div>


<div class="clear"></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script>
var loginname =new tt.Field(" 登录名  ","sysloginPojo.loginname").setMsgId("loginname_Msg");
var authcode =new tt.Field(" 验证码   ","verifyCode").setMsgId("authcode");

tt.vf.req.add(loginname,authcode);
	$(document).ready(function() {
		$("#sbutton_taobao").click(function(){		
			if(tt.validate()){
				document.getElementById("from1").submit();
			}
		});
		$("#sbutton_qq").click(function(){		
			if(tt.validate()){
				var l=document.getElementById("loginname").value;
				var v=document.getElementById("verifyCode").value;
				window.location.href = "doRebrandQQ.do?sysloginPojo.loginname="+l+"&verifyCode="+v
			}
		});
	});
	

</script>
<script type="text/javascript">
		function sendverify(){
			var vcode = $('#loginname').val();
			if(vcode == ""){
				alert("登录名不能为空！");
			}else{
			checkLoginname();
			}
		}
		var vcode_leftTime = 60;
		var vcode_timer = null;
		function vcode_startRycleVbtn() {
			if (vcode_leftTime > 1) {
				vcode_leftTime--;
				$("#JS-vcodelabel").html('<em class="red">' + vcode_leftTime + '</em>秒后 重新发送');
				$("#JS-vcodelabel").show();
				$("#JS-vcodebtn").hide();
				vcode_timer = setTimeout(vcode_startRycleVbtn, 1000);
			} else {
				if (vcode_timer) clearTimeout(vcode_timer);
					vcode_leftTime = 60;
					$("#JS-vcodelabel").hide();
					$("#JS-vcodebtn").show();
			}
		}
		
		function checkLoginname() {
		var loginname = $("#loginname").val();
		
		if (loginname!=null&&loginname!="") {
		
			MAOWU.ajax.post("checkLoginname.do", {
				"sysloginPojo.loginname" : loginname
			}, callback);
		}
		
	}
	function callback(value) {
		if (value == 1) {
			vcode_startRycleVbtn();
			var vcode = $('#loginname').val();
			$.ajax({
				url:'sendVerify.do?userVerifyPojo.loginname='+vcode,
				type:'post',
				dataType:'json',
				error: function(XMLHttpRequest, textStatus, errorThrown){
				alert("发送验证码失败");
		    	},
		    	success: function(result){
	 		   		if(result == 1){
		    			alert("发送验证码成功");
		  	  		}
		    	}
			});
		}else{
			alert("该号码尚未注册！");
		}
	}
	</script>