<#macro page pageContext  url  param ="param" totalPage=0 rows=0 nowPage=1 pageSize=5>
<p>	


    <#if nowPage ==1>
		首页|上一页|
	    <#else>
	        <a href="${pageContext}${url}?${param}=1&pageSize=${pageSize}">首页</a>|
	    	<a href="${pageContext}${url}?${param}=${nowPage?number-1}&pageSize=${pageSize}">上一页</a>|
	</#if>
 	<#if nowPage ==totalPage>
		下一页|尾页|
	    <#else>
	    	<a href="${pageContext}${url}?${param}=${nowPage?number+1}&pageSize=${pageSize}">下一页</a>|
            <a href="${pageContext}${url}?${param}=${totalPage}&pageSize=${pageSize}">尾页</a>|	
</#if>
 
   共${rows}条| 共${totalPage}页|第${nowPage}页|一页${pageSize}条</p>
   
</#macro>