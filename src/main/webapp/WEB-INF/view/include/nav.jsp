<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$(document).ready(function(e){
		$('#logout').on('click', function(e){
			// submit, a 태그는 클릭 + 이동 -> 두번째 동작을 비활성화한다
			e.preventDefault();
			// logout을 클릭하면 from을 만들어서 붙인 다음 전송
			
			// js로 폼을 생성하면 메모리에 존재 -> submit 불가 -> html에 폼을 붙인 다음에 submit
			const html = `
				<form action="/member/logout" method="post">
				</form>
			`;
			$(html).appendTo($('body')).submit();
			// const a = 부모.append(자식) -> 결과는 부모
			// const a = 자식.append(부모) -> 결과는 자식
			
			// $(선택자): 요소를 선택 ex) $('p')
			// $(html): 요소를 생성 ex> $('<p>')
		});
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/">ICIA</a>
			</div>
			<ul class="navbar-nav" id="menu_parent">
				<sec:authorize access="isAnonymous()">
					<!-- 비로그인인 경우 나타난다 -->
					<li class="nav-item">
						<a href="/member/join" class="nav-link">회원가입</a>
					</li>
					<li class="nav-item">
						<a href="/member/find" class="nav-link">아이디/비번찾기</a>
					</li>
					<li class="nav-item">
						<a href="/member/login" class="nav-link">로그인</a>
					</li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<a href="/board/write" class="nav-link">글쓰기</a>
					</li>
					<li class="nav-item">
						<a href="/member/read" class="nav-link">내정보</a>
					</li>
					<li class="nav-item">
						<a href="/member/logout" class="nav-link">로그아웃</a>
					</li>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item">
						<a href="#" class="nav-link">admin</a>
					</li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</body>
</html>



