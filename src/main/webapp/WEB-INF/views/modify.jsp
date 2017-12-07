<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
	.page_title { margin-bottom:80px;}
</style>
<div class="contents_wrap" id="modify">
	<div class="w970">
		<div class="page_title text-center">회원정보변경</div>
		
		<div class="userData">
			<label for="user_name" class="pull-left">이름</label>
			<div class="border pull-left">
				<input type="text" id="user_name" readonly="readonly"><br>
			</div>
			<div class="clearfix"></div>
			<label for="email" class="pull-left">이메일</label>
			<div class="border pull-left">
				<input type="text" id="email"  readonly="readonly"><br>
			</div>
			<div class="clearfix"></div>
			<label for="pw" class="pull-left">비밀번호</label>
			<div class="border pull-left">
					<input type="password" id="pass"><br>
			</div>
			<div class="clearfix"></div>
			<label for="confirm" class="pull-left">비밀번호 확인</label>
			<div class="border pull-left">
				<input type="password" id="confirm"><br>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="btn_wrap text-center" style="margin:45px 0 70px 0;">
			<button class="btn btn_white btn_confirm">수정하기</button>
			<button class="btn btn_white btn_cancel">취소</button>
		</div>
				
	</div>
</div>
<jsp:include page="/footer"  flush="false" />

<script>
$(function(){
	modify.init();
});

var modify = {};
modify.init = function(){
	var that = this;
	$("#user_name").val( $(".user_name .name").text() );
	$("#email").val( sessionStorage.email );
	that.listener();
	
};
modify.listener = function(){
	var that = this;
	
	$('.btn_confirm').off('click').on('click',function(){
		if( $("#pass").val() == $("#confirm").val()){
			that.updateUser();
		}else{
			alert("비밀번호 확인을 다시 입력하세요.");
		}
	});
	
};
modify.updateUser = function(){
	var ajaxData = {};
	ajaxData.mno = 101;
	ajaxData.name =$("#name").val();
	ajaxData.email = $("#email").val();
	ajaxData.mpw = $("#pass").val();
		
	$.ajax({
    	url : base_url + "member/modify",
    	data : ajaxData,
    	type : "post",
    	success : function(res){
    		console.log('res',res)
    	},
    	error : function(err){
    		 console.log("ERROR!!", err);
    	}
    });
	
	
	
	
};

</script>
