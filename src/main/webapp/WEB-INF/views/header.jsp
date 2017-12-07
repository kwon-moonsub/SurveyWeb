<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>설문조사 솔루션</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/survey.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>

	<!-- graph -->
	<script src="${pageContext.request.contextPath}/resources/js/echarts-all.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/cytoscape.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/visual.js"></script>
	
	<!-- custom js -->	
	<script src="${pageContext.request.contextPath}/resources/js/dnd.js"></script>

	<!-- Datatables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
	
	<!-- JS Tree -->
	<script src="${pageContext.request.contextPath}/resources/js/jstree.min.js"></script>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css"> --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	
	

</head>
<style>
	.dropdown-menu { top:80%; min-width:95px; border-radius:0; padding:0; border:2px solid #ddd; }
	.dropdown-menu li{ border-bottom:2px solid #ddd; }
	.dropdown-menu li:last-child{ border-bottom:0; }
	.dropdown-menu>li>a { text-align:center;}
	
</style>
<body>
	<!-- header -->
	<nav class="navbar bg_blue">
	  <div class="container w1366">	  
	    <div class="collapse navbar-collapse navbar-right">
			<ul class="nav navbar-nav hide">
			  <li ><a>로그인</a></li>
			</ul>      
    	</div><!--/.nav-collapse -->
	    <div class="clearfix"></div>
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/home">form.</a>
	    </div>
	    <div class="collapse navbar-collapse navbar-right"  id="navbar">
	      <ul class="nav navbar-nav">
	        <li menu="home" ><a>홈</a></li>
	        <li menu="makeSurvey"><a>설문 만들기</a></li>
	        <li menu="manageSurvey" ><a>설문 관리</a></li>
	        <li menu="manageOrg" ><a>관계도 관리</a></li>
	        <li menu="help"><a>도움말</a></li>
	        <li menu="login" class="login_btn"><a>로그인</a></li>
	       
			
	      </ul>
	   
	<form method="post" action="/logout">
		<h3>Logout</h3>
		<button type="submit" class="btn">LogOut</button>
	</form>
		 <div class="userInfo pull-right hide dropdown">
		 	<div class="user_name dropdown-toggle" type="button" data-toggle="dropdown">
		 	<div class="name pull-left"></div>
		 	<span class="caret pull-left" style="margin-top:20px;"></span><div class="clearfix"></div></div>
			<ul class="dropdown-menu">
			  <li class="btn_logout"><a>로그아웃</a></li>
			  <li><a href="${pageContext.request.contextPath}/modify">회원정보변경</a></li>
			  <li class="btn_deleteUser"><a>회원탈퇴</a></li>
			</ul>		 	
		 </div>
	    </div><!--/.nav-collapse -->
	  </div>
	</nav>
	
<%-- 	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">로그인</h4>
		      </div>
		      <div class="modal-body">
		      	<div class="" style="width:385px; margin:50px auto 0 auto;">
					<a>이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><input type="text" id="id"><br>
					<a>비밀번호&nbsp;&nbsp;&nbsp;</a><input type="password" id="pw"><br><br>
					<a style="color:#618fca;" href="${pageContext.request.contextPath}/join">회원가입</a>
					<a style="color:#618fca;">&nbsp;/&nbsp;</a>
					<a style="color:#618fca;">비밀번호를 잊어버리셨나요?</a>
		      	</div>
		      </div>
			  	<div class="modal-footer">
			        <button type="button" class="btn btn-default confirm" >확인</button>
			        <button type="button" class="btn btn-default cancel" >취소</button>
				</div>
			</div>
		</div>
	</div> --%>
<!-- 서비스 준비중 -->
	<div class="ready hide">
		<div class="bg_gray">
			<div class="ready_wrap">
				<div class="ready_text text-center">서비스 준비중입니다.</div>
				<div style="height:35px; border-top:3px solid #ddd;"></div>
			</div>
		</div>
	</div>

	
<script>

$(function(){
		header.init();
});
	
var header = {};

header.init = function(){
		
	window.base_url = '${pageContext.request.contextPath}'+'/';
		
	
	$.ajaxSetup({
		cache:false,
		crossDomain:true,
		crossOrigin: true,
 		contentType:"application/json; charset=utf-8;",
  		/* contentType:"application/x-www-form-urlencoded; charset=UTF-8", */
		type:"POST",
		dataType:"json"
	});
	
    jQuery.ajaxSettings.traditional = true; 

    var that = this;
    checkId()
	that.listener();
};

header.listener = function(){
	$("#navbar li").off('click').on('click',function(){
		sessionStorage.removeItem("current_qnno")
		var menu = $(this).attr('menu')
		if( menu=="home" || menu=="help" || menu=="login"){
			location.href="${pageContext.request.contextPath}/"+menu;
		}else{
			if(sessionStorage.length>0){
				location.href="${pageContext.request.contextPath}/"+menu;
				if(menu=="makeSurvey"){
					sessionStorage.removeItem("edit_qnno")
				}
				/* $(".userInfo").removeClass("hide");
				$(".login_btn").addClass("hide"); */
			}else{
				alert("로그인 후 이용가능합니다.");
				location.href="${pageContext.request.contextPath}/login";
			}
			
		}
		
	});

	$('.dropdown-toggle').dropdown()

	$(".btn_logout").off('click').on('click',function(){
		sessionStorage.clear();
		$(".userInfo").addClass('hide');
		$('.login_btn').removeClass('hide');
		alert('로그아웃되었습니다.');
		location.href="${pageContext.request.contextPath}/home";
	});
	
	$(".btn_deleteUser").off('click').on('click',function(){
		
		var mno = sessionStorage.mno;
		
 	 	$.ajax({
		   	url : base_url + "member/"+mno,
		   	data : {},
		   	type : "DELETE",
		   	success : function(res){
		   		console.log("=====click 회원탈퇴=====", res);
		   	},
		   	error : function(err){
		   		 console.log("ERROR!!", err);
		   	}
		});
	});
};

function checkId(){
	var loginId = sessionStorage.getItem("name");
	
	if(loginId == null || loginId == ""){
		$('.userInfo').addClass('hide');
		$(".login_btn").removeClass('hide');
	}else{
		$(".userInfo .user_name .name").append(sessionStorage.name)
		$('.userInfo').removeClass('hide');
		$(".login_btn").addClass('hide');
		
	}
}

</script>