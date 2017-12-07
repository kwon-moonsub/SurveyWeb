<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
	.nav-pills>li>a { border-radius:0; }
	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {  background-color:#d8e4f1; color:#000; }
	.nav-pills>li+li { margin-left:0; }
</style>
<div class="contents_wrap makeSurvey">
	<div class="w970">
		<div class="page_title text-center">설문 만들기</div>
		
		<div class="step_wrap">
			<div class="step_contents">
				<div class="line pull-left" type="step1"></div>
				<div class="line pull-left" type="step2"></div>
				<div class="clearfix"></div>
				<ul class="nav nav-tabs" style="border:0;">
					<li role="presentation" class="active">
						<a href="#step1" data-toggle="tab" aria-controls="step1" role="tab">
							<div class="circle active text-center">1</div>
							<p>설문 정보 등록</p>
						</a>
					</li>
					<li role="presentation" class="disabled" style="left:58px;">
						<a href="#step2" data-toggle="tab" aria-controls="step2" role="tab">
							<div class="circle text-center">2</div>
							<p>설문 제작</p>
						</a>
					</li>
					<li role="presentation" class="disabled" style="left:125px;">
						<a href="#step3" data-toggle="tab" aria-controls="step2" role="tab">
							<div class="circle text-center">3</div>
							<p>설문 게시</p>
						</a>
					</li>
				</ul>
			</div>
			
			<div class="tab-content">
				<div id="step1" class="tab-pane fade in active" role="tabpanel">
					<div class="page_subtitle text-center">설문 제목, 설문 날짜, 설문 개요를 입력하고 저장을 누르세요.</div>
					<div class="panel panel-default">
						<div class="panel-heading text-center">설문 등록 필수 항목</div>
						<div class="panel-body" style="">
							<div class="survey_data">
								<p>설문제목</p>
								<input type="text" id="survey_name">
								<p>조사기간</p>
								<input type="text" id="start_date"><a style="margin:0 10px;">~</a><input type="text" id="end_date">
								<p>비밀번호</p>
								<input type="password" id="survey_pw">
								<p>비밀번호 확인</p>
								<input type="password" id="survey_pwConfirm">
							</div>
						</div>
					</div>				
					<div class="panel panel-default">
						<div class="panel-heading text-center">설문 등록 선택 항목</div>
						<div class="panel-body" style="">
							<div class="survey_data">
								<p>설문개요</p>
								<input type="text" id="survey_info">
							</div>
						</div>
					</div>
					<div class="btn_wrap" style="margin:50px 0;">
						<div class="text-center" style="padding-left:400px;">
							<!-- <button class="btn btn_white pull-left" style="margin-right:20px;">Previous</button> -->
							<button type="button" class="btn btn_white pull-left next-step disabled" >Next</button>
						</div>
						<button type="button" class="btn btn_blue active pull-right btn_save">저장</button>
						<div class="clearfix"></div>
						
					</div>									
				
				</div>
				
				<div id="step2" class="tab-pane fade" role="tabpanel" >
					<div class="page_subtitle text-center">아래 화면에서 설문을 제작해보세요.</div>
					<!-- 편집메뉴 -->
					<div class="edit_menu pull-left">
						<div class="edit_wrap">
							<div class="tab_title">설문편집</div>
							<ul class="nav nav-pills">
								<li class="text-center active" style="width:114px; border-right:2px solid #ddd;"><a class="text-center" data-toggle="tab" href="#ques">설문항목</a></li>
								<li class="text-center" style="width:96px; "><a data-toggle="tab" href="#style" >속성</a></li>
							</ul>
							<div class="tab-content">
								<!-- 설문항목 -->
								<div id="ques" class="tab-pane fade text-center active in">
									<div class="ques_type" type="obj">객관식</div>
									<div class="ques_type" type="sbj">주관식</div>
									<div class="ques_type" type="rel_obj">관계도 객관식</div>
									<div class="ques_type" type="rel_sbj">관계도 주관식</div>
								</div>
								<!-- 스타일편집 -->
								<div id="style" class="tab-pane fade">
									<div class="style_wrap">
										<div class="tab_contents_title"style="margin-top:16px;">텍스트 스타일</div>
										<div class="text_style_wrap">
											<div class="style_item pull-left" type="bold" style="background-image:url(${pageContext.request.contextPath}/resources/images/text_style_bold.png)"></div>
											<div class="style_item pull-left" type="italic" style="background-image:url(${pageContext.request.contextPath}/resources/images/text_style_italic.png)"></div>
											<div class="style_item pull-left" type="underline" style="background-image:url(${pageContext.request.contextPath}/resources/images/text_style_underline.png)"></div>
											<div class="clearfix"></div>
										</div>
										<div class="tab_contents_title">질문 입력</div>
										<textarea></textarea>
										<div class="tab_contents_title" style="margin-bottom:0">보기 입력</div>
										<div class="option_wrap">
											<div class="btn_plus pull-left"></div>
											<div class="btn_minus pull-left"></div>
											<div class="clearfix"></div>
										</div>
										<div class="object_items">
											<div class="object_item_wrap">
												<input class="item pull-left" type="text">
												<input class="weight pull-left" type="number">
												<div class="clearfix"></div>
											</div>											
											<div class="object_item_wrap">
												<input class="item pull-left" type="text">
												<input class="weight pull-left" type="number">
												<div class="clearfix"></div>
											</div>											
											<div class="object_item_wrap">
												<input class="item pull-left" type="text">
												<input class="weight pull-left" type="number">
												<div class="clearfix"></div>
											</div>											
											<div class="object_item_wrap text-">
												<input class="item pull-left" type="text">
												<input class="weight pull-left" type="number">
												<div class="clearfix"></div>
											</div>											
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="org_wrap">
							<div class="tab_title">관계도</div>
							<button class="btn org_btn" type="button">관계도 불러오기</button><br><br>
							
							<p class="text-center">선택된 관계도</p>
							<p class="org_name text-center">:</p>
							
						</div>
					</div>
					<!-- 미리보기 -->
					<div class="preview pull-left"></div>
					<div class="clearfix"></div>
					<div class="btn_wrap" style="margin:50px 0;">
						<div class="text-center" style="padding-left:400px;">
							<button type="button" class="btn btn_white pull-left prev-step" style="margin-right:20px;">Previous</button>
							<button type="button" class="btn btn_white pull-left next-step disabled">Next</button>
						</div>
						<button type="button" class="btn btn_blue active pull-right btn_save">저장</button>
						<div class="clearfix"></div>
						
					</div>									
				</div>
				<div id="step3" class="tab-pane fade" role="tabpanel" >
					<div class="page_subtitle text-center">URL을 통하여 설문조사를 시작해보세요.</div>
					<div class="url_wrap">
						<a>설문URL</a><input type="text" readonly="readonly">
					</div>
					<div class="btn_wrap" style="margin:50px 0;">
						<div class="text-center" style="padding-left:400px;">
							<button type="button" class="btn btn_white pull-left prev-step" style="margin-right:20px;">Previous</button>
						</div>
						<button type="button" class="btn btn_blue active pull-right btn_save">게시</button>
						<div class="clearfix"></div>
						
					</div>									
				</div>
			</div>
		</div>
		
	</div>
</div>

<div id="org_popup" class="hide">
	<div class="popup_title">
	관계도 목록<button type="button" class="close">&times;</button>
	</div>
	<div class="popup_body text-center">
		<p>관계도 이름</p>
		<div class="org_list"></div>
	</div>
	<div class="popup_footer">
		<button class="btn btn-default pull-left btn_select" style="margin-left:100px; " >선택</button>
		<button class="btn btn-default pull-left btn_make" style="margin-left:10px; ">관계도 만들기</button>
		<div class="clearfix"></div>
	</div>
</div>
<jsp:include page="/footer"  flush="false" />

<script>
$(function(){
	makeSurvey.init();	
});

var makeSurvey = {}
makeSurvey.init = function(){
	var that = this;
	that.setPage(); 
	/* that.listener(); */
};
makeSurvey.setPage = function(){
	var that = this;
	
	//설문편집
	if(sessionStorage.current_qnno != null){
		
		var mno = sessionStorage.mno;
		$.ajax({
		 	url : base_url + "questionnaire/"+sessionStorage.current_qnno,
		 	data : {},
		 	type : "get",
		 	dataType:"json",
		 	success : function(res){
		 		console.log("=====setPage=====", res);
 				$("#survey_name").val(res.subject);
 				
 				if(res.stdate[1] < 10){
 					if(res.stdate[2]<10){
		 				$("#start_date").val(res.stdate[0]+"-0"+res.stdate[1]+"-0"+res.stdate[2]);
 					}else{
		 				$("#start_date").val(res.stdate[0]+"-0"+res.stdate[1]+"-"+res.stdate[2]);
 					}
 				}else{
 					if(res.stdate[2]<10){
		 				$("#start_date").val(res.stdate[0]+"-"+res.stdate[1]+"-0"+res.stdate[2]);
 					}else{
		 				$("#start_date").val(res.stdate[0]+"-"+res.stdate[1]+"-"+res.stdate[2]);
 					}
 				}
 				
 				if(res.endate[1] < 10){
 					if(res.endate[2] < 10){
		 				$("#end_date").val(res.endate[0]+"-0"+res.endate[1]+"-0"+res.endate[2]);
 					}else{
		 				$("#end_date").val(res.endate[0]+"-0"+res.endate[1]+"-"+res.endate[2]);
 					}
 				}else{
 					if(res.endate[2]<10){
		 				$("#end_date").val(res.endate[0]+"-"+res.endate[1]+"-0"+res.endate[2]);
 						
 					}else{
		 				$("#end_date").val(res.endate[0]+"-"+res.endate[1]+"-"+res.endate[2]);
 					}
 				}
 				$("#survey_pw").val(res.qpw);
 				$("#survey_pwConfirm").val(res.qpw);
 				if(res.overview != null){
 					$("#survey_info").val(res.overview)
 				}
 				if(res.relationDiagram !=null){
	 				$(".org_wrap .org_name").append(res.relationDiagram.name+"")
	 				$(".org_wrap .org_name").attr('rdno',res.relationDiagram.rdno)
 				}
 				that.setPreview(res.questions);
				sessionStorage.current_qnno = res.qnno;
				$(".line").css('border-color','#94bcff');
				$(".nav-tabs li, .next-step").removeClass('disabled')
				$(".nav-tabs li").children().children().addClass('active')
				$(".url_wrap input").val("http://localhost:8080/answer/"+res.url)
		 	},
		 	error : function(err){
		 		 console.log("ERROR!!", err);
		 	}
		 });
	}
	//설문만들기
	else{
		that.setPreview(null);
	}
	
};
/* init end */
makeSurvey.listener = function(){
	var that = this;
	
	//질문 삭제
	$(".question_wrap .close").on('click',function(){
		$(this).parent().parent().remove();
	})

	//텍스트 스타일
	$(".style_item[type=bold]").on('click',function(){
		if(that.edit_target.hasClass('text_bold')){
			that.edit_target.removeClass('text_bold')
		}else{
			that.edit_target.addClass('text_bold')
		}
	});
	
	$(".style_item[type=italic]").on('click',function(){
		if(that.edit_target.hasClass('text_italic')){
			that.edit_target.removeClass('text_italic')
		}else{
			that.edit_target.addClass('text_italic')
		}
	});
	
	$(".style_item[type=underline]").on('click',function(){
		if(that.edit_target.hasClass('text_underline')){
			that.edit_target.removeClass('text_underline')
		}else{
			that.edit_target.addClass('text_underline')
		}
	});
	
	/* 탭이동 버튼 */
     $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
        var $target = $(e.target);
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

/*     $(".next-step").click(function (e) {
        var $active = $('.nav-tabs li.active');
        $active.next().removeClass('disabled');
        $active.next().children().children().addClass("active")
        nextTab($active);
    });
    $(".prev-step").click(function (e) {
        var $active = $('.nav-tabs li.active');
        prevTab($active);
    }); */
	/* 탭이동 버튼 끝*/

	/* step1 datepicker */
	$("#start_date").datepicker({ dateFormat: 'yy-mm-dd' });
	$("#end_date").datepicker({ dateFormat: 'yy-mm-dd' });
	
	/* step1 저장 */
	$("#step1 .btn_save").off('click').on('click',function(){
		if( 
				$("#survey_name").val() == "" ||
				$("#start_date").val() == "" ||
				$("#end_date").val() == "" ||
				$("#survey_pw").val() == "" ||
				$("#survey_pwConfirm").val() == ""
		){
			alert("설문정보를 입력해주세요.")
		}else{
			if( $("#survey_pw").val() != $("#survey_pwConfirm").val() ){
				alert("비밀번호를 확인해주세요.")
			}else{
				if(sessionStorage.current_qnno != null){
					that.procQuestionData();
				}else{
					that.insertSurvey();
					$(".line[type=step1]").css('border-color','#94bcff');
				}
			}
		}
	});
	
	/* step2 관계도 불러오기 */
	$(".org_btn").off('click').on('click',function(e){
		that.getOrgList();
		$('#org_popup').css({left:e.pageX+20,top:e.pageY-30})
		$('#org_popup').removeClass('hide')
		
	});
	//체크박스 선택 후 대시보드 로딩
	$('input[type=checkbox]').on('change',function(){
		var size = $('.table_wrap input[type=checkbox]').length;
		
		if(size>1){
			$('input[type=checkbox]').prop('checked',false);
			$(this).prop('checked',true);
		}
	});

	/* 관계도 선택 */
	$('#org_popup .btn_select').off('click').on('click',function(){
		var selected_org = "";
		
		selected_org=$('#org_popup input[type=checkbox]:checked')[0].labels[0].textContent;
		console.log("selected",selected_org);
		$(".edit_menu .org_wrap .org_name").text("")
		$(".edit_menu .org_wrap .org_name").text(": " + selected_org)
		$(".edit_menu .org_wrap .org_name").attr("rdno",$('#org_popup input[type=checkbox]:checked').attr('name').split("c")[1])
		$("#org_popup").addClass('hide');
		
	});
	/* 관계도 만들기 */
	$("#org_popup .btn_make").off('click').on('click',function(){
		location.href="${pageContext.request.contextPath}/manageOrg";
	});
	
	$("#step2 .prev-step").off('click').on('click',function(){
		$(".step_contents li:eq(0) a").trigger('click');
	});
	$("#step1 .next-step, #step3 .prev-step").off('click').on('click',function(){
		$(".step_contents li:eq(1) a").trigger('click');
	});
	$("#step2 .next-step").off('click').on('click',function(){
		$(".step_contents li:eq(2) a").trigger('click');
	});
	
	
	/* step2 저장 */
	$("#step2 .btn_save").off('click').on('click',function(){
		that.procQuestionData()
		
	});
	/* step3 저장 */
	$("#step3 .btn_save").off('click').on('click',function(){
		
		$.ajax({
		 	url : base_url + "questionnaire/post/"+sessionStorage.current_qnno,
		 	data : {},
		 	type : "put",
		 	success : function(res){
		 		console.log("res step3 btn_Save",res);
		 		$("#step3 input").val(res.msg)
		 	},
		 	error : function(err){
		 		 console.log("ERROR!!", err);
		 	}
		 });
	});
	
	/* 질문 추가 */
	$(".ques_type").off('click').on('click',function(){
		var type = $(this).attr('type');
		that.addQuestion(type);
	});
	
	$(".question_title").off('click').on('click',function(){
		$(".nav-pills li:eq(1) a").trigger('click')
		$("#step2 .edit_menu textarea").val($(this).text().slice(0,-1))
		that.edit_target = $(this);
		
	});
	$("#step2 .edit_menu textarea").on('keyup',function(){
		that.edit_target.html("")
		that.edit_target.html("<img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+$("#step2 .edit_menu textarea").val())
	});
	
	$(".answer_wrap").off('click').on('click',function(){
		that.edit_target = $(this);
		
		var type = $(this).parent().attr('type');
		var html ="";
		
		if(type== "obj" || type=="rel_obj"){
			console.log("this.",$(this).children())
			var len = $(this).children().length;
			for( i=0; i<len; i++){
				if($(this).children()[i].type=="radio"){
					html += "<div class='object_item_wrap'>"
					html += "<input class='item pull-left' type='text' value='"+$(this).children()[i].labels[0].innerText+"' name="+$(this).children()[i].id+">"
					html += "<input class='weight pull-left' type='number' value="+$("#"+$(this).children()[i].id).attr('weight')+"  name="+$(this).children()[i].id+">"
					html += "	<div class='clearfix'></div>"
					html += "</div>"
				}
			}
			$(".object_items").html("");
			$(".object_items").append(html);
			$(".nav-pills li:eq(1) a").trigger('click')
			that.listener();
			
		}
	});
	
	$(".object_item_wrap .item").on('keyup',function(){
		var num = $(this).attr('name')
		console.log('num',num, $(this).attr('name'))
		$( $("#"+num)[0].labels ).html("<span></span>"+$(this).val())
		console.log("dfd",that.edit_target)
		
	});
	
	$(".object_item_wrap .weight").on('keyup',function(){
		var num = $(this).attr('name')
		console.log("weight value;",num, $("#"+num),$(this).val())
		$("#"+num).attr("weight",$(this).val())
		
	});
	
	$(".option_wrap .btn_plus").off('click').on('click',function(){
		
		var html ="";
		html += "<div class='object_item_wrap'>"
		html += "<input class='item pull-left' type='text' name='c"+that.radio_num+"''>"
		html += "<input class='weight pull-left' type='number' value=0>"
		html += "	<div class='clearfix'></div>"
		html += "</div>"		
		$(".object_items").append(html)
		html = "";
		html += "<input type='radio' id=c"+that.radio_num+">"
		html += "<label for=c"+that.radio_num+"><span></span></label><br>"
		that.radio_num++;
		
		that.edit_target.append(html)
		that.listener();
	});
	
	$(".option_wrap .btn_minus").off('click').on('click',function(){
		
		$(".object_items .object_item_wrap:last-child").remove();
		var len = $(".object_items .object_item_wrap").length;
		var html ="";
		
		that.edit_target.html('')
		console.log('len',len)
		for( i=0; i<len; i++){
			html += "<input type='radio' id=c"+i+">"
			html += "<label for=c"+i+"><span></span>"+$(".object_items .item:eq("+i+")").val()+"</label><br>"
		}
			that.radio_num --; 
		
		that.edit_target.append(html)
	});
	
	$("#org_popup .close").off('click').on('click',function(){
		$("#org_popup").addClass('hide');
		
	});
	
};
/* 
 * listener end 
 */
 
 /* 설문정보등록 */
makeSurvey.insertSurvey = function(){
	
	var that = this;
	var questionnaire = {};
	questionnaire.qnno = sessionStorage.current_qnno;
	questionnaire.subject = $("#survey_name").val();	//설문제목
	questionnaire.stdate = $("#start_date").val()+"T00:00:00";	//시작일
	questionnaire.endate = $("#end_date").val()+"T23:59:59";		//종료일
	questionnaire.qpw = $("#survey_pw").val();				//비밀번호
	questionnaire.overview = $("#survey_info").val();		//설문개요
	
	var mno = sessionStorage.mno;
	console.log("ajaxData::",questionnaire)
	
	$.ajax({
	  	url : base_url + "questionnaire/"+mno,
 	  	data : JSON.stringify(questionnaire),
	  	type : "POST",
	  	dataType :"json",
	  	success : function(res){
	  		if(res != null){
		  		console.log("=====insertSurvey=====", res);
				alert("설문 정보가 저장되었습니다.");
		  		sessionStorage.current_qnno = res.qnno;
		  		
		  		var $active = $('.nav-tabs li.active');
		        $active.next().removeClass('disabled');
		        $active.next().children().children().addClass("active")
		        $("#step1 .next-step").removeClass('disabled')
		        $("#step1 .next-step").trigger('click')
		        
		        
	  		}
	  	},
	  	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	  });
}

/* 조직도 불러오기 */
makeSurvey.getOrgList = function(){
	
	var html="";
			
	$.ajax({
	  	url : base_url + "diagram/list/"+sessionStorage.mno,
	  	data : {},
	  	type : "GET",
	  	dataType:"json",
	  	success : function(res){
	  		console.log("=====getOrgList=====", res);
	  		if(res.length>0){
		  		res.forEach(function(r,i){
		  			html += "		<input type='checkbox' id='c"+r.rdno+"' name='c"+r.rdno+"' />"
	 				html += "		<label for='c"+r.rdno+"'><span></span>"+r.name+"</label></br>"
		  		});
	  		}else {
	  			html +="<div>조직도를 등록해보세요!</div>";
	  		}
	  		
	  		$("#org_popup .popup_body").html('')
	  		$("#org_popup .popup_body").append(html)
	  	},
	  	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	  });
	
};

makeSurvey.procQuestionData = function(){
	var that = this;
	var questions = [];
	var q_num = $(".question_wrap").length

	
	var target = "";
	for( i=0; i<q_num ; i++){
		var temp = {};
		target = ".question_wrap:eq("+i+")";
		var type = $(target).attr('type');
		if( type=="obj"){
			temp.type = "OBJECTIVE";
		}else if( type=="sbj"){
			temp.type = "SUBJECTIVE";
		}else if( type=="rel_obj"){
			temp.type = "RELATIONALOBJECTIVE";
		}else if( type=="rel_sbj"){
			temp.type = "RELATIONALSUBJECTIVE";
		}
		
		temp.text = $(target+" .question_title").text().slice(0,-1);
		console.log(target+" .question_title", temp.text);
		temp.questionno=i+1;
		temp.pno=1;
		
		if ($(target).attr('type') == "obj" || $(target).attr('type') == "rel_obj"){
			temp.objectiveItems = [];
			var item_length = $(target + " .answer_wrap input[type=radio]").length;
			
			for( j=0; j<item_length; j++){
				
				var temp2 = {};
				var target2 = ".question_wrap:eq("+i+") .answer_wrap input[type=radio]";
				temp2.text = $(target2)[j].labels[0].innerText;
				temp2.weight = $(target2).attr("weight");
				temp.objectiveItems.push(temp2);
			}
			
		}
		questions.push(temp);
	}
	that.insertQuestion(questions);
	
};
makeSurvey.insertQuestion = function(data){
	
	var ajaxData ={};
	ajaxData.qnno = sessionStorage.current_qnno;
	ajaxData.subject = $("#survey_name").val();	//설문제목
 	ajaxData.stdate = $("#start_date").val()+"T00:00:00";	//시작일
	ajaxData.endate = $("#end_date").val()+"T23:59:59";		//종료일
	ajaxData.qpw = $("#survey_pw").val();				//비밀번호
	ajaxData.overview = $("#survey_info").val();		//설문개요		
	ajaxData.questions = data;
	ajaxData.relationDiagram = { rdno:null };
	if($(".question_wrap[type=rel_obj]").length > 0 || $(".question_wrap[type=rel_sbj]").length>0 ){
		if($(".org_name").attr('rdno') != null){
			ajaxData.relationDiagram = { rdno:$(".org_name").attr('rdno') }
		}else{
			alert('관계도를 선택하세요.');
			return;
		}			
		
		
	}
	console.log('ajaxData::::',ajaxData);

	$.ajax({
	  	url : base_url + "questionnaire/",
		data : JSON.stringify(ajaxData),
	  	type : "PUT",
	  	dataType:"json",
	  	success : function(res){
	  		console.log("=====insertQuestion=====", res);
	  		if(res != null){
				alert("설문 정보가 저장되었습니다.");
		  		sessionStorage.current_qnno = res.qnno;
		  		var $active = $('.nav-tabs li.active');
		        $active.next().removeClass('disabled');
		        $active.next().children().children().addClass("active")
		        /* nextTab($active); */
		        $(".line[type=step1]").css('border-color','#94bcff');
		        $("#step2 .next-step").removeClass('disabled')
		        $("#step2 .next-step").trigger('click');
	  		}
	  	},
	  	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	  });
};

//메뉴클릭 후 설문 추가
makeSurvey.addQuestion = function(type){
	var that = this;
	var html="";
	
	if( type== "obj" ){
		html += "<div class='question_wrap' type='obj'>"
		html += "	<div class='question_title'><img src='/resources/images/ic_question.png'>가장 좋아하는 점심메뉴는?<span class='close'>×</span></div>"
		html += "	<div class='answer_wrap'>"
		html += "		<input type='radio' id=c"+that.radio_num+" weight='1'>"
		html += "		<label for=c"+that.radio_num+"><span></span></label><br>"		
		that.radio_num ++;
		html += "		<input type='radio' id=c"+that.radio_num+" weight='1'>"
		html += "		<label for=c"+that.radio_num+"><span></span></label><br>"		
		that.radio_num ++;
		html += "		<input type='radio' id=c"+that.radio_num+" weight='1'>"
		html += "		<label for=c"+that.radio_num+"><span></span></label><br>"		
		that.radio_num ++;
		html += "	</div>"
		html += "</div>"
		
	}else if( type == "sbj" ){
		html += "	<div class='question_wrap' type='sbj'>"
		html += "		<div class='question_title'><img src='/resources/images/ic_question.png'>가장 좋아하는 점심메뉴는?<span class='close'>×</span></div>"
		html += "		<div class='answer_wrap'>"
		html += "			<textarea style='width:100%;'></textarea>"
		html += "		</div>"
		html += "	</div>"		
	}else if( type=="rel_obj" ){
		if($(".belong_title").length==0){
			var html2 = ""
				html2 += "	<div class='belong_title'>소속을 선택하세요</div>"
				html2 += "	<input type='text' readonly='readonly'><button class='btn dept_btn'>부서선택</button>"
				html2 += "</div>"
				$(".belong_info").append(html2);
		}		
		html += "	<div class='question_wrap' type='rel_obj'>"
		html += "		<div class='question_title'><img src='/resources/images/ic_question.png'>협업부서와 이메일을 얼마나 주고받나요?<span class='close'>×</span></div>"
		html += "		<div class='answer_wrap'>"
		html += "			<input type='text'><button class='btn dept_btn'>부서 선택</button><br>"
		html += "			<input type='radio' id=c"+that.radio_num+" weight='1'>"
		html += "			<label  for=c"+that.radio_num+"><span></span>0~5회</label><br>"
		html += "		</div>"
		html += "	</div>"
		that.radio_num ++;
		
	}else if( type=="rel_sbj"){
		if($(".belong_title").length==0){
			var html2 = ""
				html2 += "	<div class='belong_title'>소속을 선택하세요</div>"
				html2 += "	<input type='text' readonly='readonly'><button class='btn dept_btn'>부서선택</button>"
				html2 += "</div>"
				$(".belong_info").append(html2);
		}		
		html += "	<div class='question_wrap' type='rel_sbj'>"
		html += "		<div class='question_title'><img src='/resources/images/ic_question.png'>협업부서와 이메일을 얼마나 주고받나요?<span class='close'>×</span></div>"
		html += "		<div class='answer_wrap'>"
		html += "			<input type='text'><button class='btn dept_btn'>부서 선택</button><br>"
		html += "			<textarea style='width:100%;'></textarea>"
		html += "		</div>"
		html += "	</div>"
	}
	
	$(".preview .all_question").append(html);
	that.listener();
		
};

//설문수정 시 미리보기영역에..
makeSurvey.setPreview = function(data){
	var that = this;
	var html ="";
	if(data != null){
	that.radio_num=0;
		
		html += "<!-- 소속정보 -->"
		html += "<div class='belong_info'></div>"
		html += "<div class='all_question'>"
		data.forEach(function(r,i){
			if( r.type == "OBJECTIVE" ){
				html += "	<div class='question_wrap' type='obj'>"
				html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.slice(0,-1)+"<span class='close'>×</span></div>"
				html += "		<div class='answer_wrap'>"
				r.objectiveItems.forEach(function(d,k){
					html += "			<input type='radio' id=c"+that.radio_num+" weight='"+d.weight+"'>"
					html += "			<label for='c"+that.radio_num+"'><span></span>"+d.text+"</label><br>"
					that.radio_num++;
				});
				html += "		</div>"
				html += "	</div>"
			}else if( r.type == "SUBJECTIVE" ){
				html += "	<div class='question_wrap' type='sbj'>"
				html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.slice(0,-1)+"<span class='close'>×</span></div>"
				html += "		<div class='answer_wrap'>"
				html += "			<textarea style='width:100%;'></textarea>"
				html += "		</div>"
				html += "	</div>"
			}else if( r.type == "RELATIONALOBJECTIVE"){
				if($(".belong_title").length==0){
					var html2 = ""
						html2 += "	<div class='belong_title'>소속을 선택하세요</div>"
						html2 += "	<input type='text' readonly='readonly'><button class='btn dept_btn'>부서선택</button>"
						html2 += "</div>"
						$(".belong_info").append(html2);
				}
				html += "	<div class='question_wrap' type='rel_obj'>"
				html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.split('×')[0]+"<span class='close'>×</span></div>"
				html += "		<div class='answer_wrap'>"
				r.objectiveItems.forEach(function(d,k){
					html += "			<input type='radio' id='c"+that.radio_num+"' weight='"+d.weight+"'>"
					html += "			<label for='c"+that.radio_num+"'><span></span>"+d.text+"</label><br>"
					that.radio_num++;
				});
				html += "		</div>"
				html += "	</div>"				
			}else if( r.type == "RELATIONALSUBJECTIVE" ){
				if($(".belong_title").length==0){
					var html2 = ""
					html2 += "	<div class='belong_title'>소속을 선택하세요</div>"
					html2 += "	<input type='text' readonly='readonly'><button class='btn dept_btn'>부서선택</button>"
					html2 += "</div>"
					$(".belong_info").append(html2);
				}				
				html += "	<div class='question_wrap' type='rel_sbj'>"
				html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.split('×')[0]+"<span class='close'>×</span></div>"
				html += "		<div class='answer_wrap'>"
				html += "			<input type='text'><button class='btn dept_btn'>부서 선택</button><br>"
				html += "			<textarea style='width:100%;'></textarea>"
				html += "		</div>"
				html += "	</div>"				
			}
			
		})
		html += "</div>"
		html += "<div class='text-center'>"
		html += "	<button class='btn btn_white'>제출하기</button>"
		html += "</div>"
		
	}else{
		html += "<div class='all_question'></div>"
		html += "<div class='text-center'>"
		html += "	<button class='btn btn_white'>제출하기</button>"
		html += "</div>"
	}
	$(".preview").html("")
	$(".preview").append(html);
	that.listener();
}


function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

</script>
