function sub_check(type, event){
	if(type=='chk'){
		jk_check_get();	
	} else {
		form.submit();	
	}
	
}

function jk_check_get(){
	var reg = /^((http|https):\/\/)?[A-Za-z0-9][A-Za-z0-9-]*\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"])*$/;
	var testval = $("#check_domain");

	if(!reg.test(testval.val())){
		alert('请填写正确的网页, 例如: http://www.qycn.com 或 www.qycn.com 或 https://www.qycn.com');
		testval.focus();
		testval.select();
		return false;
	}
	$check_domain = testval.val();
	$.ajax({
		type:"POST",
		url:"jk_check_res.php",
		data:"check_domain="+$check_domain,
		dataType: "json",
		beforeSend:function(){
			    $str1 = "";
				$str1 += "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			  	$str1 +="<tr>";
			  	$str1 += "<td align='center'><b class='jk_jianyi'><img src='/templates/jk/images/loading_detail.gif' align='absmiddle' /><br />数据检测中，请稍候...</b></td>";
			  	$str1 += "</tr>";
			  	$str1 += "</table>";
			$("#ck_rs").html($str1);
			$("#check_domain_btn").attr("class", "jk_ch_btn_b");
			$("#check_domain_btn").attr("disabled", "disabled");
		},
		success:function(data){
			
			$("#data_success").html(data);
			$sp_arr = $check_domain.split("//");
			if($sp_arr[1] != "" && $sp_arr[1] != undefined){
				$check_domain = $sp_arr[1]; 
			}
			$("a[name='ckhref']").each(function(){
				$(this).attr('href', '../user.php?action=register&type=jk&ckid='+data.ckid);
			})
			
			$("#check_domain_btn").attr("class", "jk_ch_btn");
			$("#check_domain_btn").attr("disabled", "");
		}		
	});
}
