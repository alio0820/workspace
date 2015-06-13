function createXMLRequest()
{
	var xmlHttp = null;
	if(window.XMLHttpRequest)
	{
		xmlHttp = new XMLHttpRequest();//除IE之外的浏览器
	}
	else if(window.ActiveXObject)//IE浏览器
	{
		try
		{
			xmlHttp = new ActiveXObject(Msxml2.XMLHTTP);
		}catch(e)
		{
			xmlHttp = new ActiveXObject(Microsoft.XMLHTTP);
		}
	}
	return xmlHttp;
}


function sendRequest(method,url,str_params,callback,error)
{				
	var xmlHttp = createXMLRequest();
	if(method.toLowerCase()=="get" && str_params!=null)
	{
		url += "?" + str_params;
	}
	xmlHttp.open(method,url,true);
	
	xmlHttp.onreadystatechange = function()
		{
			if(xmlHttp.readyState == 4)
			{
				if(xmlHttp.status ==200)
				{
					if(typeof(callback)=="function")
					{
						callback(xmlHttp);
					}
				}
				else
				{
					if(typeof(error)=="function")
					{
						error(xmlHttp);
					}	
				}
			}
		}
	if(method.toLowerCase()=="post")
	{
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttp.send(str_params);
	}
	else
	{
		xmlHttp.send(null);
	}
	
}