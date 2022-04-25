/*
function check() {
	var str = $("#ch_name").val().trim();
	$.ajax({
		url: "/channel/nameCheck",
		type: "get",
		dataType: "json",
		data: { ch_name: str },
		success: function(data) {
			$('#result').empty();
		
			if (str == "") {
				$('#result').append("&nbsp;")
				$('#formbtn').css('disabled', 'true');
			} else
				if (data == 1) {
					$('#result').text("중복입니다.");
					$('#formbtn').css('disabled', 'true');
				}
				else if (data == 0) {
					$('#result').text("사용가능!!!");
					$('#formbtn').removeAttr("disabled");
				}
		}
	})
}
*/