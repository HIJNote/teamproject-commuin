<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<%@ include file="setting/js.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이모티콘 업로드</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">

</style>
</head>

<body>
	<%@ include file="../common/navbar.jsp"%>

	<article class="emoticon-upload-article">
		<div class="container">
			<div class="upload-container">
				<div class="upload-title">
					<span><i class="bi bi-image"></i>&nbsp;이모티콘 등록</span>
				</div>
				<div class="card">
					<form id="upload" name="upload" action="/emoticon/uploadDo"
						method="POST" enctype="multipart/form-data" onsubmit="return check()">
						<div class="form-group row">
							<label for="idTitle" class="col-3 col-form-label">제목</label>
							<div class="col-9">
								<!-- 이모티콘 제목  -->
								<input class="form-control mt-2" type="text" name="e_title"
									id="title" maxlength="20" oninput="titleCheck()">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3 col-form-label">썸네일</label>
							<!-- 썸네일 -->
							<div class="col-9">
								<input id="in-thumbnail" class="form-control mt-2" type="file"
									name="thumbnail" accept="image/*">
							</div>
						</div>
						<div class="row">
							<div class="col-3"></div>
							<div class="col-9 mb-2">
								<div id="out-thumbnail"></div>
							</div>
						</div>
						<!-- 이모티콘리스트등록 -->
						<div class="form-group row">
							<label class="col-3 col-form-label">이모티콘 업로드</label>
							<div class="col-9">
								<input class="form-control mt-2" type="file" id="emoticon"
									name="emoticonList" accept="image/*" multiple="multiple">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3 col-form-label">업로드 된 이모티콘</label>
							<div class="col-9 mt-2" id="emoticons"></div>
						</div>					
						<span id="check-info"></span>
						<span class="upload-btn float-right">	
							<button class="btn btn-secondary" type="submit">등록</button>
						</span>				
					</form>
					
				</div>
			</div>
		</div>
	</article>

	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		function titleCheck(text) {
			var text=$('#title').val();
			$.ajax({
				url: "/emoticon/checkTitle",
	    		type: "GET",
	    		data: { e_title: text},    			
	    		success:function(data){
	    			if(data==1)
	    				$('#check-info').text('같은 제목이 있습니다. 등록 하시겠습니까?');
	    			else
	    				$('#check-info').empty();
	    		}
			});
		}
		
	</script>
</body>

</html>