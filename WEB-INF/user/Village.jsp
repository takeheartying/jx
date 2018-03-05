<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>具体乡村介绍</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="user/css/font-awesome.min.css" />
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="user/js/village.js"></script>
    <link rel="stylesheet" href="user/css/flyaway.min.css">


</head>

<link rel="stylesheet" href="user/css/navbar.css">
<link rel="stylesheet" type="text/css" media="all" href="user/css/zzsc.css" />
<link rel="stylesheet" type="text/css" href="user/css/village.css">
<link rel="stylesheet" type="text/css" href="user/css/nav.css">
<link rel="shortcut icon" href="user/images/greyLogo.png">


<script type="text/javascript">
	var page = 1;
	var atp = ${atp};
	var condition = new Array("全部");
	
	//多条件查询分页活动首次加载及下一页查询
	function activityselect(obj,vid){
		if($(obj).text()!="下一页"){
			page = 1;
			condition[0] = $(obj).text();
		}else{
			page++;
			if(page>atp){
				page--;
				return false;
			}
		}
		
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("condition[0]", condition[0]);
		formdata.append("vid", vid);
		formdata.append("phone", ${user.u_phone});
		$.ajax({  
	         url:'page/VActivityPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#VActivityPage").html(returndata);	  
	        	 height();
	        	 atp = $("#pt").text().charAt(1);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	//上一页
	function backpage(vid){
		page--;
		if(page<1){
			page++;
			return false;
		}
		var formdata = new FormData();
		formdata.append("page", page);
		formdata.append("condition[0]", condition[0]);
		formdata.append("vid", vid);
		formdata.append("phone", ${user.u_phone});
		$.ajax({  
	         url:'page/VActivityPage' ,  
	         type: 'POST',  
	         data: formdata,
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false, 
	         success: function (returndata) { 
	        	 $("#VActivityPage").html(returndata);
	        	 height();
	        	 atp = $("#pt").text().charAt(1);
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  });
	}
	
	//活动点赞
	function activityPraise(aid){
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
	        	 var data = returndata.split(",");
	        	 $("span[activityId=" + aid + "]").html(data[0]);
	        	 var isPraise = parseInt(data[1]);
	        	 if(1 == isPraise){
	        		 $("span[activityId=" + aid + "]").css("color","red"); 
	             }else{
	            	 $("span[activityId=" + aid + "]").css("color","white");                
	             }
	         },  
	         error: function (returndata) {  
	              alert("未查询到数据！");
	         }  
	  	});
	} 
</script>


<body>
<s:include value="nav.jsp"></s:include>
<!-- 轮播图-->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li> 
    </ol>
    <div class="carousel-inner">
        <div class="item active" id="first">
            <img src="user/images/big1.jpg" alt="1 slide">
        </div>
        <div class="item">
            <img src="user/images/big2.jpg" alt="2 slide">
        </div>
        <div class="item">
            <img src="user/images/big3.jpg" alt="3 slide">
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
            class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
            class="glyphicon glyphicon-chevron-right"></span></a>
    
	<!-- <span class="badge pull-right" >50</span>&nbsp
    <a href="#" class="pull-right"><span class="glyphicon glyphicon-thumbs-up"></span> </a> -->

</div>

<div id="left-nav" style="display: none;">
    <ul id="leftnavul">
        <li>
            <a class="entypo-map"></a> <span>历史</span>
        </li>
        <li>
            <a class="entypo-record"></a> <span>文化</span>
        </li>
        <li>
            <a class="entypo-picture"></a> <span >美景</span>
        </li>

        <li>
            <a class="entypo-flag"></a> <span>活动</span>
        </li>
    </ul>
</div>


<!-- 内容 -->
<div id="ruralDiv">
        <div id="ruralImgLeft">
            <img src="user/images/hppic2.png"  alt="pic-left">
        </div>
        <div id="ruralWord">
            <h1 >${village.v_name }</h1>

        </div>
        <div id="ruralImgRight">
            <img src="user/images/hppic1.png" alt="pic-right" id="plane">
        </div>
    </div>
</div>


<!--向下的箭头-->
<div style="width: 850px;"><div class="down" id="historyDown"><a ><img src="user/images/down2.jpg"></a></div></div>

<!-- 历史-->
<div  class="DivClass" id="history">
	<div class="DivHead">
	    <div class="smallPlane">
	        <img src="user/images/hppic1.png"  alt="pic-left">
	    </div>
	    <h3>历史</h3>
    </div>
	<div class="introImgDiv"><img src="${village.historyimg }" class="introImg"></div>
	
	<div class="DivWord">
		<p>   ${village.history }</p>
	</div>
</div>




<!--向下的箭头-->
<div style="width: 850px;"><div class="down" id="cultureDown"><a ><img src="user/images/down2.jpg"></a></div></div>


<!-- 文化-->
<div  class="DivClass" id="culture">
	<div class="DivHead">
	    <div class="smallPlane">
	        <img src="user/images/hppic1.png"  alt="pic-left">
	    </div>
	    <h3>文化</h3>
    </div>
	<div class="introImgDiv">
		<img src="${village.cultureimg }"  class="introImg">
	</div>
	
	<div class="DivWord">
		<p>   ${village.culture }</p>
	</div>
</div>




<!--向下的箭头-->
<div style="width: 850px;"><div class="down" id="beautyDown"><a ><img src="user/images/down2.jpg"></a></div></div>


<!-- 周围美景-->
<div  class="DivClass" id="beauty">
	<div class="DivHead">
	    <div class="smallPlane" >
	        <img src="user/images/hppic1.png"  alt="pic-left">
	    </div>
	    <h3>周围美景</h3>
    </div>
	<div class="introImgDiv"><img src="${village.sceneryimg }" class="introImg"></div>
	
	<div class="DivWord">
		<p>   ${village.scenery }</p>
	</div>
</div>


<!--向下的箭头-->
<div style="width: 850px;"><div class="down" id="activityDown"><a ><img src="user/images/down2.jpg" id="downImg"></a></div></div>


<!-- 乡村活动-->
<div id="activityDiv" >
    <img src="user/images/BackGround1.jpg" style="width:100%;" id="activityImg">
    <div style="position: absolute;top: 0px;width: 100%;">
    	<div class="DivHead">
    	    <div class="smallPlane">
    	        <img src="user/images/hppic1.png"  alt="pic-left">
    	    </div>
    	    <h3>乡村活动</h3>
        </div>
    	
    	<div  id="searchBackImgDiv" >

    	   <!-- 活动类型 -->
    	    <div id="searchNavFirstDiv" >
    	        <a class="navbar-brand"  style="color:gray">&nbsp&nbsp&nbsp&nbsp状态：</a>
    	        <div>
    	            <ul class="nav nav-pills" style="line-height:20px;margin-top: 5px;" id="sortUl">
    	                <li class="active" onclick="activityselect(this,${village.v_id})"><a>全部</a></li>
    	                <li onclick="activityselect(this,${village.v_id})"><a>正在进行</a></li>
    	                <li onclick="activityselect(this,${village.v_id})"><a>已结束</a></li>
    	            </ul>
    	        </div>
    	    </div>
    	</div>

    	<!-- 活动文字和图片-->
<div id="VActivityPage">
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
  </div>
    </div>
</div>



<div class="love">
	<p>点个赞呗~！</p><br>
	<ul class="grid">
		<li class="grid__item">
			<button class="icobutton icobutton--heart"><span class="fa fa-heart"></span><span class="icobutton__text icobutton__text--side">${village.v_praise }</span></button>
		</li>
	</ul>
</div>






<div style="width: 100%;height: 50px;background: #A8A8A8;margin-top: 100px;"></div>


	<script src="user/js/mo.min.js"></script>
	<script type="text/javascript" src="user/js/demo.js"></script>


</body>
</html>
