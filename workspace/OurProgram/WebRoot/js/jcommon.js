
	var XJBgcolor = "#DBDBDB";//小计行背景颜色
    var HJBgcolor = "#DBDBDB";//合计行背景颜色
    var ZJBgcolor = "#DBDBDB";//总计行背景颜色

	var ExcelXJBgcolor = 19;//小计行背景颜色
    var ExcelHJBgcolor = 40;//合计行背景颜色
    var ExcelZJBgcolor = 38;//总计行背景颜色
	var ExcelLMBgcolor = 23;//总计行背景颜色

// 将一个变量转换为对象
function var_to_obj(val)
{
	this.value=val;
}
// 判断是否大于某个数
function is_greater(field,limit)
{
	var Ret = (is_numeric(field,-1) ) ? (field.value > parseInt(limit) )  : false;
	return(Ret);
}
// 判断是否小于某个数
function is_less(field,limit)
{
	var Ret = (is_numeric(field,-1) ) ? (field.value < parseInt(limit) )  : false;
	return(Ret);
}

function is_numeric(field)
{
	var Ret = true;
	var NumStr="0123456789";
	var decUsed=false;
	var chr;
	if(field.value.length<1)
		return false;
    if (field.value == ".")
    {
        Ret = false;
    }
	for (var i=0;i<field.value.length;++i)
	{
		chr=field.value.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			if ( (!decUsed) && chr==".")
			{
				decUsed=true;
			}
			else
			{
				Ret=false;
			}
		}
	}
	return(Ret);
}
 // 判断是否是价格
function is_price(field)
{
	var Ret = true;
	var NumStr="0123456789";
	var decUsed=false;
	var chr;
    if (field.value == ".")
    {
        Ret = false;
    }
	for (var i=0;i<field.value.length;++i)
	{
		chr=field.value.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			if ( (!decUsed) && chr==".")
			{
				decUsed=true;
			}
			else
			{
				Ret=false;
			}
		}
	}
	if(Ret)
	{
		if(decUsed&&(field.value.length-field.value.indexOf('.')<4))
		;
		else if(decUsed)
			Ret=false;
	}
	return(Ret);
}

 // 判断是否是价格
function isPrice(field,crit,msg)
{
	var Ret = true;
	var NumStr="0123456789";
	var decUsed=false;
	var chr;
	var tempStr = field.value;
	if ( tempStr.charAt(0) == "-" )
	{
	    tempStr = field.value.substring(1);
	}
    if (tempStr == ".")
    {
        Ret=false;
    }
	for (var i=0;i<tempStr.length;++i)
	{
		chr=tempStr.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			if ( (!decUsed) && chr==".")
			{
				decUsed=true;
			}
			else
			{
				Ret=false;
			}
		}
	}
	if(Ret)
	{
		if(decUsed&&(tempStr.length-tempStr.indexOf('.')<4)) {
		    if ((tempStr-1)>(99999999999.99-1)) {
                Ret=false;
			}
		} else if(decUsed) {
			Ret=false;
		} else if ((tempStr-1)>(99999999999.99-1)) {
		    Ret=false;
	    }
	}
	if (!Ret)
		doMSG(field,crit,msg);
	return(Ret);
}
 // 判断是否是重量
function isDecimal(field,crit,msg)
{
	var Ret = true;
	var NumStr="0123456789";
	var decUsed=false;
	var chr;
	var tempStr = field.value;
	if ( tempStr.charAt(0) == "-" )
	{
	    tempStr = tempStr.substring(1);
	}
    if (tempStr == ".")
    {
        Ret=false;
    }
	for (var i=0;i<tempStr.length;++i)
	{
		chr=tempStr.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			if ( (!decUsed) && chr==".")
			{
				decUsed=true;
			}
			else
			{
				Ret=false;
			}
		}
	}
	if(Ret)
	{
		if(decUsed&&(tempStr.length-tempStr.indexOf('.')<5)) {
		    if( (tempStr-1+1) > (9999999999.999-1+1) ) {
                 Ret=false;
			}
		} else if(decUsed) {
			Ret=false;
		} else if( (tempStr-1+1) > (9999999999.999-1+1) )
		    Ret=false;
	}
	if (!Ret)
		doMSG(field,crit,msg);
	return(Ret);
}

function is_decimal(field,crit,msg)
{
	var Ret = true;
	var NumStr="0123456789";
	var decUsed=false;
	var chr;
    if (field.value == ".")
    {
        Ret=false;
    }
	for (var i=0;i<field.value.length;++i)
	{
		chr=field.value.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			if ( (!decUsed) && chr==".")
			{
				decUsed=true;
			}
			else
			{
				Ret=false;
			}
		}
	}
	if(Ret)
	{
		if(decUsed&&(field.value.length-field.value.indexOf('.')<5)) {
		    if( (field.value-1+1) > (9999999999.999-1+1) ) {
                 Ret=false;
			}
		} else if(decUsed) {
			Ret=false;
		} else if( (field.value-1+1) > (9999999999.999-1+1) )
		    Ret=false;
	}
	if (!Ret)
		doMSG(field,crit,msg);
	return(Ret);
}


 // 判断是否是空
function Is_Null(field)
{
	var Text=""+field.value;
	var Ret;
	if(Text.length)
	{
		for(var i=0;i<Text.length;i++)
		if(Text.charAt(i)!=" ")
		break;
		if(i>=Text.length){
		    Ret=true;
		} else {
		    Ret=false;
		}
	}
	else
		Ret=true;
	return(Ret);
}

function IsNull(field,crit,msg)
{
	var Text=""+field.value;
	var Ret;
	if(Text.length)
	{
		for(var i=0;i<Text.length;i++)
		if(Text.charAt(i)!=" ")
		break;
		if(i>=Text.length)
			Ret=true;
		else
			Ret=false;
	}
	else
		Ret=true;
	if (Ret)
		doMSG(field,crit,msg);
	return(Ret);
}
function doMSG(field,crit,msg)
{
	if ( (-1!=crit) )
	{
		alert(msg)
		if (crit==1)
		{
			field.focus();  // focus does not work on certain netscape versions
			field.select();
		}
	}
}
function IsSpace(field)
{
	var Text=""+field.value;
	if(Text.length)
	{
		for(var i=0;i<Text.length;i++)
			if(Text.charAt(i)!=" ")
				break;
		if(i>=Text.length)
			field.value="";
	}
}

// 判断是否是整数
function is_int(field){
	var Ret = true;
	var NumStr="0123456789";
	var chr;

	for (var i=0;i<field.length;++i)
	{
		chr=field.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			Ret=false;
		}
	}
    if (Number(field) > 2147483647) {
        Ret = false;
    }
	return(Ret);
}
// 判断是否是正整数
function is_positiveInt(field){
	if ( !is_int(field) ){
        return false;
	}
	if ( Number(field) == 0 && field!="" ) {
        return false;
    }
	return true;
}
// 判断是否是日期
function is_date_old(field){
	var Ret = false;
	var mark1;
	var mark2;

	if(field.value=="")
		return true;
	cd=new Date();

	if ( (mark1 = field.value.indexOf('-'))==-1)
		mark1=field.value.indexOf('-')
	if (mark1>-1)
	{
		if ( (mark2 = field.value.indexOf('-',mark1+1)) ==-1)
			mark2=field.value.indexOf('-',mark1+1);
		if ((mark2>-1)&&(mark2+1<field.value.length) )
		{
			year = new var_to_obj(field.value.substring(0,mark1));
			month = new var_to_obj(field.value.substring(mark1+1,mark2));
			day = new var_to_obj(field.value.substring(mark2+1,field.value.length));
			if (
				(is_greater(day,0))&&(is_less(day,32))&&
				(is_greater(month,0))&&(is_less(month,13))&&
				(is_greater(year,1900))&&(is_less(year,2500))
				)
				Ret=true;
		}
	}
	return(Ret);
}

// 判断是否是日期
function is_date(field){



	var Ret = false;
	var mark1;
	var mark2;
	var month_n;
	var year_n;

	if(field.value=="")
		return true;

	var vDate1 = field.value.split("-")

	 if (vDate1[0].length != 4) {
	     return false;
	 }
	 if (vDate1[1].length != 2) {
	     return false;
	 }
	 if (vDate1[2].length != 2) {
	     return false;
	 }

	var cd=new Date();

	if ( (mark1 = field.value.indexOf('-'))==-1)
		mark1=field.value.indexOf('-')
	if (mark1>-1)
	{
		if ( (mark2 = field.value.indexOf('-',mark1+1)) ==-1)
			mark2=field.value.indexOf('-',mark1+1);
		if ((mark2>-1)&&(mark2+1<field.value.length) )
		{
			year_n=field.value.substring(0,mark1);
			var year = new var_to_obj(year_n);
			month_n=field.value.substring(mark1+1,mark2);
			var month = new var_to_obj(month_n);
			var day = new var_to_obj(field.value.substring(mark2+1,field.value.length));
			if ((is_greater(day,0))&&(is_less(day,32))&&(is_greater(month,0))&&(is_less(month,13))&&(is_greater(year,1900))&&(is_less(year,2500))){

			month_n = month_n.replace("0", " ");
			month_n = Trim(month_n);

			     	  switch(month_n){
			    		case "4":
			   		case "6":
			   		case "9":
			   		case "11":
			   			if(is_less(day,31))
			   			    Ret=true;

			   			break;

			   		case "2":
			   			if((year_n%4==0 && year_n%100!=0)||(year_n%400==0)){
			   			    if(is_less(day,30))
			   			    	 Ret=true;
						}else{
						   if(is_less(day,29))
			   			    	 Ret=true;
						}
						 break;
					default:
						Ret=true;
				  }
			     }

		}
	}
    return(Ret);
}


// 判断是否有有效数据被选中
function IsSelected(field)
{
	var value=""+field.options[field.selectedIndex].value;
	var Ret;

	if(value=="0")
		Ret=false;
	else
		Ret=true;
	return(Ret);
}

function isLoginIDCharacter(cCharacter) {

	var sFormat = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
    if (sFormat.indexOf(cCharacter, 0) == -1) {
	    return false;
    }
	return true;
}

function isLoginID(sValue) {
	if (sValue == null)	{
		return false;
	}

	for (var i=0;i<sValue.length;i++) {
		var cCharacter = sValue.charAt( i );
		if (isLoginIDCharacter(cCharacter) == false) {
			return false;
		}
	}

	return true;
}

// 检查是否是字符
// cCharacter：输入值
function isCharacter( cCharacter )
{
	var sFormat = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// 检查是否是数字字符
// cCharacter：输入值
function isDigitalCharacter( cCharacter )
{
	var sFormat = "0123456789";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// 检查是否是其它可以作名称的字符
// cCharacter：输入值
function isOtherNameCharacter( cCharacter )
{
	var sFormat = "_";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// 检查是否是可以作名称的字符
// sValue：输入值
function isNameCharacter( sValue ) {
/*
	if( sValue == null )
	{
		return false;
	}

	for( i = 0; i < sValue.length; i ++ )
	{
		var cCharacter = sValue.charAt( i );
		if( isCharacter( cCharacter ) == false && isOtherNameCharacter( cCharacter ) == false )
		{
			return false;
		}
	}
*/
	return true;
}

// 检查是否仅包含字符和数字
// sValue：输入值
function isCharacterAndDigital( sValue ) {

/*
	if( sValue == null )
	{
		return false;
	}

	for( i = 0; i < sValue.length; i ++ )
	{
		var cCharacter = sValue.charAt( i );
		if( isCharacter( cCharacter ) == false && isDigitalCharacter( cCharacter ) == false )
		{
			return false;
		}
	}
*/
	return true;
}

function isCharacterAndDigitalAndSpaceCharacter(cCharacter) {
/*
	var sFormat = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789  ";
    if (sFormat.indexOf(cCharacter, 0) == -1) {
	    return false;
    }
*/
	return true;
}

function isCharacterAndDigitalAndSpace(sValue) {

/*
	if (sValue == null)	{
		return false;
	}

	for (var i=0;i<sValue.length;i++) {
		var cCharacter = sValue.charAt( i );
		if (isCharacterAndDigitalAndSpaceCharacter(cCharacter) == false) {
			return false;
		}
	}
*/
	return true;
}

// 检查是否是Email
// sValue：输入值，合法格式为a@b.c.d此类形式
function isEmail( sValue ) {
/*
	var iFirstIndex = 0;
	var iSecondIndex = sValue.indexOf( '@' );
	if( iSecondIndex == -1 )
	{
		return false;
	}
*/
	return true;
}

// 检查是否是邮编
// sValue：输入值，合法格式为六位整数
function isZIP( sValue ) {
/*
	if( sValue == null )
	{
		return false;
	}

	if( sValue.length != 6 )
	{
		return false;
	}
	else
	{
		for( i = 0; i < 6; i ++ )
		{
			if( isDigital( sValue.charAt( i ) ) == false )
			{
				return false;
			}
		}
	}
*/
	return true;
}

// 检查是否是数字字符串
// sValue：输入值
function isDigitalString( sValue )
{
	if( sValue == null )
	{
		return false;
	}

	for( i = 0; i < sValue.length; i ++ )
	{
		if( isDigital( sValue.charAt( i ) ) == false )
		{
			return false;
		}
	}
}


//IsEmpty函数判断一个字符串是否为空
function IsEmpty(his)
{
   var flag = true;
   for(var i=0;i<his.length;i++)
   {
      if(his.charAt(i)!=" ")
      {
         flag = false;
         break;
      }
   }
   return flag;
}
//Trim函数去掉一字符串两边的空格
function Trim(his)
{
   //找到字符串开始位置
   var Pos_Start = -1;
   for(var i=0;i<his.length;i++)
   {
     if(his.charAt(i)!=" ")
      {
         Pos_Start = i;
         break;
      }
   }
   //找到字符串结束位置
   var Pos_End = -1;
   for(var i=his.length-1;i>=0;i--)
   {
     if(his.charAt(i)!=" ")
      {
         Pos_End = i;
         break;
      }
   }
   //返回的字符串
   var Str_Return = ""
   if(Pos_Start!=-1 && Pos_End!=-1)
   {
		for(var i=Pos_Start;i<=Pos_End;i++)
		{
			   Str_Return = Str_Return + his.charAt(i);
		}
   }
   return Str_Return;
}
//IsDigital函数判断一个字符串是否由数字(int or long)组成
function isDigital(str)
{
  for(var ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
       return false;
    }
  }
  return true;
}
//IsFloat函数判断一个字符串是否由数字(int or long or float)组成
function IsFloat(str)
{
  var flag_Dec = 0
  for(var ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) == '.')
    {
       flag_Dec++;
	   if(flag_Dec > 1)
          return false;
       else
          continue;
    }
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
       return false;
    }
  }
  return true;
}
//IsTelephone函数判断一个字符串是否由数字或'-','*'组成
function IsTelephone(str) {
/*
  for(ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
	if((str.charAt(ilen)!='-')&&(str.charAt(ilen)!='*')&&(str.charAt(ilen)!='(')&&(str.charAt(ilen)!=')'))
        return false;
    }
  }
*/
  return true;
}

// The following added by liyin
// 2000-09-29
//is_IDCard函数判断一个字符串是否符合身份证的长度限制和数字限制
function is_IDCard(str)
{
  if((str.length!=15)&&(str.length!=18))
  	return false;
  for(ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
	if((str.charAt(ilen)!='-')&&(str.charAt(ilen)!='*'))
        return false;
    }
  }
  return true;
}


//The following code is for input validate
//Code by James Wang
//2000-07-22
function doCritCode(item) {
	if (Trim(item[3])!="") window.alert(item[3]);
	eval(item[1]).focus();
	eval(item[1]).select();
}

//The paramater parss looks like
// var paras = [
//  ["T","form1.f1","NotNull","f1 not null"],
//  ["T","form1.f2","IsZip","f2 is a zip code"],
//  ["T","form1.f3","IsDate","f3 is a date"],
//  ["T","form1.f4","IsEMail","f4 is a email"],
//  ["T","form1.f5","IsNumber","f5 is a number"]
//  ]
//
//说明：
//第一个参数为数据类型：
//   T  表示为Type=input
//
//第二个参数表示数据域名称
//
//   须以Form.fieldName形式表示
//第三个参数表示数据库的约束
//1）对于T型的数据
//   NotNull   表示本域必须为非空
//   IsEMail   表示本域必须是
//   IsNumber  表示本域必须为一个数字
//   IsInt     表示本域必须为一个整形
//   IsDate    表示本域须是一个日期
//   IsZip     表示本域须是一个ZipCode
//   IsTelephone 表示本域须是一个电话号码
//   IsIDCard 表示本域须是一个身份证号码
//   IsInLengthLimition 表示本域是否在数据库的长度限制之内
//   HowLength=##  表示判断域值是否超长 其中##表示字段域的最大长度
//第四个参数表示如果数据不合格显示的信息，如果为空在不显示
//
function inputValidate(paras) {
	for ( var i=0; i<paras.length; i++ ) {
		if ( paras[i][0] =="T" ) {
			//如果处理的是确认某域非空
   		if (paras[i][2] == "NotNull" ) {
	   		if ( Trim(eval (paras[i][1]+".value")) =="" ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为Email
   		if (paras[i][2] == "IsEMail" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isEmail(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为数字
   		if (paras[i][2] == "IsNumber" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") &&  ! IsFloat(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为整型
   		if (paras[i][2] == "IsInt" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") &&  ! is_int(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为身份证号码
   		if (paras[i][2] == "IsIDCard" ) {
   			if ( (Trim(eval (paras[i][1]+".value")) !="") &&  ! is_IDCard(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为日期
   		if (paras[i][2] == "IsDate" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! is_date(eval (paras[i][1])) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为数字
   		if (paras[i][2] == "IsDigital" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isDigital(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}

			//如果处理的是确认某域为邮政编码
   		if (paras[i][2] == "IsZip" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isZIP(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为电话号码
   		if (paras[i][2] == "IsTelephone" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! IsTelephone(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//如果处理的是确认某域为身份证
   		if (paras[i][2] == "IsIDCard" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! is_IDCard(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//判断是否长度大于要求的最小长度
		if (paras[i][2].substring(0,9) == "MinLength" ) {
				if ( (Trim(eval (paras[i][1]+".value")) !="") && ! Is_InLengthMin(paras[i][2].substring(10),eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}

		//判断中英文混输的字段长度  function Is_InLengthLimit(iLimition,field,crit,msg)
		if (paras[i][2].substring(0,9) == "HowLength" ) {
				if ( (Trim(eval (paras[i][1]+".value")) !="") && ! Is_InLengthLimit(paras[i][2].substring(10),eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}

		//判断是否仅为英文字母或数字
		if (paras[i][2] == "IsCharacterAndDigital" ) {
				if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isCharacterAndDigital(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
		}
	}

	return true;
}

// The following added by Zhenghao
// 2000-09-29
//求判断一个字符是否是ASCII值
//cValue：参数值
function isASCII( cValue )
{
	var sFormat = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	var iLocation = sFormat.indexOf( cValue );
	return( iLocation != -1 );
}

//将一个字符串中的汉字计为2个字符，以利于数据库中正确处理
//sString：待记数的字符串
function calcRealLength( sString )
{
	var iLength = 0;	// 真实长度记数器
	for( i = 0; i < sString.length; i ++ )
	{
		if( isASCII( sString.charAt( i ) ) )
		{
			iLength += 1;
		}
		else
		{
			iLength += 2;
		}
	}

	return( iLength );
}

//判断长度是否符合数据库的长度要求
//iLimition：长度限制
//field：输入字段名称
//crit：是否显示提示信息并置回焦点
//msg：提示信息
function Is_InLengthLimit(iLimition,Fieldvalue)
{
	if( calcRealLength( Fieldvalue ) > iLimition )
		return false;
	return true;
}

function Is_OverLength_ex(iLimition,field,crit,msg)
{
    Text = "" + field.value;
    if ( calcRealLength( Text ) > iLimition  ){
	    doMSG(field,crit,msg);
	    return true;
	}
	return false;
}


function Is_InLengthMin(iLimition,Fieldvalue)
{
	if( calcRealLength( Fieldvalue ) < iLimition )
		return false;
	return true;
}

//function Is_InLengthLimit(iLimition,Fieldvalue)
//{
//	alert( "Flag=" + isInLengthLimit( iLimition,Fieldvalue ) );
//}

//求字符的ASCII值或求给定值的字符
//iFlag：1时求给定字符的ASCII值；0时求给定值的ASCII字符
//cValue：参数值
function asciiXvalue( iFlag, cValue )
{
	var sFormat = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	if( iFlag == 1 )
	{
		var iLocation = sFormat.indexOf( cValue ) + 32;
		//document.write( "ASCII Value=" + iLocation );
		return iLocation;
	}
	else if( iFlag == 0 )
	{
		if( cValue > 126 || cValue < 32 )
		{
			document.write( "所给ASCII值必须在32～126之间！" );
		}
		else
		{
			var cChar = sFormat.charAt( cValue - 32 );
			//document.write( "ASCII Code=" + cChar );
			return cChar;
		}
	}
	else
	{
		document.write( "非法参数！" );
	}
}

//加密解密转换
//iFlag：1时求给定字符的ASCII值；0时求给定值的ASCII字符
//sSource：参数值
function changePassword( iFlag, sSource )
{
	var sSourceFormat = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	var sTargetFormat = " #$!\"'%&+,)*/0-.1423(58679:;<A?@B=>EFCJDHQGIPLMKUNTOWS[RZVXY\\]^_`abefciqdgomvhjkn~lzut{rpysx|w}";
	var sTarget = "";
	if( iFlag == 1 )
	{
		for( i = 0; i < sSource.length; i ++ )
		{
			sTarget += sTargetFormat.charAt( sSourceFormat.indexOf( sSource.charAt( i ) ) );
		}
		return sTarget;
	}
	else if( iFlag == 0 )
	{
		for( i = 0; i < sSource.length; i ++ )
		{
			sTarget += sSourceFormat.charAt( sTargetFormat.indexOf( sSource.charAt( i ) ) );
		}
		return sTarget;
	}
	else
	{
		document.write( "非法参数！" );
	}
}

// Compare two date
// 如果_Date2大于_Date1，返回true
function _compareTwoDate(_Date1, _Date2) {
     vDate1 = _Date1.value.split("-")
	 vDate2 = _Date2.value.split("-")

	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

function _compareTwoDate_ex(_Date1, _Hour1, _Min1, _Date2, _Hour2, _Min2) {
     vDate1 = _Date1.value.split("-")
	 vDate2 = _Date2.value.split("-")

	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     H1 = parseInt(_Hour1.value-0)
	 H2 = parseInt(_Hour2.value-0)
	 M1 = parseInt(_Min1.value-0)
     M2 = parseInt(_Min2.value-0)

	 if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 == _Day2) && (H1>H2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 == _Day2) && (H1 == H2) && (M1>M2) ) {
	    return false
	 }

	 return true
}


function _compareTwoDateForString(_Date1, _Date2) {
     var vDate1 = _Date1.split("-")
	 var vDate2 = _Date2.split("-")
	 var _Year1 = parseInt(vDate1[0]-0)
	 var _Month1 = parseInt(vDate1[1]-0)
	 var _Day1 = parseInt(vDate1[2]-0)

	 var _Year2 = parseInt(vDate2[0]-0)
	 var _Month2 = parseInt(vDate2[1]-0)
	 var _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

// get current date
function _getCurrentDate() {
     var _newDate = new Date()
	 var _Year = _newDate.getYear()
	 var _Month = 1 + _newDate.getMonth()
	 var _Day = _newDate.getDate()

	 if (_Month.toString().length == 1) {
	     _Month = "0" + _Month;
     }

	 if (_Day.toString().length == 1) {
	     _Day = "0" + _Day;
	 }

	 var _sDate = _Year + "-" + _Month + "-" + _Day
	 return _sDate
     }

// compare date with current date
function _biggerThanToday(_Date2) {
     var vDate1 = _getCurrentDate().split("-")
	 var vDate2 = _Date2.value.split("-")

	 var _Year1 = parseInt(vDate1[0]-0)
	 var _Month1 = parseInt(vDate1[1]-0)
	 var _Day1 = parseInt(vDate1[2]-0)

	 var _Year2 = parseInt(vDate2[0]-0)
	 var _Month2 = parseInt(vDate2[1]-0)
	 var _Day2 = parseInt(vDate2[2]-0)

         if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 >= _Day2)) {
	    return false
	 }

	 return true

}

// compare date with current year&&month
function _biggerThanTodayMonth(_Date2) {
     var vDate1 = _getCurrentDate().split("-")
	 var vDate2 = _Date2.value.split("-")

	 var _Year1 = parseInt(vDate1[0]-0)
	 var _Month1 = parseInt(vDate1[1]-0)
	 var _Day1 = parseInt(vDate1[2]-0)

	 var _Year2 = parseInt(vDate2[0]-0)
	 var _Month2 = parseInt(vDate2[1]-0)
	 var _Day2 = parseInt(vDate2[2]-0)

         if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

     return true

}

function _getDate(periodType, year, period) {

	var dates = new Array(_getCurrentDate(), _getCurrentDate());

	// Validate
	if (periodType != 0 && periodType != 1) {
		// Error period type
		alert("Error period type.\nPeriod type(0-1):" + periodType);
		return dates;
	}

	var intYear = 2000;
	if (isNaN(year) == true) {
		alert("Invalid year.\nYear:" + year);
		return dates;
	}
	intYear = parseInt(year);
	if (intYear < 1900 || intYear > 2100) {
		alert("Invalid year.\nYear(1900-2100):" + year);
		return dates;
	}

	var intPeriod = 1;
	if (isNaN(period) == true) {
	    alert("Invalid period.\nPeriod:" + period);
		return dates;
    }
	intPeriod = parseInt(period);
	if (periodType == 0) {
		// Season
		if (intPeriod < 1 || intPeriod > 4) {
			alert("Invalid season.\nSeason(1-4):" + period);
			return dates;
		}
	} else {
		// Month
		if (intPeriod < 1 || intPeriod > 12) {
			alert("Invalid month.\nMonth(1-12):" + period);
			return dates;
		}
	}

	if (periodType == 0) {
		// Season
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-3-31";
				break;
			case 2 :
				dates[0] = year + "-4-1";
				dates[1] = year + "-6-30";
				break;
			case 3 :
				dates[0] = year + "-7-1";
				dates[1] = year + "-9-30";
				break;
			case 4 :
				dates[0] = year + "-10-1";
				dates[1] = year + "-12-31";
				break;
		}
	} else {
		// Month
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-1-31";
				break;
			case 2 :
				dates[0] = year + "-2-1";
				if ((intYear % 400 == 0) || ((intYear % 4 == 0) && (intYear % 100 != 0))) {
					dates[1] = year + "-2-29";
				} else {
					dates[1] = year + "-2-28";
				}
				break;
			case 3 :
				dates[0] = year + "-3-1";
				dates[1] = year + "-3-31";
				break;
			case 4 :
				dates[0] = year + "-4-1";
				dates[1] = year + "-4-30";
				break;
			case 5 :
				dates[0] = year + "-5-1";
				dates[1] = year + "-5-31";
				break;
			case 6 :
				dates[0] = year + "-6-1";
				dates[1] = year + "-6-30";
				break;
			case 7 :
				dates[0] = year + "-7-1";
				dates[1] = year + "-7-31";
				break;
			case 8 :
				dates[0] = year + "-8-1";
				dates[1] = year + "-8-31";
				break;
			case 9 :
				dates[0] = year + "-9-1";
				dates[1] = year + "-9-30";
				break;
			case 10 :
				dates[0] = year + "-10-1";
				dates[1] = year + "-10-31";
				break;
			case 11 :
				dates[0] = year + "-11-1";
				dates[1] = year + "-11-30";
				break;
			case 12 :
				dates[0] = year + "-12-1";
				dates[1] = year + "-12-31";
				break;
		}
	}

	// Return
	return dates;
}

function _getFinanceDate(financeDay, periodType, year, period) {

	var dates = new Array(_getCurrentDate(), _getCurrentDate());

	// Validate
	if (financeDay < 0 || financeDay > 28) {
		// Error finance type
		alert("Error finance day.\nFinance type(0-28):" + financeDay);
		return dates;
	}

	if (periodType != 0 && periodType != 1) {
		// Error period type
		alert("Error period type.\nPeriod type(0-1):" + periodType);
		return dates;
	}

	var intYear = 2000;
	if (isNaN(year) == true) {
	    alert("Invalid year.\nYear:" + year);
		return dates;
	}
	intYear = parseInt(year);
	if (intYear < 1900 || intYear > 2100) {
	    alert("Invalid year.\nYear(1900-2100):" + year);
		return dates;
	}

	var intPeriod = 1;
	if (isNaN(period) == true) {
	    alert("Invalid period.\nPeriod:" + period);
		return dates;
	}
	intPeriod = parseInt(period);
	if (periodType == 0) {
		// Season
		if (intPeriod < 1 || intPeriod > 4) {
		    alert("Invalid season.\nSeason(1-4):" + period);
			return dates;
		}
	} else {
		// Month
		if (intPeriod < 1 || intPeriod > 12) {
		    alert("Invalid month.\nMonth(1-12):" + period);
			return dates;
		}
	}

	if (financeDay == 0) {
		return _getDate(periodType, year, period);
	}

	if (periodType == 0) {
		// Season
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-3-" + financeDay;
				break;
			case 2 :
				dates[0] = year + "-3-" + (financeDay + 1);
				dates[1] = year + "-6-" + financeDay;
				break;
			case 3 :
				dates[0] = year + "-6-" + (financeDay + 1);
				dates[1] = year + "-9-" + financeDay;
				break;
			case 4 :
				dates[0] = year + "-9-" + (financeDay + 1);
				dates[1] = year + "-12-31";
				break;
		}
	} else {
		// Month
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-1-" + financeDay;
				break;
			case 2 :
				dates[0] = year + "-1-" + (financeDay + 1);
				dates[1] = year + "-2-" + financeDay;
				break;
			case 3 :
				if (((intYear % 400 == 0) || ((intYear % 4 == 0) && (intYear % 100 != 0)))
					&& (financeDay == 28)) {
					dates[0] = year + "-2-" + (financeDay + 1);
				} else {
					dates[0] = year + "-3-1";
				}
				dates[1] = year + "-3-" + financeDay;
				break;
			case 4 :
				dates[0] = year + "-3-" + (financeDay + 1);
				dates[1] = year + "-4-" + financeDay;
				break;
			case 5 :
				dates[0] = year + "-4-" + (financeDay + 1);
				dates[1] = year + "-5-" + financeDay;
				break;
			case 6 :
				dates[0] = year + "-5-" + (financeDay + 1);
				dates[1] = year + "-6-" + financeDay;
				break;
			case 7 :
				dates[0] = year + "-6-" + (financeDay + 1);
				dates[1] = year + "-7-" + financeDay;
				break;
			case 8 :
				dates[0] = year + "-7-" + (financeDay + 1);
				dates[1] = year + "-8-" + financeDay;
				break;
			case 9 :
				dates[0] = year + "-8-" + (financeDay + 1);
				dates[1] = year + "-9-" + financeDay;
				break;
			case 10 :
				dates[0] = year + "-9-" + (financeDay + 1);
				dates[1] = year + "-10-" + financeDay;
				break;
			case 11 :
				dates[0] = year + "-10-" + (financeDay + 1);
				dates[1] = year + "-11-" + financeDay;
				break;
			case 12 :
				dates[0] = year + "-11-" + (financeDay + 1);
				dates[1] = year + "-12-31";
				break;
		}
	}

	// Return
	return dates;
}


function _formatNumber(myField){
    if ( myField.value != "") {
    	if ( myField.value.indexOf(".") == -1) {
    	    myField.value = myField.value + ".000";
    	} else if ( (myField.value.length-myField.value.indexOf("."))<4 )  {
    	    for (var i=0;i<4-(myField.value.length-myField.value.indexOf("."));i++) {
    	    	alert(i);
    	    	myField.value += "0";
    	    }
    	}
    }
}

function _compareDate(sDate1, sDate2) {

     var vDate1 = sDate1.split("-")
	 var vDate2 = sDate2.split("-")

	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

	var date1 = new Date(_Year1, _Month1, _Day1);
	var date2 = new Date(_Year2, _Month2, _Day2);

	var dif = 0;

	var lDate2 = date2.getTime();
	var lDate1 = date1.getTime();

	dif = (lDate2 - lDate1) / 1000 / 60 / 60 / 24;

	return dif;
}

/**
 * Format number
 * parameter:
 *     _express: double
 *     iSize:    int
 *
 * _changeNumber(12.3456, 3) = 12.346
 */
function _changeNumber(_express, iSize) {
	_express = _express - 1 + 1;
	iSize = iSize - 1 + 1;

	var iKey1 = Math.pow(10, 12);
	var dTemp = Math.round(_express * iKey1);
	var sTemp = "" + dTemp;
	var iEndNum = sTemp.substring(sTemp.length - 1, sTemp.length) - 1 + 1
	if (iEndNum = 9) {
		dTemp = dTemp + 1;
	} else {
		dTemp = dTemp + 2;
	}

	dTemp = dTemp / iKey1;

	var iKey = Math.pow(10, iSize);
	dTemp = Math.round(dTemp * iKey);

	return dTemp / iKey;
}

//format float data as:*****.**
//decplaces:小数位数
function FloatFormat(expr,decplaces) {

	// judge if it is a valid number
	if (isNaN(expr)) {
		alert("Invalid number:" + expr);
		return 0;
	}

	// change to number
	var nExpr = Number(expr);

	// multiple
	nExpr = nExpr * Math.pow(10, decplaces);

	// round
	nExpr = Math.round(nExpr);

	// division
	nExpr = nExpr / Math.pow(10, decplaces);

	var sExpr = nExpr.toString();

	// decimal point location
	var pointIndex = sExpr.indexOf('.');

	// patch zero
	var loop;
	if (pointIndex == -1) {
		sExpr = sExpr + ".";
		loop = decplaces - 1;
	} else {
		loop = decplaces - (sExpr.length - pointIndex);
	}
	for (var i=0;i<=loop;i++)	{
		sExpr = sExpr + "0";
	}

	// return
	return sExpr;
}

//格式化查询时间
function getFormatTime(iYear, sTime, iKey) {
    //iYear---2001
    //sTime---1,2,3,4
	//iKey---1:季度;2:月份

	var _str = null;
    var aTime = new Array();
	var iFlag = true;
	aTime = sTime.split(",")

	if (aTime.length < 2) {
	    iFlag = false;
	} else {
		for (i = 0; i < aTime.length - 1; i++) {
			 iPre = aTime[i] - 1 + 1;
			 iLast = aTime[i + 1] - 1 + 1;
			 if (iLast - iPre != 1) {
				 iFlag = false;
				 break;
			 }
		}
	}
	if (iFlag == true){
	    _str = iYear + "年" + aTime[0] + "-" + aTime[aTime.length - 1];
	} else {
	    _str = iYear + "年" + sTime;
	}

	if (iKey == 1) {
	    _str = _str + "季度";
	} else {
	    _str = _str + "月";
	}

	return _str;
}

//检查日期时间是否合法。
function JudgeDateFormat(sDate, iType) {
		/*参数说明*******************/
		/**sDate——输入的日期*****/
		/**iType——日期格式类型***
			   0——年、月、日格式 YYYY-MM-DD
			   1——年、月、日、时  YYYY-MM-DD HH
			   2——年、月、日、时分  YYYY-MM-DD HH:MI
			   3——年、月、日、时分秒  YYYY-MM-DD HH:MI:SS */

		switch (iType) {
			case 0:
				var aDateList = new Array();
				aDateList = sDate.split("-");
				if (aDateList.length != 3) {
					return false;
				}

				if (!is_int(aDateList[0]) || aDateList[0] == "" || !is_int(aDateList[1]) || aDateList[1] == "" || !is_int(aDateList[2]) || aDateList[2] == "") {
					return false;
				}
				if (aDateList[0].length != 4 || aDateList[1].length > 2 || aDateList[2].length > 2) {
					return false;
				}
				aDateList[0] = aDateList[0] - 1 + 1;
				aDateList[1] = aDateList[1] - 1 + 1;
				aDateList[2] = aDateList[2] - 1 + 1;

				if ((aDateList[0] < 1950) || (aDateList[0] > 2050)) {
					return false;
				}
				if ((aDateList[1] < 1) || (aDateList[1] > 12)) {
					return false;
				}
				switch (aDateList[1]) {
					case 1:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 2:
						if ((aDateList[2] < 1) || (aDateList[0] % 4 == 0 && aDateList[2] > 29) || (aDateList[0] % 4 != 0 && aDateList[2] > 28)) return false;
						break;
					case 3:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 4:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 5:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 6:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 7:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 8:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 9:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 10:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 11:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 12:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
				}
				return true;
				break;
			case 1:
				var aDateSec = new Array();
				var aDateList = new Array();

				aDateSec = sDate.split(" ");
				if (aDateSec.length != 2) {
					return false;
				}

				aDateList = aDateSec[0].split("-");
				if (aDateList.length != 3) {
					return false;
				}
				aDateList[3] = aDateSec[1];

				if (!is_int(aDateList[0]) || aDateList[0] == "" || !is_int(aDateList[1]) || aDateList[1] == "" || !is_int(aDateList[2]) || aDateList[2] == "" || !is_int(aDateList[3]) || aDateList[3] == "") {
					return false;
				}
				if (aDateList[0].length != 4 || aDateList[1].length > 2 || aDateList[2].length > 2 || aDateList[3].length > 2) {
					return false;
				}
				aDateList[0] = aDateList[0] - 1 + 1;
				aDateList[1] = aDateList[1] - 1 + 1;
				aDateList[2] = aDateList[2] - 1 + 1;
				aDateList[3] = aDateList[3] - 1 + 1;

				if ((aDateList[0] < 1950) || (aDateList[0] > 2050)) {
					return false;
				}
				if ((aDateList[1] < 1) || (aDateList[1] > 12)) {
					return false;
				}
				switch (aDateList[1]) {
					case 1:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 2:
						if ((aDateList[2] < 1) || (aDateList[0] % 4 == 0 && aDateList[2] > 29) || (aDateList[0] % 4 != 0 && aDateList[2] > 28)) return false;
						break;
					case 3:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 4:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 5:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 6:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 7:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 8:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 9:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 10:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 11:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 12:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
				}

				if (aDateList[3] < 0 || aDateList[3] > 23) {
					return false;
				}
				return true;
				break;
			case 2:
				var aDateSec = new Array();
				var aDateList = new Array();
				var aDateMiList = new Array();

				aDateSec = sDate.split(" ");
				if (aDateSec.length != 2) {
					return false;
				}

				aDateList = aDateSec[0].split("-");
				if (aDateList.length != 3) {
					return false;
				}
				aDateMiList = aDateSec[1].split(":");
				if (aDateMiList.length != 2) {
					return false;
				}
				aDateList[3] = aDateMiList[0];
				aDateList[4] = aDateMiList[1];

				if (!is_int(aDateList[0]) || aDateList[0] == "" || !is_int(aDateList[1]) || aDateList[1] == "" || !is_int(aDateList[2]) || aDateList[2] == "" || !is_int(aDateList[3]) || aDateList[3] == "" || !is_int(aDateList[4]) || aDateList[4] == "") {
					return false;
				}
				if (aDateList[0].length != 4 || aDateList[1].length > 2 || aDateList[2].length > 2 || aDateList[3].length > 2 || aDateList[4].length > 2) {
					return false;
				}

				aDateList[0] = aDateList[0] - 1 + 1;
				aDateList[1] = aDateList[1] - 1 + 1;
				aDateList[2] = aDateList[2] - 1 + 1;
				aDateList[3] = aDateList[3] - 1 + 1;
				aDateList[4] = aDateList[4] - 1 + 1;

				if ((aDateList[0] < 1950) || (aDateList[0] > 2050)) {
					return false;
				}
				if ((aDateList[1] < 1) || (aDateList[1] > 12)) {
					return false;
				}
				switch (aDateList[1]) {
					case 1:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 2:
						if ((aDateList[2] < 1) || (aDateList[0] % 4 == 0 && aDateList[2] > 29) || (aDateList[0] % 4 != 0 && aDateList[2] > 28)) return false;
						break;
					case 3:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 4:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 5:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 6:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 7:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 8:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 9:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 10:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 11:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 12:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
				}

				if (aDateList[3] < 0 || aDateList[3] > 23) {
					return false;
				}

				if (aDateList[4] < 0 || aDateList[4] > 59) {
					return false;
				}
				return true;
				break;
			case 3:
				var aDateSec = new Array();
				var aDateList = new Array();
				var aDateMiList = new Array();

				aDateSec = sDate.split(" ");
				if (aDateSec.length != 2) {
					return false;
				}

				aDateList = aDateSec[0].split("-");
				if (aDateList.length != 3) {
					return false;
				}
				aDateMiList = aDateSec[1].split(":");
				if (aDateMiList.length != 3) {
					return false;
				}
				aDateList[3] = aDateMiList[0];
				aDateList[4] = aDateMiList[1];
				aDateList[5] = aDateMiList[2];

				if (!is_int(aDateList[0]) || aDateList[0] == "" || !is_int(aDateList[1]) || aDateList[1] == "" || !is_int(aDateList[2]) || aDateList[2] == "" || !is_int(aDateList[3]) || aDateList[3] == "" || !is_int(aDateList[4]) || aDateList[4] == "" || !is_int(aDateList[5]) || aDateList[5] == "") {
					return false;
				}
				if (aDateList[0].length != 4 || aDateList[1].length > 2 || aDateList[2].length > 2 || aDateList[3].length > 2 || aDateList[4].length > 2 || aDateList[5].length > 2) {
					return false;
				}

				aDateList[0] = aDateList[0] - 1 + 1;
				aDateList[1] = aDateList[1] - 1 + 1;
				aDateList[2] = aDateList[2] - 1 + 1;
				aDateList[3] = aDateList[3] - 1 + 1;
				aDateList[4] = aDateList[4] - 1 + 1;
				aDateList[5] = aDateList[5] - 1 + 1;

				if ((aDateList[0] < 1950) || (aDateList[0] > 2050)) {
					return false;
				}
				if ((aDateList[1] < 1) || (aDateList[1] > 12)) {
					return false;
				}
				switch (aDateList[1]) {
					case 1:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 2:
						if ((aDateList[2] < 1) || (aDateList[0] % 4 == 0 && aDateList[2] > 29) || (aDateList[0] % 4 != 0 && aDateList[2] > 28)) return false;
						break;
					case 3:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 4:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 5:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 6:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 7:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 8:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 9:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 10:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
					case 11:
						if (aDateList[2] < 1 || aDateList[2] > 30) return false;
						break;
					case 12:
						if (aDateList[2] < 1 || aDateList[2] > 31) return false;
						break;
				}

				if (aDateList[3] < 0 || aDateList[3] > 23) {
					return false;
				}

				if (aDateList[4] < 0 || aDateList[4] > 59) {
					return false;
				}

				if (aDateList[5] < 0 || aDateList[5] > 59) {
					return false;
				}
				return true;
				break;
		}
	}

//比较格式化时间
	function _compareFullDate(_Date1,_Date2,iType){
		/*参数说明*******************/
		/**_Date1,_Date2——输入的日期*****/
		/**iType——日期格式类型***
			   0——年、月、日格式 YYYY-MM-DD
			   1——年、月、日、时  YYYY-MM-DD HH
			   2——年、月、日、时分  YYYY-MM-DD HH:MI
			   3——年、月、日、时分秒  YYYY-MM-DD HH:MI:SS */
		/**返回值
			_Date1<_Date2 返回 1
			_Date1>_Date2 返回 -1
			_Date1=_Date2 返回 0
		*/
		switch (iType) {
			case 0:
				var aDateList1 = new Array();
				aDateList1 = _Date1.split("-");
				var aDateList2 = new Array();
				aDateList2 = _Date2.split("-");
				var sDate1 = new Date(aDateList1[0],aDateList1[1],aDateList1[2],0,0,0);
				var sDate2 = new Date(aDateList2[0],aDateList2[1],aDateList2[2],0,0,0);
				if (sDate1<sDate2) {
					return 1;
				}else if (sDate1>sDate2) {
					return -1;
				}else {
					return 0;
				}
				break;
			case 1:
				_Date1 = _Date1.replace(" ","-");
				_Date2 = _Date2.replace(" ","-");
				var aDateList1 = new Array();
				aDateList1 = _Date1.split("-");
				var aDateList2 = new Array();
				aDateList2 = _Date2.split("-");
				var sDate1 = new Date(aDateList1[0],aDateList1[1],aDateList1[2],aDateList1[3],0,0);
				var sDate2 = new Date(aDateList2[0],aDateList2[1],aDateList2[2],aDateList2[3],0,0);
				if (sDate1<sDate2) {
					return 1;
				}else if (sDate1>sDate2) {
					return -1;
				}else {
					return 0;
				}
				break;
			case 2:
				_Date1 = _Date1.replace(" ","-");
				_Date2 = _Date2.replace(" ","-");
				_Date1 = _Date1.replace(":","-");
				_Date2 = _Date2.replace(":","-");
				var aDateList1 = new Array();
				aDateList1 = _Date1.split("-");
				var aDateList2 = new Array();
				aDateList2 = _Date2.split("-");
				var sDate1 = new Date(aDateList1[0],aDateList1[1],aDateList1[2],aDateList1[3],aDateList1[4],0);
				var sDate2 = new Date(aDateList2[0],aDateList2[1],aDateList2[2],aDateList2[3],aDateList2[4],0);
				if (sDate1<sDate2) {
					return 1;
				}else if (sDate1>sDate2) {
					return -1;
				}else {
					return 0;
				}
				break;
			case 3:
				_Date1 = _Date1.replace(" ","-");
				_Date2 = _Date2.replace(" ","-");
				_Date1 = _Date1.replace(":","-");
				_Date2 = _Date2.replace(":","-");
				_Date1 = _Date1.replace(":","-");
				_Date2 = _Date2.replace(":","-");
				var aDateList1 = new Array();
				aDateList1 = _Date1.split("-");
				var aDateList2 = new Array();
				aDateList2 = _Date2.split("-");
				var sDate1 = new Date(aDateList1[0],aDateList1[1],aDateList1[2],aDateList1[3],aDateList1[4],aDateList1[5]);
				var sDate2 = new Date(aDateList2[0],aDateList2[1],aDateList2[2],aDateList2[3],aDateList2[4],aDateList2[5]);
				if (sDate1<sDate2) {
					return 1;
				}else if (sDate1>sDate2) {
					return -1;
				}else {
					return 0;
				}
				break;
		}
	}

	function isIDCard(sInput) {
		var NumStr="0123456789";
		var NumStr_1="0123456789Xx";

		if (sInput == "") {
			return false;
		}

		if (sInput.length != 15 && sInput.length != 18)	{
			return false;
		}

		if (sInput.length == 15) {
			for (i = 0; i < sInput.length; i++)
			{
				if (NumStr.indexOf(sInput.charAt(i),0) == -1)
				{
					return false;
				}
			}
		} else {
			for (i = 0;i < sInput.length - 1; i++)
			{
				if (NumStr.indexOf(sInput.charAt(i), 0) == -1)
				{
					return false;
				}
			}

			if (NumStr_1.indexOf(sInput.charAt(sInput.length - 1), 0) == -1)
			{
				return false;
			}
		}

		return true;
	}
