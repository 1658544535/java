<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/jquery/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/base/operation/shop/shop.js"></script>
<link type="text/css" rel="stylesheet"
	href="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/css/validate.css" />
<script src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/talent-validate-all.js"
	language="javascript"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/base/operation/shop/shop.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/jquery/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/base/operation/shop/shop.js"></script>
<link type="text/css" rel="stylesheet"
	href="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/css/validate.css" />
<script src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/talent-validate-all.js"
	language="javascript"></script>
<link type="text/css" rel="stylesheet"
	href="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/css/validate.css" />
<jsp:include page="../../common/top.jsp"></jsp:include>
</head>
<body>
	<div class="sub_wrap">
		<div class="s_nav">
		 <a href="#">活动商品管理</a> &gt;<a href="activityTitleManage.do?type=5">web活动页管理</a>&gt;<a>添加活动商品</a></div>
		<div class="h15"></div>
		<div>
			<form action="insertActivityProduct.do?type=${type}&titleId=${titleId}" method="post" id="from1" enctype="multipart/form-data">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="info_table">
				   <!--<input type="hidden" name="activityGoodsPojo.timeId" value="${timeId}" id="activityGoodsPojo.timeId">
				   <input type="hidden" name="activityGoodsPojo.productId" value="${productId}" id="activityGoodsPojo.productId">
				   <input type="hidden" name="activityGoodsPojo.sellPrice" value="${sellPrice}" id="activityGoodsPojo.sellPrice">-->
				     <tr>
	                    <td align="right" class="grey" width="15%">展位类型：</td>
			            <td><select name="activityProductPojo.productType" id="activityProductPojo.productType" class="floatLeft">
							<option value="1">活动单品</option>
							<option value="2">单品连接专场</option>
				    		</select>
				    		<span id="productType_msgId"></span>
				    	</td>
	                 </tr>
	                 <tr>					
						<td align="right" class="grey" width="15%">专场ID：</td>	
						<td width="35%"><input type="text" name="activityProductPojo.specialId" value="${activityProductPojo.specialId}" class="floatLeft" >
						<span id="specialId_msgId"></span>
						</td>				
						<td align="right" class="grey" width="15%">商品ID：</td>	
						<td width="35%"><input type="text" name="activityProductPojo.productId" value="${activityProductPojo.productId}" class="floatLeft" >
						<span id="productId_msgId"></span>
						</td>
				    </tr>
					<tr>
                       <td align="right" class="grey" width="15%">审核状态：</td>
						<td><select name="activityProductPojo.status" id="activityProductPojo.status"  class="floatLeft">
							<s:iterator value="statusSysDictList">
								<option value="<s:property value="value"/>"><s:property value="name" />
								</option>
							</s:iterator>
				    		</select>
				    		<span id="activityNum_msgId"></span>
				    	</td>
				    	<td align="right" class="grey" width="15%">排序：</td>
						<td width="35%"><input type="text" name="activityProductPojo.sorting" value="${activityProductPojo.sorting}" class="floatLeft" >
						<div id="sorting_msgId"></div></td>
					</tr>
					</table>
			</form>
		</div>
		<div class="Btn_div">
			<button type="input" class="back_btn" onclick="window.history.back()">返回</button>
			<input type="button" class="ok_btn" value="提交" id="sbutton" />
		</div>
	</div>
</body>
</html>

<script>
	var specialId = new tt.Field(" 专场ID ", "activityProductPojo.specialId").setMsgId("specialId_msgId");
	var productId  = new tt.Field(" 商品ID ", "activityProductPojo.productId").setMsgId("productId_msgId");
	var sorting	   = new tt.Field("排序","activityProductPojo.sorting").setMsgId("sorting_msgId");
	tt.vf.req.add(specialId,productId,sorting);
	new tt.NRV().set(0, '++').add(specialId,productId,sorting);
	tt.vf.int.add(specialId,productId,sorting);
	$(document).ready(function() {
		$("#sbutton").click(function() {
		
			if (tt.validate()) {		
				document.getElementById("from1").submit();
			}
		});
	});
</script>