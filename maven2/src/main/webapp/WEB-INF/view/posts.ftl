<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>帖子列表</title>

		
	
	</head>
	
	<body>
		<#include "/inc/head.ftl">
		<script src="${base.contextPath}/static/js/optionPost.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.addbutton,.delbutton{margin-bottom:5px;}
		</style>
	<div class="row">
		<div class="col-md-1"></div>
		
			<div class="col-md-10">
			<div class="page-header">
				 <h3>欢迎来到本站: ${loginUser.user_name}</small></h3>
					<h1 class="text-center">帖子列表</h1>
					
						<button type="button" class="btn btn-default btn-md addbutton">
						  <span class="glyphicon glyphicon-plus"></span> 发帖
						</button>
						<button type="button" class="btn btn-default btn-md delbutton">
						  <span class="glyphicon glyphicon-minus"></span> 删帖
						</button>
					<#list posts as p>
						<div class="panel panel-default">
							  <div class="panel-heading">
							  		<input type="hidden" value="${p.id}">
	        						<input type="checkbox">
	      						作者：
	      						<span>${p.post_author}</span>
	  						  </div>
							  <div class="panel-body">
								<div><a href="${base.contextPath}/PostController/ShowInfo?id=${p.id}">标题：${p.post_title}</a> </div> <div class="text-right">发布日期：<span>${p.post_date}</span></div>
							  </div>
						</div>
			
					</#list >
			</div>
			</div>
			<div class="col-md-1"></div>
			
		
			
	</body>
</html>
