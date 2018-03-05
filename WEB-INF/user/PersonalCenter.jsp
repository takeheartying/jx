<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script type="text/javascript" src="./user/js/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="./user/css/build.css">
<script src="./user/js/personalcenter.js"></script>
<link rel="stylesheet" href="./user/css/style.css">
<link rel="stylesheet" href="./user/css/personalcenter.css">
<script src="https://cdn.bootcss.com/blueimp-md5/2.8.0/js/md5.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">

<style type="text/css">
#myActivities {
	display: block;
}

#now {
	display: none;
}

#already {
	display: none;
}

#myPublish {
	display: none;
}
</style>

<script type="text/javascript">
  var page = 1;
  var npage = 1;
  var ntp = ${ntp};
  var mtp = ${mtp};
  var mtp = parseInt(mtp);
  var ztp = ${ztp};
  var ztp = parseInt(ztp);
  var ytp = ${ytp};
  var ytp = parseInt(ytp);
  var wtp = ${wtp};
  var wtp = parseInt(wtp);
 
  $(function() {
	  $("#file_upload").change(function() {
		var $file = $(this);
	  var fileObj = $file[0];
	  var windowURL = window.URL || window.webkitURL;
	  var dataURL;
	  var $img = $("#uploadimg");
	  if(fileObj && fileObj.files && fileObj.files[0]){
	  dataURL = windowURL.createObjectURL(fileObj.files[0]);
	  $img.attr('src',dataURL);
	  }else{
	  dataURL = $file.val();
	  var imgObj = document.getElementById("uploadimg");
	  // 两个坑:
	  // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
	  // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
	  imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	  imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
	  }
	  });}
)
  $(function(){
	  $(".all").click(function(){
		  $("#now").css("display","none");
		  $("#already").css("display","none");
		  $("#myPublish").css("display","none");
		  $("#all").css("display","block");
		  page = 0;
		  activitypagingnext(${user.u_phone},0);
	  });
	  $(".already").click(function(){
		  $("#now").css("display","none");
		  $("#already").css("display","block");
		  $("#myPublish").css("display","none");
		  $("#all").css("display","none");
		  page = 0;
		  activitypagingnext(${user.u_phone},2);
	  });
	  $(".myPublish").click(function(){
		  $("#now").css("display","none");
		  $("#myPublish").css("display","block");
		  $("#already").css("display","none");
		  $("#all").css("display","none");
		  page = 0;
		  activitypagingnext(${user.u_phone},3);
	  });
	  $("#zzcj").click(function(){
		  $("#already").css("display","none");
		  $("#now").css("display","block");
		  $("#myPublish").css("display","none");
		  $("#all").css("display","none");
		  page = 0;
		  activitypagingnext(${user.u_phone},1);
	  });
	  
  })
  function  usersetting(){
	  var formData = new FormData($("#usersettingform")[0]); 
	    $.ajax({  
	         url: 'setting/User' ,  
	         type: 'POST',  
	         data: formData, 
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false,  
	         success: function (returndata) { 
	         },  
	         error: function (returndata) {  
	              alert("添加失败");
	         }  
	    });
  }
  function pswsetting(){
	  var formData = new FormData($("#pswsettingform")[0]);
	  formData.set("newpsw",md5(formData.get("newpsw")));//md5加密
	    $.ajax({  
	         url:'setting/Psw' ,  
	         type: 'POST',  
	         data: formData, 
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false,  
	         success: function (returndata) { 
	         },  
	         error: function (returndata) {  
	              alert("添加失败");
	         }  
	    });
  }
  
  //下一页
  function activitypagingnext(phone,mark){
	  page++;
	  page = checkBounds(page,mark);
	  var formdata = new FormData();
	  formdata.append("page", page); 
	  formdata.append("phone", phone);
	  formdata.append("mark", mark);
	  $.ajax({  
	         url:'page/activity' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {
	        	 $("#mbody"+mark).html(returndata);
	        	 $("#cp"+mark).text("第"+page+"页");
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
   }
  
  //上一页
  function activitypagingback(phone,mark){
	  page--;
	  page = checkBounds(page,mark);
	  var formdata = new FormData();
	  formdata.append("page", page); 
	  formdata.append("phone", phone);
	  formdata.append("mark", mark);
	  $.ajax({  
	         url:'page/activity' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#mbody"+mark).html(returndata);
	        	 $("#cp"+mark).text("第"+page+"页");
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
   }
  
  //首页和尾页的处理
  function checkBounds(page,mark){
	  if(mark == 0){
		  if(page<1)
			  page = 1;
		  if(page>mtp)
			  page = mtp;
	  }else if(mark == 1){
		  if(page<1)
			  page = 1;
		  if(page>ztp)
			  page = ztp;
	  }else if(mark == 2){
		  if(page<1)
			  page = 1;
		  if(page>ytp)
			  page = ytp;
	  }else{
		  if(page<1)
			  page = 1;
		  if(page>wtp)
			  page = wtp;
	  }
	  return page;
  } 
  
  
	//我的游记下一页
	function nextpage(phone){
		npage++;
		if(npage>ntp){
			npage = ntp;
			return false;
		}
		var formdata = new FormData();
		formdata.append("npage", npage);
		formdata.append("phone", phone);
		$.ajax({  
	         url:'page/myPageArticle' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#NotePage").html(returndata);
	        	 ntp = $("#pt").text().charAt(1);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	//我的游记上一页
	function backpage(phone){
		npage--;
		if(npage<1){
			npage++;
			return false;
		}
		var formdata = new FormData();
		formdata.append("npage", npage);
		formdata.append("phone", phone);
		$.ajax({  
	         url:'page/myPageArticle' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#NotePage").html(returndata);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	function deleteNote(id,p,t,phone){
		var formdata = new FormData();
		formdata.append("npage", p);
		formdata.append("ntp", t);
		formdata.append("id", id);
		formdata.append("phone", phone);
		$.ajax({  
	         url:'page/delete' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#NotePage").html(returndata);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
  
  </script>
</head>
<body>
	<s:include value="nav.jsp"></s:include>
	<div id="mycontainer">
		<div id="h2btn">
			<img src="./user/images/papic.jpg" class="img-responsive"
				alt="Responsive image">
			<h2 id="publishtitle1">为何不自己来发布一个特别的活动呢？</h2>
			<a class="btn btn-lg" id="publishactivity"
				href="publishactivity?phone=${user.u_phone}">立即发布</a>
			<h2 id="publishtitle2">
				旅程仿佛“嗖”的一下就过去了，<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赶紧记录下那些难忘的回忆吧
			</h2>
			<a href="publishnote?phone=${user.u_phone}" class="btn btn-lg"
				id="publishnote">立即发布</a>
		</div>


		<div class="container-fluid">
			<div class="row setaccount" id="title">
				<div class="col-md-4 col-sm-4 col-xs-4" id="setaccount">
					<h2>基本资料</h2>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4" id="activityabstract">
					<h2>我的活动</h2>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4" id="travelnotes">
					<h2>我的游记</h2>
				</div>
			</div>
			<hr class="feature-divider">

			<!-- 账户设置 -->
			<div class="row setaccount content" id="content">
				<ul id="myTab1" class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#basicinfo" role="tab"
						data-toggle="tab">基本资料</a></li>
					<li><a href="#alterpassword" role="tab" data-toggle="tab">修改密码</a></li>
				</ul>

				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="basicinfo">
						<form class="form-horizontal" id="usersettingform"
							enctype="multipart/form-data" action="setting/user" method="post">
							<div class="form-group form-group-lg">
								<div class="col-md-11 col-sm-11 col-xs-11" id="picload">
									<div id="editAvatar">
										<div id="mypic" class="">
											<img src="${user.headimg}" alt="头像" id="uploadimg"
												class="uploadimg">
										</div>
										<div id="editText">更改头像</div>
										<input type="file"
											Style="opacity: 0; position: absolute; top: 130px; left: 35%; height: 30px; z-index: 2"
											name="headimg" id="file_upload">
									</div>
								</div>
							</div>
							<input type="hidden" name="sessionid" id="sessionid"
								value="${pageContext.session.id}">
							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>手机号码</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="number" readonly="readonly" name="user.u_phone"
										class="form-control" value="${user.u_phone}">
								</div>
							</div>
							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>你的昵称</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="text" class="form-control" name="user.u_name"
										value="${user.u_name}" placeholder="">
								</div>
							</div>

							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>你的姓名</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="text" class="form-control" name="user.realName"
										value="${user.realName}">
								</div>
							</div>

							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>你的性别</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<div class="radio radio-info radio-inline">
										<input type="radio" id="male" value="男" name="user.sex"
											checked> <label for="male">男</label>
									</div>
									<div class="radio radio-inline">
										<input type="radio" id="female" value="女" name="user.sex">
										<label for="female">女</label>
									</div>
								</div>
							</div>

							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>你的生日</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="date" class="form-control" name="user.birth"
										value="${user.birth}" />
								</div>
							</div>


							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>你的住址</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="text" class="form-control" name="user.address"
										value="${user.address}">
								</div>
							</div>

							<div class="form-group form-group-lg">
								<div class="col-md-12 col-sm-12 col-xs-12 infotitle infobtn">
									<button type="button" class="btn btn-lg btn-info"
										data-toggle="modal" data-target="#infomodal"
										onclick="return usersetting()">更改</button>
								</div>
							</div>
						</form>
					</div>
					<div role="tabpanel" class="tab-pane" id="alterpassword">
						<form class="form-horizontal" id="pswsettingform">
							<input type="hidden" name="phone" class="form-control"
								value="${user.u_phone}">
							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>你的新密码</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="password" class="form-control" name="newpsw" id=""
										placeholder="">
								</div>
							</div>
							<input type="hidden" name="sessionid" id="sessionid"
								value="${pageContext.session.id}">
							<div class="form-group form-group-lg">
								<div class="col-md-3 col-sm-3 col-xs-3 infotitle">
									<img src="./user/images/logo4.png">
									<div>确认新密码</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5">
									<input type="password" class="form-control" id=""
										placeholder="">
								</div>
							</div>

							<div class="form-group form-group-lg">
								<div class="col-md-12 col-sm-12 col-xs-12 infotitle infobtn">
									<button type="button" class="btn btn-lg btn-info"
										data-toggle="modal" data-target="#passmodal"
										onclick="pswsetting()">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>


			<!-- 我的活动 -->
			<div class="row activityabstract content" id="content">
				<div class="panel panel-default col-md-12 col-xs-12">
					<!-- Default panel contents -->
					<div class="panel-body">
						<ul id="myTab2" class="nav nav-pills" role="tablist">
							<li class="all active"><a href="#entering" role="tab"
								data-toggle="pill">所有活动</a></li>
							<li id="zzcj"><a href="#entering" role="tab"
								data-toggle="pill">正在参加</a></li>
							<li class="already"><a href="#entered" role="tab"
								data-toggle="pill">已参加</a></li>
							<li class="myPublish"><a href="#mypublish" role="tab"
								data-toggle="pill">我的发布</a></li>
						</ul>
						<div class="dropdown" id="dropdown">
							<button class="btn btn-default dropdown-toggle btn-lg"
								type="button" id="dropdownMenu1" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="true">
								排序 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
								<li><a href="#">按时间</a></li>
								<li><a href="#">按名称</a></li>
							</ul>
						</div>
					</div>


					<!-- Table -->
					<div class="tab-content" id="all">
						<div role="tabpanel" class="tab-pane active" id="entering">
							<table class="table">
								<thead>
									<tr>
										<th>活动名</th>
										<th>时间</th>
										<th>地点</th>
										<th>参加人数</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mbody0" class="tbody">

									<c:forEach items="${myActivities }" var="a">
										<tr>
											<td><a
												href="detail?aid=${a.a_id }&phone=${user.u_phone}">${a.a_name }</a></td>
											<td>${a.startDate }—— ${a.endDate }</td>
											<td>${a.village.v_name }</td>
											<td>${a.currentPeople }</td>
											<td><button class="btn btn-danger delrecord"
													type="button"
													onclick="window.location.href='detail?aid=${a.a_id }&phone=${user.u_phone}'">查看记录</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation" id="page">
								<ul class="pagination">
									<li><a href="javascript:void(0)" aria-label="Previous">
											<span aria-hidden="true"
											onclick="activitypagingback(${user.u_phone},0)">上一页</span>
									</a></li>
									<li><span id="cp0">第${page }页</span></li>
									<li><span>共${mtp}页</span></li>
									<li><a href="javascript:void(0)" aria-label="Next"
										onclick="activitypagingnext(${user.u_phone},0)"> 下一页 </a></li>
								</ul>
							</nav>
						</div>
					</div>


					<div class="tab-content" id="now">
						<div role="tabpanel" class="tab-pane active" id="entering">
							<table class="table">
								<thead>
									<tr>
										<th>活动名</th>
										<th>时间</th>
										<th>地点</th>
										<th>参加人数</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mbody1" class="tbody">

									<c:forEach items="${zzcj }" var="a">
										<tr>
											<td><a
												href="detail?aid=${a.a_id }&phone=${user.u_phone}">${a.a_name }</a></td>
											<td>${a.startDate }—— ${a.endDate }</td>
											<td>${a.village.v_name }</td>
											<td>${a.currentPeople }</td>
											<td><button class="btn btn-danger delrecord"
													type="button"
													onclick="window.location.href='detail?aid=${a.a_id }&phone=${user.u_phone}'">查看记录</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation" id="page">
								<ul class="pagination">
									<li><a href="javascript:void(0)" aria-label="Previous">
											<span aria-hidden="true"
											onclick="activitypagingback(${user.u_phone},1)">上一页</span>
									</a></li>
									<li><span id="cp1">第${page }页</span></li>
									<li><span>共${ztp}页</span></li>
									<li><a href="javascript:void(0)" aria-label="Next"
										onclick="activitypagingnext(${user.u_phone},1)"> 下一页 </a></li>
								</ul>
							</nav>
						</div>
					</div>


					<div class="tab-content" id="already">
						<div role="tabpanel" class="tab-pane active" id="entering">
							<table class="table">
								<thead>
									<tr>
										<th>活动名</th>
										<th>时间</th>
										<th>地点</th>
										<th>参加人数</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mbody2" class="tbody">

									<c:forEach items="${ycj }" var="a">
										<tr>
											<td><a
												href="detail?aid=${a.a_id }&phone=${user.u_phone}">${a.a_name }</a></td>
											<td>${a.startDate }—— ${a.endDate }</td>
											<td>${a.village.v_name }</td>
											<td>${a.currentPeople }</td>
											<td><button class="btn btn-danger delrecord"
													type="button"
													onclick="window.location.href='detail?aid=${a.a_id }&phone=${user.u_phone}'">查看记录</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation" id="page">
								<ul class="pagination">
									<li><a href="javascript:void(0)" aria-label="Previous">
											<span aria-hidden="true"
											onclick="activitypagingback(${user.u_phone},2)">上一页</span>
									</a></li>
									<li><span id="cp2">第${page }页</span></li>
									<li><span>共${ytp}页</span></li>
									<li><a href="javascript:void(0)" aria-label="Next"
										onclick="activitypagingnext(${user.u_phone},2)"> 下一页 </a></li>
								</ul>
							</nav>
						</div>
					</div>


					<div class="tab-content" id="myPublish">
						<div role="tabpanel" class="tab-pane active" id="entering">
							<table class="table">
								<thead>
									<tr>
										<th>活动名</th>
										<th>时间</th>
										<th>地点</th>
										<th>参加人数</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mbody3" class="tbody">

									<c:forEach items="${wdfb }" var="a">
										<tr>
											<td><a
												href="detail?aid=${a.a_id }&phone=${user.u_phone}">${a.a_name }</a></td>
											<td>${a.startDate }—— ${a.endDate }</td>
											<td>${a.village.v_name }</td>
											<td>${a.currentPeople }</td>
											<td><button class="btn btn-danger delrecord"
													type="button"
													onclick="window.location.href='detail?aid=${a.a_id }&phone=${user.u_phone}'">查看记录</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation" id="page">
								<ul class="pagination">
									<li><a href="javascript:void(0)" aria-label="Previous">
											<span aria-hidden="true"
											onclick="activitypagingback(${user.u_phone},3)">上一页</span>
									</a></li>
									<li><span id="cp3">第${page }页</span></li>
									<li><span>共${wtp}页</span></li>
									<li><a href="javascript:void(0)" aria-label="Next"
										onclick="activitypagingnext(${user.u_phone},3)"> 下一页 </a></li>
								</ul>
							</nav>
						</div>
					</div>

				</div>
			</div>

			<!-- 我的游记 -->
			<div class="row travelnotes content">
				<div class="panel panel-default col-md-12 col-sm-12 col-xs-12" id="content">
					<!-- Default panel contents -->
					<div class="panel-body">
						<form class="navbar-form navbar-right">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">搜索</button>
						</form>
					</div>
					<!-- 游记和分页条开始 -->
					<div id="NotePage">
						<c:forEach items="${notes }" var="note">
							<!-- 游记列表 -->
							<div class="panel panel-info container-fluid notepanel">
								<div class="panel-heading row">
									<div class="col-md-8 col-sm-8 col-xs-8" id="travelnotetitle">
										<a href="article?tid=${note.t_id }&phone=${phone}">${note.title }</a>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3" id="travelnotetime">${note.t_date }</div>
									<button type="button" class="close"
										onclick="return deleteNote(${note.t_id},${npage},${ntp},${user.u_phone })">
										<span>&times;</span><span class="sr-only">删除</span>
									</button>
								</div>
								<div class="panel-body row" id="travelnotebody">
									<div class="col-md-6 col-sm-6 col-xs-6" id="notecontent">
										${note.t_desc }</div>
									<div class="col-md-3 col-sm-3 col-xs-3" id="notepic">
										<img src="${note.coverimg }" class="img-rounded">
									</div>

								</div>
							</div>
						</c:forEach>

						<!-- 分页 -->
						<nav aria-label="Page navigation" id="page">
							<ul class="pagination">
								<li><a class="norunback" onclick="backpage(${phone })"
									href="#content">上一页</a></li>
								<li><span id="cp">第${npage }页</span></li>
								<li><span id="pt">共${ntp }页</span></li>
								<li><a class="norunnext" onclick="nextpage(${phone })"
									href="#content">下一页</a></li>
							</ul>
						</nav>
					</div>
					<!-- 游记和分页条结束 -->
				</div>
			</div>
		</div>


		<div class="modal fade" id="infomodal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-body" id="infocontent">成功修改个人信息！</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="passmodal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-body" id="passcontent">成功修改密码！</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>


</html>