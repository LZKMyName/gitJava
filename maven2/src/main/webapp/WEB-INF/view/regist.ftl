<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/bootstrap-theme.min.css"/>
	   	<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/site.min.css"/>
		<script src="${base.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base.contextPath}/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base.contextPath}/static/js/regist.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<style type="text/css">
		.container{padding: 0;}
		.head{letter-spacing: 10px;}
		.conttainer:nth-child(".row"){background-color: #A6E1EC;}
		body{padding:0;}
		.jumbotron{margin-bottom:0;}
	</style>
	<body>
			<div class="container">
				<div class="row">
					<div class="page-header head">
					  <h1 >欢迎入驻<small>XXX资讯中心</small></h1>
					</div>
			        <div class="col-md-1">
		        	</div>
		        	 <div class="col-md-10">
		        	 	<div class="panel panel-primary ">
						<div class="panel-heading">
						    用户注册
						  </div>
					    <div class="panel-body">
					    	<form role="form" id="inputFile">
							  <div class="form-group">
							    <label for="username">用户名</label>
							    <input type="email" class="form-control" id="username" name="username" placeholder="用户名">
							  </div>
							  <div class="form-group">
							    <label for="password">密码</label>
							    <input type="password" class="form-control" id="password" name="password" placeholder="密码">
							  </div>
							  <div class="form-group">
							    <label for="upload">上传头像</label>
							    <input type="file" name ="uplodFile" id="upload">
							    <p class="help-block">点击上方按钮上传你的头像</p>
							  </div>
							  <button type="button" class="btn btn-default regist">注册</button>
							  <button type="button" class="btn btn-default login">登录</button>
							</form>
					    </div>
					</div>
		        	</div>
		        	 <div class="col-md-1">
		        	</div>
				</div>
			</div>
			
	</body>
</html>
