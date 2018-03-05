<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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