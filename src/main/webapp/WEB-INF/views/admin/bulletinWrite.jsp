<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<c:if test="${sessionValue.getSessionName() != '관리자'}">
		<script>
			alert("비 정상적 접근하셨습니다. \n뒤로 돌아갑니다.");
			window.history.back();
		</script>
	</c:if>
	<div class="container-scroller">
		<%@ include file="header.jsp"%>
		<!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">공지글 작성</h4>
								<form action="adminBoardInsert" class="forms-sample" method="POST">
									<input type="hidden" name="u_name" value="${sessionValue.getSessionName()}">
									<div class="form-group row">
										<label for="exampleInputUsername2"
											class="col-sm-1 col-form-label">제목</label>
										<div class="col-sm-11">
											<input type="text" name="title" class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label for="exampleInputEmail2"
											class="col-sm-1 col-form-label">카테고리</label>
										<div class="col-sm-2" style="padding-top: 0.5%">
											<div class="form-group">
												<select name="ch_name" class="form-control form-control-sm" id="exampleFormControlSelect3" disabled="disabled">
													<option value="공지사항">공지사항</option>
													<option>문의 게시판</option>
													<option>채널 문의 게시판</option>
												</select>
											</div>
										</div>
										<div class="col-sm-2" style="padding-top: 0.5%">
											<div class="form-check form-check-flat form-check-primary">
												<label class="form-check-label">
					                              <input type="checkbox" class="form-check-input" disabled checked>
					                              전체공지
					                            </label>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="exampleInputMobile"
											class="col-sm-1 col-form-label">내용</label>
										<div class="col-sm-11">
											<textarea name="b_content" id="summernote"></textarea>
										</div>
									</div>
									<button type="submit" class="btn btn-primary mr-2">작성</button>
									<button class="btn btn-light">취소</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="footer.jsp"%>
		</div>
	</div>
<script>
      $('#summernote').summernote({
        //placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
</script>
<%@ include file="setting/js.jsp"%>
</body>
</html>