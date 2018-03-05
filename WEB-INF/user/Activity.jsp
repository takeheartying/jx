<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的游记</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="user/css/style.css">

<link rel="stylesheet"
	href="user/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<link href="user/css/froala_editor.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="user/css/activityDetails.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">
<script type="text/javascript">
	function join(aid){
		if(confirm("您确定要报名吗？")){
		 var formData = new FormData();
		 formData.append("aid",aid);
		    $.ajax({  
		         url: 'joinactivity' ,  
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
		else{
			return false;
		}
	}
</script>

</head>
<body>
	<s:include value="nav.jsp"></s:include>
	<div id="banner"
		style="background: url(user/images/villageimage.jpg) center no-repeat; background-size: 100%; height: 480px;">
		<div class="LeftBanner">
			<a class="btn "><span>已参加<joinNumber>${activity.currentPeople }</joinNumber></span><i
				class="glyphicon glyphicon-cd" aria-hidden="true"></i></a> <a
				class="btn " id="bannerSignUpBtn" href="#run"><span>立即报名</span><i
				class="glyphicon glyphicon-dashboard" aria-hidden="true"></i></a>
				<a class="btn" id="trumbsUp">
					<span id="trumbsUpSpan">我要点赞</span>
					<i class="glyphicon glyphicon-info-sign" aria-hidden="true"></i>
				</a>

		</div>
		<div class="myThumbsUp" activityId="${activity.a_id}">
			<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp赞(
			<ThumbsUpNumber activityId="${activity.a_id}">${activity.praiseQuantity }</ThumbsUpNumber>
			)
		</div>
	</div>
	<div class="mainMenu">
		<ul id="run">
			<li class="fee"><a class="changeA">费用说明</a></li>
			<li class="travelNotes"><a>旅行游记</a></li>
			<li class="arrangements"><a>活动安排</a></li>
			<li class="notice"><a>注意事项</a></li>
			<li class="attention"><a>申请要求</a></li>
			<li class="signUp"><a>我要报名</a></li>
		</ul>
	</div>
	<!-- travelNotesPage:我的游记页面：———————————————————————————————————————————————————— -->
	<div id="travelNotesPage" class="mypageDiv">
		<div class="contentDiv">
			<div class="content" id="TimeTravelContent">
				<div class="title">-----&nbsp时光旅行&nbsp-----</div>
				<div class="contentBody">
					<i class="fa fa-paper-plane-o fa-4x" aria-hidden="true"></i>
					<section class="timeline">
					
					
					
						<div class="wrapper">
<s:iterator value="listNotes" var="note" status="status">
		<c:if test="${status.count%2!=0}">
							<div class="timeline__item timeline__item--0 timeline__item-bg">
								<div class="timeline__item__station"></div>
								<div class="timeline__item__content"  
									onclick="window.location.href='article?tid=${note.t_id }&a_id=${activity.a_id}&phone=${phone}'">

									<div class="ribbon">
										<div class="ribbonLable">
											<c:if test="${isNew eq '1'}">
												<div class="ribbon">
													<div class="ribbonLable">最新</div>
												</div>
											</c:if>
											<c:if test="${isNew eq '0'}"></c:if>
										</div>
									</div>
									<div class="coverContent">
										<h4 class="timeline__item__content__title">${note.title }</h4>
										<p class="timeline__item__content__date">${note.t_date }</p>
										<p class="timeline__item__content__description">${note.t_desc }</p>
										<span class="timeline__item__content__author">作者:${noters.get(status.index).u_name }</span> <span
											class="timeline__item__content__readCount">阅读:${note.readQuantity }</span>
									</div>
									<div class="coverBg"></div>
								</div>
							</div>
		</c:if>
							<!-- end timeline__item -->
		<c:if test="${status.count%2==0}">
							<div class="timeline__item timeline__item--1">
								<div class="timeline__item__station"></div>
								<div class="timeline__item__content" onclick="window.location.href='article?tid=${note.t_id }&a_id=${activity.a_id}&phone=${phone}'" >
									<div class="coverContent">
										<h4 class="timeline__item__content__title">${note.title }</h4>
										<p class="timeline__item__content__date">${note.t_date }</p>
										<p class="timeline__item__content__description">${note.t_desc }</p>
										<span class="timeline__item__content__author">作者:${noters.get(status.index).u_name }</span> <span
											class="timeline__item__content__readCount">阅读:${note.readQuantity }</span>

									</div>
									<div class="coverBg"></div>

								</div>
							</div>
		</c:if>						
</s:iterator>



						</div>
					</section>

					<!-- 显示更多按钮：							 -->
					<button class="btn" id="showMoreBtn">显示更多</button>
				</div>

				
			<!-- end content -->	
			</div>
		</div>
	</div>


	<!-- arrangementsPage:活动安排页面：—————————————————————————————————————————————————— -->
	<div id="arrangementsPage" class="mypageDiv">
		<div class="contentDiv">
			<div class="content" id="activeBriefContent">
				<div class="title">
					<i class="glyphicon glyphicon-record"></i> 活动简介
				</div>
				<div class="contentBody" id="activeBriefBody">
					<div class="col-xs-7 activityTextDiv">
						<div class="TFcorner">
							<div class="Tcorner"></div>
							<div class="Lcorner"></div>
						</div>
						<p class="activityText">${activity.summary }</p>
					</div>
					<div class="col-xs-5 activityPicDiv">

						<img src="${activity.image_summary }">
						<div class="BRcorner">
							<div class="Bcorner"></div>
							<div class="Rcorner"></div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="content" id="activityInfContent">
				<div class="title">
					<i class="glyphicon glyphicon-record"></i> 活动细则
				</div>
				<div class="contentBody" id="activityInfBody">
					<div class="col-xs-5 activityPicDiv">

						<img src="${activity.image_detail }">
						<div class="BLcorner">
							<div class="Bcorner"></div>
							<div class="Lcorner"></div>
						</div>
					</div>
					<div class="col-xs-7 activityTextDiv">
						<div class="TRcorner">
							<div class="Tcorner"></div>
							<div class="Rcorner"></div>
						</div>
						<div class="activityText">
							<div class="PIDiv">
								<div class="PIDivTitle">
									<i class="glyphicon glyphicon-time"></i> 活动时间
								</div>
								<div class="infor">${activity.startDate }至${activity.endDate }</div>
							</div>
							<div class="PIDiv">
								<div class="PIDivTitle">
									<i class="glyphicon glyphicon-credit-card"></i>活动经费
								</div>
								<div class="infor">￥${activity.totalCost }/人</div>
							</div>
							<div class="PIDiv">
								<div class="PIDivTitle">
									<i class="glyphicon glyphicon-user"></i>活动人数
								</div>
								<div class="infor">${activity.requiredPeople }人（最少${activity.minPeople }人成团）</div>
							</div>
							<div class="PIDiv">
								<div class="PIDivTitle">
									<i class="glyphicon glyphicon-calendar"></i>截止日期
								</div>
								<div class="infor">${activity.closingDate }</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<hr />
			<!-- end content -->
			<div class="content" id="SchedulingContent">
				<div class="title">
					<i class="glyphicon glyphicon-record"></i> 行程安排
				</div>
				<div class="contentBody" id="SchedulingBody">
					<!-- <div id="verticalLine"></div>	 -->
					
				<!-- 上边的两个左右直角 -->	
				<div class="TFcorner" id="firstTFcorner">
					<div class="Tcorner"></div>
					<div class="Lcorner"></div>
				</div>	
				<div class="TRcorner" id="firstTRcorner">
					<div class="Tcorner"></div>
					<div class="Rcorner"></div>
				</div>
				
<c:forEach items="${schedules }" var="schedule" varStatus="status">
		<c:if test="${status.count%2!=0}">
					<div class="SchedulingItem">
						<div class="col-xs-6 activityTextDiv">
							<div class="activityText">
								<div class="date">day ${schedule.startDay } to day ${schedule.endDay }</div>
								<p class="dayThings">${schedule.arrangement }</p>
							</div>
						</div>
						<div class="col-xs-6 activityPicDiv">
							<img src="${schedule.image }">
						</div>
					</div>
		</c:if>							
					<!-- end SchedulingItem -->
		<c:if test="${status.count%2==0}">
					<div class="SchedulingItem">
						<div class="col-xs-6 activityPicDiv">
							<img src="${schedule.image }" style="float: right;">
						</div>
						<div class="col-xs-6 activityTextDiv">
							<div class="activityText">
								<div class="date">${schedule.startDay } to day ${schedule.endDay }</div>
								<p class="dayThings">${schedule.arrangement }</p>
							</div>
						</div>
					</div>
		</c:if>
</c:forEach>					
					<!-- 下边的两个左右直角 -->
					<div class="BLcorner" id="lastBLcorner">
						<div class="Bcorner"></div>
						<div class="Lcorner"></div>
					</div>
					<div class="BRcorner" id="lastBRcorner">
						<div class="Bcorner"></div>
						<div class="Rcorner"></div>
					</div>
					
					
					<!-- end SchedulingItem -->
				</div>
			</div>
			<hr />
		</div>
		
	</div>
	<!-- noticePage:注意事项页面：—————————————————————————————————————————————— -->
	<div id="noticePage" class="mypageDiv">
		<div class="contentDiv">
			<div class="content">
				<div class="title">
					<i class="fa fa-exclamation-circle fa-2x" aria-hidden="true"></i>
					安全事项
				</div>
				
				
				<div class="contentBody">
<s:iterator value="safetyTips" var="safetyTip" status="status">
					<div>
						<span>${status.count }</span>
						<p>${safetyTip.tip }</p>
					</div>
</s:iterator>
				</div>
			</div>
			<!-- end content -->
			<div class="content">
				<div class="title">
					<i class="glyphicon glyphicon-info-sign"  style="font-size:38px;"></i> 活动贴士
				</div>
				<div class="contentBody">
<s:iterator value="activityTips" var="activityTip" status="status">
					<div>
						<span>${status.count }</span>
						<p>${activityTip.tip }</p>
					</div>
</s:iterator>
				</div>
			</div>
			
		</div>
	</div>
	<!-- fee:费用说明页面 ———————————————————————————————————————————————————————————————————-->
	<div id="feePage" class="mypageDiv">
		<div class="contentDiv">
			<div class="content" id="#carousel">

				<div class="circle-container parent">
					<!-- 包含费用的项目数量： -->
<c:forEach items="${costDetails }" var="costDetail">
					<costItem class="hasItem">${costDetail.contain }</costItem>
</c:forEach>

					<!-- Used for more of a gyroscope type effect -->
					<div class="outer-outer-ring"></div>
					<div class="circle">
						<div class="front">
							<p>
								活动包含<br> 总计费用:￥${activity.totalCost }/人<br> 预付费用:￥${activity.deposit }/人
							</p>
						</div>
						<div class="back">
							<img class="back-logo" src="user/images/costBack.jpg"
								alt="The Elevation Group Logo" />
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- attention:申请要求页面：-———————————————————————————————————————————————————————— -->
	<div id="attentionPage" class="mypageDiv">
		<div class="contentDiv">
			<div class="content">
				<div class="title">
					<i class="fa fa-pencil-square fa-2x" aria-hidden="true"></i></i> 报名流程
				</div>
				<div class="contentBody2">
					<div class="col-sm-6">
						<span>step.1</span>
						<p>
							<i class="fa fa-calendar-check-o fa-2x" aria-hidden="true"></i>选择出行项目
							提交报名表
						</p>
					</div>
					<div class="col-sm-6">
						<span>step.2</span>
						<p>
							<i class="fa fa-money fa-2x" aria-hidden="true"></i> 联系负责人 支付预付款
						</p>
					</div>
					<div class="col-sm-12">
						<span>step.3</span>
						<p>
							<i class="fa fa-envelope-o fa-2x" aria-hidden="true"></i>收到短信和邮件通知
							准备行程
						</p>
					</div>
					<div class="col-sm-6">
						<span>step.4</span>
						<p>
							<i class="fa fa-book fa-2x" aria-hidden="true"></i>领队在出发前组织
							请进行配合哦！
						</p>
					</div>
					<div class="col-sm-6">
						<span>step.5</span>
						<p>
							<i class="fa fa-car fa-2x" aria-hidden="true"></i>按时到达集合点 一起出发喽！
						</p>
					</div>

				</div>
			</div>
			<hr />
			<div class="content">
				<div class="title">
					<i class="fa fa-file-text-o fa-2x" aria-hidden="true"></i> 申请须知
				</div>
				<div class="contentBody">
<c:forEach items="${applyNotices }" var="applyNotice" varStatus="status">
					<div class="col-sm-6">
						<div>NO.${status.count }</div>
						<p>${applyNotice.notice }</p>
					</div>
</c:forEach>
				</div>
			</div>
			<hr />
			<!-- end content -->

		</div>
	</div>
	<!-- signUpPage:我要报名页面：——————————————————————————————————————————————————————— -->
	<div id="signUpPage" class="mypageDiv">
		<div class="contentDiv">
			<div class="content">
				<div class="title" id="activityInfTitle">
					<i class="fa fa-angle-double-right fa-2x" aria-hidden="true"></i> <span>活动信息</span>
					<i class="fa fa-angle-double-left fa-2x" aria-hidden="true"></i>
				</div>
				<div class="contentBody">
					<div class="col-xs-12">
						<div class="col-xs-6">活动名称</div>
						<div class="col-xs-6">${activity.a_name }</div>
					</div>
					<div class="col-xs-12">
						<div class="col-xs-6">活动时间</div>
						<div class="col-xs-6">${activity.startDate }至${activity.endDate }</div>
					</div>
					<div class="col-xs-12">
						<div class="col-xs-6">项目费用</div>
						<div class="col-xs-6">￥${activity.totalCost }/人</div>
					</div>
					<div class="col-xs-12">
						<div class="col-xs-6">集合地点</div>
						<div class="col-xs-6">${activity.gatherPlace }</div>
					</div>
					<div class="col-xs-12">
						<div class="col-xs-6">目的地点</div>
						<div class="col-xs-6">${village.v_name }</div>
					</div>
					<div class="col-xs-12">
						<div class="col-xs-6">活动类型</div>
						<div class="col-xs-6">${activity.type }</div>
					</div>
					<div class="col-xs-12">
						<div class="col-xs-6">负责人联系方式</div>
						<div class="col-xs-6">${publisher.u_phone }</div>
					</div>
				</div>
			</div>
			<hr />
			</div>
			
		<!-- end modal	 -->
		<div id="signUpBtnDiv" class="container">
			<a id="signUpBtn" class="btn" data-toggle="modal" data-target="" onclick="join(${activity.a_id })">我要报名</a>
		</div>
	</div>
	
	<div class="modal fade" id="signUpSuccessModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						报名已成功！
					</div>
					<div class="modal-footer cneter-block" id="successModal-footer">
						<button type="button" class="btn confirmBtn" id="successBtn"
							data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>


<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script src="user/js/libs/jquery-1.11.1.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="user/js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="user/js/activityDetails.js"></script>
<script src="user/js/froala_editor.min.js"></script>
<script src="user/js/plugins/tables.min.js"></script>
<script src="user/js/plugins/lists.min.js"></script>
<script src="user/js/plugins/colors.min.js"></script>
<script src="user/js/plugins/media_manager.min.js"></script>
<script src="user/js/plugins/font_family.min.js"></script>
<script src="user/js/plugins/font_size.min.js"></script>
<script src="user/js/plugins/block_styles.min.js"></script>
<script src="user/js/plugins/video.min.js"></script>


</body>
<script type="text/javascript">
	//活动点赞
	$(document).on("click", ".myThumbsUp", function(){
		var $spanNode = $($(this).children().get(1));
		var activityId = $spanNode.attr("activityId");
		var aid = parseInt(activityId);
		var formdata = new FormData();
		formdata.append("aid", aid);
		$.ajax({  
	         url:'ActivityPraise' ,  
	         type: 'POST', 
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {    
	        	 var data = returndata.trim().split(",");
	        	 $("thumbsupnumber[activityId=" + aid + "]").html(data[0]);
	        	 var isPraise = parseInt(data[1]);
	        	 if(1 == isPraise){
	        		 $("div[activityId=" + aid + "]").css("color","red");
	             }else{
	            	 $("div[activityId=" + aid + "]").css("color","black"); 
	             }
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  	});
	} );
	
	//活动点赞(改变文字)
	$(document).on("click", ".trumbsUp", function(){
		var $spanNode = $($(this).children().get(1));
		var activityId = $spanNode.attr("activityId");
		var aid = parseInt(activityId);
		var formdata = new FormData();
		formdata.append("aid", aid);
		$.ajax({  
	         url:'ActivityPraise' ,  
	         type: 'POST', 
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {    
	        	 var data = returndata.trim().split(",");
	        	 $("thumbsupnumber[activityId=" + aid + "]").html(data[0]);
	        	 var isPraise = parseInt(data[1]);
	        	 if(1 == isPraise){
	        		 $("div[activityId=" + aid + "]").css("color","red");
	             }else{
	            	 $("div[activityId=" + aid + "]").css("color","black"); 
	             }
	        	 if($(".promptLine").is(':hidden')&&$(".col-xs-12 input").val()!=""&&flag=="hideFlag"){
	        		 $("#signUpPage #signUpBtn").attr("data-target","#signUpModal");
	        	 }else{
	        		 $("#signUpPage #signUpBtn").attr("data-target","#signUpFailModal")
	        	 } 
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  	});
	} );
</script>
</html>