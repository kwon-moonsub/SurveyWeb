<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/header"  flush="false" />
<style>
.btn_blue, .btn_white { height:27px; width:78px; font-size:12px; }
.btn_make { width:210px; }
.no_data { padding:185px 0; }
.table>thead>tr>th { padding:12px 0; }
.table>tbody>tr>td { border-top:2px solid #ddd; padding:8px 0; vertical-align:middle; }
.table>tbody>tr>td:first-child { text-align:center; width:40px; }
table.dataTable { border-collapse:collapse; }
table.dataTable thead th { border-bottom:2px solid #ddd; }
.pagination>li>a { color: #4ea0e1; }
.pagination>.active>a { background-color:#4ea0e1; border-color:#4ea0e1; }
.dataTables_wrapper .dataTables_paginate .paginate_button { padding:0; margin-left:0; }
.dataTables_wrapper .dataTables_paginate .paginate_button:hover { background:#fff; box-shadow:none; border:0;  }
</style>

<div class="contents_wrap">

	<div class="w970">
		<div class="text-center page_title">설문관리</div>
		<button class="btn btn_aqua pull-right btn_make">설문 만들기</button>
		<div class="clearfix"></div>
		
		<div class="surveyInfo">
			<div class="no_data text-center" style="font-size:25px">설문을 선택해주세요.</div>
			<div class="survey_wrap hide">
				<div class="graph_wrap col-md-6"></div>
				<div class="total_wrap col-md-3 text-center">
					<p style="font-size:20px">총 설문자</p>
					<div class="total_num"></div>
				</div>
				<div class="day_wrap col-md-3 text-center">
					<p style="font-size:20px">남은 설문기간</p>
					<div class="day_num"></div>
				</div>			
			</div>
		</div>
		
		<div class="list_wrap">
			<table class="table table-striped">
				<thead>
					<tr>
						<th></th>
						<th style="width:350px;">설문제목</th>
						<th>설문기간</th>
						<th>상태</th>
						<th style="width:265px;">관리</th>
						
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/footer"  flush="false" />
<sec:authentication property="principal.mno" var="currentMno"/>
<script>
$(function(){
	manageSurvey.init();
})
var manageSurvey = {};

manageSurvey.init = function(){
	var that = this;
	
	that.getSurveyList();
	that.listener();
	
};
//설문지 리스트
manageSurvey.getSurveyList = function(){

	var html = "";
	var that = this;

	
	var mno = '${currentMno}';
	$.ajax({
	 	url : base_url + "questionnaire/list/"+mno,
	 	data : {},
	 	type : "GET",
	 	success : function(res){
	 		console.log("=====getSurveyList=====", res);
	 		if(res.length>1){
		 		res.forEach(function(r,i){
		 			var state = "", month;
		 			if(r.endate[1]<11){
		 				month = "0"+r.endate[1]
		 			}
		 			var endDate = new Date(r.endate[0], month, r.endate[2]).getTime();
		 			html += "		<tr qnno='"+r.qnno+"' remain="+r.remainDay+" count="+r.count+"> "
	 				html += "			<td><input type='checkbox'></td> "
	 				html += "			<td>"+r.subject+"</td> "
	 				html += "			<td>"+r.stdate[0]+"-"+r.stdate[1]+"-"+r.stdate[2]+ " ~ " +r.endate[0]+"-"+r.endate[1]+"-"+r.endate[2]+"</td> "
	 				if( r.post == true ){
		 				html += "			<td>설문 진행중</td> "
	 				}else if( r.post == null){
		 				html += "			<td>설문 제작중</td> "
	 				}
	 				else{
		 				html += "			<td>종료</td> "
	 				}
	 				html += "			<td> "
	 				html += "				<button class='btn_white btn_result'>결과보기</button> "
	 				html += "				<button class='btn_white btn_edit'>설문수정</button> "
	 				html += "				<button class='btn_white btn_end' state='"+r.post+"'>설문종료</button> "
	 				html += "			</td> "
	 				html += "		</tr> "
		 		});
		 		
		 		$(".list_wrap table tbody").html('');
		 		$(".list_wrap table tbody").append(html);
	 		}else{
	 			html += "		<tr> "
				html += "			<td colspan='5' class='text-center' style='padding:12px;'> 설문을 만들어 보세요! </td> "
				html += "		</tr> "
		 		$(".list_wrap table tbody").html('');
		 		$(".list_wrap table tbody").append(html);
	 		}
	 		that.listener();
	 		$(".list_wrap table").DataTable({
	 		});
	 		
	 	},
	 	error : function(err){
	 		 console.log("ERROR!!", err);
	 	}
	 });
};

//설문 대시보드
manageSurvey.setDashboard = function(num,remain,count){
	var axisData =[], seriesData = [];
	
	$.ajax({
	 	url : base_url + "questionnaire/count/day/"+num,
	 	data : {},
	 	type : "get",
	 	success : function(res){
	 		console.log("=====setDashboard=====", res);
	 		axisData.push(res[0].regdate);
	 		seriesData.push(res[0].count);
	 		console.log(axisData,seriesData)
	 		
	 		if(res.length != 0){
	 			$(".graph_wrap").html("")
	 			$('.no_data').addClass('hide');
	 			$('.survey_wrap').removeClass('hide');
	 			$(".survey_wrap .total_num").html("")
	 			$(".survey_wrap .day_num").html("")
	 			
	 			$(".survey_wrap .total_num").append(count);
	 			if(remain >=0){
		 			$(".survey_wrap .day_num").append(remain);
	 			}else {
		 			$(".survey_wrap .day_num").append(0);
	 			}
	 			if( res.regdata !=null){
		 			visual.barChart('.survey_wrap .graph_wrap',axisData,seriesData);
	 			}
	 			
	 		}else{
	 			$(".graph_wrap").append("설문자가 없습니다.")
	 		}
	 	},
	 	error : function(err){
	 		 console.log("ERROR!!", err);
	 	}
	 });

}

//설문삭제
manageSurvey.deleteSurvey = function(mno,qnno){
	
	$.ajax({
	 	url : base_url + "/questionnaire/"+num+"/"+qnno,
	 	data : {},
	 	type : "delete",
	 	success : function(res){
	 		console.log("=====deleteSurvey=====", res);
	 	},
	 	error : function(err){
	 		 console.log("ERROR!!", err);
	 	}
	 });
}

/* listener */
manageSurvey.listener = function(){
	var that = this;
	
	/* 설문만들기 */
	$('.btn_make').off('click').on('click',function(){
		location.href="${pageContext.request.contextPath}/makeSurvey";
	});
	
	$('.btn_result').off('click').on('click',function(){
		sessionStorage.result_qnno = $(this).parent().parent().attr("qnno");
		location.href="${pageContext.request.contextPath}/result";
	});
	
	$('.btn_edit').off('click').on('click',function(){
		if($(this).parent().parent().attr('count')>0 || $(this).parent().parent().attr('remain') < 0){
			alert("수정 불가능")
		}else{
			sessionStorage.current_qnno = $(this).parent().parent().attr('qnno');
			location.href="${pageContext.request.contextPath}/makeSurvey";
		}
	});
	
	$(".btn_end").off('click').on('click',function(){
		if( state == true){
			var ajaxData = { qnno:$(this).parent().parent().attr('qnno'), member:{ mno:sessionStorage.mno} }
	 		
			$.ajax({
			 	url : base_url + "questionnaire/close/",
			 	data : JSON.stringify(ajaxData),
			 	type : "put",
			 	dataType:"json",
			 	success : function(res){
			 		console.log("=====end button click=====", res);
			 		location.reload(true);
			 	},
			 	error : function(err){
			 		 console.log("ERROR!!", err);
			 	}
			 });
			
		}else if( state == false){
			alert('이미 종료된 설문입니다.')
		}else{
			alert('제작중인 설문입니다.')
		}
		
	});
	
	//체크박스 선택 후 대시보드 로딩
	$('.list_wrap input[type=checkbox]').on('change',function(){
		
		var size = $('.list_wrap input[type=checkbox]').length;
		
		if(size>1){
			$('.list_wrap input[type=checkbox]').prop('checked',false);
			$(this).prop('checked',true);
		}
		
		if($('.list_wrap input[type=checkbox]').is(':checked')){
			var num = $('.list_wrap input[type=checkbox]:checked').parent().parent().attr("qnno");
			var remain = $('.list_wrap input[type=checkbox]:checked').parent().parent().attr("remain");
			var count = $('.list_wrap input[type=checkbox]:checked').parent().parent().attr("count");
			console.log("num,remain, count", num, remain, count)
			that.setDashboard(num,remain,count);
		}
		
	});
};
</script>
