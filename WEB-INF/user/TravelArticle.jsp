<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>游记文章</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="user/css/style.css">
<link rel="stylesheet" href="user/css/travelArticle.css">
<link rel="stylesheet" href="user/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">
</head>
<body>
	<s:include value="nav2.jsp"></s:include>

	<div class="mycontainer">
		<div class="col-xs-3">
			<div class="rightArticleDiv" id="newestDiv">
				<div class="title">
					<i class="fa fa-lightbulb-o" aria-hidden="true"></i> 最新文章
				</div>
				<div class="articleContent">
					<s:iterator value="newnotes" var="n">
						<a class="article"
							href="article?tid=${n.t_id }&a_id=${activity.a_id}&phone=${phone}">
							<div class="pic">
								<img src="${n.coverimg }" />
								<div class="cover">
									<div class="text">
										${n.title }
										<div class="TravelNumber">
											<i class="fa fa-meetup" aria-hidden="true"></i>阅读量:${n.readQuantity }
										</div>
									</div>
									<div class="coverBg"></div>
								</div>
							</div>
						</a>
					</s:iterator>
				</div>
			</div>
			<!-- end newestArticle -->
			<div class="rightArticleDiv" id="hottestDiv">
				<div class="title">
					<i class="fa fa-diamond" aria-hidden="true"></i> 最热文章
				</div>
				<div class="articleContent">
					<s:iterator value="notes" var="n">
						<a class="article"
							href="article?tid=${n.t_id }&a_id=${activity.a_id}&phone=${phone}">
							<div class="pic">
								<img src="${n.coverimg }" />
								<div class="cover">
									<div class="text">
										${n.title }
										<div class="TravelNumber">
											<i class="fa fa-meetup" aria-hidden="true"></i>阅读量:${n.readQuantity }
										</div>
									</div>
									<div class="coverBg"></div>
								</div>
							</div>
						</a>
					</s:iterator>
				</div>
			</div>
			<!-- end hottestArticle -->
		</div>
		<!-- end rightContent -->
		<div class="col-xs-8 rightContent">
			<div class="title">${showNote.title }</div>
			<div class="basicInf">
				<span class="author">编者:${author.u_name }</span> <span
					class="readNum">阅读量:${showNote.readQuantity }</span> <span
					class="date">${showNote.t_date }</span>
			</div>
			<div class="editContent">
				<s:property value="showNote.t_content" escape="false" />
			</div>
			<!-- end editContent -->
			<div class="commentContent">
				<div class="commentTitle">我的评论</div>
				<input class="sr-only" id="userNameInput" value="用户名" /> <input
					class="sr-only" id="userAvatarInput"
					value="user/images/avatar4.jpg" />
				<div class="MyComment">
					<form id="commentForm">
						<div class="avatar col-xs-2"
							style="background-image: url(${user.headimg});"></div>
						<textarea id="editComment" class="editComment col-xs-10"
							placeholder="请输入少于150字..." maxlength="150" name="content"></textarea>
						<input type="hidden" name="tid" value="${showNote.t_id}">
					</form>
				</div>
				<button class="btn" id="sendComment">发表评论</button>
				<hr />
				<div id="CommentPage">
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
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">举报</h4>
						</div>
						<div class="modal-body">
							<div class="reportPrompt">
								举报
								<userName>用户名</userName>
								的评论:
							</div>
							<div class="userComment">
								<userName>用户名</userName>
								: <span id="userText">这鬼地方真想干一架啊！</span>
							</div>
							<form>
								<div class="chooseReason">
									<div class="mycheckbox col-xs-4">
										<label> <input type="checkbox">垃圾营销
										</label>
									</div>
									<div class="mycheckbox col-xs-4">
										<label> <input type="checkbox">有害信息
										</label>
									</div>
									<div class="mycheckbox col-xs-4">
										<label> <input type="checkbox">违法信息
										</label>
									</div>
									<div class="mycheckbox col-xs-4">
										<label> <input type="checkbox">淫秽色情
										</label>
									</div>
									<div class="mycheckbox col-xs-4">
										<label> <input type="checkbox">人生攻击
										</label>
									</div>
									<div class="mycheckbox col-xs-4">
										<label> <input type="checkbox">暴恐血腥
										</label>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn" id="confirmReportBtn"
								data-dismiss="modal">举报</button>
						</div>
					</div>
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
<script type="text/javascript">
	var page = 1;
	var ctp = ${ctp};
	ctp = parseInt(ctp);
	//评论下一页
	function nextPage(){
		page++;
		if(page>ctp){
			page--;
			return false;
		}
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("tid", ${showNote.t_id});
		$.ajax({  
	         url:'page/CommentPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#CommentPage").html(returndata);
	        	 ctp = $("#pt").text().charAt(1);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	//上一页
	function backPage(){
		page--;
		if(page<1){
			page++;
			return false;
		}
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("tid", ${showNote.t_id});
		$.ajax({  
	         url:'page/CommentPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {         	
	        	 $("#CommentPage").html(returndata);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}

	// 举报弹出框的用户评论：
	$(".reportSpan").click(
			function(e) {
				$("#userText").text(
						$(this).closest(".col-xs-10").find(".commentText")
								.text());
				// 用户被举报的举报样式：
				$("#confirmReportBtn").click(
						function() {
							$(e.target).closest(".comment")
									.find(".ribbonLable").text("已被举报");
						});
			});

	// 获取时间：
	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var currentdate = date.getFullYear() + seperator1 + month + seperator1
				+ strDate + " " + date.getHours() + seperator2
				+ date.getMinutes() + seperator2 + date.getSeconds();
		return currentdate;
	}
	// 发表评论：
	$("#sendComment")
			.click(
					function() {
						var formData = new FormData($("#commentForm")[0]);
						$.ajax({  
					         url:'comment' ,  
					         type: 'POST',  
					         data: formData, 
					         async: true,  
					         cache: false, 
					         contentType: false,  
					         processData: false,  
					         success: function (returndata) { 
					        	 $("#CommentPage").html(returndata);
					        	 ctp = $("#pt").text().charAt(1);
					         },  
					         error: function (returndata) {  
					              alert("添加失败");
					         }  
					    });
					});
	
	//评论点赞
	$(document).on("click", ".thumbSpan", function(){
		var $spanNode = $($(this).children().get(1));
		var commentid = $spanNode.attr("commentid");
		var cid = parseInt(commentid);
		var formdata = new FormData();
		formdata.append("cid", cid);
		$.ajax({  
	         url:'CommentPraise' ,  
	         type: 'POST', 
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) {     
	        	 var data = returndata.trim().split(",");
	        	 $("thumbsupnumber[commentId=" + cid + "]").html(data[0]);
	        	 var isPraise = parseInt(data[1]);
	        	 if(1 == isPraise){
	        		 $("thumbsupnumber[commentId=" + cid + "]").css("color","red"); 
	        		 $("i[commentId=" + cid + "]").css("color","red");
	             }else{
	            	 $("thumbsupnumber[commentId=" + cid + "]").css("color","black"); 
	            	 $("i[commentId=" + cid + "]").css("color","black");
	             }
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  	});
	} );
</script>
</html>
