$(document).ready(function(){
	$(".addbutton").click(function(){
		window.location.href="/maven2/view/addPost";
	});
	$(".delbutton").click(function(){
		var $user = $("#username");
		if($user.length<1){
			alert("删帖前请先登录");
			return;
		}
		$checkBoxs = $(":checkbox:checked");
		if($checkBoxs.length<1){
			alert("请选中要删除的帖子");
			return;
		}
		var flag =true; 
		$checkBoxs.each(function(){
			if($(this).siblings("span").text()!=$user.text()){
				flag=false;
				return flag;
			}
		});
		if(!flag){
			alert("您不能删除他人的帖子");
			return ;
		}else{
			arr=[];
			$checkBoxs.prev("input[type='hidden']").each(function(){
				arr.push("id="+$(this).val());
				
			});
			$.ajax({
				url:"/maven2/PostController/delPosts",
				type:"get",
				data:arr.join("&"),
				success:function(data){
					if(data.statu=="y"){
						alter("删帖成功");
					
					}else{
						alter("删帖失败");
					}
				}
			});
		}
			
	});
});