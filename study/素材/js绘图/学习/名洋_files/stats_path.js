//document.write("<iframe id='__xd' name='hidden' width='0' height='0' src='http://my.51.com/ga.php'></iframe>");
var _51ebro = {};

(function(){
	var encode = window.encodeURIComponent ? encodeURIComponent: escape;

	_config = {};
	_config.destPath = "http://www.analytics-51.com/ga.php";
	_config.expireTime = 1800;
	
	_runtime = {
	    account: "",
        flag:   "",
        act_url:""
	};


	_helper = {};

	// �ڲ�����
	_f = {};


	_f.SetAccount = function(account){
		_runtime.account = account;
	};

	_f.Now = function(){
		return String( parseInt((new Date).getTime() / 1000) );
	};

	// �����ϱ���Ϣ
	_f.GenerateReport = function(){};


	// ���ɻỰ��ʶ
	// @TODO �����ͻ����
	_f.GenerateSid = function(){
		return _f.RandomString();
	};
	
	// �����������ʶ
	// @TODO �����ͻ����
	_f.GenerateBid = function(){
		return _f.Now() + _f.RandomString();
	};

	_f.RandomString = function(){
		return String(parseInt( Math.random() * 4000000000 ));
	};



	// ȡ��cookie
	/**
	 * get a cookie
	 * @param {string} n name
	 */
	_f.GetCookie = function(name)
	{
        var mn=name+"=";
	    var b,e;
	    var co=document.cookie;

	    if (mn=="=") 
	    {
		    return co;
	    }

	    b=co.indexOf(mn);
    
	    if (b < 0) {
		    return "";
	    }

	    e=co.indexOf(";", b+name.length);
    
	    if (e < 0) {
	    	return co.substring(b+name.length + 1);
	    }
	    else {
	    	return co.substring(b+name.length + 1, e);
	    }
	};
	/**
	 * Delete a cookie
	 * @param {string} n name
	 */
	_f.DelCookie = function(n){
		_f.SetCookie(n, "", -1);
	};

	_f.GetReferrer = function(){
		return encode(document.referrer);
	};
	
	_f.GetCurrent = function(){
		return encode(document.location);
	};

	_f.GetCurrentWithAction = function(act_url){
		return encode(document.location + act_url);
	};

	// ��������
	_f.Send = function(URL){
        //window.hidden.location = URL;
        (new Image).src = URL;
        //this.location = URL;

        
	};


	_f.Main =function()
	{
		// @TODO ��Ӹ��ʺ���
       var account = _runtime.account;
       var flag = "";

		if(!account)
		{
		   try
		   {
				account = _f.GetCookie("FO_LSTATE").split("%7C")[1];
		   }
		   catch(e){}

		   if(account == undefined) account = "";
		}

        if(!flag)
        {
            try
            {
                flag = _f.GetCookie("FO_LSTATE").split("%7C")[7];
            }
            catch(e){}

            if(flag == undefined)flag = "";
        }

		// ��ȡreffer
		var referrerURL = _f.GetReferrer();
		var currentURL = _f.GetCurrent();
   
        // ��֯����
        var zk_mod = parseInt(_f.StrHash(account)) % 1023;
        var currentURLCopy = "";
        try
        {
            currentURLCopy = document.location.href.toLowerCase();        
        }
        catch(e){}

        if(currentURLCopy.indexOf("stats=tj") != -1)
        {
            flag = "4";
        }
        else if(currentURLCopy.indexOf("stats=yellow") != -1)
        {
            flag = "32";
        }
        else if(currentURLCopy.indexOf("stats=friend_list") != -1)
        {
            flag = "64";
        }
        else if(currentURLCopy.indexOf("stats=top_line") != -1)
        {
            flag = "127";
        }
        else if(currentURLCopy == "www.51.com/404.php")
        {
            flag = "44";
        }
        else if("p" == flag && zk_mod != - 296)
        {
            flag = "2";
        }
        else if("p" != flag && zk_mod == - 296)
        {
            flag = "1";
        }
        else if("p" == flag && zk_mod == -296)
        {
            flag = "3";
        } 
        else
        {
            flag = "0";
        }
        var URL=_config.destPath+"?account="+account+"&preURL="+referrerURL+"&curURL="+currentURL+"&user_flag="+flag;
        // ��������
        if("0" != flag)
        {
            _f.Send(URL);;
        }
        
	};

	_f.Main_100 =function()
    {
		// @TODO ��Ӹ��ʺ���


       var account = _runtime.account;
       var flag = "8";

		if(!account)
		{
		   try{
				account = _f.GetCookie("FO_LSTATE").split("%7C")[1];
		   }
		   catch(e){}

		   if(account == undefined) account = "anonymous";
		}

		// ��ȡreffer
		var referrerURL = _f.GetReferrer();
		var currentURL = _f.GetCurrent();
   
        // ��֯����
        var URL=_config.destPath+"?account="+account+"&preURL="+referrerURL+"&curURL="+currentURL+"&user_flag="+flag;
        // ��������
        _f.Send(URL);;
        
	};

    _f.action =function(act_url)
    {
       var account = _runtime.account;
       var flag = "16";

		if(!account)
		{
		   try{
				account = _f.GetCookie("FO_LSTATE").split("%7C")[1];
		   }
		   catch(e){}

		   if(account == undefined) account = "anonymous";
		}

		// ��ȡreffer
		var referrerURL = _f.GetReferrer();
		var currentURL = _f.GetCurrentWithAction(act_url);
   
        // ��֯����
        var URL=_config.destPath+"?account="+account+"&preURL="+referrerURL+"&curURL="+currentURL+"&user_flag="+flag;
        // ��������
        _f.Send(URL);
        
	};

    _f.StrHash = function(str) 
    {
         var h = 0;
        for (var i = 0; i < str.length; ++i) 
        {
            h = ((h & 0xFFFFFFF) << 4) + str.charCodeAt(i);
            var g = (h & 0xF0000000);
            if (g != 0)
            {
                h = h ^ (g >> 24);
                h = h ^ g;
            }
        }
        return h;
    };
    

	window._51ebro = {
		SetAccount: _f.SetAccount,
        SetFlag:_f.SetFlag,
		go: _f.Main,
        run:_f.Main_100,
        act:_f.action
	};
})();


