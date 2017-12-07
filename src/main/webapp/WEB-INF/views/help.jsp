<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
</style>
<div class="contents_wrap">
	<div class="w970">
		<div class="page_title text-center">도움말</div>
		<ul class="nav nav-tabs nav-justified help_tab center-block">
			<li class="active"><a data-toggle="tab" href="#notice">공지사항</a></li>
			<li class=""><a data-toggle="tab" href="#function">기능설명</a></li>
			<li class=""><a data-toggle="tab" href="#price">가격</a></li>
			<li class=""><a data-toggle="tab" href="#access">이용약관</a></li>
			<li class=""><a data-toggle="tab" href="#personal">개인정보처리방침</a></li>
		</ul>
		<!-- tab contents -->
		<div class="tab-content help_tabContents">
		  <div id="notice" class="tab-pane fade in active">
		    <h3>공지사항</h3>
		    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
		  </div>
		  <div id="function" class="tab-pane fade">
		    <h3>기능설명</h3>
		    <div class="col-md-10">
		    </div>
		    <div class="col-md-2">
		    	<ul class="nav nav-stacked">
		    		<li><a>가입하기</a></li>
		    		<li><a>설문만들기</a></li>
		    		<li><a>설문공유하기</a></li>
		    		<li><a>결과보기</a></li>
		    		
		    	</ul>
		    </div>
		  </div>
		  <div id="price" class="tab-pane fade">
		    <h3>가격</h3>
		    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
		  </div>
		  <div id="access" class="tab-pane fade">
		    <h3>이용약관</h3>
		    <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
		  </div>
		  <div id="personal" class="tab-pane fade">
		    <h3>개인정보처리방침</h3>
		    <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
		  </div>
		</div>	
		<!-- tab contents end -->				
				
	</div>
</div>

<jsp:include page="/footer"  flush="false" />
<script>
$(function(){
	help.init();
});

var help = {};
help.init = function(){
	$('.ready').removeClass('hide');
};
</script>
