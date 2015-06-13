<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'createTable.jsp' starting page</title>
		<script type='text/javascript'>
    function submitTable()
    {
        var trArray = document.getElementsByName("nameTr");
        if (trArray)
        {
            for (var i = 0; i < trArray.length; i++)
            {
                var tr = trArray[i];
                var tdArray = tr.getElementsByTagName("td");
                var index = tdArray[0].innerHTML;
                var name = tdArray[1].innerHTML;
                alert(index + ": " + name);
            }
        }
    }

    function addNameTR()
    {
        var userName = document.getElementById("nameText").value;
        var table    = document.getElementById("tableBody");    
        var tr = document.createElement('tr');
        tr.id = "nameTr";
        table.appendChild(tr);     
        var td1 = document.createElement('td');
        tr.appendChild(td1);
        td1.appendChild(document.createTextNode(getNameTrIndex()));     
        var td2 = document.createElement('td');
        tr.appendChild(td2);
        td2.appendChild(document.createTextNode(userName));
        var td3 = document.createElement('td');
        tr.appendChild(td3);
        var upHref = "<a href='javascript:void(0);' onclick='upTR(this);'>上移</a>";
        var downHref = "<a href='javascript:void(0);' onclick='downTR(this);'>下移</a>";
        var delHref = "<a href='javascript:void(0);' onclick='delTR(this);'>删除</a>";
        td3.innerHTML = upHref + "&nbsp;&nbsp;" + downHref + "&nbsp;&nbsp;" + delHref;   
    }

    function getNameTrIndex()
    {
        var table = document.getElementById("tableBody");
        var trArray = document.getElementsByName("nameTr");
        if (trArray)
            return trArray.length;
        else
            return 1;
    }
    
    function upTR(link)
    {
        var table      = document.getElementById("tableBody");
        var selectedTr = link.parentElement.parentElement;
        var preTr      = selectedTr.previousSibling;
        if (preTr && preTr.id != "topTr")
        {
            var selectedIndex = selectedTr.getElementsByTagName("td")[0].innerHTML;
            selectedTr.getElementsByTagName("td")[0].innerHTML = preTr.getElementsByTagName("td")[0].innerHTML;
            preTr.getElementsByTagName("td")[0].innerHTML = selectedIndex;
            table.insertBefore(selectedTr, preTr);
        }
    }

    function downTR(link)
    {
        var table      = document.getElementById("tableBody");
        var selectedTr = link.parentElement.parentElement;
        var nextTr     = selectedTr.nextSibling;
        if (nextTr)
        {
            var selectedIndex = selectedTr.getElementsByTagName("td")[0].innerHTML;
            selectedTr.getElementsByTagName("td")[0].innerHTML = nextTr.getElementsByTagName("td")[0].innerHTML;
            nextTr.getElementsByTagName("td")[0].innerHTML = selectedIndex;
            table.insertBefore(nextTr, selectedTr);
        }
    }

    function delTR(link)
    {
        if (window.confirm("确认删除？"))
        {
            var table = document.getElementById("tableBody");
            var selectedTr = link.parentElement.parentElement;
            while(selectedTr.nextSibling)
            {
                selectedTr = selectedTr.nextSibling;
                selectedTr.getElementsByTagName("td")[0].innerHTML -= 1;
            }
            table.removeChild(link.parentElement.parentElement);
        }
    }
    </script>
	</head>

	<body>
		<table border="1" bordercolor='#000000' align="center"
			style="border-collapse: collapse; width: 500px">
			<tbody id="tableBody">
				<tr id="topTr">
					<td width="200px">
						<input type="text" name="nameText">
					</td>
					<td width="150px">
						<input type="button" value="Add" onclick="addNameTR()">
					</td>
					<td width="150px">
						<input type="button" value="Submit" onclick="submitTable();">
					</td>
				</tr>
			</tbody>
		</table>
		<input type='button' value='创建表格行' onclick='javascript:alert("创建")'>
	</body>
</html>
