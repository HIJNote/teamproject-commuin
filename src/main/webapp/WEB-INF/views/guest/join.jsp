<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>커뮤인</title>
<link rel=stylesheet href="${path}/resources/css/root.css">
<style>
.custom-btns {
  
  
  color: #fff;
  border-radius: 5px;
  
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
/* 5 */
.btns-5 {
  
  
  
  
  border: none;
  background: rgb(255,27,0);
background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
}
.btns-5:hover {
  color: #f0094a;
  background: transparent;
   box-shadow:none;
}
.btns-5:before,
.btns-5:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #f0094a;
  box-shadow:
   -1px -1px 5px 0px #fff,
   7px 7px 20px 0px #0003,
   4px 4px 5px 0px #0002;
  transition:400ms ease all;
}
.btns-5:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btns-5:hover:before,
.btns-5:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>

	<article class="join-article">
		<div class="container">
			<div class="row">
                    <div class="col-12 offset-lg-1 col-lg-10 mt-5">
                    
                        <form action="/member/userJoin" method="post" class="custom-form px-4">
                            
                            <div class="col-12 text-left pl-0 my-3">
                                <span class="font-weight-bolder py-3 mb-0 custom-span">커뮤인 계정 만들기</span>
                                <p class="text-muted mb-5">커뮤인의 계정을 생성합니다.</p>
                            </div>

                            <!-- 아이디 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="j-email">이메일</label>
                                </div>
    
                                <div class="col-5 col-md-6" id="j-email-div">	
	                                <input type="text" class="form-control rounded-0" id="j-email" name="joinEmail" required>
                                    <p class="text-muted" id="j-email-message">계정 찾기 위한 이메일을 입력해 주세요.</p>
                                </div>
                                
                                 <!-- 이메일 인증 시작 -->
	                             <div class="col-3 col-md-2 pl-0" id="email-btn">
	                             	<button class="custom-btns btns-5 btn rounded-0 btn-block custom-btn px-0" id="e_btn1" type="Button" onclick="time_start(0);">인증</button>
	                             </div>
	                                
	                             <!-- 이메일 인증 끝 -->
                            </div>
                            
                          	<div class="form-group row mb-0" id="email-div">
                          		<div class="col-4"></div>
				            	<div class="col-4 col-md-3" id="emailCheck"></div>
								<div class="col-2 align-self-center" id="ViewTimer"></div>              	
                          	</div>
                            
                            <!-- 아이디 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="j-id">아이디</label>
                                </div>
    
                                <div class="col-8">
                                    <input type="text" class="form-control rounded-0" id="j-id" name="joinId" required>
                                    <p class="text-muted" id="j-id-message">로그인할 때 사용하실 아이디를 입력해 주세요.</p>
                                </div>
                            </div>

                            <!-- 비밀번호 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="j-pwd">비밀번호</label>
                                </div>
    
                                <div class="col-8">
                                    <input type="password" class="form-control rounded-0" id="j-pwd" name="joinPwd" required>
                                    <p class="text-muted">로그인할 때 사용하실 비밀번호를 입력해 주세요.</p>
                                </div>
                            </div>

                            <!-- 비밀번호 확인 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="j-pwdConfirm">비밀번호 확인</label>
                                </div>
    
                                <div class="col-8">
                                    <input type="password" class="form-control rounded-0" id="j-pwdConfirm" required>
                                    <p class="text-muted" id="j-pwdConfirm-message">비밀번호 확인을 입력해 주세요.</p>
                                </div>
                            </div>

                            <!-- 닉네임 확인 -->
                            <div class="form-group row">
                                <div class="col-4 col-form-label">
                                    <label for="j-name">닉네임</label>
                                </div>
    
                                <div class="col-8">
                                    <input type="text" class="form-control rounded-0" id="j-name" name="joinName" required>
                                    <p class="text-muted" id="j-name-message">커뮤인에서 사용하실 닉네임을 입력해 주세요.</p>
                                </div>
                            </div>

                            <!-- 로그인 버튼 -->
                            <div class="form-group row">
                                <div class="col-12 text-right">
                                    <button type="submit" id="joinBtn" disabled class="btn btn-primary ml-3 mt-3 rounded-0 custom-btn">계정 만들기</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
		</div>
	</article>



	<%@ include file="../common/footer.jsp"%>

	<script>
		var checkId = 0;
		var checkEmail = 0;
		var checkPwd = 0;
		var checkName = 0;
		
    	//아이디 실시간 체크
    	$("#j-id").blur(function() {
    		var joinId = $("#j-id").val();
			var joinIdMessage = $("#j-id-message").val(); 
			
    		$.ajax({
    			url:"/member/joinIdCheck",
    			type:"POST",
    			data:{id:joinId},    			
    			success:function(cnt) {
    				
    				if(cnt != 0){
    					$("#j-id").css("background-color", "#FFF0F5");
    					$("#j-id-message").text("중복된 아이디입니다.");
    					checkId = 0;
    				}
    				else{
    					if(joinId == ''){
    						$("#j-id").css("background-color", "WHITE");	
    						$("#j-id-message").text("로그인할 때 사용하실 아이디를 입력해 주세요.");	
    						checkId = 0;
    					}
    					else if(joinId.length < 4 || joinId.length > 12){
    						$("#j-id").css("background-color", "#FFF0F5");
    						$("#j-id-message").text("영문 or 숫자로 4-16글자로 입력해 주세요.");
    						checkId = 0;
    					}
    					else{
    						$("#j-id-message").text("사용 가능한 아이디입니다.");
    						$("#j-id").css("background-color", "#E0FFFF");
    						checkId = 1;
    						joinCheck();
    					}	
    				}
    				
    			},
    		
    			error:function() {
    				swal('에러', 'ajax', 'error');
    			}
    		})
    	})
    	
    	//비밀번호 체크
    	$("#j-pwdConfirm").blur(function() {
    		var pwd = $("#j-pwd").val();
    		var pwdConfirm = $("#j-pwdConfirm").val();
    		
    		if(pwdConfirm == ''){
    			$("#j-pwdConfirm").css("background-color", "WHITE");
    			$("#j-pwdConfirm-message").text("비밀번호 확인을 입력해 주세요.");
    			checkPwd = 0;
    		}
    		else if(pwd == pwdConfirm){
    			$("#j-pwdConfirm").css("background-color", "#E0FFFF");
    			$("#j-pwdConfirm-message").text("비밀번호가 일치합니다.");
    			checkPwd = 1;
				joinCheck();
    		}
    		else{
    			$("#j-pwdConfirm").css("background-color", "#FFF0F5");
    			$("#j-pwdConfirm-message").text("비밀번호가 일치하지 않습니다.");
    			checkPwd = 0;
    		}
    	})
    	
    	//닉네임 실시간 체크
    	$("#j-name").blur(function() {
    		var joinName = $("#j-name").val();
			var joinNameMessage = $("#j-name-message").val(); 
			
    		$.ajax({
    			url:"/member/joinNameCheck",
    			type:"POST",
    			data:{name:joinName},    			
    			success:function(cnt) {
    				
    				if(cnt != 0){
    					$("#j-name").css("background-color", "#FFF0F5");
    					$("#j-name-message").text("중복된 닉네임입니다.");
    					checkName = 0;
    				}
    				else{
    					if(joinName == ''){
    						$("#j-name").css("background-color", "WHITE");	
    						$("#j-name-message").text("커뮤인에서 사용하실 닉네임을 입력해 주세요.");	
    						checkName = 0;
    					}
    					else{
    						$("#j-name").css("background-color", "#E0FFFF");
    						$("#j-name-message").text("사용 가능한 닉네임입니다.");
    						checkName = 1;
    						joinCheck();
    					}	
    				}
    				
    			},
    		
    			error:function() {
    				swal('에러', 'ajax', 'error');
    			}
    		})
    	})
    	
    	//이메일 실시간 체크
    	$("#j-email").blur(function() {
    		var joinEmail = $("#j-email").val();
			var joinEmailMessage = $("#j-email-message").val(); 
			
    		$.ajax({
    			url:"/member/joinEmailCheck",
    			type:"POST",
    			data:{email:joinEmail},    			
    			success:function(cnt) {
    				
    				if(cnt != 0){
    					$("#j-email").css("background-color", "#FFF0F5");
    					$("#j-email-message").text("중복된 이메일입니다.");
    					checkEmail = 0;
    				}
    				else{
    					if(joinEmail == ''){
    						$("#j-email").css("background-color", "WHITE");	
    						$("#j-email-message").text("계정 찾기 위한 이메일을 입력해 주세요.");
    						checkEmail = 0;
    					}
    					else{
    						var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    						if(joinEmail.match(regExp) != null){
    							$("#j-email").css("background-color", "#E0FFFF");
    							$("#j-email-message").text("사용 가능한 이메일입니다.");
    							checkEmail = 1;
        						joinCheck();
    						}
    						else{
    							$("#j-email").css("background-color", "#FFF0F5");
    							$("#j-email-message").text("이메일을 다시 입력해주세요.");
    							checkEmail = 0;
    						}
    					}	
    				}
    				
    			},
    		
    			error:function() {
    				swal('에러', 'ajax', 'error');
    			}
    		})
    	})
    	
    	var SetTime = 299;      // 최초 설정 시간(기본 : 초)
    	var btn = 0; // 0 : 인증, 1 : 인증확인 버튼
    	var emali = 0 // 이메일 인증 성공시 1 아니면 0
    	var tid = null; // 타이머 설정
    	var server_key; // 서버에서 보낸 키
    	var user_key; // 사용자가 입력한 키
    	
    	function msg_time() {   // 1초씩 카운트      
	        m = Math.floor(SetTime / 60) + ":" + (SetTime % 60); // 남은 시간 계산         
	        var msg = "<font color='red'>" + m + "</font>";  
	        document.all.ViewTimer.innerHTML = msg;     // div 영역에 보여줌                  
	        SetTime--;                  // 1초씩 감소
	        if (SetTime < 0) {          // 시간이 종료 되었으면..        
	            clearInterval(tid);     // 타이머 해제
	            emali = 0;
	            SetTime = 299;
	            alert("제한 시간 초과 ! \n페이지 새로고침 합니다.");
	            history.go(0);
	        }       
	    }
    	
	    function time_start(num) {
	    	if(checkEmail != 1) {
	    		alert("이메일 입력");
	    	}else {
	    		if(num == 0) {
	    			alert("해당 이메일로 메일을 발송했습니다 \n 확인 후 인증 번호를 입력해주세요.");
	    			var joinEmail = $("#j-email").val();
			    	
	    			$("#email-div").addClass("mb-5");
	    			$("#emailCheck").append('<input type="text" class="form-control rounded-0" id="e_Auth">');
			    	$("#e_btn1").remove();
			    	$("#email-btn").append('<button class="custom-btns btns-5 btn px-0 rounded-0 btn-block custom-btn" id="e_btn2" type="Button" onclick="e_Auth_Check();">인증확인</button>');
			    	tid = setInterval('msg_time()',1000);			
	    			
			    	$.ajax({
		    			url:"/member/emailCheck",
		    			type:"POST",
		    			data:{u_email:joinEmail},    			
		    			success:function(data) {
		    				if(data != null) {
		    					server_key = data;
		    				}
		    			},
		    		
		    			error:function() {
		    				swal('에러', 'ajax', 'error');
		    			}
		    		});
		    	}
	    	}
		}
	    
	    function e_Auth_Check() {
	    	user_key = $("#e_Auth").val();
	    	
	    	if(user_key == server_key) {
	    		$("#j-email").prop("readonly", true);
	    		$("#e_Auth").prop("disabled", true);
	    		$("#e_btn2").prop("disabled", true);
	    		clearInterval(tid);     // 타이머 해제
	    		alert("성공");
	    	}else {
	    		if(user_key == ''){
	    			swal('공백', '공백입니다.', 'error');
	    		} else if(user_key.length > 6) {
	    			swal('길이', '인증번호를 확인해주세요.', 'error');
	    		} else {
	    			swal('실패', '잘못입력 or 대소문자 확인', 'error');
	    		}
	    	}
	    }
	    
    	function joinCheck() {
    		if(checkId != 1 || checkEmail != 1 || checkPwd != 1 || checkName != 1){
    			$("#joinBtn").prop("disabled", true);
    		}
    		else{
    			$("#joinBtn").prop("disabled", false);
    		}
    	}
    	
    </script>

</body>
</html>