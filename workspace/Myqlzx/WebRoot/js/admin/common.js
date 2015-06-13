// JavaScript Document
//全选全不选
function select_All()
{
	var chkAll = document.getElementById('chkAll');
	var items = document.getElementsByName("chkitem");
	if(items!=null)
	{
		if(chkAll.checked!=false)
		{
			for(var i = 0; i<items.length;i++)
			{
				if(items[i].type=='checkbox')
				{
					items[i].checked="checked";
				}
			}
		}
		else
		{
			for(var i = 0; i<items.length;i++)
			{
				if(items[i].type=='checkbox')
				{
					items[i].checked=false;
				}
			}
		}
	}
}

function choosePhoto(file)
{
	var fileName = file.value;
	var index = fileName.lastIndexOf('.');
	
	var pic_style = ["jpg","png","gif","bmp"];
	var file_style = fileName.substring(index+1);
	if(fileName!="")
	{
		for(var i=0; i<pic_style.length; i++)
		{
			if(file_style==pic_style[i])
			{
				document.getElementById('photo_hidden').value=fileName;
				return true; 
			}
			else
			{
				alert('图片类型不符合');
				document.getElementById('photo_hidden').value="";
				return false;
			}
		}
	}
	else
	{
		alert('请选择商品图片！');
		document.getElementById('photo_hidden').value="";
		return false;
	}
}
function GO()
{
  	var page = document.getElementById("page").value;
   	document.getElementById("currentPage").value = page;
	document.body_form.submit();
}

function goBack()
{
	document.getElementById("method").value = "search";
	document.body_form.submit();
}

function addData()
{
	document.getElementById("method").value = "add";
	document.body_form.submit(); 
}

function deleteData()
{
   	var inputs = document.getElementsByTagName("input");
	var dvalue = "";
	for(var i = 0;i<inputs.length;i++)
	{	
		if(inputs[i].name=="chkitem"&&inputs[i].checked==true)
		{
			dvalue += inputs[i].value+",";
		}
	}
	
	document.getElementById("deleteValue").value=dvalue;
   	document.getElementById("method").value = "delete";
   	if(confirm("您确定要删除吗？"))
   	{
   		document.body_form.submit();
   	}	
}