<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/top.jsp"></jsp:include>
<jsp:include page="../../common/common_head.jsp"></jsp:include>

<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/system/help/helpCommon.js"></script>
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/jquery/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/pagination/jquery.pagination.js"></script>
<link href="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/pagination/pagination.css"
	media="screen" rel="stylesheet">
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/sys_util.js"></script>
<link type="text/css" rel="stylesheet" href="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/css/validate.css" /> 
<script src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/testJSP/js/validate/talent-validate-all.js" language="javascript"></script>
<script type="text/javascript"
	src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/tipswindown/tipswindown.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/tipswindown/browser.js"></script>
<link href="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/tipswindown/tipswindown.css" media="screen"
	rel="stylesheet">

<script type="text/javascript">

	function allcb() {
		var checkbox = document.getElementById("selectcb");
		if (checkbox.checked == true) {
			var code_Values = document.getElementsByName("tids");
			for (i = 0; i < code_Values.length; i++) {
				if (code_Values[i].type == "checkbox") {
					code_Values[i].checked = true;
				}
			}
		} else {
			var code_Values = document.getElementsByName("tids");
			for (i = 0; i < code_Values.length; i++) {
				if (code_Values[i].type == "checkbox") {
					code_Values[i].checked = false
				}
			}
		}
	}
	
	//批量审核
	function checkAll() {
		document.getElementById("idform").submit();
	}
	
/**
	function deleteAll() {
		document.getElementById("idform").submit();
	}

	function del(val) {
		if (confirm("你真的想删除该记录么？")) {
			var url = "deleOrder.do?order.id=" + val;
			doOpreator(url, null);
		} else {
			return;
		}
	}
	
	function doOpreator(url, params) {
		MAOWU.ajax.get(url, params, goRefreshPage);
	}

	function goRefreshPage(result) {
		var rand = Math.random() * (100000 + 1);
		if (result == "1") {
			alert("删除成功");
			queryData("getOrderCount.do", "orderAllList.do?randdelete=" + rand);
		} else {
			alert("删除失败");
		}
    }
*/
</script>
</head>
<body>
	<div class="sub_wrap">
		<div class="s_nav">
			<a href="#">信息统计</a> &gt; <a href="#">商品销售统计</a>
		</div>
		<div class="Search_control">
			<p>按条件查找</p>
			<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->
		<form action="userOrderDetailManage.do" method="post" id="sysform">
			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">
					<tr>
						<!--<td align="right">用户名称</td>
						<td><label><input type="text" name="userOrderDetailPojo.loginName"
								id="userOrderDetailPojo.loginName" value=""></label>
						</td>-->
						<td align="right">商家(店铺名称)</td>
						<td><label><input type="text" name="userOrderDetailPojo.shopName"
								id="userOrderDetailPojo.shopName" value=""></label>
						</td>
						<!--<td align="right">商品名称</td>
						<td><label><input type="text" name="userOrderDetailPojo.productName"
								id="userOrderDetailPojo.productName" value=""></label>
						</td>
						<td align="right">商品货号</td>
						<td><label><input type="text" name="userOrderDetailPojo.product_num"
								id="userOrderDetailPojo.product_num" value=""></label>
						</td>
						<td align="right">支付状态</td>
						<td>
						 <select name="productSaleRecordPojo.payStatus" id="">
						 		<option value="">--请选择--</option>
								<s:iterator value="payStatusList">
									<option value="<s:property value="value"/>"
									<s:if test="value == productSaleRecordPojo.payStatus">selected="selected"</s:if>>
									<s:property value="name" />
									</option>
								</s:iterator>
						</select>
						</td>
						-->
					</tr>
					<tr>
						<td align="right">开始日期</td>
						<td><label><input id="beganday" name="beganday" type="text"
							readonly="readonly" value="${userInfoPojo.birthday}"> <img id="begancalendarImg"
							src="<s:property value="ctx" />/js/My97DatePicker/skin/datePicker.gif"
							width="16" height="22" align="middle" /></label></td>
						<td align="right">结束日期</td>
						<td><label><input id="endday" name="endday" type="text"
							readonly="readonly" value="${userInfoPojo.birthday}"> <img id="endcalendarImg"
							src="<s:property value="ctx" />/js/My97DatePicker/skin/datePicker.gif"
							width="16" height="22" align="middle" /></label></td>		
					</tr>
				</table>
				<input type="hidden" name="page.pageNo" value=0 id="pageNo">
				<div class="floatRight">
					<input id="query_btn" type="button" class="submit_btn" value="查询" />
				</div>
				<div class="Clear"></div>
			</div>
		</form>
		<!-- 查询结束 -->
		<div class="h15"></div>
		<div>
		<table width="100%" border="0" class="Search_table">
					<tr>
						<td align="right">本月成交订单总量：</td>
						<td><label><input type="text" name="mouthcount"
								id="mouthcount" value="${mouthcount}" readonly="readonly"></label>
						</td>
						<td align="right">平台成交总订单量：</td>
						<td><label><input type="text" name="allcount"
								id="allcount" value="${allcount}" readonly="readonly"></label>
						</td>
					</tr>
					
				</table>
			<!--<a class="Add_btn" onclick="checkAll()">批量审核</a>-->
			<form action="checkAllUserOrderDetailById.do" id="idform" method="post">
				<table width="100%" border="0" class="Info_list_table">
					<tr>
						<th><input type="checkbox" id="selectcb" name="selectcb" onclick="allcb()"></th>
						<th>日期</th>
						<th>商家</th>
						<th>金额</th>
						<!--<th>商品名称</th>
						<th>商品序号</th>
						<th>商品货号</th>
						<th>商品类型</th>
						<th>商品总价格</th>
						<th>总数量</th>
						<th>状态</th>
						<th>时间</th>-->
						<th>操作</th>
					</tr>
					<tbody id="body"></tbody>
				</table>
			</form>
			<div class="page">
				<div class="floatleft">
					总共 <i id="rowcount">${page.rowCount }</i> 条/<i id="pagecount"></i>页
				</div>
				<div style="float: right" id="Pagination" class="pagination"></div>
				<div class="Clear"></div>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	var ctx = "<s:property value="ctx" />";
	var pagecount = "${page.rowCount}";
	function query() {
		if (tt.validate()) {
			var rand = Math.random() * (100000 + 1);
			queryData("getProductSaleCount.do", "productSaleAllList.do?randquery=" + rand);
		}
	}

	//分页展现页面函数 
	function installPage() {
		$("#body")
				.append(
						"<tr><td><input  name='tids' type='checkbox' value="+this.id +"   /></td><td>"
								+ this.creatDateString
								+ "</td><td>"
								+ this.shopName
								+ "</td><td>"
								+ this.sumprice
								+ "</td><td>"
								+ "<a class='edit_btn' href='shopSaleListCount.do?userOrderDetailPojo.shopId="
								+ this.shopId + "'>查看</a>"
								+"</td></tr>"
                         );
	}

	$(function() {
		// 首次要初始化分页
		//alert(this.createDateString);
		var rand = Math.random() * (100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"productSaleAllList.do?randIni=" + rand);
		$("#query_btn").click(query);
	});


function setBeganDay() {
		WdatePicker({
			el : 'beganday'
		});
	}
function setEndDay() {
		WdatePicker({
			el : 'endday'
		});
	}	
	
	$("#begancalendarImg").click(setBeganDay);
	$("#beganday").click(setBeganDay);
	$("#endcalendarImg").click(setEndDay);
	$("#endday").click(setEndDay)
</script>