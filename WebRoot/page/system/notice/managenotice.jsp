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
		if (confirm("你真的想删除该记录么？")) {
			//var url = "delnotice.do?notice.noticeId=" + val;
			var url = "delPushNotice.do?pagePushPojo.id=" + val;
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
			queryData("getNoitceCount.do", "noticeAllList.do?randquery=" + rand);
		} else {
			alert("删除失败");
		}
	}
</script>
</head>
<body>
	<div class="sub_wrap">
		<div class="s_nav">
			<a href="#">推送综合管理</a> &gt; <a href="#">推送信息管理</a>
		</div>
		<div class="Search_control">
			<p>按条件查找</p>
			<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->
		<div id="search_show" style="">
			<form action=pushNoticeManage.do method="post" id="sysform">
				<table width="100%" border="0" class="Search_table">
					<tr align="center">
						<td align="right">标题</td>
						<td align="left"><input type="text" name="pagePushPojo.title"
							id="pagePushPojo.title"
							value="<s:property
								value="pagePushPojo.title" />" /></td>
						<td align="right">所属类型</td>
						<td align="left">
						 <select name="pagePushPojo.type" id="">
						 		<option value="">全部</option>
								<s:iterator value="noticeSysDictList">
									<option value="<s:property value="value"/>"
									<s:if test="value == pagePushPojo.type">selected="selected"</s:if>><s:property
											value="name" />
									</option>
								</s:iterator>
						</select>
						</td>
					</tr>
					<tr align="right">
						<td align="right" colspan="4">
							<div class="floatRight">
								<input type="hidden" name="page.pageNo" value=0 id="pageNo">
								<input id="query_btn" type="button" class="submit_btn"
									value="查询" />
							</div>
						</td>
					</tr>
				</table>
				<div class="Clear"></div>
			</form>
		</div>

		<div class="h15"></div>
		<div>
			<input type="hidden" name="pagePushPojo.type"
				value="${pagePushPojo.type}" class="floatLeft" id="merNamffe">
			<s:if test="#session.role.roleId!=7"><a class="delAll_btn" onclick="deleteAll()">批量删除</a>
			<a class="Add_btn" href="goAddPushNotice.do">新增推送信息</a></s:if>
			<form action="noticeDeleteId.do" id="idform" method="post">
				<table width="100%" border="0" class="Info_list_table">
					<tr>
						<th><input type="checkbox" id="selectcb" name="selectcb"
							onclick="allcb()"></th>
						<th>ID参数</th>
						<th>推送图片</th>
						<th>信息类型</th>
						<th>背景色值</th>
						<th>状态</th>
						<th>发布时间</th>
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
			queryData("getNoitceCount.do", "noticeAllList.do?randquery=" + rand);
		}
	}

	//分页展现页面函数 
	function installPage() {
		$("#body")
				.append(
						"<tr><td><input  name='tids' type='checkbox' value="+this.id +"   /></td><td>"
								+ this.title
								+ "</td><td>"
								+ "<img src='<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/upfiles/notice/"+ this.images + "' height='50px' />"
								+ "</td><td>"
								+ this.typeName
								+ "</td><td>"
								+ this.backgroundColor
								+ "</td><td>"
								+ this.statusName
								+ "</td><td>"
								+ this.updateDateStr
								+ "</td><s:if test="#session.role.roleId!=7"><td><a class='del_btn' onclick=del('"
								+ this.id
								+ "')>删除</a>"
								+ "<a class='edit_btn' href='goUpdatePushNotice.do?pagePushPojo.id="
								+ this.id + "'>编辑</a></td></s:if></tr>");
	}

	$(function() {
		//首次要初始化分页
		var rand = Math.random() * (100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"noticeAllList.do?randIni=" + rand);
		$("#query_btn").click(query);
	});

</script>