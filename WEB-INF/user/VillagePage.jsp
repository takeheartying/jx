<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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