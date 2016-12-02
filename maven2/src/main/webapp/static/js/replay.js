$(document).ready(function(){
	$("body").on("click",".replaybtn",function(){
		$("textarea").focus();//焦点集中
		$("#submit").data("data-pid",$(this).attr("data-pid"));//通过品论按钮回复 
		$("#submit").data("button",$(this));//保存点击的按钮
	});
	
	$("#submit").on("click" ,function(){//点击提交
			var arr=[];//连接数据的数组
			var date= new Date();
			arr.push("time="+date.getTime());//保存发帖时间
			var autohrName = $("#post-author").text();//帖子作者名
			
			var button=$(this).data("button");//品论或回复按钮
			console.log(button);
			console.log("text"+button.text());
			var replayButton=$("#replay");//评论按钮
			
			var pid = $(this).data("data-pid");//取通过评论按钮进行评论的对象的id
			
			if(pid==undefined)//直接回复
				pid=0;
			
			arr.push("pid="+pid);
			var postId = $("#postId").attr("data-pid");//帖子的id
			arr.push("postId="+postId);
			
			var user = $("#username");
			if(user.length==0){//登录判断
				alert("请先登录,在发表评论");
				$(".form-control:eq(1)").focus();
				return;
			}else{
				arr.push("username="+user.text());//login用户名
			}
			
			var context = $("textarea").val();//评论内容	
		 
			if(context.trim()==""){//TODO:good去空评论
				$("textarea").val("");
				return;
			}else{
				arr.push("context="+context);
			}
			if(button!=null&&button.attr("data-grade")=="3"){//第三级评论
				arr.push("replayPeople="+button.siblings("strong").text())
			}
			
			/**
			 * 传输数据到后台
			 */
			$.ajax({
				url:"/maven2/PostController/addReplay",
				type:"post",
				data:arr.join("&"),
				success:function(data){
					var html="";
					
					if(button==undefined||button.text().trim()=="评论"){//是通过点击按钮或直接发布评论的 
						buttonDirectReplay(html,replayButton,user,data,context);
						$("#submit").removeData("data-pid");
						$("#submit").removeData("button");
					}else if(button.attr("data-grade")=="1"||button.attr("data-grade")=="2"){
						button1And2(html,button,user,data,context);
						$("#submit").removeData("data-pid");
						$("#submit").removeData("button");
					}else{
						button3(html,button,user,data,context);
						$("#submit").removeData("data-pid");
						$("#submit").removeData("button");
					}
					
					html="";
				}
			});
			  	function buttonDirectReplay(html,button,user,data,context){
			  		html+="<li class='list-group-item'><div class='panel panel-default'><div class='panel-heading'><button type='button' class='btn btn-default btn-xs' data-pid='"+pid+"'>";
			  		html+="评论人:"+"<strong>"+user.text()+"</strong>";
			  		html+="<span class='glyphicon glyphicon-envelope'></span> </button></div><div class='panel-body'><div> 评论内容 : <span>"+context+"</span>";
					html+="<div><div><h6 class='text-right'>回复时间："+date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</h6></div><ul class='list-group'></ul></div></div></li>";
			  		button.next("ul").append(html);
			  	}
			  	function button1And2( html,button,user,data,context){
			  		var dataGrade="";
			  			if(button.attr("data-grade")=="1")
			  				dataGrade=2;
			  			else
			  				dataGrade=3;
			  		html+="<li class='list-group-item'><div class='panel panel-default'>";
			  		html+="<div class='panel-heading'><strong>"+user.text()+":</strong>"+"回复"+button.siblings("strong").text()+"<button type='button' class='btn btn-default btn-xs' data-pid='"+pid+"' data-grade='"+dataGrade+"'><span class='glyphicon glyphicon-envelope'></span> 回复</button></div><div class='panel-body'><div> 回复内容 : <span>"+context+"</span>";
					html+="<div><div><h6 class='text-right'>回复时间："+date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</h6></div><ul class='list-group'></ul></div></div></li>";
			  		button.parent("div.panel-heading").parent("div.panel").find("ul:eq(0)").append(html);
			  	}
			  	function button3(html,button,user,data,context){
			  		html+="<li class='list-group-item'><div class='panel panel-default'>";
			  		html+="<div class='panel-heading'><strong>"+user.text()+":</strong>"+"回复"+button.siblings("strong").text()+"<button type='button' class='btn btn-default btn-xs' data-pid='"+pid+"' data-grade='3'><span class='glyphicon glyphicon-envelope'></span> 回复</button></div><div class='panel-body'><div> 回复内容 : <span>"+context+"</span>";
					html+="<div><div><h6 class='text-right'>回复时间："+date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</h6></div><ul class='list-group'></ul></div></div></li>";
					button.parent("div.panel-heading").parent("div.panel").parent("li").parent("ul").append(html);
			  	}
			  	
	});
	
	$("#cancal").on("click" ,function(){//点击取消
		$("#submit").removeData("data-pid");
		$("#submit").removeData("button");
		$("textarea").val("");
	});
	
	
});