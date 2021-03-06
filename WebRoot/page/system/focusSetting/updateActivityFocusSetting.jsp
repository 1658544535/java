<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/top.jsp"></jsp:include>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="sub_wrap">
		<div class="s_nav">
			<a href="#">图片综合管理</a> &gt; <a href="#">活动顶部图片</a> &gt; <a href="#">编辑</a>
		</div>
		<div class="h15"></div>
		<div>
			<form action="updateFocusSetting.do?os=1" method="post" id="from1" enctype="multipart/form-data">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="info_table"> 
					<input type="hidden" name="focusSettingPojo.id" id="focusSettingPojo.id" value="${focusSettingPojo.id}" class="inputText" />
				<tr>
					<td align="right" class="grey" width="15%">开始显示时间：</td>
					<td><input name="focusSettingPojo.startTime" class="Wdate" type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:00', isShowToday: false, isShowClear: true })" value="${focusSettingPojo.startTimeStr}"/></td>
					<td><span id="startTime_mgId"></span></td>
				</tr>
				<tr>
				<td align="right" class="grey" width="15%">类型：</td>
					<td> <select name="activityFocusType" id="activityFocusType">
									<option value="2" <s:if test="focusSettingPojo.type==2">selected="selected"</s:if>>猜价格</option>
									<option value="3" <s:if test="focusSettingPojo.type==3">selected="selected"</s:if>>0.1抽奖</option>
									<option value="4" <s:if test="focusSettingPojo.type==4">selected="selected"</s:if>>免费抽奖</option>
						 </select><td>
				</tr>	
				<tr>
				    <td align="right" class="grey" width="15%">上传图片:</td>
					<td width="35%">
						<table border="0" cellpadding="0" cellspacing="0">
	                    <tr><td><img  class="floatLeft" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/upfiles/focusbanner/${focusSettingPojo.banner}" height="100px"  /></td></tr>
	                    <tr>
	                    <td><input type="file" name="upfile" class="floatLeft" id="ticketName"></td>
	                    </tr>
	                    </table>
	                    <span style="color:red">(图片格式640*350)</span>
					</td>
					<td><span id="banner_mgId"></span></td>
				</tr>
				</table> 
			</form>
		</div>
		<div class="Btn_div">
			<button type="input" class="back_btn" onclick="window.history.back()">返回</button><input type="button"  class="ok_btn" value="提交" id="sbutton"/>
		</div>
	</div>
</body>
</html>
<script>
	var startTimeStr = new tt.Field(" 开始显示时间 ", "focusSettingPojo.startTime").setMsgId("startTime_mgId");
	tt.vf.req.add(startTimeStr);
	$(document).ready(function() {
		$("#sbutton").click(function(){	
			if(tt.validate()){
				document.getElementById("from1").submit();					
			}
		});
	});	
</script>