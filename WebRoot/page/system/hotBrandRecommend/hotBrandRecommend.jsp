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
<script type="text/javascript">
	/*改变checkBox的状态*/
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

	/*删除全部*/
	function deleteAll() {
		document.getElementById("idform").submit();
	}

	/*删除*/
	function del(val) {
		if (confirm("你真的想删除么？")) {
			//var url = "delnotice.do?notice.noticeId=" + val;
			var url = "delHotBrandRecommend.do?hotBrandRecommendPojo.id=" + val;
			doOpreator(url, null);
		} else {
			return;
		}

	}
	
	function doOpreator(url, params) {
		MAOWU.ajax.get(url, params, goRefreshPage);
	}

	/*刷新*/
	function goRefreshPage(result) {
		var rand = Math.random() * (100000 + 1);
		if (result =="1") {
			alert("删除成功");//浏览器阻止创建更多的的多画框对话框
			//MAOWU.page.init(<s:property value="page.rowCount"/>,"noticeAllList.do?randIni=" + rand);
			queryData("getHotBrandRecommendCount.do", "hotBrandRecommendAllList.do?randquery=" + rand);
		} else {
			alert("删除失败");
		}
	}
</script>
</head>
<body>
	<div class="sub_wrap">
		<div class="s_nav">
			<a href="#">商家中心管理</a> &gt; <a href="#">热门品牌</a>
		</div>
			<form action=goHotBrandRecommend.do method="post" id="sysform">
				
								<input type="hidden" name="page.pageNo" value=0 id="pageNo">
							
					
			</form>
		<div class="h15"></div>
		<div>
			<input type="hidden" name="pagePushPojo.type"
				value="${pagePushPojo.type}" class="floatLeft" id="merNamffe">
			<!--<s:if test="#session.role.roleId!=7"><a class="delAll_btn" onclick="deleteAll()">批量删除</a>-->
			<a class="Add_btn" href="goSelectHotBrandRecommend.do">新增推荐</a></s:if>
			<form action="hotBrandRecommendDeleteId.do" id="idform" method="post">
				<table width="100%" border="0" class="Info_list_table">
					<tr>
						<!--<th><input type="checkbox" id="selectcb" name="selectcb"
							onclick="allcb()"></th>-->
						<th>品牌名</th>
						<th>品牌图</th>
						<th>序号</th>
						<th>添加时间</th>
						<s:if test="#session.role.roleId!=7"><th>操作</th></s:if>
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
			queryData("getHotBrandRecommendCount.do", "hotBrandRecommendAllList.do?randquery=" + rand);
		}
	}

	//分页展现页面函数 
	function installPage() {
		$("#body")
				.append(
						<!--"<tr><td><input  name='tids' type='checkbox' value="+this.id +"   /></td><td>"-->
								"<tr><td>"+ this.name
								+ "</td><td>"
								+ "<img src='<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/upfiles/businessCenter/brandDic/"+ this.image + "' height='50px' />"
								+ "</td><td>"
								+ this.sorting
								+ "</td><td>"
								+ this.createDateStr
								+ "</td><s:if test="#session.role.roleId!=7"><td><a class='del_btn' onclick=del('"
								+ this.id
								+ "')>删除</a>"
								+ "<a class='edit_btn' href='goUpdateHotBrandRecommend.do?hotBrandRecommendPojo.id="
								+ this.id + "'>编辑</a></td></s:if></tr>");
	}

	$(function() {
		//首次要初始化分页
		var rand = Math.random() * (100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"hotBrandRecommendAllList.do?randIni=" + rand);
		$("#query_btn").click(query);
	});

</script>