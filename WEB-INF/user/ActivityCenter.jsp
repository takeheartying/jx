<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>活动简录</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="user/css/style.css">
<link rel="stylesheet" href="user/css/activeBrief.css">
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<link rel="stylesheet"
	href="user/css/font-awesome.min.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">
<link rel="stylesheet" media="screen" href="user/css/zz.css" />

<script type="text/javascript">
	var page = 1;
	var atp = ${atp};
	atp = parseInt(atp);
	var condition = new Array("全部","全部","全部");
	
	//多条件查询分页活动首次加载及下一页查询
	function activityselect(obj,con,index){
		if($(obj).text()!="下一页"){
			page = 1;
			con[index] = $(obj).text();
		}else{
			page++;
			if(page>atp){
				page=atp;
				return false;
			}
		}
		
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("phone", ${user.u_phone});
		formdata.append("condition[0]", con[0]);
		formdata.append("condition[1]", con[1]);
		formdata.append("condition[2]", con[2]);
		$.ajax({  
	         url:'page/ActivitySelectLoadPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#activityPage").html(returndata);	 
	        	 atp = $("#pt").text().charAt(1);
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
		formdata.append("phone", ${user.u_phone});
		formdata.append("condition[0]", condition[0]);
		formdata.append("condition[1]", condition[1]);
		formdata.append("condition[2]", condition[2]);
		$.ajax({  
	         url:'page/ActivitySelectLoadPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#activityPage").html(returndata);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	
</script>

</head>
<body style=" background: 	/* Safari 5.1 - 6.0 */
  background: -webkit-linear-gradient(-20deg,#A5D2CF,#C0C7BF,#BCD3C0,#CAD4B9,#E6D5CE,#D2F2ED);
  /* Opera 11.1 - 12.0 */
  background: -o-linear-gradient(-20deg,#A5D2CF,#C0C7BF,#BCD3C0,#CAD4B9,#E6D5CE,#D2F2ED);
  /* Opera 11.1 - 12.0 */
  /* Firefox 3.6 - 15 */
  background: -moz-linear-gradient(-20deg,#A5D2CF,#C0C7BF,#BCD3C0,#CAD4B9,#E6D5CE,#D2F2ED);
  /* Opera 11.1 - 12.0 */
  /* 鏍囧噯鐨勮娉� */
  background: linear-gradient(-20deg,#A5D2CF,#C0C7BF,#BCD3C0,#CAD4B9,#E6D5CE,#D2F2ED);
  /* Opera 11.1 - 12.0 */">
  <s:include value="nav.jsp"></s:include>
	<div style="width:100%;height:100px;   "></div>
	<div id="mycontainer">
		<p id="poetry">     	从前的日色变得慢 
		           车，马，邮件都慢 
		                        一生只够爱一个人 
		                        	—— 木心</p>
		<i class="fa fa-paperclip" aria-hidden="true" id="paper-clip"></i>
		<div id="classification">
			<ul>
				<li class="ulLabel disabled" >活动:</li>
				<li class="choosen" onclick="activityselect(this,condition,0)">全部</li>
				<li onclick="activityselect(this,condition,0)">进行中</li>
				<li onclick="activityselect(this,condition,0)">已结束</li>
				<li onclick="activityselect(this,condition,0)">报名中</li>
				<li onclick="activityselect(this,condition,0)">报名已截止</li>
			</ul>
			<ul>
				<li class="ulLabel">分类:</li>
				<li class="choosen" onclick="activityselect(this,condition,1)">全部</li>
				<li onclick="activityselect(this,condition,1)">募集捐款</li>
				<li onclick="activityselect(this,condition,1)">动物保护</li>
				<li onclick="activityselect(this,condition,1)">走进空巢</li>
				<li onclick="activityselect(this,condition,1)">环境保护</li>
				<li onclick="activityselect(this,condition,1)">生活服务</li>
				<li onclick="activityselect(this,condition,1)">心灵讲座</li>
				<li onclick="activityselect(this,condition,1)">健康维护</li>
				<li onclick="activityselect(this,condition,1)">乡村支教</li>
				<li class="" data-toggle="modal" data-target="#moreActivitiesModal">
					<span id="moreActivities">更多</span> <span
					class="glyphicon glyphicon-chevron-down" id="moreActivitiesIcon"></span>
				</li>
			</ul>
			<!-- Modal:#moreActivitiesModal-->
			<div class="modal fade" id="moreActivitiesModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel1">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 选择你最心仪的活动吧！ -->
							<i class="fa fa-podcast fa-2x" aria-hidden="true"></i>&nbsp&nbspCome
							on! Join us now!
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>

						</div>
						<div class="modal-body">
							<div class="btn-wrap">
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default choosen" data-dismiss="modal" onclick="activityselect(this,condition,1)">全部</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">募集捐款</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">动物保护</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">走进空巢</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">环境保护</a>
								</div>
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">心灵讲座</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">感恩之旅</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">健康维护</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">乡村支教</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">娱乐酷玩</a>
								</div>
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">生活服务</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">户外运动</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">美食风俗</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">冒险旅程</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,1)">才艺比拼</a>
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
			<!-- end  modal -->
			<ul id="areaUL">
				<li class="ulLabel">地区:</li>
				<li class="choosen" onclick="activityselect(this,condition,2)">全部</li>
				<li onclick="activityselect(this,condition,2)">陕西</li>
				<li onclick="activityselect(this,condition,2)">甘肃</li>
				<li onclick="activityselect(this,condition,2)">青海</li>
				<li onclick="activityselect(this,condition,2)">云南</li>
				<li onclick="activityselect(this,condition,2)">贵州</li>
				<li onclick="activityselect(this,condition,2)">四川</li>
				<li onclick="activityselect(this,condition,2)">江西</li>
				<li onclick="activityselect(this,condition,2)">安徽</li>
				<li class="" data-toggle="modal" data-target="#moreAreasModal">
					<span id="moreAreas">更多</span> <span
					class="glyphicon glyphicon-chevron-down" id="moreAreasIcon"></span>
				</li>
			</ul>
			<!-- Modal:#moreAreasModal-->
			<div class="modal fade" id="moreAreasModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel2">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 选择你最感兴趣的地区吧！ -->
							<i class="fa fa-podcast fa-2x" aria-hidden="true"></i>&nbsp&nbspChoose
							the one you favourite!
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>

						</div>
						<div class="modal-body">
							<div class="btn-wrap">
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default choosen" data-dismiss="modal" onclick="activityselect(this,condition,2)">全部</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">澳门</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">安徽</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">北京</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">重庆</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">福建</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">甘肃</a>
								</div>
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">广东</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">广西</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">贵州</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">海南</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">黑龙江</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">河北</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">河南</a>
								</div>
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">湖北</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">湖南</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">吉林</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">江苏</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">江西</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">辽宁</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">内蒙古</a>
								</div>
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">宁夏</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">青海</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">山东</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">山西</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">陕西</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">上海</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">四川</a>
								</div>
								<div class="btn-group btn-group-justified">
									<a class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">台湾</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">天津</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">西藏</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">新疆</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">香港</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">云南</a> <a
										class="btn btn-default" data-dismiss="modal" onclick="activityselect(this,condition,2)">浙江</a>
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
			<!-- end  modal -->
		</div>
		<!-- end classfication -->
		<div class="mydownIcon">
			<span class="glyphicon glyphicon-chevron-down"></span> <span
				class="glyphicon glyphicon-chevron-down"></span>
		</div>





<div id="activityPage">		
<div id="myContents">
	<c:forEach items="${activities }" var="a" varStatus="status" >
	
	<!-- 活动数为奇数，且不是最后一个活动 -->
	  <c:if test="${status.count%2!=0 && !status.last}">
	<div class="activityBox">
	   <!-- 左上角的直角： -->
    	<div class="TFcornerDiv" style="position:relative">
			<div class="TFcorner">
				<div class="Tcorner"></div>
				<div class="Lcorner"></div>
			</div>
    	</div>
	  
		<div class="myItem">
			<div class="myPicDiv col-xs-5 col-xs-offset-1 col-sm-offset-1  col-sm-5">
				<a href="#" class="thumbnail imgBox col-sm-11">
				<c:if test="${activityNew.get(status.index) eq '最新'}">
					<div class="ribbon">
						<div class="ribbonLable">最新</div>
					</div>
				</c:if>
				<c:if test="${activityNew.get(status.index) eq '普通'}"></c:if>
					<img src="${a.image_summary }" alt="下淤村图片">
					<div class="cover">
						<div class="state">
							${activityState.get(status.index) }
							<span class="leftBorder blr"></span>
							<span class="rightBorder blr"></span>
							<span class="topBorder btb"></span>
							<span class="bottomBorder btb"></span>
							<div class="TravelNumber">
							   <i class="fa fa-meetup" aria-hidden="true"></i>已参加:${a.currentPeople }人
							</div>
						</div>

						<div class="coverBg"></div>
					</div>
				</a>
			</div>
			<div class="caption col-xs-5 col-sm-5">
				<div class="captionText col-xs-11 col-sm-11">
						<h4 class="captionTextTitle">${a.a_name }&nbsp&nbsp<span class="badge">活动所需人数:${a.requiredPeople }</span></h4>
						
						<div class="captionTextCountry"><i class="fa fa-globe fa-lg"></i>&nbsp&nbsp${a.village.v_name }</div>
						<div class="captionTextDate"><span class="glyphicon glyphicon-calendar"></span>&nbsp&nbsp
							${a.startDate } --- ${a.endDate }
						</div>
						<div captionTextEditor><span class="glyphicon glyphicon-tags" ></span>&nbsp&nbsp 发布者：${ulist.get(status.index).u_name }</div>
						<p>${a.summary }</p>
						<div class="captionTextFooter">
							<a href="detail?aid=${a.a_id }&phone=${user.u_phone}" class="btn">前往查看</a>
							
						</div>
						<div class="myThumbsUp" activityId="${a.a_id}">
						    <span class="glyphicon glyphicon-thumbs-up"></span>
						       赞(<ThumbsUpNumber activityId="${a.a_id}">${a.praiseQuantity }</ThumbsUpNumber>)
						</div>
				</div>
			</div>  
		</div>
		<!-- end item -->
		<div class="cross">
	        <div class="rowCross"></div>
	        <div class="colCross"></div>
	        <i class="fa fa-empire fa-spin fa-3x fa-fw"></i>
	    </div>
	  </div>
	 </c:if>
	 
	 
	 <!-- 活动数为偶数，且不是最后一个活动 -->
	 <c:if test="${status.count%2==0 && !status.last}">
	   <div class="activityBox">
		<div class="myItem secondRowItem">
			<div class="col-xs-5 col-xs-offset-1 col-sm-offset-1  col-sm-5">
				<div class="captionText col-xs-11 col-sm-11">
						<h4 class="captionTextTitle">${a.a_name }&nbsp&nbsp<span class="badge">活动所需人数:${a.requiredPeople }</span></h4>
						<div class="captionTextCountry"><i class="fa fa-globe fa-lg"></i>&nbsp&nbsp${a.village.v_name }</div>
						<div class="captionTextDate"><span class="glyphicon glyphicon-calendar"></span>&nbsp&nbsp
							${a.startDate } --- ${a.endDate }
						</div>
						<div captionTextEditor><span class="glyphicon glyphicon-tags"></span>&nbsp&nbsp 发布者：${ulist.get(status.index).u_name }</div>
					
						<!-- <div>—— 简.行</div> -->
						<p>${a.summary }</p>
						<div class="captionTextFooter">
							<a href="detail?aid=${a.a_id }&phone=${user.u_phone}" class="btn">前往查看</a>
							
						</div>
						<div class="myThumbsUp" activityId="${a.a_id}">
						    <span class="glyphicon glyphicon-thumbs-up"></span>
						       赞(<ThumbsUpNumber activityId="${a.a_id}">${a.praiseQuantity }</ThumbsUpNumber>)
						</div>
				</div>
			</div>
			<div class="caption myPicDiv col-xs-5 col-sm-5">
				<a href="#" class="thumbnail imgBox col-sm-11">
				<c:if test="${activityNew.get(status.index) eq '最新'}">
					<div class="ribbon">
						<div class="ribbonLable">最新</div>
					</div>
				</c:if>
				<c:if test="${activityNew.get(status.index) eq '普通'}"></c:if>
					<img src="${a.image_summary }" alt="下淤村图片">
					<div class="cover">
						<div class="state">
							${activityState.get(status.index) }
							<span class="leftBorder blr"></span>
							<span class="rightBorder blr"></span>
							<span class="topBorder btb"></span>
							<span class="bottomBorder btb"></span>
							<div class="TravelNumber">
							   <i class="fa fa-meetup" aria-hidden="true"></i>已参加:${a.currentPeople }人
							</div>
						</div>
						<div class="coverBg"></div>
					</div>
				</a>
			</div>  
		</div>
		<!-- 右下角的直角： -->		
		<div class="BRcornerDiv">
			<div class="BRcorner">
				<div class="Bcorner"></div>
				<div class="Rcorner"></div>
			</div>	
		</div>
		<!-- end item2 -->
		<i class="fa fa-angle-double-down fa-5x" aria-hidden="true"></i>
	  </div>
	</c:if>
	
	
	<!-- 活动数为奇数，且是最后一个活动 -->
	<c:if test="${status.count%2!=0 && status.last}">
	  <div class="activityBox">
	  	<!-- 左上角的直角： -->
    	<div class="TFcornerDiv">
			<div class="TFcorner">
				<div class="Tcorner"></div>
				<div class="Lcorner"></div>
			</div>
    	</div>
		<div class="myItem">
			<div class="myPicDiv col-xs-5 col-xs-offset-1 col-sm-offset-1  col-sm-5">
				<a href="#" class="thumbnail imgBox col-sm-11">
				<c:if test="${activityNew.get(status.index) eq '最新'}">
					<div class="ribbon">
						<div class="ribbonLable">最新</div>
					</div>
				</c:if>
				<c:if test="${activityNew.get(status.index) eq '普通'}"></c:if>
					<img src="${a.image_summary }" alt="下淤村图片">
					<div class="cover">
						<div class="state">
							${activityState.get(status.index) }
							<span class="leftBorder blr"></span>
							<span class="rightBorder blr"></span>
							<span class="topBorder btb"></span>
							<span class="bottomBorder btb"></span>
							<div class="TravelNumber">
							   <i class="fa fa-meetup" aria-hidden="true"></i>已参加:${a.currentPeople }人
							</div>
						</div>

						<div class="coverBg"></div>
					</div>
				</a>
			</div>
			<div class="caption col-xs-5 col-sm-5">
				<div class="captionText col-xs-11 col-sm-11">
						<h4 class="captionTextTitle">${a.a_name }&nbsp&nbsp<span class="badge">活动所需人数:${a.requiredPeople }</span></h4>
						
						<div class="captionTextCountry"><i class="fa fa-globe fa-lg"></i>&nbsp&nbsp${a.village.v_name }</div>
						<div class="captionTextDate"><span class="glyphicon glyphicon-calendar"></span>&nbsp&nbsp
							${a.startDate } --- ${a.endDate }
						</div>
						<div captionTextEditor><span class="glyphicon glyphicon-tags"></span>&nbsp&nbsp 发布者：${ulist.get(status.index).u_name }</div>
						<p>${a.summary }</p>
						<div class="captionTextFooter">
							<a href="detail?aid=${a.a_id }&phone=${user.u_phone}" class="btn">前往查看</a>
							
						</div>
						<div class="myThumbsUp" activityId="${a.a_id}">
						    <span class="glyphicon glyphicon-thumbs-up"></span>
						       赞(<ThumbsUpNumber activityId="${a.a_id}">${a.praiseQuantity }</ThumbsUpNumber>)
						</div>
				</div>
			</div>  
		</div>
		<!-- end item -->
<!-- 右下角的直角： -->		
		<div class="BRcornerDiv">
			<div class="BRcorner">
				<div class="Bcorner"></div>
				<div class="Rcorner"></div>
			</div>	
		</div>
	 </c:if>
	 
	 
	 <!-- 活动数为偶数，且是最后一个活动 -->
	 <c:if test="${status.count%2==0 && status.last}">
	  <div class="activityBox">
		<div class="myItem secondRowItem">
			<div class="col-xs-5 col-xs-offset-1 col-sm-offset-1  col-sm-5">
				<div class="captionText col-xs-11 col-sm-11">
						<h4 class="captionTextTitle">${a.a_name }&nbsp&nbsp<span class="badge">活动所需人数:${a.requiredPeople }</span></h4>
						<div class="captionTextCountry"><i class="fa fa-globe fa-lg"></i>&nbsp&nbsp${a.village.v_name }</div>
						<div class="captionTextDate"><span class="glyphicon glyphicon-calendar"></span>&nbsp&nbsp
							${a.startDate } --- ${a.endDate }
						</div>
						<div captionTextEditor><span class="glyphicon glyphicon-tags"></span>&nbsp&nbsp 发布者：${ulist.get(status.index).u_name }</div>
					
						<!-- <div>—— 简.行</div> -->
						<p>${a.summary }</p>
						<div class="captionTextFooter">
							<a href="detail?aid=${a.a_id }&phone=${user.u_phone}" class="btn">前往查看</a>
							
						</div>
						<div class="myThumbsUp" activityId="${a.a_id}">
						    <span class="glyphicon glyphicon-thumbs-up"></span>
						       赞(<ThumbsUpNumber activityId="${a.a_id}">${a.praiseQuantity }</ThumbsUpNumber>)
						</div>
				</div>
			</div>
			<div class="caption myPicDiv col-xs-5 col-sm-5">
				<a href="#" class="thumbnail imgBox col-sm-11">
				<c:if test="${activityNew.get(status.index) eq '最新'}">
					<div class="ribbon">
						<div class="ribbonLable">最新</div>
					</div>
				</c:if>
				<c:if test="${activityNew.get(status.index) eq '普通'}"></c:if>
					<img src="${a.image_summary }" alt="下淤村图片">
					<div class="cover">
						<div class="state">
							${activityState.get(status.index) }
							<span class="leftBorder blr"></span>
							<span class="rightBorder blr"></span>
							<span class="topBorder btb"></span>
							<span class="bottomBorder btb"></span>
							<div class="TravelNumber">
							   <i class="fa fa-meetup" aria-hidden="true"></i>已参加:${a.currentPeople }人
							</div>
						</div>
						<div class="coverBg"></div>
					</div>
				</a>
			</div>  
		</div>
		<!-- end item2 -->
<!--  
		<i class="fa fa-angle-double-down fa-5x" aria-hidden="true"></i>
-->
	  </div>
	  <!-- 右下角的直角： -->		
		<div class="BRcornerDiv">
			<div class="BRcorner">
				<div class="Bcorner"></div>
				<div class="Rcorner"></div>
			</div>	
		</div>
	</c:if>
</c:forEach>
</div>







			


		<ul class="myPage">
			<li class="text-center" ><a class="norunback" href="#areaUL" onclick="return backpage()">上一页</a></li>
			<li class="choosen text-center"><span id="cp">第${page }页</span></li>
			<li class="text-center"><span id="pt">共${atp}页</span></li>
			<li class="text-center" ><a class="norunnext" href="#areaUL" onclick="return activityselect(this,condition,0)">下一页</a></li>
		</ul>

	</div>
</div>


	<!-- end mycontainer -->
<!-- 登录 -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
	     aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	            	<button type="button" class="close" data-dismiss="modal"><span
	                        aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	                <h4 class="modal-title" id="modal-label">登录</h4>
	                <form class="form-horizontal" id="loginform">
						<div class="form-group">
							<label for="name" class="sr-only">手机号</label>
							<div class="col-md-10 col-sm-10 col-xs-10">
								<input type="text" class="form-control" id="name" name="phone" placeholder="请输入手机号" onfocus="distip()">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<div class="col-md-10 col-sm-10 col-xs-10">
								<input type="password" class="form-control" id="password" name="psw" placeholder="请输入密码" onfocus="distip()">
							</div>
						</div>
						<div style="display:none" id="tip">
							<div style="width:470px;height:50px;margin:0 auto;text-align:center;line-height:30px;color:red;font-weight:500">
								<span id="logintip" ></span>
							</div>
						</div>
						<div style="width:560px;height:50px;">
							<div style="width:470px;height:50px;margin:0 auto">
								<button type="button" class="login-btn" id="login-submit" onclick="return login();">登录</button>
							</div>
						</div >
						<input type="hidden" name="sessionid" id="sessionid" value="${pageContext.session.id}">
						<div style="width:460px;height:40px;margin-top:10px;margin-left:50px">
							<span class="go-register">还没有账号？ <a href="#" data-toggle="modal" data-target="#register-modal" data-dismiss="modal">立即注册</a></span>
						</div>
					</form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 注册 -->
	<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	            	<button type="button" class="close" data-dismiss="modal"><span
	                        aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	                <h4 class="modal-title" id="modal-label">注册</h4>
	                <form class="form-horizontal" id="msform" action="registerAction">
						<div class="input-group">
							<input type="text" name="user.u_phone" id="r_phone" placeholder="手机号码" onblur="checkphone()" onfocus="canclephonetip()"/>
							<span id="tip_phone" style="display:none;margin-top:-20px;margin-bottom:10px;color:red;">您输入的手机号码错误</span>
							<input type="text" name="user.u_name" id="r_name" placeholder="用户名" />
							<input type="password" id="psw" name="user.u_psw" placeholder="设置密码" onblur="checkpsw()"/>
							<input type="password" id="rpsw" placeholder="确认密码" onblur="checkrpsw()" onfocus="canclepswtip()"/>
							<span id="tip_repsw" style="display:none;margin-top:-20px;margin-bottom:10px;color:red;">密码输入不一致</span>
							<input type="text"  placeholder="验证码" id="inputCode" style="width:200px;float:left;"  onfocus="canclecodetip()" />
						
								<input type="text" onselectstart="return false" style="background:url(user/images/code.jpg);" onclick="createCode();inputCode.focus();inputCode.select();" readonly="readonly" id="checkCode" class="code">
							
							
						</div>
						<span id="tip_checkcode" style="display:none;margin-top:-20px;margin-bottom:10px;color:red;">您输入验证码错误</span>
						<input type="hidden" name="user.sessionid" id="sessionid" value="${pageContext.session.id}">
						<div style="width:400px;height:40px;margin-top:10px">
							<span class="go-register">已有账号？<a href="#" data-toggle="modal" data-target="#login-modal" data-dismiss="modal">立即登录</a></span>
							<button type="button" class="btn btn-info" id="submit-btn"  onclick="return register();">注册</button>
						</div>
					</form>
	            </div>
	        </div>
	    </div>
	</div>
</body>
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="user/js/activeBrief.js"></script>
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
</script>
</html>