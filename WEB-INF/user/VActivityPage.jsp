<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


        <div id="avtivityWordAndImgDiv">
<c:forEach items="${activities }" var="activity" varStatus="status">
        	<div class="fourDivClass countryWordClass" align="center">
                <c:if test="${isNew.get(status.index) eq '最新'}">
					<div class="ribbon">
						<div class="ribbonLable">最新</div>
					</div>
				</c:if>
				<c:if test="${isNew.get(status.index) eq '普通'}"></c:if>
                <h3 align="center" style="margin-bottom: 20px;">${activity.a_name }</h3>
                <div style="width: 95%;height: 40px; margin-top: 20px;" ><span >需要志愿者人数:</span><span>&nbsp${activity.requiredPeople }</span></div>
                <div style="width: 95%;height: 40px;" ><span >已参加人数:</span><span>&nbsp${activity.currentPeople }</span></div>
                <button type="button" class="btn btn-success" onclick="window.location.href='detail?aid=${activity.a_id }&phone=${user.u_phone}'">Go!</button> 
            </div>
            <div class="fourDivClass ImgClass box">
                <img src="${activity.image_summary }" class="countryImgClass">
                	<div class="box-content">
        				    <div class="state" >
                                ${activityState.get(status.index) }
                                <span class="leftBorder blr"></span>
                                <span class="rightBorder blr"></span>
                                <span class="topBorder btb"></span>
                                <span class="bottomBorder btb"></span>
                            </div>
        				<ul class="icon">

        					<li class="up"><a id="aaa" onclick="activityPraise(${activity.a_id})"><img src="user/images/up.png" style="width: 130%;" >
        						<span class="upspan" activityId="${activity.a_id}">${activity.praiseQuantity }</span></a>
        					</li>

        				</ul>
        			</div>
            </div>
</c:forEach> 
            <!-- 分页导航条-->
        	<div  id="myPageDiv">
            	<ul class="myPage">
					<li class="text-center" ><a class="norunback" href="#searchNavFirstDiv" onclick="return backpage(${village.v_id})">上一页</a></li>
					<li class="choosen text-center"><span id="cp">第${page }页</span></li>
					<li class="text-center"><span id="pt">共${atp}页</span></li>
					<li class="text-center" ><a class="norunnext" href="#searchNavFirstDiv" onclick="return activityselect(this,${village.v_id})">下一页</a></li>
				</ul>         
        	</div> 	
        </div> 