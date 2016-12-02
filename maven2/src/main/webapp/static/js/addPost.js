$(document).ready(function(){
var ue = UE.getEditor('container',
		{
	toolbars:[[ 'undo', //撤销
           'redo', //重做
           'bold', //加粗
           'indent', //首行缩进
           'snapscreen', //截图
           'italic', //斜体
           'underline', //下划线
           'strikethrough', //删除线
           'formatmatch', //格式刷
           'preview', //预览
           'removeformat', //清除格式
           'unlink', //取消链接
           'mergecells', //合并多个单元格
           'cleardoc', //清空文档
           'fontfamily', //字体
           'fontsize', //字号
           'paragraph', //段落格式
           'simpleupload', //单图上传
           'insertimage', //多图上传
           'link', //超链接
           'emotion', //表情
           'spechars', //特殊字符
           'searchreplace', //查询替换
           'justifyleft', //居左对齐
           'justifyright', //居右对齐
           'justifycenter', //居中对齐
           'justifyjustify', //两端对齐
           'forecolor', //字体颜色
           'fullscreen', //全屏
           'imagecenter', //居中
           'lineheight', //行间距
           'edittip ', //编辑提示
           'autotypeset', //自动排版
           'touppercase', //字母大写
           'tolowercase', //字母小写
           ]],autoHeightEnabled: false,autoFloatEnabled: false});
   $("#submit").click(function(){
	 var data=[];
	var title = $("#postTitle").val();
	if(title!=""){
		data.push("title="+title);
	}else{
	    alert("请输入标题");
	    return;
	}
	data.push("content="+ue.getContent());
	var user = $("#username");

	if(user.length>0){
	
	 	data.push("username="+$("#username").text());
	}else{
		 alert("请先登录");
		 return;
	}
	console.log(data.join("&"));
		 $.ajax({
		 url: "/maven2/PostController/addPost", 
	     type: 'POST',
	     data: data.join("&"),
	     success: function(data){
	       if(data=="1"){
	          alert("添加成功");
	          ue.resert();
          }
	     } 
	     });
});
$("#resert").click(function(){
	console.log(ue);
		var test =ue.execCommand("");
	});
});