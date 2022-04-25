<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
<title>커뮤인</title>
<link rel=stylesheet href="${path}/resources/css/root.css">
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>

	<article class="accountSearch-article">
		<div class="container">
			<div class="row">
                    <div class="col-12 offset-lg-1 col-lg-10 mt-5">
                        <form action="" class="custom-form px-4">
                            <div class="col-12 text-left pl-0 my-3">
                                <span class="font-weight-bolder py-3 mb-0 custom-span">커뮤인 아이디/비밀번호 찾기</span>            
                            </div>


                            <ul class="nav nav-tabs nav-fill mt-5" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                  <a class="nav-link active rounded-0" id="id-search-tab" data-toggle="tab" href="#id-search" role="tab" aria-controls="id-search" aria-selected="true">아이디 찾기</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                  <a class="nav-link rounded-0" id="pwd-search-tab" data-toggle="tab" href="#pwd-search" role="tab" aria-controls="pwd-search" aria-selected="false">비밀번호 찾기</a>
                                </li>
                            </ul>

                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="id-search" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row mx-0 custom-search">
                                        <div class="col-12"></div>
                                        <div class="col-12"></div>
                                        <div class="col-4 text-center pt-2">
                                            <label for="s-email">이메일</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="form-control rounded-0" id="s-email" required>
                                            <p id="idSearch" class="form-text text-muted create-massage pt-2">아이디 찾기에 필요한 이메일을 입력해주세요</p>    
                                        </div>
                                        <div class="col-12 text-right">
                                            <button class="btn btn-primary rounded-0 custom-btn" onclick="swal('아이디', '이메일 입력', 'error')">아이디 찾기</button>
                                        </div>
                                    </div>
                                </div>
        
                                <div class="tab-pane fade" id="pwd-search" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="row mx-0 custom-search">
                                        <div class="col-12"></div>
                                        <div class="col-12"></div>
                                        <div class="col-4 text-center pt-2">
                                            <label for="s-id">아이디</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="text" class="form-control rounded-0" id="s-id" required>
                                            <p id="idSearch" class="form-text text-muted create-massage pt-2">비밀번호 찾기에 필요한 아이디를 입력해주세요</p>    
                                        </div>
                                        <div class="col-12 text-right">
                                            <button class="btn btn-primary rounded-0 custom-btn" onclick="swal('비밀번호', '아이디 입력', 'error')">비밀번호 찾기</button>
                                        </div>
                                    </div>
                                </div>
                              </div>
                            
                        </form>
                    </div>
                </div>
		</div>
	</article>



	<%@ include file="../common/footer.jsp"%>
</body>
</html>