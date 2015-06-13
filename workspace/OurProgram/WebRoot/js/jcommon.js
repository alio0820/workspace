
	var XJBgcolor = "#DBDBDB";//С���б�����ɫ
    var HJBgcolor = "#DBDBDB";//�ϼ��б�����ɫ
    var ZJBgcolor = "#DBDBDB";//�ܼ��б�����ɫ

	var ExcelXJBgcolor = 19;//С���б�����ɫ
    var ExcelHJBgcolor = 40;//�ϼ��б�����ɫ
    var ExcelZJBgcolor = 38;//�ܼ��б�����ɫ
	var ExcelLMBgcolor = 23;//�ܼ��б�����ɫ

// ��һ������ת��Ϊ����
function var_to_obj(val)
{
	this.value=val;
}
// �ж��Ƿ����ĳ����
function is_greater(field,limit)
{
	var Ret = (is_numeric(field,-1) ) ? (field.value > parseInt(limit) )  : false;
	return(Ret);
}
// �ж��Ƿ�С��ĳ����
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
 // �ж��Ƿ��Ǽ۸�
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

 // �ж��Ƿ��Ǽ۸�
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
 // �ж��Ƿ�������
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


 // �ж��Ƿ��ǿ�
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

// �ж��Ƿ�������
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
// �ж��Ƿ���������
function is_positiveInt(field){
	if ( !is_int(field) ){
        return false;
	}
	if ( Number(field) == 0 && field!="" ) {
        return false;
    }
	return true;
}
// �ж��Ƿ�������
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

// �ж��Ƿ�������
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


// �ж��Ƿ�����Ч���ݱ�ѡ��
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

// ����Ƿ����ַ�
// cCharacter������ֵ
function isCharacter( cCharacter )
{
	var sFormat = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// ����Ƿ��������ַ�
// cCharacter������ֵ
function isDigitalCharacter( cCharacter )
{
	var sFormat = "0123456789";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// ����Ƿ����������������Ƶ��ַ�
// cCharacter������ֵ
function isOtherNameCharacter( cCharacter )
{
	var sFormat = "_";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// ����Ƿ��ǿ��������Ƶ��ַ�
// sValue������ֵ
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

// ����Ƿ�������ַ�������
// sValue������ֵ
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

// ����Ƿ���Email
// sValue������ֵ���Ϸ���ʽΪa@b.c.d������ʽ
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

// ����Ƿ����ʱ�
// sValue������ֵ���Ϸ���ʽΪ��λ����
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

// ����Ƿ��������ַ���
// sValue������ֵ
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


//IsEmpty�����ж�һ���ַ����Ƿ�Ϊ��
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
//Trim����ȥ��һ�ַ������ߵĿո�
function Trim(his)
{
   //�ҵ��ַ�����ʼλ��
   var Pos_Start = -1;
   for(var i=0;i<his.length;i++)
   {
     if(his.charAt(i)!=" ")
      {
         Pos_Start = i;
         break;
      }
   }
   //�ҵ��ַ�������λ��
   var Pos_End = -1;
   for(var i=his.length-1;i>=0;i--)
   {
     if(his.charAt(i)!=" ")
      {
         Pos_End = i;
         break;
      }
   }
   //���ص��ַ���
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
//IsDigital�����ж�һ���ַ����Ƿ�������(int or long)���
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
//IsFloat�����ж�һ���ַ����Ƿ�������(int or long or float)���
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
//IsTelephone�����ж�һ���ַ����Ƿ������ֻ�'-','*'���
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
//is_IDCard�����ж�һ���ַ����Ƿ�������֤�ĳ������ƺ���������
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
//˵����
//��һ������Ϊ�������ͣ�
//   T  ��ʾΪType=input
//
//�ڶ���������ʾ����������
//
//   ����Form.fieldName��ʽ��ʾ
//������������ʾ���ݿ��Լ��
//1������T�͵�����
//   NotNull   ��ʾ�������Ϊ�ǿ�
//   IsEMail   ��ʾ���������
//   IsNumber  ��ʾ�������Ϊһ������
//   IsInt     ��ʾ�������Ϊһ������
//   IsDate    ��ʾ��������һ������
//   IsZip     ��ʾ��������һ��ZipCode
//   IsTelephone ��ʾ��������һ���绰����
//   IsIDCard ��ʾ��������һ�����֤����
//   IsInLengthLimition ��ʾ�����Ƿ������ݿ�ĳ�������֮��
//   HowLength=##  ��ʾ�ж���ֵ�Ƿ񳬳� ����##��ʾ�ֶ������󳤶�
//���ĸ�������ʾ������ݲ��ϸ���ʾ����Ϣ�����Ϊ���ڲ���ʾ
//
function inputValidate(paras) {
	for ( var i=0; i<paras.length; i++ ) {
		if ( paras[i][0] =="T" ) {
			//����������ȷ��ĳ��ǿ�
   		if (paras[i][2] == "NotNull" ) {
	   		if ( Trim(eval (paras[i][1]+".value")) =="" ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��ΪEmail
   		if (paras[i][2] == "IsEMail" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isEmail(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ����
   		if (paras[i][2] == "IsNumber" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") &&  ! IsFloat(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ����
   		if (paras[i][2] == "IsInt" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") &&  ! is_int(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ���֤����
   		if (paras[i][2] == "IsIDCard" ) {
   			if ( (Trim(eval (paras[i][1]+".value")) !="") &&  ! is_IDCard(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ����
   		if (paras[i][2] == "IsDate" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! is_date(eval (paras[i][1])) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ����
   		if (paras[i][2] == "IsDigital" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isDigital(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}

			//����������ȷ��ĳ��Ϊ��������
   		if (paras[i][2] == "IsZip" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! isZIP(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ�绰����
   		if (paras[i][2] == "IsTelephone" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! IsTelephone(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//����������ȷ��ĳ��Ϊ���֤
   		if (paras[i][2] == "IsIDCard" ) {
	   		if ( (Trim(eval (paras[i][1]+".value")) !="") && ! is_IDCard(eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}
			//�ж��Ƿ񳤶ȴ���Ҫ�����С����
		if (paras[i][2].substring(0,9) == "MinLength" ) {
				if ( (Trim(eval (paras[i][1]+".value")) !="") && ! Is_InLengthMin(paras[i][2].substring(10),eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}

		//�ж���Ӣ�Ļ�����ֶγ���  function Is_InLengthLimit(iLimition,field,crit,msg)
		if (paras[i][2].substring(0,9) == "HowLength" ) {
				if ( (Trim(eval (paras[i][1]+".value")) !="") && ! Is_InLengthLimit(paras[i][2].substring(10),eval (paras[i][1]+".value")) ) {
					doCritCode(paras[i]);
					return false;
				}
			}

		//�ж��Ƿ��ΪӢ����ĸ������
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
//���ж�һ���ַ��Ƿ���ASCIIֵ
//cValue������ֵ
function isASCII( cValue )
{
	var sFormat = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	var iLocation = sFormat.indexOf( cValue );
	return( iLocation != -1 );
}

//��һ���ַ����еĺ��ּ�Ϊ2���ַ������������ݿ�����ȷ����
//sString�����������ַ���
function calcRealLength( sString )
{
	var iLength = 0;	// ��ʵ���ȼ�����
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

//�жϳ����Ƿ�������ݿ�ĳ���Ҫ��
//iLimition����������
//field�������ֶ�����
//crit���Ƿ���ʾ��ʾ��Ϣ���ûؽ���
//msg����ʾ��Ϣ
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

//���ַ���ASCIIֵ�������ֵ���ַ�
//iFlag��1ʱ������ַ���ASCIIֵ��0ʱ�����ֵ��ASCII�ַ�
//cValue������ֵ
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
			document.write( "����ASCIIֵ������32��126֮�䣡" );
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
		document.write( "�Ƿ�������" );
	}
}

//���ܽ���ת��
//iFlag��1ʱ������ַ���ASCIIֵ��0ʱ�����ֵ��ASCII�ַ�
//sSource������ֵ
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
		document.write( "�Ƿ�������" );
	}
}

// Compare two date
// ���_Date2����_Date1������true
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
//decplaces:С��λ��
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

//��ʽ����ѯʱ��
function getFormatTime(iYear, sTime, iKey) {
    //iYear---2001
    //sTime---1,2,3,4
	//iKey---1:����;2:�·�

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
	    _str = iYear + "��" + aTime[0] + "-" + aTime[aTime.length - 1];
	} else {
	    _str = iYear + "��" + sTime;
	}

	if (iKey == 1) {
	    _str = _str + "����";
	} else {
	    _str = _str + "��";
	}

	return _str;
}

//�������ʱ���Ƿ�Ϸ���
function JudgeDateFormat(sDate, iType) {
		/*����˵��*******************/
		/**sDate�������������*****/
		/**iType�������ڸ�ʽ����***
			   0�����ꡢ�¡��ո�ʽ YYYY-MM-DD
			   1�����ꡢ�¡��ա�ʱ  YYYY-MM-DD HH
			   2�����ꡢ�¡��ա�ʱ��  YYYY-MM-DD HH:MI
			   3�����ꡢ�¡��ա�ʱ����  YYYY-MM-DD HH:MI:SS */

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

//�Ƚϸ�ʽ��ʱ��
	function _compareFullDate(_Date1,_Date2,iType){
		/*����˵��*******************/
		/**_Date1,_Date2�������������*****/
		/**iType�������ڸ�ʽ����***
			   0�����ꡢ�¡��ո�ʽ YYYY-MM-DD
			   1�����ꡢ�¡��ա�ʱ  YYYY-MM-DD HH
			   2�����ꡢ�¡��ա�ʱ��  YYYY-MM-DD HH:MI
			   3�����ꡢ�¡��ա�ʱ����  YYYY-MM-DD HH:MI:SS */
		/**����ֵ
			_Date1<_Date2 ���� 1
			_Date1>_Date2 ���� -1
			_Date1=_Date2 ���� 0
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
