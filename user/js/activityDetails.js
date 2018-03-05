//点赞：
$("#trumbsUp").click(function(){
  if($("#trumbsUpSpan").text()=="我要点赞"){
     var ThumbsUpNumber=parseInt($("ThumbsUpNumber").text())+1;
     $("ThumbsUpNumber").text(ThumbsUpNumber);  
     $(".myThumbsUp").css("color","red");
     $("#trumbsUpSpan").text("取消点赞");
  }else{
     var ThumbsUpNumber=parseInt($("ThumbsUpNumber").text())-1;
     $("ThumbsUpNumber").text(ThumbsUpNumber); 
     $(".myThumbsUp").css("color","#333");
     $("#trumbsUpSpan").text("我要点赞");
  }
});


// 左边nav的hover事件：
$('.LeftBanner a').hover(function(){
    $(this).animate({left:'0px'},300);   
},function(){
$(this).animate({left:'-110px'},300);   
});


// 切换不同页面：
function showPage(clickLiName,showpage){
  $(clickLiName).click(function(){
    changePages(clickLiName,showpage);
    // 当切换到活动安排页面时 body的min-width：900px
    if($("#arrangementsPage").css("display")=="block"){
      $("body").css("min-width","900px");
    }

  });
}
function changePages(clickLiName,showpage){
    $(clickLiName).find("a").addClass("changeA");
    $(clickLiName).siblings().find("a").removeClass("changeA");
    $(showpage).css("display","block");
    $(showpage).siblings(".mypageDiv").css("display","none"); 
}
showPage(".travelNotes","#travelNotesPage");
showPage(".arrangements","#arrangementsPage");
showPage(".notice","#noticePage");
showPage(".fee","#feePage");
showPage(".attention","#attentionPage");
showPage(".signUp","#signUpPage");
 
 // 转到我要报名：
$("#travelNotesPage #signUpBtn,#arrangementsPage #signUpBtn,#noticePage #signUpBtn,#attentionPage #signUpBtn,#feePage #signUpBtn").click(function(){
  changePages(".signUp","#signUpPage");
});
$("#bannerSignUpBtn").click(function(){
	  changePages(".signUp","#signUpPage");
	});



/*以下为非同一样式：——————————————————————————————————————————————————*/

// 1.travelNotes:我的游记页面：

// 元素滚动监听：
function customWayPoint(className, addClassName, customOffset) {
  var waypoints = $(className).waypoint({
    handler: function(direction) {
      if (direction == "down") {
        $(className).addClass(addClassName);

      } else {
        $(className).removeClass(addClassName);
      }
    },
    offset: customOffset
  });
}

var defaultOffset = '50%';

for (i = 0; i < 17; i++) {
  customWayPoint('.timeline__item--' + i, 'timeline__item-bg', defaultOffset);
}

// 如果大于4个文章，则显示更多按钮：
if($("#travelNotesPage .timeline__item").length<=4){
  $("#travelNotesPage #showMoreBtn").hide();
}else{
  $("#travelNotesPage #showMoreBtn").show();
}

var ContentArray=$("#travelNotesPage .timeline__item__content");
for(var i=0;i<ContentArray.length;i++){
  // cover效果:
  if($(ContentArray[i]).css("background-image")!="none"){
    $(ContentArray[i]).find(".coverContent").css("visibility","hidden");
    $(ContentArray[i]).hover(function(){
      $(this).find(".coverContent").css("visibility","visible");
      $(this).find(".coverBg").css("visibility","visible");
    },function(){
      $(this).find(".coverContent").css("visibility","hidden");
      $(this).find(".coverBg").css("visibility","hidden");
    });
  }else{
    $(ContentArray[i]).hover(function(){
      $(this).find(".coverContent").removeClass("coverContent");
    });
  }

 
 
}

    // 图片上传
    var filepath;
    $('#travelNotesPage .fileinput').change(function(){
        filepath=$(this).val(); 
        var filepath1=filepath.split('\\');
        var filename=filepath1[filepath1.length-1];
        $('#uploadpic').attr("src","../images/"+filename);
        $('#mypic').css('top','3%');
        $('#mypic').css('left','0');
        $('#mypic').css('width','100%');
        $('#mypic').css('border','1px solid white');
        $('#editAvatar').css('background','none');
    });
   $(function(){
      $('#edit').editable({inlineMode: false, alwaysBlank: true})
  });
// ajax显示更多数据:

// $("#showMoreBtn").click(function(){
//   $.ajax({
//                type: "post",//数据提交的类型（post或者get）
//                url: "travelNotes.jsp",//数据提交得地址
//                data: {id:1,num:5},//提交的数据(自定义的一些后台程序需要的参数)
//                dataType: "json",//返回的数据类型
//                success: function(data){//请求成功后返执行的方法（这里处理添加五条的数据 data为处理之后的返回数据）
//               var str = "";
//               $.each(data,function(num,title,date,author,readCount){//循环遍历返回的json数据,a为
//                   str += "<div class='timeline__item timeline__item--"+num+"'><div class='timeline__item__station'></div><div class='timeline__item__content'><h4 class='timeline__item__content__title'>"+title+"</h4><p class='timeline__item__content__date'>"+date+"</p><span class='timeline__item__content__author'>"+author+"</span><span  class='timeline__item__content__readCount'>阅读:"+readCount+"</span></div></div>";     //将json数据拼接成字符串
              
//               });
//             $(".wrapper").append(str)//将拼接好数据追加到id为main的对象里
//                }
//   )};
//   changeHeight();
// });

// 点击更多 ：
var timelineItemArry=$(".timeline__item");
for(var i=4;i<timelineItemArry.length;i++){
  $(timelineItemArry[i]).hide();
}
if($("#travelNotesPage .timeline__item").length<=6){
  $("#showMoreBtn").hide();
}else{
  $("#showMoreBtn").show();
}
$("#showMoreBtn").click(function(){
  if($(this).text()=="显示更多"){
    for(var i=4;i<=timelineItemArry.length;i++){
      $(timelineItemArry[i]).show();
    }
    $(this).text("收起更多");   
  }else{
    for(var i=4;i<=timelineItemArry.length;i++){
      $(timelineItemArry[i]).hide();
    }
    $(this).text("显示更多");
  }

});

// 点击提交时判断是否登录：
function submit(data){
  alert("data");
  // if(data=="undefined"){
  //   $("#notesubmit").attr("data-target","#alertmodal");
  // }else{
  //   $("#notesubmit").attr("data-target","#Loginmodal");
  // }
}

// 2.arrangements:活动安排

// 中间垂直线的高度：
var LineNum=$("#arrangementsPage .SchedulingItem").length;
var top=LineNum*240+"px";
$("#lastBRcorner,#lastBLcorner").css("top",LineNum*240-80+"px");
$("#SchedulingBody").height(LineNum*240+70+"px");
var verticalLine=$("#SchedulingBody").height()-40;
$('head').append("<style>#arrangementsPage #SchedulingBody::before{ height:"+verticalLine+"px }</style>");

// 3.notice:注意事项——————无js

// 4.fee:费用说明


//费用 包含：

  function toDegrees(angle){
    return angle * (Math.PI / 180);
  }
 
  //console.clear();
  var parent = $('#feePage div.parent');
  console.log(parent);
  var parentLeft = parent.offset().left;
  var parentTop = parent.offset().top;
  var parentLeftCentre = parentLeft + (parent.width() / 2);
  var parentTopCentre = parentTop + (parent.width() / 2);
  
  //包含项目的数量：
  var noOfServices = $(".hasItem").length;
  //Half width of parent
  var parentCircleHalfWidth = 90; 
  //Add some padding from parent circle
  var Hyp = parentCircleHalfWidth + 100; 
  //360 degrees / 包含项目的数量
  var angle = Math.round(360 / noOfServices); 
  // popover数据：
  var popoverJson={
    "popoverInf":[
      {"popoverTitle":"车辆","popoverContent":"全程正规旅行用车（含师傅吃住及补助、过路费、油费）"},
      {"popoverTitle":"住宿","popoverContent":"全程住宿"},
      {"popoverTitle":"领队","popoverContent":"专业领队带队，小众纯玩深度旅行"},
      {"popoverTitle":"单房差","popoverContent":"单人报名安排同性拼房，若拼房不成房差由组织者承担；"},
      {"popoverTitle":"保险","popoverContent":"意外保险，人身保险"},
      {"popoverTitle":"公用装备","popoverContent":"旅行所需药品和集体物资"},
      {"popoverTitle":"往返交通","popoverContent":"往返大交通"},
      {"popoverTitle":"体验项目","popoverContent":"乡村活动涉及的体验项目"},
      {"popoverTitle":"个人消费","popoverContent":"限定个人消费，给予部分补助,消费前请询问负责人"},
      {"popoverTitle":"用餐","popoverContent":"全程集体用餐"}

    ]
  }  
  for(var i = 1; i <= noOfServices; i++){ 
    var currentAngle = i * angle;
    //calculate the positioning of the child circle around the parent circle
    var circlePosXOpp = Math.sin(toDegrees(currentAngle)) * Hyp;
    var circlePosYAdj = Math.cos(toDegrees(currentAngle)) * Hyp;
    //create a child element and assign "child" class with some properties such as positining
    var currentChild = $('<div class="child" role="button" data-toggle="" data-trigger="focus" tabindex="0" data-placement="right" title="说明" data-content=""></div>').appendTo('div.parent');  
    currentChild.css({'transform' : 'translate(' + circlePosXOpp + 'px, ' + -circlePosYAdj + 'px)'});
// 设置项目文字：
    var childTextArray=$(".hasItem");
    var currentChildText=childTextArray[i-1].innerHTML;
    currentChild.text(currentChildText); 
// 设置数据：
    currentChild.attr("title",currentChildText);
    var k;
    for (k in popoverJson.popoverInf) {
        if(popoverJson.popoverInf[k].popoverTitle==currentChildText){
          currentChild.attr("data-content",popoverJson.popoverInf[k].popoverContent);
       
        }
    }
  
  }



// 设置旋转动画效果：
var offsetAngle = 0,
  carousel = $('#carousel'),
  container = $('.circle-container'),
  circles = $('.child');
var carouselBoundingRect = document.getElementById('#carousel').getBoundingClientRect(),
  carouselSize = {
    w: carouselBoundingRect.width,
    h: carouselBoundingRect.height,
    radius: carouselBoundingRect.width / 2,
    circle: circles[0].getBoundingClientRect().width
  }
function setPosition() {
  var circles = $('.child');
  var circleSize = circles[0].getBoundingClientRect().width;
  for (var i = 0; i < circles.length; i++) {

    var angle = (360 / circles.length) * i + offsetAngle;
    var radians=angle / 360 * 2 * Math.PI;
    var transformY = (Math.sin(radians) * carouselSize.radius - carouselSize.circle / 2) + "px";
    var transformX = (Math.cos(radians) * carouselSize.radius - carouselSize.circle / 2) + "px";
    circles[i].style.transform = "translate3d(" + transformX + ", " + transformY+ ", 0)";
    circles[i].style.left="80px";
    circles[i].style.top="80px";
  };
} 
function rotate() {
  var circles = $('.child');

  offsetAngle += (360 / circles.length);

  if (offsetAngle > 360)
    offsetAngle -= 360;

  setPosition();
}
var timer;
function start(){
    timer=setInterval(function() {rotate();},1500);
    $(this).unbind("click").click(stop);
    // 让popover消失：
} 

function stop(){
    clearInterval(timer);
    // $('.child').popover();
    $(".popover").css("width","250px");
    $(this).unbind("click").click(start);
}
$(".outer-outer-ring,.circle,.front,.back").click(start());


 $('.child').hover(function() {
    clearInterval(timer);
    if($(this).offset().left < document.body.scrollWidth / 2){
      $(this).attr("data-placement","left");
    }
    $(this).attr("data-toggle","popover");
   // alert($(this).attr("data-placement"));  
    // 弹出框初始化：
    $(this).popover(); 
    $(".popover").css("width","250px");
  },function(){
    // var timer=setInterval(function() {rotate();},1500);
  });


// 5.attention:申请要求————无js

// 6.signUp:我要报名

$(".promptLine").hide();
var flag="hideFlag";
// 点击x删除提示框：
$(".prompt span").click(function(){
  $(this).closest(".promptLine").hide();
});
// 姓名提示框：
$("#nameInput").blur(function(){
  if($(this).val().trim()==""){
    $("#NamePrompt").closest(".promptLine").show();
    $("#NamePrompt promptText").text("请输入姓名！");
    flag="showFlag";
  }else{
    $("#NamePrompt").closest(".promptLine").hide();
    flag="hideFlag";
  }
});
// 手机号码提示框：
$("#TelPhoneInput").blur(function(){
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(14[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
  if(!myreg.test($(this).val().trim())||($(this).val().length!=11)){
    $("#TelPhonePrompt").closest(".promptLine").show();
    $("#TelPhonePrompt promptText").text("请您输入正确的手机号码！");
    flag="showFlag";
  }else{
    $("#TelPhonePrompt").closest(".promptLine").hide(); 
    flag="hideFlag";   
  }  
});
// 邮箱提示框：
$("#EmailInput").blur(function(){
  var myreg = /\w+[@]{1}\w+[.]\w+/;; 
  if(!myreg.test($(this).val().trim())){
    $("#EmailPrompt").closest(".promptLine").show();
    $("#EmailPrompt promptText").text("请您输入正确的邮箱！");
    flag="showFlag";
  }else{
    $("#EmailPrompt").closest(".promptLine").hide();
    flag="hideFlag";     
  }  
});
// 微信提示框：
$("#WeChatInput").blur(function(){
  var myreg = /^[a-zA-Z\d_]{5,}$/;  
  if(!myreg.test($(this).val().trim())){
    $("#WeChatPrompt").closest(".promptLine").show();
    $("#WeChatPrompt promptText").text("请您输入正确的微信号！");
    flag="showFlag";
  }else{
    $("#WeChatPrompt").closest(".promptLine").hide();  
    flag="hideFlag";   
  }  
});
// 紧急联系电话提示框：
$("#PhoneInput").blur(function(){
  var myreg = /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/ ;   // 固话：
  var myreg2=/^(((13[0-9]{1})|(15[0-9]{1})|(14[0-9]{1})|(18[0-9]{1}))+\d{8})$/;// 手机号码： 

  if(!myreg.test($(this).val().trim())&&(!myreg2.test($(this).val().trim()))){
    $("#PhonePrompt").closest(".promptLine").show();
    $("#PhonePrompt promptText").text("请您输入正确的联系方式！");
    flag="showFlag";
  }else{
    $("#PhonePrompt").closest(".promptLine").hide();
    flag="hideFlag";     
  }  
});
// 确认报名的条件：
$("#signUpPage #signUpBtn").click(function(){
  if($(".promptLine").is(':hidden')&&$(".col-xs-12 input").val()!=""&&flag=="hideFlag"){
    $("#signUpPage #signUpBtn").attr("data-target","#signUpModal");
  }else{
    $("#signUpPage #signUpBtn").attr("data-target","#signUpFailModal")
  }  

});

