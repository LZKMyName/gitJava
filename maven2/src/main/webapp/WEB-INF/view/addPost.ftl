<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加帖子</title>
		<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/bootstrap.min.css"/>
		<script src="${base.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base.contextPath}/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
	



<#if congfig.right??>
<import file=''>
<#else>

</#if>
	</head>
	<style>
	#container{height:400px}
	.panel-body{height:500px}
	</style>
	<body>
	<#include "/inc/head.ftl">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
					  <div class="panel panel-info">
						  <div class="panel-heading">
						  	<div class="input-group input-group-lg">
							  <span class="input-group-addon">标题</span>
							  <input type="text" id="postTitle" class="form-control" placeholder="请输入标题">
							</div>
						  </div>
						  <div class="panel-body">
						    <!-- 加载编辑器的容器 -->
							    <script id="container" name="content" type="text/plain">
							    </script>
							    <!-- 配置文件 -->
							    <script type="text/javascript" src="${base.contextPath}/ueditor.config.js"></script>
							    <!-- 编辑器源码文件 -->
							    <script type="text/javascript" src="${base.contextPath}/ueditor.all.js"></script>
							    <!-- 实例化编辑器 -->
							    <script type="text/javascript" src="${base.contextPath}/static/js/addPost.js"></script>
						  </div>
						  <div class="panel panel-foot">
							 <button id="submit">提交</button>
							 <button id="resert">重置</button>
						  </div>
						</div>
				</div>
				<div class="col-md-1">
				</div>
				
			</div>
		</div>	
	</body>
</html>
