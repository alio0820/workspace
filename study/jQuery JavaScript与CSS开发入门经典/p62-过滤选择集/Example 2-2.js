var tmpExample = {
		ready : function() {
			//找到所有的<input>元素，增加一个连接
			$('a').click(tmpExample.findElements);
},
findElements : function($e)
{
	//阻止默认事件
	$e.preventDefault();
	//去掉类tmpExample
	$('*').removeClass('tmpExample');
	switch (this.id)
	{
	   case'tmpFind':
	   {
		  $('ul').find('li').addClass('tmpExample');
		  break;
	   }
	   case'tmpSiblings':
	   {
		   $('li#tmpCarrot').siblings().addClass('tmpExample');
		   break;
	   }
	   case 'tmpNext':
	   {
		   $('li#tmpBroccoli').next().addClass('tmpExample');
		   break;
	   }
	   case 'tmpPrev':
	   {
		   $('li#tmpBroccoli').prev().addClass('tmpExample');
		   break;
	   }
	   case 'tmpNextAll':
	   {
		   $('li#tmpBroccoli').nextAll().addClass('tmpExample');
		   break;
	   }
	   case 'tmpPrevAll':
	   {
		   $('li#tmpOrange').prevAll().addClass('tmpExample');
		   break;
	   }
	   case 'tmpVegetables':
	   {
		   $('li#tmpOrange').prevAll('li.tmpVegetables').addClass('tmpExample');
		   break;
	   }
	   case 'tmpParents':
	   {
		   $('li#tmpCarrot').parents('div#tmpSelection').addClass('tmpExample');
		   break;
	   }
	   case 'tmpParent':
	   {
		   $('li').parent('ul').addClass('tmpExample');
		   break;
	   }
	   case 'tmpChildren':
	   {
		   $('div.tmpList').children('h4').addClass('tmpExample');
		   break;
	   }
	   case 'tmpNot':
	   {
		   $('ul li').not('li.tmpVegetables').addClass('tmpExample');
		   break;
	   }
	   case 'tmpSlice':
	   {
		   $('ul#tmpAnimals li').slice(1,4).addClass('tmpExample');
		   break;
	   }   
	   case 'tmpAdd':
	   {
		   $('ul#tmpAnimals li').add('li#tmpBroccoli,li#tmpPepper').addClass('tmpExample');
		   break;
	   } 
	   case 'tmpEq':
	   {
		   $('ul li').eq(10).addClass('tmpExample');
		   break;
	   }
	}	
}
};
$(document).ready(tmpExample.ready);