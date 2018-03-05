<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>乡村</title>

<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="user/js/countryMain.js"></script>
<link rel="stylesheet" href="user/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="user/css/flyaway.min.css">
<link rel="stylesheet" href="user/css/navbar.css">
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<link rel="stylesheet" type="text/css" href="user/css/countryMain.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">

<script type="text/javascript">
	var page = 1;
	var vtp = ${vtp};
	vtp = parseInt(vtp);
	var condition = new Array("全部","全部");
	
	//多条件查询分页乡村首次加载及下一页查询
	function villageselect(obj,con,index){
		if($(obj).text()!="下一页"){
			page = 1;
			con[index] = $(obj).text();
		}else{
			page++;
			if(page>vtp){
				page--;
				return false;
			}
		}
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("condition[0]", con[0]);
		formdata.append("condition[1]", con[1]);
		formdata.append("phone", ${user.u_phone});
		$.ajax({  
	         url:'page/VillageCenterPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#villagePage").html(returndata);
	        	 vtp = $("#pt").text().charAt(1);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	//上一页
	function backpage(){
		page--;
		if(page<1){
			page++;
			return false;
		}
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("condition[0]", condition[0]);
		formdata.append("condition[1]", condition[1]);
		formdata.append("phone", ${user.u_phone});
		$.ajax({  
	         url:'page/VillageCenterPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {         	
	        	 $("#villagePage").html(returndata);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	//乡村点赞
	function villagePraise(vid){
		var formdata = new FormData();
		formdata.append("vid", vid);
		$.ajax({  
	         url:'villagepraise' ,  
	         type: 'POST', 
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {     
	        	 var data = returndata.split(",");
	        	 $("span[villageId=" + vid + "]").html(data[0]);
	        	 var isPraise = parseInt(data[1]);
	        	 if(1 == isPraise){
	        		 $("span[villageId=" + vid + "]").css("color","red"); 
	             }else{
	            	 $("span[villageId=" + vid + "]").css("color","white");                
	             }
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  	});
	} 
	
	
</script>

</head>


<body>
	<!-- 导航条 -->
	<s:include value="nav.jsp"></s:include>
	<!-- 大图 -->
	<div id="bigImgDiv">
		<img src="user/images/9_1imagedetailimg.jpg" alt="countryMainImg">
	</div>


	<!-- 内容 -->
	<div id="ruralDiaryDiv">
		<div id="ruralDiaryImgLeft">
			<img src="user/images/hppic2.png" alt="pic-left">
		</div>
		<div id="ruralDiaryWord">
			<h2>乡村日记</h2>
			<p>
				在这里，你将看到风景如画的美丽乡村<br>在这里，你将了解到不同乡村的历史、文化，看到各具特色的乡村美景<br>在这里，你能参加意义非凡的公益活动
			</p>

		</div>
		<div id="ruralDiaryImgRight">
			<img src="user/images/hppic1.png" alt="pic-right" id="plane">
		</div>
	</div>
	</div>

	<!-- 筛选框 -->

	<div id="searchBackImgDiv">

		<!-- 地区 -->
		<div id="searchNavFirstDiv">
			<a class="navbar-brand" href="#" style="">地区：</a>
			<div>
				<ul class="nav nav-pills"
					style="line-height: 20px; margin-top: 5px;" id="areaUl">
					<li class="active" onclick="villageselect(this,condition,0)"><a>全部</a></li>
					<li onclick="villageselect(this,condition,0)"><a>浙江</a></li>
					<!-- 最多8个，其余放更多里面-->
					<li onclick="villageselect(this,condition,0)"><a>江苏</a></li>
					<li onclick="villageselect(this,condition,0)"><a>安徽</a></li>
					<li onclick="villageselect(this,condition,0)"><a>上海</a></li>
					<li onclick="villageselect(this,condition,0)"><a>江西</a></li>
					<li onclick="villageselect(this,condition,0)"><a>云南</a></li>
					<li onclick="villageselect(this,condition,0)"><a>青海</a></li>

					<li class="" data-toggle="modal" data-target="#moreActivitiesModal">
						<a id="moreActivities" style="">更多&nbsp&nbsp<span
							class="glyphicon glyphicon-chevron-down" id="moreActivitiesIcon"></span></a>

					</li>

				</ul>

				<div class="modal fade in" id="moreActivitiesModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel1">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<!-- 选择你最心仪的活动吧！ -->
								<i class="fa fa-podcast fa-2x" aria-hidden="true"></i>&nbsp;&nbsp;Come
								on! Join us now!
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>

							</div>
							<div class="modal-body">
								<div class="btn-wrap">
									<div class="btn-group btn-group-justified">
										<a class="btn btn-default choosen" href="#"
											data-dismiss="modal" onclick="villageselect(this,condition,0)">全部</a> <a class="btn btn-default"
											href="#" data-dismiss="modal" onclick="villageselect(this,condition,0)">澳门</a> <a
											class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">安徽</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">北京</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">重庆</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">福建</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">甘肃</a>
									</div>
									<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">广东</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">广西</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">贵州</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">海南</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">黑龙江</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">河北</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">河南</a>
									</div>
									<div class="btn-group btn-group-justified">
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">湖北</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">湖南</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">吉林</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">江苏</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">江西</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">辽宁</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">内蒙古</a>
									</div>
									<div class="btn-group btn-group-justified">
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">宁夏</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">青海</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">山东</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">山西</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">陕西</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">上海</a>
										<a class="btn btn-default"  data-dismiss="modal" onclick="villageselect(this,condition,0)">四川</a>
									</div>
									<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">台湾</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">天津</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">西藏</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">新疆</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">香港</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">云南</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="villageselect(this,condition,0)">浙江</a>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default center-block"
									data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>

		<!-- 排序 -->
		<div id="searchNavTwoDiv">
			<nav style="width: 700px; height: 50px;">
				<a class="navbar-brand" href="#">排序：</a>
				<ul class="nav nav-pills"
					style="line-height: 20px; padding-top: 5px;" id="sortUl">
					<li class="active" onclick="villageselect(this,condition,1)"><a>全部</a></li>
					<li onclick="villageselect(this,condition,1)"><a>最新</a></li>
					<li onclick="villageselect(this,condition,1)"><a>最热</a></li>
				</ul>
			</nav>
		</div>
	</div>



	<!-- 向下箭头＋乡村主要内容 单个-->
<div id="villagePage">
<c:forEach items="${villages }" var="village" varStatus="status">
  <div id="villageBox">
	<div style="width: 800px" align="center" id="firstDown">
		<img src="user/images/xia.jpg">
	</div>
	<div class="singleVillage">
	 	<c:if test="${isNew.get(status.index) eq '最新'}">
			<div class="ribbon">
				<div class="ribbonLable">最新</div>
			</div>
		</c:if>
		<c:if test="${isNew.get(status.index) eq '普通'}"></c:if>
		<div id="leftOnDiv" class="fourDivClass countryWordClass"
			align="center">
			<h3 align="center">${village.v_name }</h3>
			<div style="width: 95%; height: 100px; margin: 0 auto;">
				<p align="left">${village.summary }</p>
			</div>
			<a href="village?vid=${village.v_id }&phone=${user.u_phone}"><button type="button" class="btn btn-success material-design"
				style="width: 80px; border-radius: 0px; background-color: #426fc5;">Go!</button></a>

		</div>
		<div id="rightOnDiv" class="fourDivClass box">
			<img src="${village.summaryimg }" class="countryImgClass">
			<div class="box-content">
				<h3 class="title"></h3>
				<span class="post"></span>
				<ul class="icon">
					<li class="up"><a id="aaa" onclick="villagePraise(${village.v_id})"><img src="user/images/up.png"
							style="width: 130%;"><span class="upspan" villageId="${village.v_id}">&nbsp&nbsp${village.v_praise }</span></a></li>

				</ul>
			</div>
		</div>
	</div>
</c:forEach>
	
	<!-- 分页导航条-->
	<div>
		<ul class="myPage">
			<li class="text-center" ><a class="norunback"  href="#searchNavFirstDiv" onclick="return backpage()">上一页</a></li>
			<li class="text-center"><span id="cp">第${page }页</span></li>
			<li class="text-center"><span id="pt">共${vtp}页</span></li>
			<li class="text-center" class="norunnext"><a href="#searchNavFirstDiv"  onclick="return villageselect(this,condition,0)">下一页</a></li>
		</ul>
	</div>
</div>

	<script type="text/javascript" src="user/js/script.js"></script>
</body>
</html>
