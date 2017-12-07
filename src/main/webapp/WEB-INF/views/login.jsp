<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="/header"  flush="false" />
<style>
	.page_title { margin-bottom:80px;}
</style>
<div class="contents_wrap" id="login">
	<div class="w970">
	
		<div></div>
		
        <sec:authorize access="hasRole('ROLE_MANAGER')">
			<p>principal : <sec:authentication property="principal.mno"/></p>
		</sec:authorize>
		
		
		<sec:authorize url="/admin" var="t">${t }</sec:authorize>​
		<sec:authorize access="hasRole('ROLE_MANAGER')" var="u">Role : ${u }</sec:authorize>
		
		
		<div class="page_title text-center">로그인</div>
		<form method="post" action="/login">
		<div class="userData">
			<div class='clearfix'></div>
			<label for="email" class="pull-left">이메일</label>
			<div class="pull-left border">
				<input type="text" id="username" name="username"><br>
			</div>	
			<div class='clearfix'></div>	
			<label for="pw" class="pull-left">비밀번호</label>
			<div class="border pull-left">
				<input type="password" id="password" name="password"><br>
			</div>
			<div class="clearfix"></div>
			<a style="color:#618fca;" href="${pageContext.request.contextPath}/join">회원가입</a>
			<a style="color:#618fca;">&nbsp;/&nbsp;</a>
			<a style="color:#618fca;">비밀번호를 잊어버리셨나요?</a>		
		</div>
		<div class="btn_wrap text-center" style="margin:45px 0 70px 0;">
			<button class="btn btn_white btn_confirm">로그인</button>
			<button class="btn btn_white btn_cancel">취소</button>
		</div>
		</form>
	</div>
</div>

			
			
<jsp:include page="/footer"  flush="false" />
<script>
<c:if test="${param.error != null}">
alert("아이디와 비밀번호가 잘못되었습니다.");
</c:if>
<c:if test="${param.logout != null}">
alert("로그아웃되었습니다");
</c:if>
 
</script>