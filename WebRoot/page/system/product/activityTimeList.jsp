<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/top.jsp"></jsp:include>
<jsp:include page="../../common/common_head.jsp"></jsp:include>
<script type="text/javascript"
src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/js/system/help/helpCommon.js"></script>
<script type="text/javascript">
	function allcb(){
		var checkbox=document.getElementById("selectcb"); 
		if(checkbox.checked==true){
			var code_Values = document.getElementsByName("tids") ; 
			for(i = 0;i < code_Values.length;i++){ 
				if(code_Values[i].type == "checkbox") { 
					code_Values[i].checked = true; 
				} 
			} 
		}else{	
			var code_Values = document.getElementsByName("tids") ; 
			for(i = 0;i < code_Values.length;i++){ 
				if(code_Values[i].type == "checkbox"){ 
					code_Values[i].checked = false
				} 
			} 
		}
	}

	function del(val){
		if(confirm("你真的想删除该记录么？")){
			var url = "delActivityTime.do?activityTimePojo.id="+val;	
			doOpreator(url,null);
		}else{
			return ;
		}
		
	}
	
	function doOpreator(url,params){
		MAOWU.ajax.get(url, params, goRefreshPage);
	}
	 
	function goRefreshPage(result){
		var rand=Math.random() * ( 100000 + 1);
		if(result=="1"){
			alert("删除成功");
			queryData("findActivityTimeCount.do?op=1", "findActivityTimeList.do?op=1&randdelete="+rand);
		}else{
			alert("删除失败");
		}
	}
	
	function check(val){
		if(confirm("确认要通过审核吗？")){
			var url = "checkActivityProduct.do?activityProductPojo.id="+val;	
			doOpreator2(url,null);
		}else{
			return ;
		}
	}
	
	function doOpreator2(url,params){
		MAOWU.ajax.get(url, params, goRefreshPage2);
	}
	 
	function goRefreshPage2(result){
		var rand=Math.random() * ( 100000 + 1);
		if(result=="1"){
			alert("审核成功");
			queryData("getActivityProductCount.do?op=1&type=${type}", "getActivityProductList.do?op=1&type=${type}&randdelete="+rand);
		}else{
			alert("审核失败");
		}
	}
	
	function uncheck(val){
		if(confirm("确认要取消审核吗？")){
			var url = "uncheckActivityProduct.do?activityProductPojo.id="+val;	
			undoOpreator(url,null);
		}else{
			return ;
		}
	}
	
	function undoOpreator(url,params){
		MAOWU.ajax.get(url, params, ungoRefreshPage);
	}
	 
	function ungoRefreshPage(result){
		var rand=Math.random() * ( 100000 + 1);
		if(result=="1"){
			alert("取消审核成功");
			queryData("getActivityProductCount.do?op=1&type=${type}", "getActivityProductList.do?type=${type}&op=1&randdelete="+rand);
		}else{
			alert("取消审核失败");
		}
	}
	function deleteAll(){
		$("#idform").attr("action","delActivityTimeAll.do?op=1");
		$("#idform").submit();
	}
	
	function checkAll(){
		$("#idform").attr("action","checkActivityProductAll.do?op=1&type=${type}");
		$("#idform").submit();
	}
	</script>
</head>
<body>
<div class="sub_wrap">
    <div class="s_nav"><a href="#">活动商品管理</a> &gt;<a href="#">限时秒杀管理</a></div>
    <div class="Search_control">
			<p>按条件查找</p>
			<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->

		<form action="findActivityTimeList.do?op=1" method="post" id="sysform">
			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">
				<tr><td align="right">活动时间从：</td>
				<td>
				<input id="d5221" name="activityTimePojo.beginTime" class="Wdate" type="text" onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},isShowToday:false,dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'d5222\')}'})"/>
				至
				<input id="d5222" name="activityTimePojo.endTime" class="Wdate" type="text" onFocus="WdatePicker({isShowToday:false,dateFmt:'HH:mm',minDate:'#F{$dp.$D(\'d5221\')}'})"/>
				</td>
				<td align="right">活动渠道：</td>
				<td>
					<select name="activityTimePojo.channel" id="">
				 		<option value="">全部</option>
				 		<option value="1">APP</option>
				 		<option value="2">微商城</option>
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
		<!-- 查询结束 -->
   <div class="h15"></div>
   <div>
   <s:if test="#session.role.roleId!=7"><a class="delAll_btn" onclick="deleteAll()" >批量删除</a>
   <a class="Add_btn" href="activityTimeAdd.do?t=1" >新增秒杀活动</a>
   <!-- <a class="Add_btn" href="activityTimeAdd.do" >专题活动设置</a> -->
   <!--<a class="Add_btn" onclick="checkAll()" >审核全部</a>--></s:if>
   <form action="getActivityProductList.do" id="idform"  method="post" >
  	<table width="100%" border="0" class="Info_list_table">
    <tr>
    	<th width='20px'><input type="checkbox" id="selectcb" name="selectcb" onclick="allcb()" ></th>
		<th>活动日期</th>
		<th>活动时间</th>
		<th>标题</th>
		<th>活动渠道</th>
		<th>Banner</th>
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
	var ctx  ="<s:property value="ctx" />";
	var pagecount = "${page.rowCount}"; 
	function query() {
		if(tt.validate()){
			var rand=Math.random() * ( 100000 + 1);
			queryData("findActivityTimeCount.do?op=1", "findActivityTimeList.do?op=1&randquery="+rand);
		}
	}

	/**
	 *分页展现页面函数 
	 **/
	function installPage() {
		if(this.channel == 1){
			var vchannel = "APP";
		} else if(this.channel == 2){
			var vchannel = "微商城";
		}
		$("#body").append(
				"<tr><td width='20px'><input name='tids' type='checkbox' value="+this.id +" /></td>"+
				"<td>"+ this.activityDateStr + "</td>"+
				//"<td><a href='activityGoodsManage.do?timeId="+this.id+"'>"+ this.activityTime + "</a></td>"+
				"<td>"+ this.activityTime + "</td>"+
				"<td>"+ this.title + "</td>"+
				"<td>"+ vchannel + "</td>"+
				"<td><img src='<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/upfiles/activity/"+ this.banner + "' height='100px'/></td>"+
				"<s:if test="#session.role.roleId!=7"><td><a class='edit_btn' href='addAgencyCollect.do?t=1&timeId="+this.id+"&activityTime="+this.activityTime+"&activityDate="+this.activityDateStr+"'>添加活动商品</a>" +
				"<a class='edit_btn' href='activityGoodsManage.do?t=1&timeId="+this.id+"')>设置活动商品</a>"+
				"<a class='del_btn' onclick=del('"+this.id+"')>删除</a>"+
				"<a class='edit_btn' href='findActivityTimeById.do?t=1&activityTimePojo.id="+this.id +"'>编辑</a></td></s:if></tr>");
	}

	$(function() {
		/**
		  首次要初始化分页
		 **/
		var rand=Math.random() * ( 100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>, "findActivityTimeList.do?op=1");
		
		$("#query_btn").click(query);
	});
	
</script>