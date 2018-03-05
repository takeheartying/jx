<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
    <div class="partnav" role="navigation" style="margin-top:-20px">
		<div class="partnav-wrap">
			<div class="partnav-header">
				<a  href="homeAction?phone=${user.u_phone}" style="float:left"><img src="user/images/logo1.png"></a>
            <a  id="partnav-title" style="float:left;margin-left:10px" href="homeAction?phone=${user.u_phone}" >简  行</a>
			</div>
			<ul class="partnav-content-left">
				<li><a href="homeAction?phone=${user.u_phone}">首页</a></li>
				<li><a href="VillageCenter?phone=${user.u_phone}">乡村日记</a></li>
				<li><a href="ActivityCenter?phone=${user.u_phone}">活动简录</a></li>
				<li><a
					href="PersonalCenter?phone=${user.u_phone}">个人中心</a></li>
				<li><a href="#">关于我们</a></li>
			</ul>
			<ul class="partnav-content-right" id="partnav-right">
				<s:if test="user==null">
					<li><a href="#" data-toggle="modal" data-target="#login-modal">登录</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#register-modal">注册</a></li>
				</s:if>
				<s:else>
					<li style="width: 75px; color: #fff">欢迎您:</li>
					<li><a
						href="PersonalCenter?phone=${user.u_phone}">${user.u_name}</a></li>
					<li><a href="index.jsp">退出 </a></li>
				</s:else>
			</ul>
		</div>
	</div>
	<div id="banner">	
	</div>

