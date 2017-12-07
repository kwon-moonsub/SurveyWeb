<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
</style>
<!-- contents -->
<div class="">
	<div class="bg_img col-xs-12" style="padding:0; background-image:url(${pageContext.request.contextPath}/resources/images/img_main.png)" >
		<%-- <img src="${pageContext.request.contextPath}/resources/images/img_main.png" class="img-responsive" style="height:635px; width:100%; "> --%>
		<div class="img_title text-center">
			<p>쉬운 설문조사, 무료로 사용해 보세요</p>
		</div>
	</div>
	<div class="info1 col-xs-12">
		<h1 class="text-center">주요 기능들</h1>
		<div class="col-md-4 col-xs-12 text-center">
			<img src="${pageContext.request.contextPath}/resources/images/ic_Freeform.png" style="width:125px; height:125px;">
			<p class="info_title">Free Form</p>
			<p class="info_subtitle">모든 설문을 무료로 이용하세요</p>
		</div>
		<div class="col-md-4 col-xs-12 text-center">
			<img src="${pageContext.request.contextPath}/resources/images/ic_Freeform.png" style="width:125px; height:125px;">
			<p class="info_title">Various Chart</p>
			<p class="info_subtitle">설문 결과를 다양한 데이터 차트로 만나보세요.</p>
		</div>
		<div class="col-md-4 col-xs-12 text-center">
			<img src="${pageContext.request.contextPath}/resources/images/ic_datadownload.png" style="width:125px; height:125px;">
			<p class="info_title">Free Form</p>
			<p class="info_subtitle">결과 데이터를 다운로드 받아보세요.</p>
		</div>
	</div>
	<div class="info2 col-xs-12 bg_blue">
		<div class="col-md-4 text-center col-xs-12" style="font-size:20px; font-weight:bold; padding:40px 0 0 88px;">form이 처음이세요?</div>
		<!-- <div class="col-md-2">step1</div> -->
		<div class="col-md-1 col-xs-12">
			<img src="${pageContext.request.contextPath}/resources/images/ic_step1.png" style="">
			<div class="step_title">step1</div>
		</div>
		<div class="col-md-1 xs-hidden">
			<div class="line" style="border-top:9px dotted rgba(255,255,255,0.5); width:50px;  margin: 50px 0 0 30px;"></div>
		</div>
		<div class="col-md-1 col-xs-12">
			<img src="${pageContext.request.contextPath}/resources/images/ic_step2.png" style="">
			<div class="step_title">step2</div>
		</div>
		<div class="col-md-1 xs-hidden">
			<div class="line" style="border-top:9px dotted rgba(255,255,255,0.5); width:50px;  margin: 50px 0 0 30px;"></div>
		</div>
		<div class="col-md-1 col-xs-12">
			<img src="${pageContext.request.contextPath}/resources/images/ic_step3.png" style="">
			<div class="step_title">step3</div>
		</div>
		<div class="col-md-1 xs-hidden">
			<div class="line" style="border-top:9px dotted rgba(255,255,255,0.5); width:50px;  margin: 50px 0 0 30px;"></div>
		</div>
		<div class="col-md-1 col-xs-12">
			<img src="${pageContext.request.contextPath}/resources/images/ic_step4.png" style="">
			<div class="step_title">step4</div>
		</div>
<%-- 		<div class="col-md-2 col-xs-12">
			<img src="${pageContext.request.contextPath}/resources/images/ic_step1.png" style="">
			<div class="step_title">step1</div>
		</div> --%>
		<!-- <div class="col-md-1" style="border-top:10px dotted #ddd;"></div> -->
	</div>
	<div class="info3 col-xs-12">
		<div class="col-md-6">
			<h1>지금 설문을 만들어 보세요</h1>
			<h3>설문조사를 만들 준비가 되셨나요? form을 사용하여 쉽게 만들어보세요</h3>
			<button class="btn btn_aqua btn_make">설문지 만들기</button>
		</div>
		<div class="col-md-6">
			<img src="${pageContext.request.contextPath}/resources/images/img_main_2.png" style="width:524px; height:298px">
		</div>
	</div>
	<div class="clearfix"></div>
</div>

<jsp:include page="/footer"  flush="false" />
<script>
$(function(){
	
});

var home = {};
home.init = function(){
	var that = this;
	
	that.listener();	
};

home.listener = function(){
	$(".btn_make").off('click').on('click',function(){
		
		location.href="${pageContext.request.contextPath}/makeSurvey";			
		/* if(sessionStorage.getItem("id")==""){
			
		}else{
			location.href="${pageContext.request.contextPath}/makeSurvey";			
		}
 */	});
};
</script>