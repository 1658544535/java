<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/common_head.jsp"></jsp:include>
<jsp:include page="../../common/top.jsp"></jsp:include>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/pagecommon.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="sub_wrap">
		<div class="s_nav"><a href="#">信息统计</a> &gt; <a href="#">拼团信息导出</a></div>
		<div class="Search_control">
			<p>按条件查找</p>
			<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->
		<form action="#" method="post" id="sysform">
			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">
				    <tr>
				        <td align="right" >参与时间：</td>
				        <td><input style="min-width:60px;" name="grouponUserRecordPojo.attendTimeStartStr" readonly="readonly" class="Wdate" type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm', isShowToday: false, isShowClear: true }); " id="attendTimeStartStr"/>到<input style="min-width:60px;" name="grouponUserRecordPojo.attendTimeEndStr" readonly="readonly" class="Wdate" type="text" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm', isShowToday: false, isShowClear: true }); " id="attendTimeEndStr"/></td>
                        <td align="right">名单：</td>
						<td>
							<select name="grouponUserRecordPojo.openGroup" id="openGroup"
								class="floatLeft">
								    <option value="">---请选择---</option>
									<option value="0">参团未开团人名单</option>
									<option value="1">开团人名单</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="page.pageNo" value=0 id="pageNo">
				<div class="floatRight">
					<input id="query_btn" type="button" class="submit_btn" value="查询" />
				</div>
				<div class="Clear"></div>
			</div>
		</form>
		<!--<a href="javascript:self.print();">打印该页</a>-->
		<!-- 查询结束 -->
		<div class="h15"></div>
		<div>
	     	<input type="button" value="导出EXCEL"  id="excel" class="submit_btn" style="float: right;"  /><label style="color:red;float: right;">最多导出三万条！</label>
			<%--<a class="Add_btn" href="goAddGrouponActivity.do" >新增</a>
			<a class="Add_btn" onclick="checkAll('checkGrouponActivityAll.do')" >审核选中</a>
			<a class="Add_btn" onclick="uncheckAll('uncheckGrouponActivityAll.do')" >选中取消审核</a>
			<a class="delAll_btn" onclick="deleteAll('delGrouponActivityAll.do')" >选中删除</a>
			--%>
			<form action="#" id="idform" method="post" >
				<table width="100%" border="0" class="Info_list_table">
					<tr>
						<!--<th><input type="checkbox" id="selectcb" name="selectcb" onclick="allcb()" ></th>-->
						<th>账号</th>
						<th>参与时间</th>
					</tr>
					<tbody id="body"></tbody>    
				</table>
			</form>
			<div class="page">
				<div class="floatleft">
					总共 <i id="rowcount">${page.rowCount}</i> 条/<i id="pagecount"></i>页
				</div>
				<div style="float: right" id="Pagination" class="pagination"></div>
				<div class="Clear"></div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var ctx  ="<s:property value="ctx" />";
	var pagecount = "${page.rowCount}"; 
	/**
	 * 条件查询函数 
	 */
	function query() {
		 if($("#attendTimeStartStr").val()=="" || $("#attendTimeEndStr").val()=="" || $("#openGroup").val()==""){
		 
		   alert("参与时间和名单都必填！");
		   
		 }else{
				if(tt.validate()){
					var rand=Math.random() * (100001);
					queryData("grouponExcelCount.do", "grouponExcelList.do?randquery="+rand);
				}
		 }
	}
	
	/**
	 * 分页展现页面函数 
	 */
	function installPage() {
		$("#body").append(
				//"<tr><td><input name='tids' type='checkbox' value="+this.id +" /></td>"+
				"<tr><td>"+ this.loginName + "</td>"+
				"<td>"+ this.attendTimeStr + "</td>"
				//<s:if test="#session.role.roleId!=7">
				//"<td><a class='edit_btn' onclick='check(\"checkGrouponActivity.do?id="+this.id +"\")'>审核通过</a>"+
				//"<a class='edit_btn' onclick='uncheck(\"uncheckGrouponActivity.do?id="+this.id +"\")'>取消审核</a>"+
				//"<a class='edit_btn' href='goEditGrouponActivity.do?id="+this.id +"'>编辑</a>"+
				//"<a class='del_btn' onclick='del(\"delGrouponActivity.do?id="+this.id+"\")'>删除</a></td>"
				//</s:if>
				);
	}
	/**
	 *  首次要初始化分页
	 */
		$(function() {
			var rand=Math.random() * (100001);
			MAOWU.page.init(${page.rowCount}, "grouponExcelList.do?randIni="+rand);	
			$("#query_btn").click(query);		
		});	

		/**
		  导出excel
		 **/
			$("#excel").click(function() {
			    if($("#attendTimeStartStr").val()=="" || $("#attendTimeEndStr").val()=="" || $("#openGroup").val()==""){
		           alert("参与时间和名单都必填！");
		        }else{
				     if(tt.validate()){
					   var formParam = $("#sysform").serialize();
					   $(location).attr('href', 'getGrouponExcel.do?'+formParam);
				      }
			    }
		   });
</script>
