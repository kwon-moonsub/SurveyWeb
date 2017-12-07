var survey = {};

window.survey = window.survey || survey

survey.addChoiceSurvey = function(num,target){
	var html =""
		html += " <div class='panel panel-default' type='choice' index='ques_"+num+"'>"
		html += " 	<div class='panel-heading'>"
		html += "         <h3 class='panel-title pull-left' role='panel'>Q1.What's your favorite color?</h3>"
		html += " 		<div class='btn-toolbar pull-right'>"
		html += " 		  <div class='btn-group'>"
		// html += " 			<button class='btn btn-default btn_copy'><span class='glyphicon glyphicon-plus-sign' aria-hidden='true'></span></button>"
		html += " 			<button class='btn btn-default btn_remove'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>"
		html += " 		  </div>"
		html += " 		</div>"
		html += " 		<div class='clearfix'></div>"
		html += " 	</div>"
		html += " 	<div class='panel-body'>"
		html += "		<input type='radio'> 보기1</br></br>"
		html += "		<input type='radio'> 보기2</br></br>"
		html += "		<input type='radio'> 보기3</br>"
		html += ""
		html += ""

		html += "	</div>" 		
		html += " </div>"		
		$(target).append(html);
}

survey.addDescSurvey = function(num,target){
	var html =""
		html += " <div class='panel panel-default' type='desc' index='ques_"+num+"'>"
		html += " 	<div class='panel-heading'>"
		html += "         <h3 class='panel-title pull-left' role='panel'>Q1.What's your favorite color?</h3>"
		html += " 		<div class='btn-toolbar pull-right'>"
		html += " 		  <div class='btn-group'>"
		// html += " 			<button class='btn btn-default btn_copy'><span class='glyphicon glyphicon-plus-sign' aria-hidden='true'></span></button>"
		html += " 			<button class='btn btn-default btn_remove'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>"
		html += " 		  </div>"
		html += " 		</div>"
		html += " 		<div class='clearfix'></div>"
		html += " 	</div>"
		html += " 	<div class='panel-body'>"
		html += "		<textarea class='col-md-12'></textarea>"
		html += ""
		html += ""
		html += ""
		html += ""

		html += "	</div>"
		html += " </div>"		
	$(target).append(html)
}

survey.addRelSurvey = function(num,target){
	var html =""
		html += " <div class='panel panel-default' type='rel' index='ques_"+num+"'>"
		html += " 	<div class='panel-heading'>"
		html += "         <h3 class='panel-title pull-left' role='panel'>Q1.What's your favorite color?</h3>"
		html += " 		<div class='btn-toolbar pull-right'>"
		html += " 		  <div class='btn-group'>"
		// html += " 			<button class='btn btn-default btn_copy'><span class='glyphicon glyphicon-plus-sign' aria-hidden='true'></span></button>"
		html += " 			<button class='btn btn-default btn_remove'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>"
		html += " 		  </div>"
		html += " 		</div>"
		html += " 		<div class='clearfix'></div>"
		html += " 	</div>"
		html += " 	<div class='panel-body'>"
		html += "		<select class='pull-left'>"
		html += "			<option>보기1</option>"
		html += "			<option>보기2</option>"
		html += "			<option>보기3</option>"		
		html += "		</select>"
		html += "		<div class='pull-left text-center'>"
		html += "			<div class='pull-left card'>1</div>"
		html += "			<div class='pull-left card'>2</div>"
		html += "			<div class='pull-left card'>3</div>"
		html += "			<div class='pull-left card'>4</div>"
		html += "			<div class='pull-left card'>5</div>"
		html += "			<div class='pull-left card'>6</div>"
		html += "			<div class='pull-left card'>7</div>"
		html += "			<div class='pull-left card'>8</div>"
		html += "			<div class='pull-left card'>9</div>"
		html += "			<div class='pull-left card'>10</div>"
		html += "		</div>"
		html += "		<div class='clearfix'></div>"
		html += ""
		html += ""
		html += ""
		html += "	</div>"
		html += " </div>"		
	$(target).append(html)

	
	

}

//div 안에서 위아래로 위치변경
survey.moveSurvey = function(target){

	$(target).sortable({
		axis:"y",
		containment:"parent",
		update : function(event,ui){
			var order = $(this).sortable('toArray',{attribute:'data-order'});
			console.log(order);
		}
	});
}
