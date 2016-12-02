$(document).ready(function(){
	$("button.login").on("click",function(){
		window.location.href="/PostProject/view/login"
	});
	$("button.regist").on("click",function(){
		var username =$("#username").val();
		var password = $("#password").val();
		
		var formData = new FormData();
		if(username!="")
			
			formData.append("username",username);
		else{
			alert("请填写用户名");
			return;
		}
		if(password!="")
			formData.append("password",password);
		else{
			alert("请填写密码");
			return;
		}
		formData.append("uplodFile",$("#upload")[0].files[0]);//单个input type=“file”输入框，
//		var formData = new FormData($("#uploadForm")[0]);//整个表当
		$.ajax({ 
			url :"/PostProject/PostController/regist", 
			type : "POST", 
			data : formData,
		/*	canch:"no",*/
			// 告诉jQuery不要去处理发送的数据
			processData : false, 
			// 告诉jQuery不要去设置Content-Type请求头
			contentType : false,
			dataType:"JSON",
			success:function(data){
				if(data.statu=="y"){
					alert(data.message+"可以前往登录");
				    $("#username").val("");
				    $("#password").val("");
				}else{
				    alert(data.message+"：请重新注册");
				}
			}
		});
			
	});
	
	
});
