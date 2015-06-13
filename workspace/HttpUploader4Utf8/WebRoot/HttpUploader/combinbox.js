/*
	组合框
	说明：需要配合JQuery使用
	更新记录：
		2012-04-02 创建
		2012-07-23 增加RangeSize字段
		2012-07-26 增加限制文件可选数接口
*/
function CombinBoxMgr()
{
	this.Config = {
		"EncodeType"		: "UTF-8"
		, "CompanyLicensed"	: "武汉命运科技有限公司"
		, "FileFilter"		: "*"//文件类型。所有类型：*。自定义类型：jpg,bmp,png,gif,rar,zip,7z,doc
		, "FileSizeLimit"	: "0"//自定义允许上传的文件大小，以字节为单位。0表示不限制。
		, "FilesLimit"		: 0//限制文件可选数。0表示不限制
		, "AllowMultiSelect": 1//多选开关。1:开启多选。0:关闭多选
		, "RangeSize"		: 131072//文件块大小，以字节为单位。必须为64KB的倍数。推荐大小：128KB。
		, "AppPath"			: ""//网站虚拟目录名称。子文件夹 web
		, "CabPath"			: "http://www.ncmem.com/products/http-uploader4/demo/HttpUploader.cab#version=2,7,41,55266"
		, "UrlCreate"		: "http://localhost:8080/HttpUploader4Utf8/db/ajax_create_fid.jsp"
		, "UrlPost"			: "http://localhost:8080/HttpUploader4Utf8/db/ajax_post.jsp"
		, "UrlProcess"		: "http://localhost:8080/HttpUploader4Utf8/db/ajax_process.jsp"
		, "UrlComplete"		: "http://localhost:8080/HttpUploader4Utf8/db/ajax_complete.jsp"
		, "UrlList"			: "http://localhost:8080/HttpUploader4Utf8/db/ajax_list.jsp"
		, "UrlDel"			: "http://localhost:8080/HttpUploader4Utf8/db/ajax_del.jsp"
		, "ClsidPartition"	: "5412F8C8-BACE-430e-9BD8-4E75F0E21E03"
		, "ClsidDroper"		: "1E7C9F05-406F-4de6-8348-53AD96A79600"
		, "ClsidUploader"	: "65D197E1-9CBC-441a-98BC-B6431C6E4617"
	};
	
	this.ActiveX = {
		"Uploader"		: "Xproer.HttpUploader4"
		, "Partition"	: "Xproer.HttpPartition4"
	};
	
	//附加参数
	this.Fields = {
		"UserName": "test"
		, "UserPass": "test"
		,"uid":0
		,"fid":0
	};

	this.upMgr = new HttpUploaderMgr(); //文件上传管理器
	this.flMgr = new FileListerMgr(); //文件列表管理器
	this.upMgr.FileLstMgr = this.flMgr;
	this.upMgr.CombinBox = this;
	this.upMgr.Config = this.Config;
	this.upMgr.Fields = this.Fields;
	this.upMgr.ActiveX = this.ActiveX;
	
	this.flMgr.UploaderMgr = this.upMgr;
	this.flMgr.CombinBox = this;
	this.flMgr.Config = this.Config;
	this.flMgr.Fields = this.Fields;
	
	//获取加载代码
	this.GetHtml = function()
	{
		var html = '<div class="combinBox">';
		html += '<ul id="cbHeader" class="cbHeader">';
		html += '<li id="liPnlUploader" class="hover">上传新文件</li>';
		html += '<li id="liPnlFiles" >文件列表</li>';
		html += '</ul>';
		html += '<div class="cbBody" id="cbBody">';
		html += '<ul name="cbItem" class="block"><li id="liUploadPanel"></li></ul>';
		html += '<ul name="cbItem" class="cbItem"><li id="liListerPanel"></li></ul>';
		html += '</div>';
		html += '</div>';
		return html;
	};
	
	//加载到指定的控件中
	this.LoadInControl = function(ctlID)
	{
		var obj = document.getElementById(ctlID);
		obj.innerHTML = this.GetHtml();
	};
	
	//打开上传面板
	this.OpenPnlUpload = function()
	{
		$("#liPnlUploader").click();
	};
	//打开文件列表面板
	this.OpenPnlFiles = function()
	{
		$("#liPnlFiles").click();
	};
	
	//初始化
	this.Init = function()
	{
		this.upMgr.LoadInControl("liUploadPanel");
		this.upMgr.Init();
		this.flMgr.LoadInControl("liListerPanel");
		this.flMgr.Init();
		this.flMgr.LoadData();

		$("#cbHeader li").each(function(n)
		{
			if (this.className == "hover")
			{
				cbItemLast = this;
			}

			$(this).click(function()
			{
				$("ul[name='cbItem']").each(function(i)
				{
					this.style.display = i == n ? "block" : "none"; /*确定主区域显示哪一个对象*/
				});
				if (cbItemLast) cbItemLast.className = "";

				if (this.className == "hover")
				{
					this.className = "";
				}
				else
				{
					this.className = "hover";
				}
				cbItemLast = this;
			});
		});
	};
}