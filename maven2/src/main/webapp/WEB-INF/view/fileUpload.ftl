<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加雇员</title>
	</head>
	<body>
		<form action="${base.contextPath}/EmpController/upload" method="post" enctype="multipart/form-data"  >
		 <div>name：<input name="name"/></div>
		  <div>文件1：<input type="file" name ="uplodFile"/></div>
		  <div>文件2：<input type="file" name ="uplodFile"/></div>
	      <div><input type="submit" value="文件上传" /></div>
	    </form>
	</body>
</html>