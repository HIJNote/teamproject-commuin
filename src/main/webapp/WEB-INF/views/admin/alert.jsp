<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 메세지</title>
</head>
<body>
	<c:choose>
		<c:when test = "${cnt eq 1}">
			<script type="text/javascript">
				alert("일반 회원으로 전환 성공!!");
				window.location.href="userList";
			</script>
		</c:when>
		<c:when test = "${cnt eq 3}">
			<script type="text/javascript">
				alert("정지 회원으로 전환 성공!!");
				window.location.href="userList";
			</script>
		</c:when>
		<c:when test = "${cnt eq 4}">
			<script type="text/javascript">
				alert("숨기기 글로 전환 성공!!");
				window.location.href="board";
			</script>
		</c:when>
		<c:when test = "${cnt eq 5}">
			<script type="text/javascript">
				alert("일반 글로 전환 성공!!");
				window.location.href="board";
			</script>
		</c:when>
		<c:when test = "${cnt eq 6}">
			<script type="text/javascript">
				alert("공지 게시글 등록 성공!!");
				window.location.href="board";
			</script>
		</c:when>
		<c:when test = "${cnt eq 7}">
			<script type="text/javascript">
				alert("메인 채널 승급 성공!!");
				window.location.href="channelList";
			</script>
		</c:when>
		<c:when test = "${cnt eq 8}">
			<script type="text/javascript">
				alert("메인 채널 하락 성공!!");
				window.location.href="channelList";
			</script>
		</c:when>
		<c:when test = "${cnt eq 10}">
			<script type="text/javascript">
				alert("정지 회원입니다.!!");
				window.location.href="userList";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("버그 발생! 전 페이지로 이동!");
				window.history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>