//-------------有关图片-------------/
var TreeImg = new Array();
        TreeImg[0] = new Image();
        TreeImg[1] = new Image();
        TreeImg[2] = new Image();

        TreeImg[0].src = "../images/openTree.gif";
        TreeImg[1].src = "../images/closeTree.gif";
        TreeImg[2].src = "../images/Treeline.gif";

//-------------制造菜单--------------------/
function MakeTree(newObj,oldObj,explain,num,title,url,target)
{
        if(num==0)
        {
                pointClass = "";
        }
        if(num==1)
        {
                pointClass = "TreePoint";
        }

        if(title&&title!="")
        {
                title = ' title="'+title+'" ';
        }
        else
        {
                title = "";
        }

        if(!url)
                url = "#";
        if(!target)
                target = "_top";

        var word = '<table border="0" cellspacing="0" cellpadding="0" class="TreeBgColor">';

                word+= '<tr>';
                word+= '<td class="TreeSign">';
                word+= '<img border="0" src="'+TreeImg[1].src+'" id="sign_'+newObj+'"  onclick="SiblingClick(this.id);">'
                word+= '</td>';
                word+= '<td>';
                //word+= '<a href="'+url+'" target="'+target+'"><nobr>'+explain+'</nobr></a>';
                var encodedUrl;
                if(url != null)
                    encodedUrl = _replaceAll(url, "'", "$");
                else
                    encodedUrl = url;
                if(url != '#'){
	                word+= '<span class="ExplainOFF" onclick=TreeControl("'+encodedUrl+'","'+target+'") value="'+newObj+'" '+title+' ><nobr>'+explain+'</nobr></span>';
				}
                else{
		            word+= '<span class="ExplainOFFNoHand"  value="'+newObj+'" '+title+' ><nobr>'+explain+'</nobr></span>';
				}
                word+= '</td>';
                word+= '</tr>';
                word+= '<tr style="display: block"  id="'+newObj+'">';
                word+= '<td class="'+pointClass+'"> </td> ';
                word+= '<td  valign="top" width="54" id="td_'+newObj+'"></td>';
                word+= '</tr>';

                word+= '</table>';

                eval(oldObj+".innerHTML+='"+ word +"'");

                word = null;

}

//-------------制造连接--------------------/
function MakeLine(newObj,oldObj,explain,url,ltarget,title)
{

        var the_target = "";

        if(ltarget&&ltarget!="")
        {
                the_target += 'target="'+ltarget+'"';
        }

        if(title&&title!="")
        {
                title = ' title="'+title+'" '
        }
        else
        {
                title = ""
        }

        var word = '<table border="0" cellspacing="0" cellpadding="0" class="TreeBgColor">';

                word+= '<tr>';
                word+= '<td class="TreeSign">';
                word+= '<img border="0" src="'+TreeImg[2].src+'">'
                word+= '</td>';
                word+= '<td>'
                if(url != '#')
                word+= '<a href="'+url+'"   '+the_target+title+' ><span class="ExplainOFF" onclick="LineControl(this.value)"><nobr>'+explain+'</nobr></span></a>';
                else
                word+= '<span class="ExplainOFFNoHand"><nobr>'+explain+'</nobr></span>';
                word+= '</td>';
                word+= '</tr>';
                word+= '</table>';

                eval(oldObj+".innerHTML+='"+ word +"'");

                word = null;
}


//--------- 建立 菜单 框架 对象 ----------/

function GoodTree(objName)
{
        this.id  	 = "tree_"+objName;
        this.obj 	 = objName;
        this.length  = 0;

        this.addTree = addTree;
        this.addLine = addLine;

        this.addEndTree = addEndTree;

        this.endTree = endTree;

        document.body.innerHTML += '<div id="stage_'+this.id+'" style="display: none"><table border="0" cellspacing="0" cellpadding="0" class="TreeBgColor"><tr><td id="td_'+this.id+'"></td></tr></table></div>';
}

//-----------建立 子菜单 对象 ---------/

function SubTree(objName,objID)
{
        this.obj = objName;
        this.id  = objID;

        this.addTree = addTree;
        this.addLine = addLine;

        this.addEndTree = addEndTree;

        this.length  = 0;
}

//---------- 菜单 方法 addTree ------------/

function addTree(explain,title,url,target)
{
        var subID    = this.id + "_" + this.length;
        var subObj  = this.obj+"["+this.length+"]";

        var oldID  = "td_"+ this.id;

        eval(subObj+"= new SubTree('"+subObj+"','"+subID+"')");

         MakeTree(subID,oldID,explain,1,title,url,target);

         this.length++;
}


//---------- 菜单 方法 addEndTree ------------/

function addEndTree(explain,title)
{

        var subID    = this.id + "_" + this.length;
        var subObj  = this.obj+"["+this.length+"]";

        var oldID  = "td_"+ this.id;

        eval(subObj+"= new SubTree('"+subObj+"','"+subID+"')");

         MakeTree(subID,oldID,explain,0,title);

         this.length++;
}

//----------- 菜单 方法 addLine -----------/

function addLine(explain,url,target,title)
{
        var subID    = this.id + "_" + this.length;
        var oldID  = "td_"+ this.id;

         MakeLine(subID,oldID,explain,url,target,title);

         this.length++;
}


//--------- 完成 菜单 和 消去 变量和 源蓝图 并且输出  -------------/

function endTree(place)
{

        var the_stage = eval("stage_"+ this.id);
        var obj = eval(place);

        obj.innerHTML += the_stage.innerHTML;

        document.getElementById("stage_"+ this.id).outerHTML ="";

        eval(this.obj+"=null");

}

//-----------菜单的 隐藏 和显示 ------------/

var temp_tree_index = null;   //纪录点击的TD的 sourceIndex

function TreeControl(url,target)
{

	if(temp_tree_index)
	{
		document.all(temp_tree_index).className = "ExplainOFF"
	}
	
	       event.srcElement.className = "ExplainON";

	       temp_tree_index = event.srcElement.sourceIndex;
        var decodedUrl;
        if(url != null){
            decodedUrl = _replaceAll(url,"$", "'")
	         if(decodedUrl.toLowerCase().indexOf("javascript:") > -1)
                eval(decodedUrl)
            else if(decodedUrl!='#')
               open(decodedUrl,target);}
}


//-----------Line的 方法 ------------/


function LineControl()
{
        if(temp_tree_index)
        {
                document.all(temp_tree_index).className = "ExplainOFF"
        }

        event.srcElement.className = "ExplainON";

        temp_tree_index = event.srcElement.sourceIndex;
}


//------------Sign TD的方法----------------/
function SiblingClick(obj)
{
        var tr_obj = eval(obj.substring(5));
        var sign_obj = eval("document.all.item('"+obj+"')");


        if(tr_obj.style.display=="none")
        {
                tr_obj.style.display = "block";
                sign_obj.src         = TreeImg[0].src;

                return;
        }
        if(tr_obj.style.display=="block")
        {
                tr_obj.style.display = "none";
                sign_obj.src         = TreeImg[1].src;

                return;
        }

}
function _replaceAll(oldStr, oldSubStr, newSubStr){
    var newStr = oldStr;
    var index = newStr.indexOf(oldSubStr);
    while(index > 0){
        newStr = newStr.replace(oldSubStr, newSubStr);
        index = newStr.indexOf(oldSubStr);
    }
    return newStr;
}