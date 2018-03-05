<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="admin/css/loginstyle.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>


</head>
<body>
	<div class="main">
		<div class="login">
			<h1>管理系统</h1>
			<div class="inset">
				<!--start-main-->
				<form action="admin/Login" method="post">
			         <div>
			         	<h2>管理登录</h2>
						<span><label>用户名</label></span>
						<span><input name="id" type="text" class="textbox" id="loginname" onfocus="inputfocus(this)" onblur="inputblur(this)" style="margin-bottom: 12px;"></span>
						<span id="loginnameError" class="errorSpan" ><label ></label></span>
					 </div>
					 <div style="margin-top: 15px;">
						<span><label >密码</label></span>
					    <span><input  name="psw" type="password" class="password" id="loginpass" onfocus="inputfocus(this)" onblur="inputblur(this)" style="margin-bottom: 12px;"></span>
					    <span id="loginpassError" class="errorSpan"><label ></label></span>
					 </div>
					<div class="sign">
                        <input type="submit" value="登录" class="submit" />
					</div>
					</form>
				</div>
			</div>
		<!--//end-main-->
		</div>



</body>

<script type="text/javascript">

	//获取焦点后隐藏错误信息
	function inputfocus(ele){
		var labelid = ele.id + "Error";
		document.getElementById(labelid).innerHTML = "";
		showError(document.getElementById(labelid));
	}

	//失去焦点后进行校验；
	//1.获得失去焦点的id；2.通过id值得到调用方法。3.使用eval方法把方法名调用
	function inputblur(ele){
		var id = ele.id;
		var funname = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";
		eval(funname);
	}

	//验证用户名
	function validateLoginname(){
		var id = "loginname";
		var value = document.getElementById(id).value;
		//1.非空验证
		if( !value ){
			document.getElementById(id + "Error").innerHTML = ("用户名不能为空");
			showError(document.getElementById(id + "Error"));
			return false;
		}

		//2.长度验证
		if(value.length < 3 || value.length > 12){
			document.getElementById(id + "Error").innerHTML = ("用户名长度必须在3 ~ 12之间");
			showError(document.getElementById(id + "Error"));
			return false;
		}
		//3.数字和字母校验
		//var reg=/[a-zA-Z]+(?=\d+)|\d+(?=[a-zA-Z]+)/g;//检验是否包含字母和数字的正则表达式
		//if(!reg.test(value)){
			//document.getElementById(id + "Error").innerHTML = ("用户名至少包含一个数字和一个字母");
			//showError(document.getElementById(id + "Error"));
			//return false;
		//}
	}
	//验证密码
	function validateLoginpass(){
		var id = "loginpass";
		var value = document.getElementById(id).value;
		//1.非空验证
		if( !value ){
			document.getElementById(id + "Error").innerHTML = ("密码不能为空");
			showError(document.getElementById(id + "Error"));
			return false;
		}
	}


function showError(ele){
	var text = ele.innerText;
	if (!text) {
		ele.style.display = "none";
	}else{
		ele.style.display = "";
	}
}

</script>

</html>