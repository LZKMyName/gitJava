<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta name="Generator" content="ZhangJi" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户登录</title>
		<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/bootstrap.min.css"/>
		<script src="${base.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base.contextPath}/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${base.contextPath}/static/js/Validform_v5.3.2.js"></script>
</head>
		<style type="text/css">
		.jumbotron{background-color:  rgb(59,28,68);}
			
		</style>
		<script type="text/javascript">
		$(function($){
			$("button[type='button']").on("click",function(){
			
					window.location.href="/PostProject/view/regist";
				});
		});
			
		
		</script>

<body>
        <div class ="container" >
	        <div class="row">
	            <div class="col-md-3"></div>
	            <div class="col-md-6">
	            <div class="jumbotron">
		            <div class="panel panel-success">
					  <div class="panel-heading" >
					   	 	<p >贴站登录</p>
					  </div>
					  <div class="panel-body">
						  <form class="form-horizontal" role="form" method="post" action="${base.contextPath}/PostController/login" >
							  <div class="form-group">
							    <label for="inputEmail3" class="col-md-2 control-label">Email</label>
							    <div class="col-md-10">
							      <input type="text" class="form-control" id="inputEmail3" name ="username" placeholder="用户名">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-md-2 control-label">Password</label>
							    <div class="col-md-10">
							      <input type="password" class="form-control" id="inputPassword3" name= "password" placeholder="密码">
							    </div>
							  </div>
							  <div class="form-group">
							    <div class="col-md-offset-2 col-md-10">
							        <button type="submit" class="btn btn-primary btn-sm">登录</button>
  									<button type="button" class="btn btn-default btn-sm">注册</button>
							    </div>
							  </div>
							</form>
					  </div>
					</div>
	            	</div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
        </div>
		

	<script>
	$(document).ready(function(){//开启验证
		var demo = $("#register").Validform({
			tiptype:2
		});
		
	});
	</script>




</body>
</html>



