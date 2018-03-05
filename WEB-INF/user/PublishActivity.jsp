<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>发布活动</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<script src="user/js/publishactivity.js"></script>
<link rel="stylesheet" href="user/css/style.css">
<link rel="stylesheet" href="user/css/publishactivity.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">
<script type="text/javascript">
	function pubactivity(){
		 var formData = new FormData($("#pubform")[0]); 
		    $.ajax({  
		         url: 'pubactivity' ,  
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
</script>
</head>
<body>

	<s:include value="nav.jsp"></s:include>
	<div id="mycontainer">
		<div>

			<img src="user/images/papic.jpg" class="img-responsive"
				alt="Responsive image">
		</div>
		<div id="title">
			<h2>发布活动</h2>
		</div>
		<!-- 活动基本信息 -->
		<form class="form-horizontal" id="pubform">
			<div class="form-group form-group-lg">
				<label for="activityname"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-user"></span>&nbsp;活动名称</label>
				<div class="col-md-7 col-sm-7 col-xs-7">
					<input type="text" class="form-control" id="activityname"
						name="sactivity.a_name" placeholder="">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label for="activitydate"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-time"></span>&nbsp;活动时间</label>
				<div class="col-md-3 col-sm-3 col-xs-3 datediv">
					<input type="date" class="form-control" id="activitydate"
						placeholder="" name="sactivity.a_startDate">
				</div>
				<label for="activitydate"
					class="col-md-1 col-sm-1 col-xs-1 control-label" id="label2">至</label>
				<div class="col-md-3 col-sm-3 col-xs-3 datediv">
					<input type="date" class="form-control" id="activitydate"
						 name="sactivity.a_endDate">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label for="destination"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-map-marker"></span>&nbsp;目的地点</label>
				<div class="col-md-7 col-sm-7 col-xs-7">
					<input type="text" class="form-control" id="destination"
						placeholder="" name="sactivity.destination">
				</div>
			</div>

			<div class="form-group form-group-lg">
				<label for="activitytype"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-tasks"></span>&nbsp;活动类型</label>
				<div class="col-md-9 col-sm-9 col-xs-9 choosebox">
					<ul class="clearfix">
						<li><input type="radio" name="sactivity.type" value="募集捐款" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">募集捐款</a></li>
						<li><input type="radio" name="sactivity.type" value="动物保护" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">动物保护</a></li>
						<li><input type="radio" name="sactivity.type" value="走进空巢" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">走进空巢</a></li>
						<li><input type="radio" name="sactivity.type" value="环境保护" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">环境保护</a></li>
						<li><input type="radio" name="sactivity.type" value="生活服务" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">生活服务</a></li>
						<li><input type="radio" name="sactivity.type" value="心灵讲堂" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">心灵讲堂</a></li>
						<li><input type="radio" name="sactivity.type" value="健康维护" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">健康维护</a></li>
						<li><input type="radio" name="sactivity.type" value="乡村支教" id="" /> <a
							href="javascript:void(0);" class="size_radioToggle">乡村支教</a></li>
					</ul>
				</div>
			</div>

			<div class="form-group form-group-lg">
				<label for="activitynum"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-menu-hamburger"></span>&nbsp;活动人数</label>
				<div class="col-md-7 col-sm-7 col-xs-7">
					<input type="number" class="form-control" id="activitynum"
						placeholder="" name="requiredPeople">
				</div>
			</div>


			<div class="form-group form-group-lg">
				<label for="activityintroduce"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-header"></span>&nbsp;活动简介</label>
				<div class="col-md-3 col-sm-3 col-xs-3">
					<textarea class="form-control" rows="3" id="activityintroduce" form="pubform" name="sactivity.summary"></textarea>
				</div>
			</div>
			<!-- 费用要求 -->
			<div class="form-group form-group-lg">
				<label for="activitymoney"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-jpy"></span>&nbsp;活动总费用(元/人)</label>
				<div class="col-md-5 col-sm-5 col-xs-5">
					<input type="text" class="form-control" id="activitymoney"
						placeholder="" name="sactivity.totalCost">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label for="subscription"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-usd"></span>&nbsp;预付定金(元/人)</label>
				<div class="col-md-5 col-sm-5 col-xs-5">
					<input type="text" class="form-control" id="subscription"
						placeholder="" name="sactivity.deposit">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label for="paycontent"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-file"></span>&nbsp;费用内容(选择包含的内容)</label>
				<div class="choosetext"></div>
				<div class="col-md-9 col-sm-9 col-xs-9 choosebox">
					<ul class="clearfix">
						<li><input type="checkbox" name="name[0]" value="车辆" id="" /> <a
							href="javascript:void(0);" class="size_checkboxToggle">车辆</a></li>
						<li><input type="checkbox" name="name[1]" value="住宿" id="" /> <a
							href="javascript:void(0);" class="size_checkboxToggle">住宿</a></li>
						<li><input type="checkbox" name="name[2]" value="领队" id="" /> <a
							href="javascript:void(0);" class="size_checkboxToggle">领队</a></li>
						<li><input type="checkbox" name="name[3]" value="保险" id="" /> <a
							href="javascript:void(0);" class="size_checkboxToggle">保险</a></li>
						<li><input type="checkbox" name="name[4]" value="公用装备" id="" />
							<a href="javascript:void(0);" class="size_checkboxToggle">公用装备</a></li>
						<li><input type="checkbox" name="name[5]" value="往返交通" id="" />
							<a href="javascript:void(0);" class="size_checkboxToggle">往返交通</a></li>
						<li><input type="checkbox" name="name[6]" value="单房差" id="" />
							<a href="javascript:void(0);" class="size_checkboxToggle">单房差</a></li>
						<li><input type="checkbox" name="name[7]" value="体验项目" id="" />
							<a href="javascript:void(0);" class="size_checkboxToggle">体验项目</a></li>
						<li><input type="checkbox" name="name[8]" value="个人消费" id="" />
							<a href="javascript:void(0);" class="size_checkboxToggle">个人消费</a></li>
						<li><input type="checkbox" name="name[9]" value="用餐" id="" /> <a
							href="javascript:void(0);" class="size_checkboxToggle">用餐</a></li>
					</ul>
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label for="activitydetail"
					class="col-md-2 col-sm-2 col-xs-2 control-label"><span
					class="glyphicon glyphicon-book"></span>&nbsp;活动详情</label>
				<div class="col-md-7 col-sm-7 col-xs-7" id="activitydetails">
					<div id="activitydetail" class="activitydetail">
						<div class="form-group" id="detailfirst">
							<label class="col-md-1 col-sm-1 col-xs-1 control-label">
								第</label>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<input type="number" class="form-control sady" id="activitynum1"
									placeholder="" name="sday[0]">
							</div>
							<label class="col-md-3 col-sm-3 col-xs-3 control-label"
								style="text-align: left;">天&nbsp;——&nbsp;第</label>
							<div class="col-md-3 col-sm-3 col-xs-3">
								<input type="number" class="form-control eday" id="activitynum2"
									placeholder="" name="eday[0]">
							</div>
							<label class="col-md-1 col-sm-1 col-xs-1 control-label">天</label>
						</div>
						<div class="form-group">
							<label class="col-md-4 col-sm-4 col-xs-4 control-label">
								行程安排：</label>
							<div class="col-md-7 col-sm-7 col-xs-7">
								<textarea class="form-control con" rows="3" form="pubform" name="content[0]"></textarea>
							</div>
						</div>
					
						<div class="col-md-12 col-sm-12 col-xs-12" id="del-schedule">
							<button class="btn btn-info btn-sm del-schedule" type="button">删除行程</button>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12" id="add-schedule">
						<button class="btn btn-info" type="button">添加行程</button>
					</div>
				</div>
			</div>
			<div id="complete" class="col-md-12 col-sm-12 col-xs-12">
				<button type="button" class="btn btn-info btn-lg complete"
					data-toggle="modal" data-target="#alertmodal" onclick="pubactivity()">我要发布</button>
			</div>
		</form>
		<div class="modal fade" id="alertmodal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-body" id="alertcontent">成功发布活动！</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-dismiss="modal"
							id="returnbtn">确定</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>