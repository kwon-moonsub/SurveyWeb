<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <jsp:include page="/header"  flush="false" /> --%>
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
	
	<!-- JS Tree -->
	<script src="${pageContext.request.contextPath}/resources/js/jstree.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	
</head>
<style>

</style>
<body>	
	<div class="contents_wrap poll">
		<div class="w970">
			<div class="pollInfo">
				<div class="page_title text-center">설문조사 제목</div>
				<p class="text-center" style="color:#6b6b6b;">이 설문은 협업에 관련된 설문조사 입니다.</p>
			</div>
			<div class="progress">
			  <div class="progress-bar progress-bar-striped active" role="progressbar"
			  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">
			    0%
			  </div>
			</div>			
			<!-- 미리보기 -->
			<div class="preview">
				<!-- 소속정보 -->
				<div class="belong_info"></div>
				<div class="all_question"></div>
				<div class="text-center">
					<button class="btn btn_white btn_submit">제출하기</button>
				</div>				
			</div>		
		</div>
	</div>
	<div id="poll_org_popup" class="hide">
		<div class="popup_header">부서찾기
			<span class="close">&times;</span>
		</div>
		<div class="popup_body"></div>
		<div class="popup_footer text-center">
			<button class="btn btn_default btn_select">선택</button>
		</div>
	</div>
	<div class="survey_end hide">
		<div class="w970">
			<div class="page_title text-center">종료된 설문입니다.</div>
		</div>
	</div>

<jsp:include page="/footer"  flush="false" />

<script>
$(function(){
	window.base_url = '${pageContext.request.contextPath}'+'/';
		
	$.ajaxSetup({
		cache:false,
		crossDomain:true,
		crossOrigin: true,
		/* contentType:"application/x-www-form-urlencoded; charset=UTF-8", */
		contentType:"application/json; charset=utf-8",
		type:"POST",
		dataType:"json"
	});
	
	poll.init();
});

var poll = {};

poll.init = function(){
	
	var that = this;
	
	$.ajax({
	  	url : base_url + "questionnaire/token/${token}",
	  	data : {},
	  	type : "get",
	  	success : function(res){
			console.log("=====init=====", res);
			var end=""
			if(res.endate[1]<10){
				if(res.endate[2]<10){
					end= res.endate[0]+"-0"+res.endate[1]+"-"+res.endate[2]
				}else{
					end= res.endate[0]+"-0"+res.endate[1]+"-0"+res.endate[2]
				}
				
			}else{
				if(res.endate[2]<10){
					end= res.endate[0]+"-"+res.endate[1]+"-0"+res.endate[2]
				}else{
					end= res.endate[0]+"-"+res.endate[1]+"-"+res.endate[2]
				}
			}
			var today = new Date();
			var endDate = new Date(end);
			console.log(endDate, today);
			if(endDate.getTime() < today.getTime()){
				$(".survey_end").removeClass('hide');
				$(".contents_wrap").addClass('hide');
				
			}else{
				that.surveyData = res;
				that.setPage(res);
				if(res.relationDiagram !=null){
					that.nodeData = res.relationDiagram.nodes;
				}
				that.qnno = res.qnno;
			}
			
	  	},
	  	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	});
	
	that.listener();	
};

poll.setPage = function(data){
	var html ="";
	var that = this;
	that.radio_num=0;
	$(".pollInfo .page_title").html("")
	$(".pollInfo .page_title").append(data.subject)
	
	$(".pollInfo p").html("")
	$(".pollInfo p").append(data.overview)
	
	data.questions.forEach(function(r,i){
		
		//객관식
		if( r.type == "OBJECTIVE" ){
			html += "	<div class='question_wrap' type='obj' qno='"+r.qno+"'>"
			html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.split('×')[0]+"</div>"
			html += "		<div class='answer_wrap'>"
			r.objectiveItems.forEach(function(d,k){
				html += "			<input type='radio' id=c"+that.radio_num+" weight='"+d.weight+"' ino='"+d.ino+"'>"
				html += "			<label for='c"+that.radio_num+"'><span></span>"+d.text+"</label><br>"
				that.radio_num++;
			});
			html += "		</div>"
			html += "	</div>"			
		}
		//주관식
		else if( r.type == "SUBJECTIVE" ){
			html += "	<div class='question_wrap' type='sbj' qno='"+r.qno+"'>"
			html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.split('×')[0]+"</div>"
			html += "		<div class='answer_wrap'>"
			html += "			<textarea style='width:100%;'></textarea>"
			html += "		</div>"
			html += "	</div>"
		}
		//관계형 객관식
		else if( r.type == "RELATIONALOBJECTIVE" ){
			if($(".belong_title").length==0){
				var html2 = ""
					html2 += "	<div class='belong_title'>소속을 선택하세요</div>"
					html2 += "	<input type='text' readonly='readonly'><button class='btn dept_btn'>부서선택</button>"
					html2 += "</div>"
					$(".belong_info").append(html2);
			}
			html += "	<div class='question_wrap' type='rel_obj' qno='"+r.qno+"'>"
			html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.split('×')[0]+"</div>"
			html += "		<div class='answer_wrap'>"
			html += "			<input type='text'><button class='btn dept_btn'>부서 선택</button><br>"
			r.objectiveItems.forEach(function(d,k){
				html += "			<input type='radio' id='c"+that.radio_num+"' weight='"+d.weight+"' ino='"+d.ino+"'>"
				html += "			<label for='c"+that.radio_num+"'><span></span>"+d.text+"</label><br>"
				that.radio_num++;
			});
			html += "		</div>"
			html += "	</div>"			
		}
		//관계형 주관식
		else{
			if($(".belong_title").length==0){
				var html2 = ""
				html2 += "	<div class='belong_title'>소속을 선택하세요</div >"
				html2 += "	<input type='text' readonly='readonly'><button class='btn dept_btn'>부서선택</button>"
				html2 += "</div>"
				$(".belong_info").append(html2);
			}				
			html += "	<div class='question_wrap' type='rel_sbj' qno='"+r.qno+"'>"
			html += "		<div class='question_title'><img src='${pageContext.request.contextPath}/resources/images/ic_question.png'>"+r.text.split('×')[0]+"</div>"
			html += "		<div class='answer_wrap'>"
			html += "			<input type='text'><button class='btn dept_btn'>부서 선택</button><br>"
			html += "			<textarea style='width:100%;'></textarea>"
			html += "		</div>"
			html += "	</div>"		
		}
	});
	
	$(".preview .all_question").html("");
	$(".preview .all_question").append(html);
	
	that.listener();

};

poll.listener = function(){
	var that = this;
	
	$(".btn_submit").off('click').on('click',function(){
		if( $("input[type=text]").val() != "" && $("textarea").val() != ""){
			var num = $(".question_wrap[type=obj]").length + $(".question_wrap[type=rel_obj]").length
			if( num == $(".answer_wrap input[type=radio]:checked").length ){
				that.procAnswerData();
			}else{
				alert("입력하지 않은 답변이 있는지 확인해 주세요.")
			}
		}else{
			alert("입력하지 않은 답변이 있는지 확인해 주세요.")
		}
	});
	
	//부서 선택 버튼 클릭
	$(".dept_btn").off('click').on('click',function(e){
		console.log("click",e);
		$("#poll_org_popup").css('left',e.pageX+"px")
		$("#poll_org_popup").css('top',e.pageY+"px")
		that.procOrgData();
		that.input_target = $($(this)[0].previousElementSibling)
		$("#poll_org_popup").removeClass('hide');
		
	});
	
	$("#poll_org_popup .close").off('click').on('click',function(){
		$("#poll_org_popup").addClass('hide');
		$("#poll_org_popup .popup_body").jstree(true).deselect_all();
	});
	
	$("#poll_org_popup .btn_select").off("click").on("click",function(){
		var selectedNode = $("#poll_org_popup .popup_body").jstree().get_selected(true)[0];
		if(selectedNode==null){
			alert("부서를 선택해 주세요.")
		}else{
			that.input_target.val($("#poll_org_popup .popup_body").jstree().get_node(selectedNode).text)
			that.input_target.attr('nno',$("#poll_org_popup .popup_body").jstree().get_node(selectedNode).id)
			$("#poll_org_popup .close").trigger('click');
			$("#poll_org_popup .popup_body").jstree(true).deselect_all();
		}
		
	});
	
	/* radio 하나만체크 */
	$('.answer_wrap input[type=radio]').on('change',function(){
		var size = $(this).parent().children("input[type=radio]").length;
		if(size>1){
			$(this).parent().children("input[type=radio]").prop('checked',false);
			$(this).prop('checked',true);
		}
	});
	
	$(".answer_wrap input, .answer_wrap textarea").on('change',function(){
		var len = $(".answer_wrap").length;
		var checked = $(".answer_wrap input[type=radio]:checked").length;
		var text = 0; 
		$(".answer_wrap textarea").each(function(i,e){
			if($(this).val() != ""){ text++; }else { console.log($(this).val() )}
		})
		console.log("checked, text",checked, text, checked+text)
		var percent = ( (checked + text) *100  / len ).toFixed(0);
		$(".progress-bar").attr('style',"width:"+percent+"%")
		$(".progress-bar").html('')
		$(".progress-bar").append(percent+'%')
		
	});
	
};
 
poll.procAnswerData = function(){
	var that = this;
	var answerData = [];
	var length = $(".question_wrap").length
	
	for( i=0; i<length; i++){
		var temp = {};
		var target = ".question_wrap:eq("+i+")";
		
		if( $(target).attr('type') == "obj" ){
			temp.question = {qno:$(target).attr('qno') };
			temp.items = [{ino: $(target + " input[type=radio]:checked").attr('ino')}];
			temp.type="OBJECTIVE"	
			
		}else if( $(target).attr('type') == "sbj" ){
			temp.question = {qno:$(target).attr('qno')};
			temp.text = $(target+" textarea").val();
			temp.type = "SUBJECTIVE";
			
		}else if( $(target).attr('type') == "rel_obj" ){
			temp.question = {qno:$(target).attr('qno')}
			temp.items = [{ ino:$(target + " input[type=radio]:checked").attr('ino') }]
			temp.source = { nno:$(".belong_info input[type=text]").attr("nno") }
			temp.target = { nno:$(target + " input[type=text]").attr('nno') }
			temp.type = "RELATIONALOBJECTIVE"
			
		}else{
			temp.question = {qno:$(target).attr('qno')}
			temp.text = $(target+" textarea").val();
			temp.source = { nno:$(".belong_info input[type=text]").attr("nno") }
			temp.target = { nno:$(target + " input[type=text]").attr('nno') }
			temp.type = "RELATIONALSUBJECTIVE"
		}
		
		answerData.push(temp);
	}
	console.log("answerData:::::",answerData);
		
		
	that.sendSurveyData(answerData);
}
//설문 제출버튼
poll.sendSurveyData = function(answerData){
	var that = this;
	
	var ajaxData = {};
	ajaxData.questionnaire={qnno:that.qnno};
	ajaxData.answers = answerData;
	
	console.log("ajaxData:::",ajaxData );
	
	$.ajax({
    	url : base_url + "answer/",
     	data : JSON.stringify(ajaxData),
    	type : "POST",
    	dataType:"json",
    	success : function(res){
    		console.log("=====sendSurveyData=====", res);
    		alert('설문제출이 완료되었습니다.')
    		/* location.href="${pageContext.request.contextPath}/home"; */
    	},
    	error : function(err){
    		 console.log("ERROR!!", err);
    	}
    });
}
poll.procOrgData = function(){
	var that = this;
	var treeData = [];
	that.nodeData.forEach(function(r,i){
		var temp = {};
		if(r.level=="1"){
			temp.parent = "#";
		}else{
			temp.parent = r.parentno;
		}
		temp.id = r.ouno;
		temp.text = r.value;
		temp.icon = false;
		treeData.push(temp);
	});
	
	that.drawOrgTree (treeData);
	
};
poll.drawOrgTree = function(data){
 	var that = this;
	$('#poll_org_popup .popup_body').jstree({
		'checkbox' : {
			"keep_selected_style" :false,
	},
	   'core' : {
	       'data' : data,
	       'multiple' : false,
	       'check_callback' : true,
	       
	   },
	'plugins':['checkbox','search','contextmenu'],
/* 	    'contextmenu':{
	    	'items':function(node){
	    		var tree = $("#tree").jstree(true);
	    		return {
	    	        "Create": {
	    	            "separator_before": false,
	    	            "separator_after": false,
	    	            "label": "Rename",
	    	            "action": function (obj) {
	    	            	console.log("obj",obj)
	    	                tree.edit(node);
	    	                
	    	                console.log(node.id,node.text)
	    	                that.data.forEach(function(r,i){
	    	                	if(r.nno==node.id){
	    	                		r.value=node.text
	    	                		console.log(r.value,node.text)
	    	                	}
	    	                })
	    	            }
	    	        },
	    	        "Rename": {
	    	            "separator_before": false,
	    	            "separator_after": false,
	    	            "label": "Rename",
	    	            "action": function (obj) {
	    	            	console.log("obj",obj)
	    	                tree.edit(node);
	    	                
	    	                console.log(node.id,node.text)
	    	                that.data.forEach(function(r,i){
	    	                	if(r.nno==node.id){
	    	                		r.value=node.text
	    	                		console.log(r.value,node.text)
	    	                	}
	    	                })
	    	            }
	    	        },
	    	        "Remove": {
	    	            "separator_before": true,
	    	            "separator_after": false,
	    	            "label": "Remove",
	    	            "action": function (obj) { 
	    	            	if(confirm('Are you sure to remove this category?')){
	    	            		tree.delete_node(node);
	    	            	}
	    	            }
	    	        }	        
	    		}
	    		
	    	}
	    } */
	    });
	
		$("#poll_org_popup .popup_body").on("ready.jstree",function(){
			$("#poll_org_popup .popup_body").jstree(true).close_all();
			$("#poll_org_popup .popup_body").jstree(true).deselect_all();
		/* 	$('#poll_org_popup .popup_body').on("select_node.jstree", function (e, data) {
				  if(data.node.children.length>0){
					  	  	return true;
					}else{
						getOrgData(data.selected);						  	
					}
			});
 */		})
}

</script>