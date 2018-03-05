window.onload=init;

function init(){

    // 图片上传
    var filepath;
    $('.fileinput').change(function(){
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

   $('#returnbtn').click(function(){
        window.location.href="personalcenter.jsp";
    });
    $('#returnnote').click(function(){
        window.location.href="personalcenter.jsp";
    })
}