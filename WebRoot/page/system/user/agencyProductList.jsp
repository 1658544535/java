<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/top.jsp"></jsp:include>
<jsp:include page="../../common/common_head.jsp"></jsp:include>

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
			var url = "delAgencyCollect.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}&agencyCollectPojo.id="+val;	
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
			queryData("agencyCollectCount.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}", "agencyCollectList.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}&randdelete="+rand);
		}else{
			alert("删除失败");
		}
	}
	function update(id) {
		var stock=document.getElementById('stock'+id).value;
		//d = window.encodeURI(window.encodeURI(d));  
		 $.ajax({
             type: "get",
             url: "updAgencyCollectStock.do?id="+id+"&stock="+stock,
             success: function(data){
             	if(data=="1"){
             		alert("成功");
             	}else{
             		alert("库存输入有误");
             	}
             	var rand=Math.random() * ( 100000 + 1);
             	queryData("agencyCollectCount.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}", "agencyCollectList.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}&randdelete="+rand);
             }
             });	
            
	}
	</script>
</head>
<body>
<div class="sub_wrap">
<div class="s_nav"><a href="#">批发商管理</a> &gt; <a href="#">账户信息</a> &gt;<a href="#">设置代理商品</a></div>
    <div class="Search_control">
			<p>按条件查找</p>
			<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->

		<form action="" method="post" id="sysform">

			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">
					<tr>
						<td align="right">商品货号：</td>
						<td><label><input type="text" name="agencyCollectPojo.productNum"
								id="agencyCollectPojo.productNum"
								value="<s:property value="agencyCollectPojo.productNo"/>"></label></td>
						<td align="right">商品名称：</td>
						<td><label><input type="text" name="agencyCollectPojo.productName"
								id="agencyCollectPojo.productName"
								value="<s:property value="agencyCollectPojo.productName"/>"></label></td>
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
  <a class="delAll_btn"  onclick="deleteAll()" >删除全部</a>
  <form action="delAgencyCollectAll.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}" id="idform"  method="post" >
  	<table width="100%" border="0" class="Info_list_table">
    <tr>
    	<th><input type="checkbox" id="selectcb" name="selectcb" onclick="allcb()" ></th>
		<th>商品编号</th>
		<th>商品货号</th>
		<th>商品图片</th>
		<th>商品名称</th>
		<th>商品价格</th>
		<th>所属用户</th>
		<th>商品类型</th>
		<th>批发商库存</th>
		<th width="10%">操作</th>
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
			queryData("agencyCollectCount.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}", "agencyCollectList.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}&randquery="+rand);
		}
	}



	/**
	 *分页展现页面函数 
	 **/
	function installPage() {
		$("#body").append(
				"<tr><td><input  name='tids' type='checkbox' value="+this.id +"   /></td>"+
				"<td>"+ this.productNo + "</td>"+
				"<td>"+ this.productNum + "</td>"+
				"<td><img src='<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/upfiles/product/"+ this.productImage + "' height='100px' /></td>"+
				"<td>"+ this.productName + "</td>"+
				"<td>"+ this.sellingPrice + "</td>"+
				"<td>"+ this.manuName + "</td>"+
				"<td>"+ this.productTypeName + "</td>"+
				//"<td>"+ this.agency_stock + "</td>"+
				"<td><input type='text' style='padding:10px 5px; vertical-align:middle;text-align:center;width:70px' id='stock"+this.id+"' value=\""+ this.agency_stock + "\" /></td>"+
				"<td><a  class='del_btn' onclick=del('"+this.id+"')>删除</a>"+
				"<a class='edit_btn' onclick=update('"+this.id+"')>保存</a>"+
				"</td></tr>");
	}
	

	$(function() {
		/**
		  首次要初始化分页
		 **/
		 var rand=Math.random() * ( 100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"agencyCollectList.do?agencyCollectPojo.agency_id=${agencyCollectPojo.agency_id}&randIni="+rand);
		
		$("#query_btn").click(query);
		
		
	});
	
</script>