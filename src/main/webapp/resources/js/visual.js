var visual = {};

visual.barChart = function(target,xAxisData,seriesData){
	
	var myChart = echarts.init($(target)[0]);
	var option = {
			color: ['#4e85ff'],
		    calculable : true,
		    grid : {
		    	x:50,y:50,x2:50,y2:30
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{b} : {c} "
		    },		    
		    toolbox:{
		    	show:true,
		    	zlevel:1,
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : xAxisData,
		            axisLine : {
		            	lineStyle : { color:'gray', width:1 }
		            },
		            axisTick : { show:false },
		            splitLine : { show:false }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLine : {
		            	show:false,
		            	lineStyle: { color:'gray', width:1 }
		            },
		            splitLine : { show:false }
		        }
		    ],
		    series : [
		        {
//		            name:'설문참여자',
		            type:'bar',
		            data:seriesData,
		        }
	        ]
	}
	
	myChart.setOption(option);
	
	
};

visual.pieChart = function(target, graphData){
	var myChart = echarts.init($(target)[0]);
	var option = {
		    tooltip : {
		        trigger: 'item',
		        formatter: "{b} : {c} 명 ({d}%)"
		    },
//		    legend: {
//		        orient : 'horizontal',
//		        x : 'left',
//		        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
//		    },
		    calculable : true,
		    series : [
		        {
//		            name:'설문참여인원',
		            type:'pie',
		            radius : ['50%', '70%'],
		            itemStyle : {
		                normal : {
		                    label : {
		                        show : false
		                    },
		                    labelLine : {
		                        show : false
		                    }
		                },
		                emphasis : {
		                    label : {
		                        show : true,
		                        position : 'center',
		                        textStyle : {
		                            fontSize : '30',
		                            fontWeight : 'bold'
		                        }
		                    }
		                }
		            },
		            data:graphData
		        }
		    ]
		};
		                    
	
	myChart.setOption(option);
};

visual.forceChart = function(target,nodeData,edgeData){

	var cy = cytoscape({
		  container: $(target),

		  boxSelectionEnabled: false,
		  autounselectify: true,

		  style: cytoscape.stylesheet()
		    .selector('node')
		      .css({
//		    	'shape': 'data(faveShape)',
		        'content': 'data(name)',
		        'text-valign': 'center',
		        'color': 'white',
		        'text-outline-width': 1,
		        'background-color': 'darkslategrey',
		        'text-outline-color': 'darkslategrey'
		      })
		    .selector('edge')
		      .css({
		        'curve-style': 'bezier',
		        'target-arrow-shape': 'triangle',
		        'target-arrow-color': '#ccc',
		        'line-color': '#ccc',
		        'width': function(ele){ return ele.data('weight')}
//		        	'width': 'data(weight)'
		      })
		    .selector(':selected')
		      .css({
		        'background-color': 'black',
		        'line-color': 'black',
		        'target-arrow-color': 'black',
		        'source-arrow-color': 'black'
		      })
		    .selector('.faded')
		      .css({
		        'opacity': 0.25,
		        'text-opacity': 0
		      }),

		  elements: {
		    nodes: nodeData,
		    edges: edgeData,
		  },

		  layout: {
		    name: 'circle',
		    padding: 10
		  }
		});

		cy.on('tap', 'node', function(e){
		  var node = e.cyTarget;
		  var neighborhood = node.neighborhood().add(node);

		  cy.elements().addClass('faded');
		  neighborhood.removeClass('faded');
		});

		cy.on('tap', function(e){
		  if( e.cyTarget === cy ){
		    cy.elements().removeClass('faded');
		  }
		});
};