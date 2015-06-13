    function    locking(){
    document.all.uw.style.display="none";
    document.all.uw.style.width=document.body.clientWidth;
    document.all.uw.style.height=document.body.clientHeight;
    document.all.uw_h.style.display='block';
    }
    function    Lock_CheckForm(theForm){
    document.all.uw.style.display='none';document.all.uw_h.style.display='none';
    return   false;
    }