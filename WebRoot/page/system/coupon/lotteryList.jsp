<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
		document.getElementById("idform").submit();
	}


	function del(val)
	{
		if(confirm("你真的想删除该记录么？"))
		{
			var url = ".do?="+val;	
			window.location.href=url;
		}else{
			return ;
		}
	}
	
	function checkAll(){
		$("#idform").attr("action",".do").submit();
	}
	function check(val)
	{
		if(confirm("确认要启用吗？"))
		{
			var url = ".do?="+val;
			window.location.href=url;
		}else{
			return ;
		}
		
	}
	function uncheck(val)
	{
		if(confirm("确认要禁用吗？"))
		{
			var url = ".do?="+val;
			window.location.href=url;
		}else{
			return ;
		}
		
	}
	</script>
</head>
<body>
<div class="sub_wrap">
<div class="s_nav"><a href="#">商品优惠管理</a> &gt; <a href="#">抽奖列表</a></div>
    <div class="Search_control">
			<p>按条件查找</p>
			<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->

		<form action="lotteryList.do" method="post" id="sysform">

			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">
					<tr>
						<td align="right">主题：</td>
						<td><label><input type="text" name="lotteryPojo.subject"
								id="lotteryPojo.subject"
								value=""></label></td>
						<%-- <td align="right">状态：</td>
						<td><select name="lotteryPojo.status" id="lotteryPojo.status"  class="floatLeft">
							<option value="">----请选择----</option>
							<option value="0">禁用</option>
							<option value="1">启用</option>
							</select></td> --%>
							<td align="right">开始时间：</td>
						<td>
							<input id="s" name="lotteryPojo.startTimeDStr" value="" class="Wdate" type="text" 
							onFocus="WdatePicker({isShowToday:false,dateFmt:'yyyy-MM-dd',
								maxDate:'#F{$dp.$D(\'e\')}'})"/>
								</td>
					</tr>
					<tr>
						
						<td align="right">结束时间：</td>
						<td>
							<input id="e" name="lotteryPojo.endTimeDStr" value="" class="Wdate" type="text" 
							onFocus="WdatePicker({isShowToday:false,dateFmt:'yyyy-MM-dd',
								minDate:'#F{$dp.$D(\'s\')}'})"/>
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
  <!-- <a class="delAll_btn" onclick="deleteAll()">删除全部</a>
  <a class="Add_btn" onclick="checkAll()">启用全部</a>
  <a href=".do?type=0" class="Add_btn">新增商品</a> -->
  <form action=".do" id="idform"  method="post" >
  	<table width="100%" border="0" class="Info_list_table">
    <tr>
    	<th><input type="checkbox" id="selectcb" name="selectcb" onclick="allcb()" ></th>
		<th>主题</th>
		<!-- <th>状态</th> -->
		<th>开始时间</th>
		<th>结束时间</th>
		<!-- <th>操作</th> -->
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
  
  
  
  <!---->


</div>
</body>
</html>


	


<script type="text/javascript">
var ctx  ="<s:property value="ctx" />";
var pagecount = "${page.rowCount}"; 
function query() {
	if(tt.validate()){
		var rand=Math.random() * ( 100000 + 1);
		queryData("lotteryListCount.do", "lotteryListAll.do?randquery="+rand);
	}
}



	/**
	 *分页展现页面函数 
	 **/
	function installPage() {
		$("#body").append(
				"<tr><td><input  name='tids' type='checkbox' value='"+this.lotteryId+"'   /></td>"+
				"<td>"+ this.subject + "</td>"+
				//"<td>"+ this.statusName + "</td>"+
				"<td>"+ this.startTimeDStr + "</td>"+
				"<td>"+ this.endTimeDStr + "</td>"+
				//"<td><a  class='edit_btn' onclick=check('"+this.couponNo+"')>启用</a>"+
				//"<a  class='edit_btn' onclick=uncheck('"+this.couponNo+"')>禁用</a>"+
				//"<a  class='del_btn' onclick=del('"+this.couponNo+"')>删除</a>"+
				//"<a class='edit_btn' href='.do?type=1&="+this.couponNo +"'>编辑</a>");
		"");
	}
	

	$(function() {
		/**
		  首次要初始化分页
		 **/
		 var rand=Math.random() * ( 100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"lotteryListAll.do?randIni="+rand);
		
		$("#query_btn").click(query);
		
		
	});
	
</script>