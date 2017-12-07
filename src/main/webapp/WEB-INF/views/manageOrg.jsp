<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/header"  flush="false" />
<style>
.panel-body { padding:50px 90px; }
input[type=text] { width:100%; }

.btn-file {
  position: relative;
  overflow: hidden;
  background-color:#d7d7d7;
  
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  background: red;
  cursor: inherit;
  display: block;
}
input[readonly] {
  background-color: white !important;
  cursor: text !important;
  width:683px!important; margin-right:6px; border-radius:4px !important;
  
}
.panel-heading { height:56px; line-height:36px; font-size:16px; }
.btn_download { width:148px; height:48px; margin-bottom:20px; font-size:14px; }
p { margin-bottom:9px; }
.arrow { width:40px; height:37px; margin-top:170px; }
.table>thead>tr>th { color:#638ecd; font-weight:normal; }
.table>tbody>tr>td { border:0; vertical-align:middle; }
.table>tbody>tr>td:first-child { border-right:2px solid #ddd; }
.table_wrap .table_header th:first-child { width:94px; border-right:2px solid #ddd; }
.table_wrap .table_body { height:250px; overflow-y:auto; }
.btn_wrap { margin:30px 0 0 70px; }
#tree { border:1px solid #ddd; height:300px; overflow-y:auto; padding-left:25px; }

input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label {
	font-weight:400;
	height:20px;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:11px;
    height:11px;
    margin:7px 5px 0 5px;
    vertical-align:middle;
    background:url('${pageContext.request.contextPath}/resources/images/checkbox_off.png') 0 top no-repeat;
    cursor:pointer;
    background-size : 11px 11px;
}

input[type="checkbox"]:checked + label span {
    background:url('${pageContext.request.contextPath}/resources/images/checkbox_on.png') 0 top no-repeat;
    background-size : 11px 11px;
}

</style>

<div class="contents_wrap">
	<div class="w970">
		<div class="page_title text-center">관계도 관리</div>
		<button class="btn btn_aqua btn_download pull-right">샘플 다운로드</button>
		<div class="clearfix"></div>
		<div class="panel panel-default" style="margin-bottom:49px;">
			<div class="panel-heading text-center">관계도 등록</div>
			<div class="panel-body">
			<!-- file upload -->
			<p>파일업로드</p>
			
			<form enctype="multipart/form-data" name="excelUpload" method="post" id="uploadForm">
		        <div class="input-group">
		            <input type="text" class="form-control" readonly>
					<span class="input-group-btn">
					    <span class="btn btn-file" style="border-radius:4px;">
					        Choose File<input type="file" single id="excelFile" name="excelFile">
					    </span>
					</span>            
		        </div>			
				<p style="margin-top:29px;">관계도 이름</p>
				<input type="text" id="fileName" name="fileName">
				<input type="submit" id="btn_formSubmit" class="btn active btn_blue" style="width:136px; height:36px; margin:30px 325px 0 325px;" value="관계도 등록">
			</form>
				
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading text-center">관계도 확인</div>
			<div class="panel-body" style="height:445px;">
				<div class="col-md-5">
					<div class="table_wrap">
						<div class="table_header">
							<table class="table text-center" style="margin-bottom:0;">
								<thead>
									<tr>
										<th style="width:"></th>
										<th class="text-center">관계도 이름</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table_body">
							<table class="table text-center">
								<tbody></tbody>
							</table>
						</div>
					</div>
					<div class="btn_wrap">
						<div class="btn btn_blue pull-left btn_edit">확인</div>
						<div class="btn btn_blue pull-left btn_delete">삭제</div>
					</div>
				</div>
				<div class="col-md-2 text-center">
					<img class="arrow" src="${pageContext.request.contextPath}/resources/images/arrow.png">
				</div>
				<div class="col-md-5">
					<div id="tree"></div>
					<!-- <div class="btn_wrap">
						<button class="btn btn_blue btn_editComplete">수정완료</button>
					</div>	 -->				
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer"  flush="false" />

<script>
$(function(){
	manageOrg.init();
});

var manageOrg = {};
manageOrg.init = function(){
	var that = this;
	that.getOrgList();
	that.listener();
	
};

//조직도 리스트 호출
manageOrg.getOrgList = function(){

	var that = this;
	var ajaxData = {};
	var mno = sessionStorage.mno;
	var html ="";
	
	$.ajax({
	  	url : base_url + "diagram/list/"+mno,
	  	data : ajaxData,
	  	type : "GET",
	  	success : function(res){
	  		console.log("=====getOrgList=====", res);
	  		if(res.length>0){
		  		res.forEach(function(r,i){
			  		html += "<tr>"
		  			html += "	<td rdno="+r.rdno+">"
		  			html += "		<input type='checkbox' id='c"+r.rdno+"' name='cc' />"
	  				html += "		<label for='c"+r.rdno+"'><span></span></label>"
		  			html += "	</td>"
		  			html += "	<td>"+r.name+"</td>"
		  			html += "</tr>"
		  		})
	  		}else{
	  			html += "<tr>"
	  			html += "<td colspan='2'>조직도를 등록해보세요!</td>"
	  			html += "</tr>"	  			
	  		}
  			$(".table_wrap tbody").html("")
  			$(".table_wrap tbody").append(html);
  			$(".table_header .table th:first-child").css ('width', $(".table>tbody>tr>td:first-child")[0].offsetWidth); 
	  		that.listener();
	  	},
	 	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	  });
};

//수정할 tree 데이터 호출
manageOrg.editOrg = function(num){
	var that = this;
	
	$.ajax({
	  	url : base_url + "diagram/"+num,
	  	data : {},
	  	type : "GET",
	  	dataType:"json",
	  	success : function(res){
	  		console.log("=====editOrg=====", res);
	  		that.drawOrgTree(res.nodes);

	  	},
	  	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	  });
	
	
}
manageOrg.drawOrgTree = function(nodeData){
	
	$("#tree").jstree('destroy');
	
	var that = this;
	var treeData = [];
	nodeData.forEach(function(r,i){
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
	console.log("treeData::::::",treeData);
	$('#tree').jstree({
		
		'checkbox' : {
			"keep_selected_style" :false,
		},
		'core' : {
		    'data' : function(node, cb){ cb(treeData) },
		    'multiple' : false,
		    'check_callback' : true,
		    
		},
		'plugins':['checkbox','search','contextmenu'],
	});
	$("#tree").jstree('open_all')
};

manageOrg.deleteOrg = function(num){
	var that = this;
	
	$.ajax({
	  	url : base_url + "diagram/"+num,
	  	data : {},
	  	type : "DELETE",
	  	dataType:"text",
	  	success : function(res){
	  		console.log("=====deleteOrg=====", res);
	  		location.reload(true);
	  	},
	  	error : function(err){
	  		 console.log("ERROR!!", err);
	  	}
	  });
	
};
manageOrg.listener = function(){
	var that = this;
	
	$(window).resize(function(){
		$(".table_header .table th:first-child").css ('width', $(".table>tbody>tr>td:first-child")[0].offsetWidth); 
	});
	$(document).on('change', '.btn-file :file', function() {
	 var input = $(this),
	     numFiles = input.get(0).files ? input.get(0).files.length : 1,
	     label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	 	input.trigger('fileselect', [numFiles, label]);
	});
	
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;
        
        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }
        
    });

    $(".btn_edit").off('click').on('click',function(){
    	if($(".table_wrap td input:checked").length != 1){
    		alert("확인할 관계도를 선택해주세요.")
    	}else{
	    	var num = $(".table_wrap td input:checked").parent().attr('rdno');
	    	$("#tree").html("")
	    	that.editOrg(num);
    	}
    	
    });
    $(".btn_delete").off('click').on('click',function(){
    	var num = $(".table_wrap td input:checked").parent().attr('rdno')*1;
    	console.log("rdno",num)
    	that.deleteOrg(num);

    	
    });
    
    
	$('.table_wrap input[type=checkbox]').on('change',function(){
		
		var size = $('.table_wrap input[type=checkbox]:checked').length;
		
		if(size>1){
			$('.table_wrap input[type=checkbox]').prop('checked',false);
			$(this).prop('checked',true);
		}
		
		if($('.table_wrap input[type=checkbox]').is(':checked')){
		}
		
	});
	
	$(".btn_download").off("click").on("click",function(){
		location.href="${pageContext.request.contextPath}/diagram/download/"
	});
	
	$(".btn_editComplete").off('click').on("click",function(){
		console.log($("#tree").jstree(true).get_json());
	});
	
	$("#btn_formSubmit").off('click').on('click',function(event){
		//stop submit the form, we will post it manually.
        event.preventDefault();
		
		var form = $('#uploadForm')[0];
		var data = new FormData(form);
		
		 $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url:  base_url +"diagram/excel/"+sessionStorage.mno,
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            dataType:'text',
	            timeout: 600000,
	            success: function (data) {
	                console.log("SUCCESS : ", data);
	                $("#btn_formSubmit").prop("disabled", false);
	               	location.href="${pageContext.request.contextPath}/manageOrg"

	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	                $("#btn_formSubmit").prop("disabled", false);

	            }
	        });
		
	})
	}
</script>