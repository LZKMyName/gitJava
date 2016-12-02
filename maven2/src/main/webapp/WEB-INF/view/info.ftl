<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>帖子详情</title>
	</head>
		<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/bootstrap.min.css"/>
		<script src="${base.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base.contextPath}/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base.contextPath}/static/js/replay.js" type="text/javascript" charset="utf-8"></script>
		
	<body>
	<#include "/inc/head.ftl">
	<style>
			.list-group-item{border: none;padding:0;}
			.panel{margin-bottom:0}
			.panel-body{padding: 0;margin-left:20px}
			.panel-default{border-right:0}
			.input-modify{margin-top:10px}
			.panel-heading strong{margin-right:6px}
			p img{max-height:200px;max-weight:300px}
			.good{margin-left:20px;}
			.good:hover{cursor: pointer;}
	</style>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
				<div class="col-md-10">
				
				<div class="panel panel-info">
					  <div class="panel-heading"><h1 class="text-center">标题：<span>${info.value.postTitle}</span></h1>
					  	
					  </div>
					  <div display="none" id="postId" data-pid="${info.value.postId}"></div>
									  <div class="panel-body">
														<p>
															<h6 class="text-right">作者：<strong id="post-author">${info.value.postAuthor}</strong></h6>
															<h6 class="text-right">发布时间：<span>${info.value.postDate}</span></h6>
															<hr/>
															<div>内容：<p class="lead">${info.value.postContent}<p></div>
															
														</p>
														
															<hr/>
															<button type="button" class="btn btn-default btn-lg replaybtn" data-pid="${info.value.replayId}" id="replay">
														 	 	<span class="glyphicon glyphicon-envelope"></span> 评论
															</button>
													  <ul class="list-group">
													  <h3>评论详情</h3>
															  <#list info.trees as p1>
																	<li class="list-group-item">
																			<div class="panel panel-default grade1">
																					<div class="panel-heading">评论人：<strong>${p1.value.replayAuthor}</strong>
																							<button type="button" class="btn btn-default btn-xs replaybtn" data-grade="1" data-pid="${p1.value.replayId}">
																							  <span class="glyphicon glyphicon-envelope"></span> 回复
																							</button>
																						
																					</div>
																						<div class="panel-body">
																							 <div> 评论内容 : <span>${p1.value.replayContext}</span><div>
																							 <div><h6 class="text-right">评论时间：${p1.value.replayDate}</h6></div>
																								<ul class="list-group">
																										<#list p1.trees as p2>
																											 <li class="list-group-item">
																													<div class="panel panel-default grade2">
																														<div class="panel-heading"><strong>${p2.value.replayAuthor}</strong>回复：${p1.value.replayAuthor}
																															<button type="button" class="btn btn-default btn-xs replaybtn" data-grade="2" data-pid="${p2.value.replayId}">
																								  							<span class="glyphicon glyphicon-envelope"></span> 回复
																															</button>
																															
																														</div>
																															<div class="panel-body">
																																 <div> 回复内容 : <span>${p2.value.replayContext}</span><div>
																																 <div><h6 class="text-right">回复时间：${p2.value.replayDate}</h6></div>
																																  <ul class="list-group">
																																	<#list p2.trees as p3>
																																		<li class="list-group-item">
																																		<div class="panel panel-default grade3">
																																				<#if p3.value.replayPeople ?? >
																																					<div class="panel-heading"><strong>${p3.value.replayAuthor}</strong>回复：${p3.value.replayPeople}
																																						<button type="button" class="btn btn-default btn-xs replaybtn" data-grade="3" data-pid="${p2.value.replayId}">
																													  									<span class="glyphicon glyphicon-envelope"></span> 回复
																																					</button>
																																						
																																					</div>
																																					
																																					<#else>
																																					<div class="panel-heading"><strong>${p3.value.replayAuthor}</strong>回复：${p2.value.replayAuthor}
																																						<button type="button" class="btn btn-default btn-xs replaybtn" data-grade="3" data-pid="${p2.value.replayId}">
																														  									<span class="glyphicon glyphicon-envelope"></span> 回复
																																						</button>
																																						
																																					</div>
																																					
																																				</#if>
																																				<div class="panel-body">
																																					<div> 回复内容 : <span>${p3.value.replayContext}</span><div>
																																					<div><h6 class="text-right">回复时间：${p3.value.replayDate}</h6></div>
																																				</div>
																																		</div>	
																																		 </li>
																																	</#list>
																																	</ul>
																															</div>
																													</div>
																											 </li>
																										</#list >
																								</ul>
																						</div>
																			 </div>
																	</li>
															</#list>
														
														
														
													  </ul>
													  <div class=" input-modify col-md-1  ">
															<h6>请输入评论内容</h6>
														</div>
														<div class=" input-modify col-md-11  ">
															<textarea class="form-control" rows="6" placeholder="请输入内容"></textarea>
														</div> 
														<br/>
														<div class=" input-modify col-md-1  ">
															<h6>操作</h6>
														</div>
														<div class=" input-modify col-md-11  ">
															<button type="button"  id ="submit"  class="btn btn-info">提交</button>
															<button type="button"  id="cancal"  class="btn btn-default">取消</button>
														</div> 
										</div>
									
												
											
						
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</div>
	</body>
</html>
