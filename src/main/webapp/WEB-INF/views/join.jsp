<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
	.page_title { margin-bottom:80px;}
</style>
<div class="contents_wrap" id="join">
	<div class="w970">
		<div class="page_title text-center">회원가입</div>
		
		<div class="userData">
			<label for="user_name" class="pull-left">이름</label>
			<div class="border pull-left">
				<input type="text" id="user_name"><br>
			</div>
			<div class='clearfix'></div>
			<label for="email" class="pull-left">이메일</label>
			<div class="pull-left border">
				<input type="text" id="email"><button class="btn btn_default btn_dup" style="width:80px;">중복확인</button><br>
			</div>	
			<div class='clearfix'></div>	
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
			<button class="btn btn_white btn_confirm">가입하기</button>
			<button class="btn btn_white btn_cancel">취소</button>
		</div>
	</div>
</div>
<jsp:include page="/footer"  flush="false" />
<script>
$(function(){
	join.init();
});

var join = {};
join.init = function(){
	var that = this;
	that.duplicate = false;
	that.listener();
};

join.listener = function(){
	var that = this;
	
	$('.btn_confirm').off('click').on('click',function(){
		if($("input").val() == ""){
			alert("정보를 입력하세요.")
		}else{
			if( $("#pass").val() == $("#confirm").val()){
				that.insertUser();
			}else{
				alert("비밀번호 확인을 다시 입력하세요.");
			}
		}
	});
	
	$('.btn_cancel').off('click').on('click',function(){
		$('input[type=text], input[type=password]').val('');
		
	});
	
	$(".btn_dup").off("click").on('click',function(){
		if($("#email").val()==""){
			alert("이메일을 입력하세요.")
		}else{
			that.checkDuplicate();
		}
		
	})
};

join.insertUser = function(){
	
	var ajaxData = {};
	ajaxData.name = $("#user_name").val();
	ajaxData.email = $("#email").val();
	ajaxData.mpw = $("#pass").val();
		
	
	console.log("ajaxData:::::",ajaxData);
	
	$.ajax({
    	url : base_url + "member/",
    	data : JSON.stringify(ajaxData),
    	type : "POST",
    	dataType:'json',
    	success : function(res){
    		console.log("====== insertUser =====",res)
    		if(res.msg=="success"){
    			alert("가입이 완료되었습니다.");
				setTimeout(login( $("#email").val(), $("#pass").val() ), 3000);
    		}
    	},
    	error : function(err){
    		 console.log("ERROR!!", err);
    	}
    });
}
join.checkDuplicate = function(){

	var ajaxData = { email:$("#email").val() }	
	console.log("dupliacation ajaxData",ajaxData)
	$.ajax({
    	url : base_url + "member/check/",
    	data : JSON.stringify(ajaxData),
    	type : "post",
    	dataType : "json",
    	success : function(res){
    		console.log("====== checkDuplicate =====",res)
    		if(res.msg == false){
    			$("#email").css("border","1px solid #ddd");
    		 	alert("사용할 수 있는 아이디입니다.")
    		}else{
    			alert("사용할수 없는 아이디 입니다.")
    			$("#email").val("").css("border","1px solid red");
    		}
      	},
    	error : function(err){
    		 console.log("ERROR!!", err);
    	}
    });
		
}

</script>