$(document).ready(
		function(){
			$('table tbody').append(
				"<TR>\n"+
				"<TD>Double Fantasy</TD>\n"+
				"<TD>1980</TD>"+
				"</TR>\n"
				);
/*			$('table tbody')[0].innerHTML+=
				"<TR>\n"+
				"<TD>Double Fantasy</TD>\n"+
				"<TD>1980</TD>"+
				"</TR>\n";
*/ //前者可以兼容IE；后者由于IE的table元素只读限制的问题无法正常显示
		}
);

				