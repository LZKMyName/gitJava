$(function($){
	getDepts();
	function getDepts(){
		$.ajax({
			type:"get",
			url:"../EmpController/getAllDept",
			dataType:"JSON",
			success:function(data){
				var html ="<select name='deptid' class='input-text-1' id='deptid'><option value=''>--请选择部门--</option>";
				$(data).each(function(i){
					html+="<option class='input-text-1' value='"+data[i].deptid+"'>"+data[i].deptname+"</option>";
				});
				html+="</select>";
				$("#select").html(html);
				
			},
			
		});
	

		
	}
});