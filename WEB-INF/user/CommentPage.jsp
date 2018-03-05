<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<div class="showComment" id="showComment">
						<s:iterator value="comments" var="comment">
							<div class="comment">
								<div class="ribbon">
									<div class="ribbonLable"></div>
								</div>
								<div class="col-xs-1 avatar"
									style="background-image: url(${comment.userImage});"></div>
								<div class="col-xs-10">
									<div class="userName">${comment.name }</div>
									<div class="commentText">${comment.content }</div>
									<div class="otherInf">
										<span class="time">${comment.commentTime }</span> 
										<span class="thumbSpan">
											<i commentId="${comment.cid}" class="fa fa-thumbs-o-up"aria-hidden="true"></i>
											<ThumbsUpNumber commentId="${comment.cid}">${comment.praiseQuantity }</ThumbsUpNumber>
										</span>
										<span class="reportSpan" data-toggle="modal"
											data-target="#myModal"><i class="fa fa-ban"
											aria-hidden="true"></i>举报</span>
	
									</div>
	
								</div>
	
							</div>
							<hr />
						</s:iterator>
					</div>
	
				<ul class="myPage">
					<li class="text-center"><a class="norunback"
						onclick="return backPage()">上一页</a></li>
					<li class="choosen text-center"><span id="cp">第${page }页</span></li>
					<li class="text-center"><span id="pt">共${ctp}页</span></li>
					<li class="text-center"><a class="norunnext"
						onclick="return nextPage()">下一页</a></li>
				</ul>