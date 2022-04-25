
$(document).ready(function(){
    if($('#member-confirm').val()==1){
       $('.login-member').css('display','inline-block');
       $('.login-nomember').css('display','none');
    }else{
        $('.login-nomember').css('display','inline-block');
        $('.login-member').css('display','none');
    }
});
