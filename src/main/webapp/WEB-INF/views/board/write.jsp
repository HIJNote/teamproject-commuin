<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel=stylesheet href="${path}/resources/css/root.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<title>커뮤인</title>
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>

	<article class="write-box">
		<div class="container">

			<div class="row">
				<div class="col-12 mt-4">

					<form action="/board/content" method="POST">
						<div class="col-12 border-dark border-top border-bottom">

							<input type="hidden" name="ch_name" id="ch_nameHidden"
								value="${channel.ch_name }"> <input type="hidden"
								name="ch_id" value="${channel.ch_id }"> <span
								class="custom-span" style="font-size: 22px" id="ch_name">${channel.ch_name }</span>
						</div>

						<div class="col-12 border-dark border-top border-bottom mt-2 py-1">
						<c:choose>
						<c:when test="${empty check}">
						<span class="custom-span" style="font-size: 22px">글쓰기</span>
						</c:when>
						<c:otherwise>
						<span class="custom-span" style="font-size: 22px">채널공지쓰기</span>
						</c:otherwise>
						</c:choose>
							
						</div>

						<div class="form-row board-create my-3">
							<div class="col-12">
								<span class="form-control-lg">글머리</span>

									<c:if test="${empty check}">
										<c:forEach var="tag" items="${tag }">
											<c:if test="${tag.tg_name ne '공지' }">
												<c:choose>
													<c:when test="${tag.tg_name eq '전체'}">
														<span class="form-control-sm"> <input type="radio"
															name="b_tag" id="${tag.tg_id }" value="${tag.tg_name }"
															checked="checked" required> <label
															for="${tag.tg_id }">${tag.tg_name }</label>
														</span>
													</c:when>
													<c:otherwise>
														<span class="form-control-sm"> <input type="radio"
															name="b_tag" id="${tag.tg_id }" value="${tag.tg_name }"
															required> <label for="${tag.tg_id }">${tag.tg_name }</label>
														</span>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${!empty check}">
									<c:forEach var="tag" items="${tag }">
										<c:if test="${tag.tg_name eq '공지' }">
										<span class="form-control-sm"> <input type="radio"
															name="b_tag" id="${tag.tg_id }" value="${tag.tg_name }"
															checked="checked" required> <label
															for="${tag.tg_id }">${tag.tg_name }</label>
														</span>
										</c:if>
									</c:forEach>
									</c:if>
									
									
							
							</div>
						</div>

						<!-- 게시글 제목 -->
						<div class="form-group row">
							<div class="col-12 input-group pt-2">
								<div class="input-group-prepend">
									<span class="input-group-text rounded-0 font-weight-bold">제목</span>
								</div>
								<input type="text" name="b_title" class="form-control rounded-0"
									id="" aria-label="게시글 제목">
							</div>
						</div>

						<!-- 게시글 작성 -->
						<div class="row">
							<div class="col-12">
								<textarea class="summernote" name="b_content"
									style="display: none;"></textarea>
							</div>
							<script>
								$('.summernote').summernote({
									height : 400,
									lang : "ko-KR",
									disableResizeEditor : true,

									toolbar : [
										// [groupName, [list of button]]
										[ 'fontname', [ 'fontname' ] ],
										[ 'fontsize', [ 'fontsize' ] ],
										[ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
										[ 'color', [ 'forecolor', 'color' ] ],
										[ 'table', [ 'table' ] ],
										[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
										[ 'height', [ 'height' ] ],
										[ 'insert', [ 'picture', 'link', 'video' ] ],
										[ 'view', [ 'fullscreen', 'help' ] ] ],

										fontNames : [ '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
										fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72' ],
										callbacks : {
	                                    	onImageUpload : function(files){
	                                    		for(var i = files.length - 1; i >= 0; i --){
	                                    			sendFile(files[i], this);
	                                    		}
	                                    	}
	                                    }
								});
								
								$('.summernote').summernote('fontSize', '16');
							</script>
						</div>

						<!-- 작성 -->
						<div class="form-group row mt-3">
							<div class="col-12 text-right">
								<button type="submit"
									class="btn btn-outline-secondary rounded-0 custom-btn">작성</button>
							</div>
						</div>
					</form>

				</div>
			</div>

		</div>
	</article>

	<%@ include file="../common/footer.jsp"%>
	<script>
		function check() {
			//채널 이름 넘기기
			var ch_name = $("#ch_name").text();
			$('#ch_nameHidden').val(ch_name);

			//유저 이름
			$('#u_nameHidden').val('${sessionValue.sessionName}');

			return true;
		}

		function sendFile(file, editor) {
			var data = new FormData();
			data.append('file', file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/board/imageConvert",
				cache : false,
				contentType : false,
				enctype : 'multipart/data',
				processData : false,
				success : function(name) {
					//0085be4a-64c8-4be5-b517-dc9a9e7cfb29.jpg
					//setTimeout(function(){
					//$(editor).summernote('insertImage', '/resources/image/bImage/' + name)}, 4000);
					$(editor).summernote('insertImage', name);
				},
				error : function() {
					alert('오류');

				}
			});
		}
	</script>

</body>
</html>