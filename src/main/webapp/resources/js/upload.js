
$(document).ready(function() {
	$("#in-thumbnail").on("change", handleImgFileSelect);
});
function handleImgFileSelect(e) {
	/*var sel_file;*/
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f) {
		if (!f.type.match("")) {
			alert("이미지 파일(jpg, png, gif) 형식만 등록 가능합니다.");
			
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			
			$("#out-thumbnail").html('<img src="' + e.target.result + '"></img>');
			
			
		}
		
		reader.readAsDataURL(f);
	});
}


$(document).ready(function() {
	$("#emoticon").on("change", handleImgsFilesSelect);
});
function handleImgsFilesSelect(e) {
	var sel_files = [];
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	var check = 0;
	/* 파일 올릴때마다 썸네일 이미지 초기화함 */
	$("#emoticons").empty();
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			check = check + 1;
			alert("이미지 파일(jpg, png, gif) 형식만 등록 가능합니다.");
				$("#emoticons").empty();
				$('#emoticon').val('');
			return ;
		}
		else{
		sel_files.push(f);
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = '<img src="' + e.target.result + '"/>'
			$("#emoticons").append(img_html);
			if (check != 0) {
				$("#emoticons").empty();
				$('#emoticon').val('');
				return;
			}
		}
		reader.readAsDataURL(f);}

	});


}

function check() {
	var title = upload.title.value.trim();
	var titleSize = title.length;
	if (titleSize == 0) {
		alert("제목을 입력해주세요.");
		upload.title.focus();
		return false;
	}
	var fileSize = $('#in-thumbnail').val();

	if (fileSize == '') {

		alert('썸네일을 등록하세요.');

		return false;
	}
	var fileList = $('#emoticon').val();

	if (fileList < 1) {
		alert('썸네일을 제외하고 한 개 이상 등록해주세요.');
		
		return false;
	}

}

	$("#in-thumbnail").on("change", function() {
		var ext = $("#in-thumbnail").val();
		ext = ext.slice(ext.indexOf(".") + 1).toLowerCase();
		if (ext != "jpg" && ext != "png" && ext != "gif") {
			alert("이미지 파일(jpg, png, gif) 형식만 등록 가능합니다.");
			$("#in-thumbnail").val("");
			$('#out-thumbnail').empty();
			return;
		}

	});
	
	


