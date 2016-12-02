<div>
	<h4>蓝桥基地4班</h4>
</div>
	<link rel="stylesheet" type="text/css" href="${base.contextPath}/static/css/bootstrap.min.css"/>
    <link href="${base.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    	<script src="${base.contextPath}/static/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${base.contextPath}/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${base.contextPath}/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${base.contextPath}/static/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

    <script type="text/javascript">
    $(function($){
	    $('.form_date').datetimepicker({
		        language:  'zh-CN',
		        weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
		    });
    });
		
    </script>
    <style>
    .navbar-default a{padding-left:5px;padding-right:5px}
    ul.nav li a{padding-left:5px;padding-right:5px}
    </style>
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="javascript:void(0)">主页</a>
    </div>

 
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
     <form class="navbar-form navbar-left" role="search" action="${base.contextPath}/PostController/search" method="post">
        <div class="form-group">
          <input type="text" class="form-control" name ="postAuthor" placeholder="帖子作者">
        </div>
        <div class="form-group">
          <input type="text" class="form-control" name="postTitle" placeholder="帖子标题">
        </div>
		<div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd hh:mm:ss" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
            <input class="form-control" size="16" type="text" name = "startDate" placeholder="从" value="" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
		<div class="input-group date form_date " data-date="" data-date-format="yyyy-mm-dd hh:mm:ss" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
            <input class="form-control" size="16" type="text" name="endDate" placeholder="到" value="" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
      <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <#if loginUser??>
	       <ul class="nav navbar-nav navbar-right">
	      <li><a href="${base.contextPath}/PostController/logout">注销</a></li>
	       
	        <li >
	          <a> <span id = "username">${loginUser.user_name}</span></a>
	        </li>
	      </ul>
      <#else>
      	<ul class="nav navbar-nav navbar-right">
	        <li class="active"><a href="${base.contextPath}/view/login">登录</a></li>
	      </ul>
      </#if>
    </div>
  </div>
</nav>