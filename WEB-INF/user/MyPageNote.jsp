<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${notes }" var="note">
					<!-- 游记列表 -->
					<div class="panel panel-info container-fluid notepanel">
						<div class="panel-heading row">
							<div class="col-md-8 col-sm-8 col-xs-8" id="travelnotetitle">
								<a href="article?tid=${note.t_id }&phone=${user.u_phone}">${note.title }</a>
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3" id="travelnotetime">${note.t_date }</div>
							<button type="button" class="close" onclick="return deleteNote(${note.t_id},${npage},${ntp},${user.u_phone })">
								<span aria-hidden="true">&times;</span><span class="sr-only">删除</span>
							</button>
						</div>
						<div class="panel-body row" id="travelnotebody">
							<div class="col-md-6 col-sm-6 col-xs-6" id="notecontent">
								${note.t_desc }
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3" id="notepic">
								<img src="${note.coverimg }" class="img-rounded">
							</div>

						</div>
					</div>
</c:forEach>

					<!-- 分页 -->
					<nav aria-label="Page navigation" id="page">
						<nav aria-label="Page navigation" id="page">
						<ul class="pagination">
							<li ><a class="norunback" onclick="backpage(${phone })" href="#content">上一页</a></li>
							<li><span id="cp">第${npage }页</span></li>
							<li><span id="pt">共${ntp }页</span></li>
							<li ><a class="norunnext" onclick="nextpage(${phone })" href="#content" >下一页</a></li>					
						</ul>
					</nav>
					</nav>