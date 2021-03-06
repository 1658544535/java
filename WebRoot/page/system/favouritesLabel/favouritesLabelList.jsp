<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../../common/top.jsp"></jsp:include>
<jsp:include page="../../common/common_head.jsp"></jsp:include>
<script type="text/javascript">
    function del(val)
	{
		if(confirm("你真的想删除该记录么？"))
		{
			var url = "delFavouritesLabel.do?yourFavouritesPojo.id="+val;	
			window.location.href=url;
		}else{
			return ;
		}
	}
	</script>
</head>
<body>
<div class="sub_wrap">
<div class="s_nav"><a href="#">标签管理</a> &gt; <a href="#">有你喜欢</a></div>
    <div class="Search_control">
		<p>按条件查找</p>
		<a class="collapse_btn" id="searchBar" onclick="showandhide()"></a>
		</div>
		<!-- 查询开始 -->
		<form action="labelList.do" method="post" id="sysform">
			<div id="search_show" style="">
				<table width="100%" border="0" class="Search_table">
					<tr>
					    <td align="right">标签名：</td>
					    <td><input type="text" name="yourFavouritesPojo.name" value=""></td>	
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
<a class="Add_btn" href="goAddFavouritesLabel.do" >新增标签</a>
<form action="" id="idform"  method="post" >
  	<table width="100%" border="0" class="Info_list_table">
    <tr>
		<th>标签名</th>	
		<th>标签图</th>
		<th>类别</th>
		<th>所属年龄</th>
		<th>序号</th>
		<th>创建时间</th>
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
		queryData("favouritesLabelListCount.do", "favouritesLabelListAll.do?randquery="+rand);
	}
}
/**
*分页展现页面函数 
**/
	function installPage() {
		var contentTypeName = "";
		if(this.contentType == 1){
			contentTypeName = "商品单品";
		}else if(this.contentType == 2){
			contentTypeName = "内容标签";
		}else{
			contentTypeName = "三级分类标签";
		}
			
		var ageTypeName = "";
		var ageTypes = (this.ageType).substring(1, this.ageType.length).split(':');
		for(var i = 0;i < ageTypes.length;i++){
			if(ageTypes[i] == 1){
				ageTypeName += "0-6月<br>";
			}else if(ageTypes[i] == 2){
				ageTypeName += "6-12月<br>";
			}else if(ageTypes[i] == 3){
				ageTypeName += "1-3岁<br>";
			}else if(ageTypes[i] == 4){
				ageTypeName += "3-6岁<br>";
			}else if(ageTypes[i] == 5){
				ageTypeName += "6-12岁<br>";
			}else if(ageTypes[i] == 6){
				ageTypeName += "12-16岁";
			}
		}
		
		$("#body").append(
				"<tr>"+
				"<td>"+ this.name + "</td>"+	
				"<td><img src='<s:i18n name="sysconfig"><s:text name="houtai_dns" /></s:i18n>/upfiles/favouritesLabel/"+ this.image + "' height='100px' /></td>"+
				"<td>"+ contentTypeName + "</td>"+
				"<td>"+ ageTypeName + "</td>"+
				"<td>"+ this.sorting + "</td>"+
				"<td>"+ this.createDateStr + "</td>"+
				"<s:if test="#session.role.roleId != 7"><td>"+
				"<a class='edit_btn' href='userCirclePostFavourites.do?yourFavouritesPojo.id="+this.id +"&yourFavouritesPojo.contentType="+this.contentType+"'>查看</a>"+
				"<a class='edit_btn' href='goUpdateFavouritesLabel.do?yourFavouritesPojo.id="+this.id +"'>编辑</a>"+
				"<a class='del_btn' onclick=del('"+this.id+"')>删除</a></td></s:if>");
	}	
$(function() {
	/**
		  首次要初始化分页
		 **/
	 var rand=Math.random() * ( 100000 + 1);
		MAOWU.page.init(<s:property value="page.rowCount"/>,
				"favouritesLabelListAll.do?randIni="+rand);	
		$("#query_btn").click(query);		
	});	
</script>