<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">	
	<title>发布游记</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="./user/js/libs/jquery-1.11.1.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./user/css/nav.css">
  <link href="./user/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="./user/css/froala_editor.min.css" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="user/images/greyLogo.png">
  <link rel="stylesheet" type="text/css" href="./user/css/demo1.css"/>
  <link rel="stylesheet" type="text/css" href="./user/css/easydropdown.css"/>
  
  <script src="./user/js/jquery.easydropdown.js"></script>
  <script src="./user/js/froala_editor.min.js"></script>
  <script src="./user/js/publishnotes.js"></script>
  <script src="./user/js/froala_editor.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../user/js/froala_editor_ie8.min.js"></script>
  <![endif]-->
  <script src="./user/js/plugins/tables.min.js"></script>
  <script src="./user/js/plugins/lists.min.js"></script>
  <script src="./user/js/plugins/colors.min.js"></script>
  <script src="./user/js/plugins/media_manager.min.js"></script>
  <script src="./user/js/plugins/font_family.min.js"></script>
  <script src="./user/js/plugins/font_size.min.js"></script>
  <script src="./user/js/plugins/block_styles.min.js"></script>
  <script src="./user/js/plugins/video.min.js"></script>
	<link rel="stylesheet" href="./user/css/style.css">
  <link rel="stylesheet" href="./user/css/publishnotes.css">
</head>
<body>
<s:include value="nav.jsp"></s:include>

<div id="mycontainer" >
  <div>
    
    <img src="./user/images/papic.jpg" class="img-responsive" alt="Responsive image">
  </div>
  <div id="notebasictitle"><h3>我的游记</h3></div>
  <div id="notebasic">
    <div id="leftlogo"><img src="./user/images/logo2.png"></div>
    <img src="./user/images/border2.png" id="border2">
    <form class="form-horizontal" id="noteform">
    <div class="form-group form-group-lg">
        <label for="" class="col-md-4 control-label"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;选择活动：</label>
        <div class="col col-md-5">
			<select tabindex="6" class="dropdown form-control" form="noteform"  name="a" data-settings='{"cutOff": 5}'>
			<s:iterator value="activities" var="a">
				<option value="${a.a_id }" >${a.a_name }</option>
			</s:iterator>
			<select>
		</div>
        
        
      </div>
    
      <div class="form-group form-group-lg">
        <label for="notetitle" class="col-md-4 control-label"><span class="glyphicon glyphicon-header"></span>&nbsp;&nbsp;我的标题：</label>
        <div class="col-md-5">
          <input type="text" class="form-control" id="notetitle" name="note.title" placeholder="">
        </div>
      </div>
      <input value="${user.u_phone }" name="phone" type="hidden">
      <div class="form-group form-group-lg">
        <label for="notebrief" class="col-md-4 control-label"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;游记简述：</label>
        <div class="col-md-5">
          <input type="text" class="form-control" id="notebrief" placeholder="" name="note.t_desc">
        </div>
      </div>
      
      <div class="form-group form-group-lg">
        <label for="notepic" class="col-md-4 control-label"><span class="glyphicon glyphicon-picture"></span>&nbsp;&nbsp;游记封面：</label>
        <div class="col-md-5" id="picload">
          <div id="editAvatar">
              <div id="mypic" class=""> 
                <img id="uploadimg" src="./user/images/plus.png" alt="" class="uploadpic"> 
              </div>
              <a id="editText" >上传图片</a>
                 <input id="file_upload" type="file"  style="cursor:pointer;opacity:0;position: absolute;width:80px;top:190px;left:30%;height: 30px;z-index: 2" name="coverimg"  ></input>
          </div> 
        </div>
      </div>
      <img src="./user/images/border1.png" id="border1">
    </form>
  </div>
  <!--  -->
  <div id="notecontitle"><h3>游记内容</h3></div>
  <div id="notecon">
    <div id="noteconlabel"><h3><span class="glyphicon glyphicon-edit"></span>&nbsp;请编辑游记内容：</h3></div>
    <div id="rightlogo">
      <img src="./images/logo3.png">
    </div>
    <section id="editor" >
      <div id="edit" style="margin-top: 30px;">
		
      </div>
    </section>
    <div id="submitdiv"><button type="submit" class="btn" id="notesubmit" data-toggle="modal" data-target="#alertmodal" onclick="publishnote()">我要提交</button></div>
    <div class="modal fade" id="alertmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <div class="modal-body" id="alertcontent">
            成功发布游记！
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-info" data-dismiss="modal" >确定</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
  <script type="text/javascript">
  	function publishnote(){
  		var formData = new FormData($("#noteform")[0]);
  		var content=$(".froala-element").html();
  		formData.set("note.t_content",content);
  		formData.set("phone",${user.u_phone});
  		 $.ajax({  
	         url: 'setting/Note' ,  
	         type: 'POST',  
	         data: formData, 
	         async: true,  
	         cache: false, 
	         contentType: false,  
	         processData: false,  
	         success: function (returndata) { 
	         },  
	         error: function (returndata) {  
	              alert("添加失败");
	         }  
	    });
  	}
  	 $(function() {
  		  $("#file_upload").change(function() {
  		  var $file = $(this);
  		  var fileObj = $file[0];
  		  var windowURL = window.URL || window.webkitURL;
  		  var dataURL;
  		  var $img = $("#uploadimg");
  		  if(fileObj && fileObj.files && fileObj.files[0]){
  		  dataURL = windowURL.createObjectURL(fileObj.files[0]);
  		  $img.attr('src',dataURL);
  		  }else{
  		  dataURL = $file.val();
  		  var imgObj = document.getElementById("uploadimg");
  		  // 两个坑:
  		  // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
  		  // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
  		  imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
  		  imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
  		   
  		  }
  		  });
  		  });
  </script>
  
</html>