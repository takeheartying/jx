<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
	<title>首页</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script type="text/javascript" src="user/js/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="user/js/main.js"></script>
	<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="user/css/normalize.css" />
	<link rel="stylesheet" href="user/css/main.css" />
	<link rel="stylesheet" href="user/css/magic.min.css" />
	<link rel="stylesheet" type="text/css" href="user/css/hover-effects.css">
	<link rel="stylesheet" type="text/css" href="user/css/rollingover.css">
	<link rel="stylesheet" media="screen" href="user/css/zz.css" />
	<link rel="stylesheet" type="text/css" href="user/css/homepage.css">
	<link rel="stylesheet" type="text/css" href="user/css/nav.css">
	<link rel="shortcut icon" href="user/images/greyLogo.png">
	<script src="user/js/homepage.js"></script>
	<script src="https://cdn.bootcss.com/blueimp-md5/2.8.0/js/md5.js"></script>
	<script type="text/javascript">
		//注册
		function register(){
			var phone=$("#r_phone");
			if(isNaN(phone.val())){//如果它不是个数字
				normal("r_phone",3);
				$("#tip_phone").css("display","block");
				return false;
			}
			var input=$("#inputCode").val();
			var check=$("#checkCode").val();
			if(input!=check){
				$("#tip_checkcode").css("display","block");
				return false;
			}
			var psw=$("#psw").val();
			$("#psw").val(md5(psw));
			$("#r_name").val(encodeURI(encodeURI($("#r_name").val())));
			$("#msform").submit();
			return true;
		}

		
		//取消登录提示
		function distip(){
			$("#tip").css("display","none");
		}
		//登录
		function login(){
			 var phone=$("#name").val();
			 var psw=$("#password").val();
			 var xmlhttp;
		 		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		 			xmlhttp = new XMLHttpRequest();
		 		} else {// code for IE6, IE5
		 			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		 		}
		 		xmlhttp.onreadystatechange = function() {
		 			//请求中显示加载中
		 			if(xmlhttp.readyState == 0||xmlhttp.readyState == 1||xmlhttp.readyState ==2||xmlhttp.readyState == 3){
		 				$("#login-submit").text("正在登录中");
		 				setTimeout(function(){},1000);
		 			}
		 			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		 				var rt=xmlhttp.responseText.trim();//返回的html
		 				if(rt=="errorpsw"||rt=="erroruser"){
		 					$("#login-submit").text("登录");
		 					$("#tip").css("display","block");
		 					$("#logintip").text("您的用户名或密码错误");
		 				}
		 				else{
		 					window.location.href="/jx/homeAction";
		 				}
		 			}
		 		}
		 			xmlhttp.open("Post", "loginAction?phone="+phone+"&psw="+psw, true);
			 		xmlhttp.send();	
		}
		function checkphone(){
			var phone=$("#r_phone");
			if(isNaN(phone.val())||phone.val().length!=11){//如果它不是个数字
				normal("r_phone",3);
				$("#tip_phone").css("display","block");
			}
		}
		function checkrpsw(){
			var psw=$("#psw").val();
			var rpsw=$("#rpsw").val();
			if(psw!=rpsw){//如果密码不一致
				$("#tip_repsw").css("display","block");
			}
		}
		
		function canclephonetip(){
			$("#tip_phone").css("display","none");
			$("#tip_phonelength").css("display","none");
		}

		function canclepswtip(){
			$("#tip_repsw").css("display","none");
		}
		function canclecodetip(){
			$("#tip_checkcode").css("display","none");
		}
		//设置边框闪烁
		function normal(id,times)    
        {    
            var obj=$("#"+id);    
            obj.css("border","1px solid #ccc");    
            if(times<0)    
            {    
                return;    
            }    
            times=times-1;    
            setTimeout("error('"+id+"',"+times+")",150); 
           
        }    
    function error(id,times)    
        {    
            var obj=$("#"+id);    
            obj.css("border","1px solid red");    
            times=times-1;    
            setTimeout("normal('"+id+"',"+times+")",150); 
             
        }    
	</script>
</head>
<body>

<!-- 轮播图 -->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li> 
    </ol>
    <div class="carousel-inner">
        <div class="item active" id="first">
            <img src="user/images/hpbg1.jpg" alt="1 slide">
        </div>
        <div class="item">
            <img src="user/images/hpbg2.jpg" alt="2 slide">
        </div>
        <div class="item">
            <img src="user/images/hpbg3.jpg" alt="3 slide">
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
            class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
            class="glyphicon glyphicon-chevron-right"></span></a>
</div>

<!-- 导航栏 -->
<div class="partnav" role="navigation">
    <div class="partnav-wrap">
        <div class="partnav-header">
            <a  href="homeAction" style="float:left"><img src="user/images/logo1.png"></a>
            <a  id="partnav-title" style="float:left;margin-left:10px" href="homeAction" >简  行</a>
        </div>
       <ul class="partnav-content-left">
           <li><a href="homeAction">首页</a></li>
           <li><a href="VillageCenter?phone=${user.u_phone}">乡村日记</a></li>
            <li><a href="ActivityCenter?phone=${user.u_phone}">活动简录</a></li>
            <li><a href="PersonalCenter?phone=${user.u_phone}">个人中心</a></li>
            <li><a href="#">关于我们</a></li>
        </ul>
        <ul class="partnav-content-right" id="partnav-right">
        <s:if test="user==null">
            <li><a href="#" data-toggle="modal" data-target="#login-modal">登录</a></li>
            <li><a href="#" data-toggle="modal" data-target="#register-modal">注册</a></li>
         </s:if>
         <s:else>
         	<li style="width:75px;color:#fff">欢迎您:</li>
         	<li><a  href="PersonalCenter?phone=${user.u_phone}">${user.u_name}</a></li>
         	<li><a href="index.jsp">退出 </a></li>
         </s:else>
        </ul>
    </div>
</div>

<!-- 内容 -->
<div class="container" id="content">

    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-3">
            <img src="user/images/hppic2.png" alt="" id="pic-left">
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6" id="first-part">
            <h2>我们一直都在路上</h2>
            <p>跟随我们的步伐，来一段别致的旅行<br>去看看那些曾被我们遗忘的风景，给自己一次感动的机会<br>让“公益”成为旅行中别样的风景</p>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <img src="user/images/hppic1.png" alt="" id="pic-right">
        </div>
    </div>
	<div class="row" id="pic-nav">
        <div class="col-md-3 col-sm-3 col-xs-3">
        	<a href="">
		        <img src="user/images/hppic3.png" alt="">
		        <h2>沿途风景</h2>
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <a href="">
		        <img src="user/images/hppic4.png" alt="">
		        <h2>我的足迹</h2>
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <a href="">
		        <img src="user/images/hppic5.png" alt="">
		        <h2>我的故事</h2>
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-3">
            <a href="">
		        <img src="user/images/hppic6.png" alt="">
		        <h2>热门活动</h2>
            </a>
        </div>
    </div>

    <!-- 最美乡村 -->
    <div class="row" id="con-title">
    	<div class="col-md-5 col-sm-5 col-xs-5">
    		<img src="user/images/hppic1.png">
    	</div>
    	<div class="col-md-7 col-md-7 col-xs-7" id="title-h2">
    		<h2>最美乡村</h2>
    	</div>
    </div>
	<div class="row full-length">
        <ul>
			<li class="col-md-3 col-sm-3 col-xs-3">
				<div class="port-1 effect-1">
					<div class="image-box">
						<img src="user/images/hppic7.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc" >
							<h3>宏村</h3>
							<p>宏村位于安徽黄山西南麓，是以徽派建筑为特色的村落，因奥斯卡获奖电影《卧虎藏龙》而闻名中外。它背倚黄山余脉羊栈岭等，地势较高，经常云蒸霞蔚，有时如浓墨重彩，有时似泼墨写意，似一幅徐徐展开的山水长卷，被誉为“中国画里乡村”。在皖南众多风格独特的徽派民居村落中，宏村是最具代表性的。</p>
						</div>
					</a>
				</div>
			</li>
			<li class="col-md-6 col-sm-6 col-xs-6">
				<div class="port-1 effect-2">
					<div class="image-box">
						<img src="user/images/hppic8.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc">
							<h3>宏村</h3>
							<p>宏村位于安徽黄山西南麓，是以徽派建筑为特色的村落，因奥斯卡获奖电影《卧虎藏龙》而闻名中外。它背倚黄山余脉羊栈岭等，地势较高，经常云蒸霞蔚，有时如浓墨重彩，有时似泼墨写意，似一幅徐徐展开的山水长卷，被誉为“中国画里乡村”。在皖南众多风格独特的徽派民居村落中，宏村是最具代表性的。</p>
						</div>
					</a>
				</div>
			</li>
			<li class="col-md-3 col-sm-3 col-xs-3">
				<div class="port-1 effect-1">
					<div class="image-box">
						<img src="user/images/hppic9.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc">
							<h3>凤凰古城</h3>
							<p>凤凰位于湖南省湘西自治州西南边.在凤凰的时光如一场梦，不愿醒来。一座座吊脚楼悬在河上，楼里的灯光或明或暗,就仿佛一幅水墨画。</p>
						</div>
					</a>
				</div>
			</li>
		</ul>
		<ul>
			<li class="col-md-3 col-sm-3 col-xs-3">
				<div class="port-1 effect-1">
					<div class="image-box">
						<img src="user/images/hppic10.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc">
							<h3>芙蓉村</h3>
							<p>芙蓉村位于岩头镇西侧。相传村西南有座高山，状若含苞待放之芙蓉，取名为芙蓉峰，每天傍晚芙蓉峰便倒映村中水池中，村以此得名。</p>
						</div>
					</a>
				</div>
			</li>
			<li class="col-md-3 col-sm-3 col-xs-3">
				<div class="port-1 effect-2">
					<div class="image-box">
						<img src="user/images/hppic11.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc">
							<h3>乌镇</h3>
							<p>乌镇位于浙江桐乡，以河成街，街桥相连，水镇一体，组织起桥梁、石板巷等独具江南韵味的建筑因素，呈现江南水乡古镇的空间魅力。</p>
						</div>
					</a>
				</div>
			</li>
			<li class="col-md-3 col-sm-3 col-xs-3">
				<div class="port-1 effect-2">
					<div class="image-box">
						<img src="user/images/hppic12.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc">
							<h3>陆川</h3>
							<p>陆川围绕“清洁环境、美化乡村、培育新风、造福群众”目标，以九洲江沿岸生态农业休闲建设为重点，打造山、水美、田园美的美丽村落。</p>
						</div>
					</a>
				</div>
			</li>
			<li class="col-md-3 col-sm-3 col-xs-3">
				<div class="port-1 effect-1">
					<div class="image-box">
						<img src="user/images/hppic13.jpg" alt="Image-1">
					</div>
					<a href="">
						<div class="text-desc">
							<h3>福宝古镇</h3>
							<p>福宝古镇，是国家级福宝森林公园的门户。高处望去，高低错落、鳞次栉比的屋宇千姿百态，排排吊脚木楼随山势起伏，错落有致。</p>
						</div>
					</a>
				</div>
			</li>
		</ul>
		<div class="col-md-12 col-sm-12 col-xs-12" id="more-beauty">
			<button class="btn btn-info" onclick="window.location.href='VillageCenter?phone=${user.u_phone}'">更多风景</button>
		</div>
    </div>
	
	<!-- 热门活动 -->
	<div class="row" id="con-title">
    	<div class="col-md-5 col-sm-5 col-xs-5">
    		<img src="user/images/hppic1.png">
    	</div>
    	<div class="col-md-7 col-sm-7 col-xs-7" id="title-h2">
    		<h2>热门活动</h2>
    	</div>
    </div>
    <!-- 活动第一行 -->
	<div class="row" id="activity">
		<div class="box col-md-3 col-sm-3 col-xs-3">
			<div class="box-content">
				<img src="user/images/hppic14.jpg" alt="" class="img-rounded">
			</div>
			<div class="box-overlay magictime" data-hover="rotateRight" data-return="">
				<img src="user/images/hppic15.jpg" alt="">
			</div>
			<a class="link" href="#" target="_blank"></a>						
		</div>
		<div class="col-md-3 col-sm-3 col-xs-3" id="activity-con">
			<div>
				<img src="user/images/hppic16.png">
				<div id="activity-text1">
					<h3>大冶市——相约支教</h3>
					<hr class="feature-divider">
					<div>武汉</div>
					<div>09:30-12:00来到当地的学校，开始支教。和当地人一起制作...</div>
					<a class="link" href="#" target=""></a>
				</div>
				
			</div>
			<div>
				<img src="user/images/hppic17.png">
				<div id="activity-text2">
					<h3>贵阳——相约支教</h3>
					<hr class="feature-divider">
					<div>云南</div>
					<div>08:30-11:00来到学校，开始支教。午餐休息后，学习如何制作...</div>
					<a class="link" href="#" target="_blank"></a>
				</div>
				
			</div>
									
		</div>
        <div class="box col-md-3 col-sm-3 col-xs-3">
			<div class="box-content">
				<img src="user/images/hppic18.jpg" alt="" class="img-rounded">
			</div>
			<div class="box-overlay magictime" data-hover="rotateUp" data-return="">
				<img src="user/images/hppic19.jpg" alt=""/>
			</div>
			<a class="link" href="#" target="_blank"></a>						
		</div>
		<div class="box col-md-3 col-sm-3 col-xs-3">
			<div class="box-content">
				<div class="box-wrapper">
					大爱衣旧情真<span class="name">商洛市</span>
					<div>此次活动的举办让乡村的孩子和老人们得到物资和资金帮助，获得生活所必须的物品，还为公益组织和政府共同搭建了一个连接城市和乡村的平台，并且推动公益社会的进步。</div>					
				</div>
			</div>
			<div class="box-overlay magictime" data-hover="rotateLeft" data-return="">
				<img src="user/images/hppic20.jpg" alt="" />
			</div>
			<a class="link" href="#" target="_blank"></a>	
		</div>
    </div>
    <!-- 活动第二行 -->
	<div class="row activity" id="activity">
		<div class="box col-md-3 col-sm-3 col-xs-3">
			<div class="box-content">
				<div class="box-wrapper">
					壹家人协会<span class="name">桂坪村</span>
					<div>协会将募集一批爱心物资对重庆开县岳溪镇桂坪村21位特贫困、孤寡老人进行关爱慰问；组织医护志愿者对老人做义诊，提供常规药品，提出防治建议并建立老人健康档案等。</div>					
				</div>
			</div>
			<div class="box-overlay magictime" data-hover="rotateRight" data-return="">
				<img src="user/images/hppic21.jpg" alt="" />
			</div>
			<a class="link" href="#" target="_blank"></a>	
		</div>
		<div class="box col-md-3 col-sm-3 col-xs-3">
			<div class="box-content">
				<img src="user/images/hppic22.jpg" alt="" class="img-rounded">
			</div>
			<div class="box-overlay magictime" data-hover="rotateDown" data-return="">
				<img src="user/images/hppic23.jpg" alt="">
			</div>
			<a class="link" href="#" target="_blank"></a>						
		</div>
		<div class="col-md-3 col-sm-3 col-xs-3" id="activity-con">
			<div>
				<img src="user/images/hppic16.png">
				<div id="activity-text1">
					<h3>爱心包裹学生圆梦</h3>
					<hr class="feature-divider">
					<div>云南</div>
					<div>以捐购爱心包裹的形式，关爱贫困地区及灾区小学生，帮助他们更...</div>
					<a class="link" href="#" target="_blank"></a>
				</div>
			</div>
			<div>
				<img src="user/images/hppic17.png">
				<div id="activity-text2">
					<h3>让留守儿童不再孤独</h3>
					<hr class="feature-divider">
					<div>邯郸</div>
					<div>志愿者组织定期为留守儿童提供心理塑造、习惯养成、安全自护...</div>
					<a class="link" href="#" target="_blank"></a>
				</div>
			</div>
									
		</div>
		<div class="box col-md-3 col-sm-3 col-xs-3">
			<div class="box-content">
				<img src="user/images/hppic24.jpg" alt="" class="img-rounded">
			</div>
			<div class="box-overlay magictime" data-hover="rotateLeft" data-return="">
				<img src="user/images/hppic25.jpg" alt=""/>
			</div>
			<a class="link" href="#" target="_blank"></a>						
		</div>
    </div>
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12" id="more-beauty">
			<button class="btn btn-info" onclick="window.location.href='ActivityCenter?phone=${user.u_phone}'">更多活动</button>
		</div>
	</div>

	<!-- 旅行日志 -->
	<div class="row" id="con-title">
    	<div class="col-md-5 col-sm-5 col-xs-5">
    		<img src="user/images/hppic1.png">
    	</div>
    	<div class="col-md-7 col-sm-7 col-xs-7" id="title-h2">
    		<h2>旅行日志</h2>
    	</div>
    </div>

    <div class="row" id="diary">
		<div class="col-md-4 col-sm-4 col-xs-4">
			<div class="diarybox">
				<div class="diarybox-img">
					<img src="user/images/hppic26.jpg" alt="">
				</div>
				<div class="diarybox-content">
					<h4 class="diarytitle">义工游学之旅</h4>
					<p class="diarydescription">从开挖掘机到游学义工再到旅行体验师，不少人都说：“看你多好，领着工资到处旅行”。说句真心话，当我不必只困在单调的工地里，无论是生活还是眼界，确实好像打开了一道光，里面都是万花筒的世界。然而，每份被羡慕的工作背后，都有一些不那么被人羡慕的瞬间。</p>
					<ul class="diarysocial-links">
						<li><a href="#" class="fa fa-qq"></a></li>
						<li><a href="#" class="fa fa-weibo"></a></li>
						<li><a href="#" class="fa fa-weixin"></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-4 col-sm-4 col-xs-4">
			<div class="diarybox">
				<div class="diarybox-img">
					<img src="user/images/hppic27.jpg" alt="">
				</div>
				<div class="diarybox-content">
					<h4 class="diarytitle">大山之中,用心的半个月</h4>
					<p class="diarydescription">早上当地的老师带着我们沿小路出发，我接触小孩们的第一天还是蛮成功，从他们的名字、年级，到孩子给大家讲自己学过的东西，每个人都没有了一开始的尴尬，越来越融洽。之后越来越多的孩子来到院子里坐到旁边，我都以微笑来欢迎他们.</p>
					<ul class="diarysocial-links">
						<li><a href="#" class="fa fa-qq"></a></li>
						<li><a href="#" class="fa fa-weibo"></a></li>
						<li><a href="#" class="fa fa-weixin"></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-4 col-sm-4 col-xs-4">
			<div class="diarybox">
				<div class="diarybox-img">
					<img src="user/images/hppic28.jpg" alt="">
				</div>
				<div class="diarybox-content">
					<h4 class="diarytitle">走进大山</h4>
					<p class="diarydescription">为什么要到这么偏远的地方来支教？我自己也说不出个一二三。但每个人都会有自己的原因，而且是千差万别的原因。就我认识的支教老师当中，都是带着个人的目的，甚至是很自私的目的来的。但当我们来了之后，我们都全身心地投入到支教活动中，几乎没有缺乏责任心的支教老师。</p>
					<ul class="diarysocial-links">
						<li><a href="#" class="fa fa-qq"></a></li>
						<li><a href="#" class="fa fa-weibo"></a></li>
						<li><a href="#" class="fa fa-weixin"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12" id="more-beauty">
			<button class="btn btn-info" onclick="window.location.href='ActivityCenter?phone=${user.u_phone}'">更多活动</button>
		</div>
	</div>
</div>


<div class="container-fluid" id="content-bottom">
	
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
							<input type="password" id="psw" name="user.u_psw" placeholder="设置密码"/>
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

    <footer>
        <p class="pull-right" id="top"><a href="#ad-carousel"><img src="user/images/top.png"></a></p>
		
        <div id="footer-pic" class="col-md-12 col-sm-12 col-xs-12">
        	<img src="user/images/hppic29.jpg">
        </div>
        <div id="footer-text" class="row">
        	<div id="first-line" class="col-md-2 col-sm-2 col-xs-2">
				<p>|&nbsp;&nbsp;关于我们</p>
				<p>&nbsp;&nbsp;&nbsp;网站介绍</p>
				<p>&nbsp;&nbsp;&nbsp;创始人介绍</p>
        	</div>
        	<div id="first-line" class="col-md-2 col-sm-2 col-xs-2">
				<p>|&nbsp;&nbsp;活动申请</p>
				<p>&nbsp;&nbsp;&nbsp;活动培训</p>
				<p>&nbsp;&nbsp;&nbsp;保险服务</p>
        	</div>
        	<div id="first-line" class="col-md-2 col-sm-2 col-xs-2">
				<p>|&nbsp;&nbsp;网站条款</p>
				<p>&nbsp;&nbsp;&nbsp;版权声明</p>
				<p>&nbsp;&nbsp;&nbsp;免责声明</p>
        	</div>
        	<div id="first-line" class="col-md-2 col-sm-2 col-xs-2">
				<p>|&nbsp;&nbsp;联系我们</p>
        	</div>
        	<div class="col-md-2 col-sm-2 col-xs-2" id="footer-text-pic">
				<img src="user/images/code.png">
        	</div>
        </div>
    </footer>
    <s:debug></s:debug>
</div>
</body>
   </html>