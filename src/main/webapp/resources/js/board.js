/*$(document).on("mouseenter", "#subsed", function() {


	$(this).empty();
	$(this).append('<i class="bi bi-x-lg"></i><span class="subscribed-text">구독 취소</span>');
});
$(document).on("mouseleave", "#subsed", function() {

	$(this).empty();
	$(this).append('<i class="bi bi-check2"></i> <span class="subscribed-text">구독 중</span>');
});*/

/* 스크랩을 누르면 스크랩 완료 or 취소 
data>0 로그인창으로 보냄
data>1 스크랩완료
data>2 스크랩취소
*/
function scrap(b_id) {
	$.ajax({
		url: "/board/scrap",
		type: "get",
		dataType: "json",
		data: { "b_id": b_id },
		success: function(data) {

			console.log(data);
			if (data == 2)
				alert('로그인을 해주세요.');
			else if (data == 0) {
				$('#scrap').empty();
				$('#scrap').append('<span class="bi bi-bookmark">');
				$('#scrap').append('</span>스크랩!');
			}
			else if (data == 1) {
				$('#scrap').empty();
				$('#scrap').append('<span class="bi bi-bookmark-check">');
				$('#scrap').append('</span>스크랩 됨');
			}

		}, error: function() {

			alert("통신실패");
		}

	});
}

$(document).ready(function(){
	    $('input:radio[name="radioValue"]').click(function(){	 
	        if($("input[name='radioValue']:checked").val() != "기타"){
	        	$("#ason").attr("readonly", true);
	        }else if($("input[name='radioValue']:checked").val() == "기타"){
	              $("#ason").attr("readonly",false);  
	        }
	    });
	});