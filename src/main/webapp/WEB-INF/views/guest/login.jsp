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


	<article class="login-article">
		<div class="container">
			<div class="row">
                    <div class="col-12 offset-lg-1 col-lg-10 mt-5">
                    
                        <form action="/member/success" method="post" class="custom-form px-4">
                        
                            <div class="col-12 text-left pl-0 my-3">
                                <span class="font-weight-bolder py-3 custom-span">커뮤인 로그인</span>
                            </div>
                            
                            <!-- 아이디 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="l-id">아이디</label>
                                </div>
    
                                <div class="col-8">
                                    <input type="text" class="form-control rounded-0" name="l-id" id="l-id" required>
                                </div>
                            </div>

                            <!-- 비밀번호 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="l-pwd">비밀번호</label>
                                </div>
    
                                <div class="col-8">
                                    <input type="password" class="form-control rounded-0" name="l-pwd" id="l-pwd" required>
                                </div>
                            </div>

                            <!-- 로그인 버튼 -->
                            <c:if test = "${msg == false }">
    							<script type="text/javascript">
    								swal('로그인 실패', '아이디 or 비밀번호를 확인해주세요', 'error');
    							</script>
    						</c:if>
                            <div class="form-group row">
                                <div class="col-12 text-right">
                                    <a href="/member/search" class="custom-a">아아디/비밀번호 찾기</a>
                                    <button type="submit" class="btn btn-primary ml-3 rounded-0 custom-btn">로그인</button>
                                </div>
                            </div>

                        </form>
                        
                    </div>
                </div>
	</article>


	<%@ include file="../common/footer.jsp"%>
</body>
</html>