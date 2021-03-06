<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/top.jsp"></jsp:include>
<jsp:include page="../../common/common_head.jsp"></jsp:include>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/system/help/helpCommon.js"></script>
<script type="text/javascript">
function allcb(){
	var checkbox=document.getElementById("selectcb"); 
	if(checkbox.checked==true){
		var code_Values = document.getElementsByName("tids") ; 
		for(i = 0;i < code_Values.length;i++){ 
		if(code_Values[i].type == "checkbox") 
		{ 
		code_Values[i].checked = true; 
		} 
		} 	 
	}else{	
		var code_Values = document.getElementsByName("tids") ; 
		for(i = 0;i < code_Values.length;i++){ 
		if(code_Values[i].type == "checkbox") 
		{ 
		code_Values[i].checked = false		
		} 
		} 
	}
}
function deleteAll(){
		$("#idform").attr("action","delNavigationAll.do").submit();
	}
function checkAll(){
		$("#idform").attr("action","checkNavigationAll.do").submit();
	}
function check(val){
		if(confirm("确认要通过审核吗？")){
			var url = "checkNavigation.do?navigationPojo.id="+val;	
			window.location.href=url;
		}else{
			return ;
		}
	}	
function uncheck(val){
		if(confirm("确认要取消审核吗？")){
			var url = "uncheckNavigation.do?navigationPojo.id="+val;	
			window.location.href=url;
		}else{
			return ;
		}
	}
function del(val){
		if(confirm("确认要删除此条吗？")){
			var url = "delNavigation.do?navigationPojo.id="+val;	
			window.location.href=url;
		}else{
			return ;
		}
	}	
</script>	
</head>
<body>
<div class="sub_wrap">
<div class="s_nav"><a href="#">商品中心</a> &gt; <a href="navigationList.do">APP导航</a></div>
     <div class="Search_control">
	 <p>按条件查找</p>
	 <a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
	 </div>
		<!-- 查询开始 -->
		<form action="navigationList.do" method="post" id="sysform">
			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">  
					<tr> 
					    <td align="right">导航分类名：</td>
						<td><label><input type="text" name="navigationPojo.name"
								value=""></label></td>
						<td align="right">审核状态：</td>
						<td><select name="navigationPojo.status" id="navigationPojo.status"  class="floatLeft">
							<option value="">----请选择----</option>
							<option value="1">未审核</option>
							<option value="2">已审核</option>
				    		</select></td>
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
<s:if test="#session.role.roleId!=7"><a class="delAll_btn" onclick="deleteAll()">批量删除</a>
<a class="Add_btn" onclick="checkAll()">批量审核</a>
<a class="Add_btn" href="goAddNavigation.do">新增导航</a></s:if>
<form action="deletecouponAllById.do" id="idform"  method="post" >
<table width="100%" border="0" class="Info_list_table">
<tr>    
        <th><input type="checkbox" id="selectcb" name="selectcb" onclick="allcb()" ></th>
		<th>导航分类名</th>
		<th>分类ID</th>
		<th>分类级别</th>
		<th>排序</th>
		<th>状态</th>
		<s:if test="#session.role.roleId!=7"><th>操作</th></s:if>
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
</body>
</html>
<script type="text/javascript">
var ctx  ="<s:property value="ctx" />";
var pagecount = "${page.rowCount}"; 
function query() {
if(tt.validate()){
		var rand=Math.random() * ( 100000 + 1);
		queryData("navigationListCount.do", "navigationListAll.do?randquery="+rand);
	}
}
	/**
	 *分页展现页面函数 
	 **/
	function installPage() {
		$("#body").append(
				"<tr><td><input  name='tids' type='checkbox' value="+this.id +"   /></td>"+
				"<td>"+ this.name + "</td>"+
				"<td>"+ this.categoryId + "</td>"+				
				"<td>"+ this.levelName + "</td>"+
				"<td>"+ this.sorting + "</td>"+
				"<td>"+ this.statusName + "</td>"+
				"<s:if test="#session.role.roleId!=7"><td><a class='edit_btn' href='goUpdateNavigation.do?navigationPojo.id="+this.id +"'>编辑</a>"+
				"<a class='del_btn'  onclick=del("+this.id+")>删除</a>"+
				"<a class='edit_btn' onclick=check("+this.id+")>通过审核</a>"+
				"<a class='edit_btn' onclick=uncheck("+this.id+")>取消审核</a></td></s:if>");
				
	}	
	$(function() {
		/**
		  首次要初始化分页
		 **/
		 var rand=Math.random() * ( 100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"navigationListAll.do?randIni="+rand);	
		$("#query_btn").click(query);		
	});	
</script>