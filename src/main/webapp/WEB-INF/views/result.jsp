<!-- 결과보기 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
.btn:focus { color:#fff; }
.panel-body { padding:45px 40px; }
.ques_result { width:970px; }
.table td { height:48px; vertical-align:middle!important; border-top:2px solid #ddd!important;  }
.table tr:last-child { border-bottom:2px solid #ddd!important;}
</style>
<div class="contents_wrap">
	<div class="w970">
		<div class="page_title text-center">결과보기</div>
		<button class="btn btn_aqua pull-right btn_image" style="width:150px; margin-left:10px;">이미지 저장</button>
		<button class="btn btn_aqua pull-right btn_excel">결과 다운로드(엑셀)</button>
		<div class="clearfix"></div>
		<!-- 설문정보 -->
		<div class="resultInfo text-center">
			<div class="survey_name">협업에 관한 설문조사</div>
			<a >총 설문인원 <a class="total_people"></a>명,&nbsp;&nbsp;<a class="survey_date"></a><a class="total_day"></a>일간 진행되었습니다.</a> 
		</div>
		
		<!-- 답변정보 -->
		<div class="result_wrap"></div>
		
	</div><!-- w970 end -->
</div>
<jsp:include page="/footer"  flush="false" />

<script>
$(function(){
	result.init();
})

var result = {}

result.init = function(){
	var that = this;
	that.getResultData();
	that.listener();
};


result.listener = function(){
	
	//엑셀다운로드
	$(".btn_excel").off('click').on('click',function(){
		
		$.ajax({
		 	url : base_url + "answer/excel/"+sessionStorage.result_qnno,
		 	data : {},
		 	type : "get",
		 	dataType:"",
		 	success : function(res){
		 		 console.log("===== excel button click =====", res);
		 	},
		 	error : function(err){
		 		 console.log("ERROR!!", err);
		 	}
		 });
		
	});
	//이미지 저장
	$(".btn_image").off("click").on("click",function(){
		
		var imgName = "설문조사 결과";
		saveImage(".contents_wrap",imgName)
	});
};


result.getResultData = function(){

		var that = this;
		var html =""
		
		$.ajax({
		 	url :  base_url + "questionnaire/list/"+sessionStorage.mno,
		 	data : {},
		 	type : "GET",
		 	success : function(res){
		 		console.log("=====getResultData =====", res);
		 		
		 		res.forEach(function(d,k){
		 			var start,end;
		 			
		 			if(d.qnno==sessionStorage.result_qnno){
		 				$(".survey_name, .total_people, .survey_date, .total_day").html("")
		 				$(".resultInfo .survey_name").append(d.subject)
		 				if(d.stdate[1] < 10){
		 					if(d.stdate[2]<10){
		 						start = d.stdate[0]+"-0"+d.stdate[1]+"-0"+d.stdate[2];
		 					}else{
		 						start = d.stdate[0]+"-0"+d.stdate[1]+"-"+d.stdate[2];
		 					}
		 				}else{
		 					if(res.d.stdate[2]<10){
		 						start = d.stdate[0]+"-"+d.stdate[1]+"-0"+d.stdate[2];
		 					}else{
		 						start = d.stdate[0]+"-"+d.stdate[1]+"-"+d.stdate[2];
		 					}
		 				}

		 				if(d.endate[1] < 10){
		 					if(d.endate[2] < 10){
		 						end = d.endate[0]+"-0"+d.endate[1]+"-0"+d.endate[2];
		 					}else{
		 						end = d.endate[0]+"-0"+d.endate[1]+"-"+d.endate[2];
		 					}
		 				}else{
		 					if(d.endate[2]<10){
		 						end = d.endate[0]+"-"+d.endate[1]+"-0"+d.endate[2];
		 						
		 					}else{
		 						end = d.endate[0]+"-"+d.endate[1]+"-"+d.endate[2];
		 					}
		 				}
		 				$(".resultInfo .survey_date").append(start + " ~ "+ end)
		 				
		 				var stDate = new Date(start);
		 				var endDate = new Date(end);
		 				console.log("start,end",stDate, endDate);
		 				var day = (endDate.getTime() - stDate.getTime())/(1000*60*60*24);
		 				
		 				$(".resultInfo .total_people").append(d.count)
		 				$(".resultInfo .total_day").append(day+1)
		 			}
		 		})
		 	},
		 	error : function(err){
		 		 console.log("ERROR!!", err);
		 	}
		 });
		
		$.ajax({
		 	url : base_url + "answer/list/"+sessionStorage.result_qnno,
		 	data : {},
		 	type : "get",
		 	success : function(res){
		 		console.log("=====getResultData=====", res);
		 		for( i=0; i<res.length; i++){
		 			html += "<div class='panel panel-default'>"
	 				html += "	<div class='panel-heading ques_title'></div>"
	 				html += "	<div class='panel-body ques_result'>"
	 				if(res[i].question.type =="RELATIONALOBJECTIVE" || res[i].question.type=="OBJECTIVE" ){
		 				html += "	<div class='col-md-6 graph'></div>"
		 				html += "	<div class='col-md-6 table_wrap'>"
		 				html += "		<table class='table text-center'><tbody></tbody></table>"
		 				html += "	</div>"
		 				html += "	<div class=''></div>"
	 				}
	 				html += "	</div>"
	 				html += "</div>"
		 		}
		 		$(".result_wrap").html("")
		 		$(".result_wrap").append(html);
		 		that.procGraphData(res);
		 	},
		 	error : function(err){
		 		 console.log("ERROR!!", err);
		 	}
		 });
		
};
result.procGraphData = function(data){

	var that = this;
	
	data.forEach(function(r,i){
		var html = "";
		var type = r.question.type
		var target = ".panel:eq("+i+")"
		$(target+" .panel-heading").append("Q. "+r.question.text)
		
		if( type== "SUBJECTIVE" ){
			if(r.answers.length<1){
				html += "<div class=''>답변이 없습니다.<div>"
			}else{
				
				html += "<table class='table'>"
				html += "	<tr>"
				html += "		<td ></td>"
				html += "		<td>답변</td>"
				html += "	</tr>"
				for ( j=0; j<r.answers.length; j++){
					html += "	<tr>"
					html += "		<td>"+(j+1)+"</td>"
					html += "		<td>"+r.answers[j].text+"</td>"
					html += "	</tr>"
				}
				html += "</table>"
				
				
			}
			$(target+" .panel-body").append(html);
			
		}else if( type== "OBJECTIVE" ){
			if(r.answers.length<1){
				html += "<div class=''>답변이 없습니다.<div>"
			}else{
				var answerArr = [];
				var html = ""
				
				r.answers.forEach(function(r,i){
					if(answerArr.length>0){
						answerArr.forEach(function(d,k){
							if(d.name == r.text){
								d.value++;
							}else{
								answerArr.push({value:1, name:r.text});
							}
						});
					}else{
						answerArr.push({value:1, name:r.text});
					}
					
					console.log("answer",answerArr);
					
					html += "		<tr>"
					html += "			<td>답변</td>"
					html += "			<td>응답자 수</td>"
					html += "		</tr>"
					answerArr.forEach(function(d,k){
						html += "		<tr>"
						html += "			<td>"+d.name+"</td>"
						html += "			<td>"+d.value+"</td>"
						html += "		</tr>"
					});
					
				});
			}
			$(target+" .panel-body .table tbody").append(html)
			$(target+" .panel-body .graph").css('height','300px')
			visual.pieChart(target+" .panel-body .graph",answerArr);
			
		}else if( type == "RELATIONALOBJECTIVE" ){
			if(r.answers.length<1){
				html += "<div class=''>답변이 없습니다.<div>"
			}else{
				html += "	<tr>"
				html += "		<td>source</td>"
				html += "		<td>target</td>"
				html += "		<td>weight</td>"
				html += "	</tr>"
				
			}
			
			var edges = [], nodes=[];
			r.answers.forEach(function(d,k){
				html += "	<tr>"
				html += "		<td>"+d.source.value+"</td>"
				html += "		<td>"+d.target.value+"</td>"
				html += "		<td>"+d.items[0].weight+"</td>"
				html += "	</tr>"
/* 				if(edges.length>1){
					edges.forEach(function(a,b){
						if( (a.data.source.split("_")[1] == d.source.ouno) && (a.data.target.split("_")[1] == d.target.ouno) ){
							a.data.weight+=
						}
						
					})
				}else{
					edges.push( { data: { source: 'node_'+d.source.ouno, target:'node_'+d.target.ouno, weight:d.items[0].weight, weight_text:d.items[0].text } } );
				} */
				edges.push( { data: { source: 'node_'+d.source.ouno, target:'node_'+d.target.ouno, weight:d.items[0].weight, weight_text:d.items[0].text } } );
				if(nodes.length>0){
					nodes.forEach(function(m,k){
						if ( m.data.id != 'node_'+d.source.ouno){
							nodes.push( { data: { id: 'node_'+d.source.ouno, name: d.source.value } } );
						}
						if ( m.data.id != 'node_'+d.target.ouno){
							nodes.push( { data: { id: 'node_'+d.target.ouno, name: d.target.value } } );
						}
					});
					
				}else{
					nodes.push( { data: { id: 'node_'+d.source.ouno, name: d.source.value } } );
					nodes.push( { data: { id: 'node_'+d.target.ouno, name: d.target.value } } );
				}
			});
			console.log("nodes,edges",nodes,edges);
			
			$(target+" .panel-body .table tbody").append(html);
			$(target+" .graph").css('height','300px');
			visual.forceChart(target+" .graph",nodes,edges)
		}else if( type == "RELATIONALSUBJECTIVE" ){
			if(r.answers.length<1){
				html += "<div class=''>답변이 없습니다.<div>"
			}else{
				html += "<table class='table'>"
				html += "	<tr>"
				html += "		<td></td>"
				html += "		<td>부서1</td>"
				html += "		<td>부서2</td>"
				html += "		<td>답변</td>"
				html += "	</tr>"
					for ( j=0; j<r.answers.length; j++){
						html += "	<tr>"
						html += "		<td>"+(j+1)+"</td>"
						html += "		<td>"+r.answers[j].source.value+"</td>"
						html += "		<td>"+r.answers[j].target.value+"</td>"
						html += "		<td>"+r.answers[j].text+"</td>"
						html += "	</tr>"
					}
				html += "</table>"
			}				
			$(target+" .panel-body").append(html);
		}
	});
	
}

//이미지 저장 이벤트 연동
function saveImage (target, imgName){
 	html2canvas($(target), {
	  background: "#fff",
	  onrendered: function(canvas) {
		   // ie
 		     if (canvas.msToBlob) { 
   	                var blob = canvas.msToBlob();
   	                window.navigator.msSaveBlob(blob, imgName+'.jpg');

             } else {
             	 $("body").append("<a class='image_save_link'></a>");
            	 
            	 var href = canvas.toDataURL("image/jpg").replace("image/jpg", "image/octet-stream");
            	 $(".image_save_link").attr("href",href);
            	 $(".image_save_link").attr("download",imgName+".jpg");
            	 
            	 var link = $(".image_save_link")[0];
            	 link.click();	 
             }
	  }
	});
}
</script>