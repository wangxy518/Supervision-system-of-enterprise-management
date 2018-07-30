<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style>
body{
padding:20px;
}
</style>
</head>
<body>
 <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
<script type="text/javascript" src="js/echarts.js"></script>
<div style="overflow:hidden">
<form action="importExcel" id="myform" name="myform" method="post"
				enctype="multipart/form-data">
				<span style="float:left;margin-right:10px;">报表日期</span><input type="text" id="datepicker" name="datepicker" style="float:left;font-size:17px;width:120px;">
					<input type="file" style="display:none" name="excelfile" id="excelfile" class="excelfile" onchange="document.getElementById('upfileResult').innerHTML=this.value"/>
				</form>
<div id="chooseFile" style="width:100px;float:left;height:28px;margin-left:10px;background:rgb(84,185,215);border-radius:3px;color:white;text-align:center;line-height:28px;cursor:pointer">选择文件</div><span class="tip" id="upfileResult" style="float:left;margin-left:10px; line-height:30px;color:red">选择xlsx后缀的excel文件</span>
<div id="update" style="width:100px;float:left;height:28px;margin-left:30px;background:rgb(84,185,215);border-radius:3px;color:white;text-align:center;line-height:28px;cursor:pointer">上传</div>
</div>
<div style="overflow:hidden">
<h3>政企客户渠道总体收入情况</h3>
<div id="TotalIncomeTrend" style="height:270px;width: 600px;padding: 20px;float:left;"></div>
<div id="TotalTongbiTrend" style="height:270px;width: 600px;padding: 20px;float:left;"></div>
</div>

<div style="overflow:hidden">
<div style="overflow:hidden">
<h3 style="float:left">新兴ICT收入情况</h3>
<select id="ICTselect" style="float:left;margin-top:20px;margin-left:30px; font-size:15px;height:25px;">
  <option value ="1">新兴ICT</option>
  <option value ="11">物联网</option>
  <option value ="12">大数据</option>
  <option value="13">IT服务</option>
  <option value="14">IDC</option>
  <option value="15">云计算（含CDN）</option>
</select>
</div>
<div id="ICTIncomeTrend" style="height:270px;width: 600px;padding: 20px;float:left;"></div>
<div id="ICTTongbiTrend" style="height:270px;width: 600px;padding: 20px;float:left;"></div>
</div>

<div style="overflow:hidden">
<h3 style="">移网基础业务收入情况</h3>
<div id="MIncomeTrend" style="height:270px;width: 600px;padding: 20px;float:left;"></div>
<div id="MTongbiTrend" style="height:270px;width: 600px;padding: 20px;float:left;"></div>
</div>

<div style="overflow:hidden">
<div style="overflow:hidden">
<h3 style="float:left">固网基础业务收入情况</h3>
<select id="Gselect" style="float:left;margin-top:20px;margin-left:30px; font-size:15px;height:25px;">
<option value ="3">固网基础业务</option>
  <option value ="31">互联网业务</option>
  <option value ="32">固话</option>
  <option value ="33">数据网元 </option>
  <option value="34">分摊固网其他收入</option>
</select>
</div>
<div id="GIncomeTrend" style="height:270px;width: 700px;padding: 20px;float:left;"></div>
<div id="GTongbiTrend" style="height:270px;width: 700px;padding: 20px;float:left;"></div>
</div>
<script>
function fix(num, length) {
	return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
}
$(document).ready(
		function() {
			var flag = 1;
			var now = new Date();
		    var str = fix((now.getMonth()),2) + "/" + fix(now.getDate(),2) + "/" + now.getFullYear();
		    
			$("#datepicker" ).datepicker();
			$("#datepicker" ).val(str);
			$('#chooseFile').click(function() {
				$('#excelfile').click()
			})
			$('#update').click(function() {
				if(flag == 2) {
					return;
				}
				flag = 2;
				$('#update').text('报表解析中...')
				$('#myform').submit();
			})
			var option = {
			        // 标题
			        title: {
			            text: '累计收入(亿元)'
			        },
			        grid: {
			            left: '3%',   //图表距边框的距离
			            right: '4%',
			            bottom: '3%',
			            containLabel: true
			        },
			        legend: {
			            data:['2017年','2018年']
			        },
			        //x轴信息样式
			        xAxis: {
			            type: 'category',
			            boundaryGap: false,
			            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			        },
			        yAxis : [
			                 {
			                     type : 'value',
			                     axisLabel : {
			                         formatter: '{value}'
			                     }
			                 }
			        ],
			        series: [
			            {
			                name:'2017年',
			                type:'line',        
			                data:[],
			                label : {normal:{show: true}},
			            },
			            {
			                name:'2018年',
			                type:'line',
			                data:[],
			                label : {normal:{show: true}},
			            }
			        ]
			    };
			
			var optionTB = {
			        // 标题
			        title: {
			            text: '同比增幅'
			        },
			        grid: {
			            left: '3%',   //图表距边框的距离
			            right: '4%',
			            bottom: '3%',
			            containLabel: true
			        },
			        legend: {
			            data:['2017年','2018年']
			        },
			        //x轴信息样式
			        xAxis: {
			            type: 'category',
			            boundaryGap: false,
			            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			        },
			        yAxis : [
			                 {
			                     type : 'value',
			                     axisLabel : {
			                         formatter: '{value}%'
			                     }
			                 }
			        ],
			        series: [
			            {
			                name:'2017年',
			                type:'line',   
			                data:[],
			                label : {normal:{show: true,formatter: function(data) {
			                	return data.value + "%"
			                }},},
			       
			            },
			            {
			                name:'2018年',
			                type:'line',
			                data:[],
			                label : {normal:{show: true,formatter: function(data) {
			                	return data.value + "%"
			                }},},
			            }
			        ]
			    };
			$.ajax({
				   type:"get",//请求方式
				   url:"/JKJY/nationtotal",//发送请求地址
				   dataType: "json",
				   data:{//发送给数据库的数据
				   },
				   //请求成功后的回调函数有两个参数
				   success:function(data){
					   var income2017 = new Array();
					   var income2018 = new Array();
					   var tongbi2017 = new Array();
					   var tongbi2018 = new Array();
					   for(var i = 0;i < 12;i++) {
						   income2017.push(data[i].income);
						   tongbi2017.push(data[i].tongbiIncrease);
					   }
					   for(var i = 12;i < data.length;i++) {
						   income2018.push(data[i].income);
						   tongbi2018.push(data[i].tongbiIncrease);
					   }
					   var myChart = echarts.init(document.getElementById("TotalIncomeTrend"));
					   option.series[0].data = income2017;
					   option.series[1].data = income2018;
					    myChart.setOption(option);
					    var myChartTB = echarts.init(document.getElementById("TotalTongbiTrend"));
					    optionTB.series[0].data = tongbi2017;
					    optionTB.series[1].data = tongbi2018;
						myChartTB.setOption(optionTB);
				   },error:function(e) {
					   alert("error");
				   }
				   })
				   
				   var nationSubjectTotaldata = '';
				   $('#ICTselect').change(function() {
					   var tmpval = $('#ICTselect').val();
					   var tmpname = $('#ICTselect').text();
					   var tmpdata = '';
					   if(tmpval == 1) {
						   tmpdata = nationSubjectTotaldata.ICTlist;
					   } else if(tmpval == 11) {
						   tmpdata = nationSubjectTotaldata.WLWlist;
					   } else if(tmpval == 12) {
						   tmpdata = nationSubjectTotaldata.DSJlist;
					   } else if(tmpval == 13) {
						   tmpdata = nationSubjectTotaldata.ITlist;
					   } else if(tmpval == 14) {
						   tmpdata = nationSubjectTotaldata.IDClist;
					   } else if(tmpval == 15) {
						   tmpdata = nationSubjectTotaldata.YJSlist;
					   }
					   var ictincome2017 = new Array();
					   var ictincome2018 = new Array();
					   var icttongbi2017 = new Array();
					   var icttongbi2018 = new Array();
					   for(var i = 0;i < 12;i++) {
						   ictincome2017.push(tmpdata[i].income);
						   icttongbi2017.push(tmpdata[i].tongbiIncrease);
					   }
					   for(var i = 12;i < tmpdata.length;i++) {
						   ictincome2018.push(tmpdata[i].income);
						   icttongbi2018.push(tmpdata[i].tongbiIncrease);
					   }
					   option.series[0].data = ictincome2017;
					   option.series[1].data = ictincome2018;
					   var charttmp = echarts.getInstanceByDom(document.getElementById("ICTIncomeTrend"));
					   charttmp.setOption(option);
					   
					   optionTB.series[0].data = icttongbi2017;
					   optionTB.series[1].data = icttongbi2018;
					   charttmp = echarts.getInstanceByDom(document.getElementById("ICTTongbiTrend"));
					   charttmp.setOption(optionTB);
				   })
				   
				   $.ajax({
				   type:"get",//请求方式
				   url:"/JKJY/nationSubjectTotal",//发送请求地址
				   dataType: "json",
				   data:{//发送给数据库的数据
				   },
				   //请求成功后的回调函数有两个参数
				   success:function(data){
					   nationSubjectTotaldata = data;
					   var ictincome2017 = new Array();
					   var ictincome2018 = new Array();
					   var icttongbi2017 = new Array();
					   var icttongbi2018 = new Array();
					   for(var i = 0;i < 12;i++) {
						   ictincome2017.push(nationSubjectTotaldata.ICTlist[i].income);
						   icttongbi2017.push(nationSubjectTotaldata.ICTlist[i].tongbiIncrease);
					   }
					   for(var i = 12;i < nationSubjectTotaldata.ICTlist.length;i++) {
						   ictincome2018.push(nationSubjectTotaldata.ICTlist[i].income);
						   icttongbi2018.push(nationSubjectTotaldata.ICTlist[i].tongbiIncrease);
					   }
					   option.series[0].data = ictincome2017;
					   option.series[1].data = ictincome2018;
					   var ICTmyChart = echarts.init(document.getElementById("ICTIncomeTrend"));
					   ICTmyChart.setOption(option);
					    
					    var ICTmyChartTB = echarts.init(document.getElementById("ICTTongbiTrend"));
					    optionTB.series[0].data = icttongbi2017;
					    optionTB.series[1].data = icttongbi2018;
						ICTmyChartTB.setOption(optionTB);
						   
						   var mincome2017 = new Array();
						   var mincome2018 = new Array();
						   var mtongbi2017 = new Array();
						   var mtongbi2018 = new Array();
						   for(var i = 0;i < 12;i++) {
							   mincome2017.push(nationSubjectTotaldata.YWJClist[i].income);
							   mtongbi2017.push(nationSubjectTotaldata.YWJClist[i].tongbiIncrease);
						   }
						   for(var i = 12;i < nationSubjectTotaldata.YWJClist.length;i++) {
							   mincome2018.push(nationSubjectTotaldata.YWJClist[i].income);
							   mtongbi2018.push(nationSubjectTotaldata.YWJClist[i].tongbiIncrease);
						   }
						   
						   var MmyChart = echarts.init(document.getElementById("MIncomeTrend"));
						   option.series[0].data = mincome2017;
						   option.series[1].data = mincome2018;
						    MmyChart.setOption(option);
						    var MmyChartTB = echarts.init(document.getElementById("MTongbiTrend"));
						    optionTB.series[0].data = mtongbi2017;
						    optionTB.series[1].data = mtongbi2018;
							   MmyChartTB.setOption(optionTB);
							   var gincome2017 = new Array();
							   var gincome2018 = new Array();
							   var gtongbi2017 = new Array();
							   var gtongbi2018 = new Array();
							   for(var i = 0;i < 12;i++) {
								   gincome2017.push(nationSubjectTotaldata.GWJClist[i].income);
								   gtongbi2017.push(nationSubjectTotaldata.GWJClist[i].tongbiIncrease);
							   }
							   for(var i = 12;i < nationSubjectTotaldata.GWJClist.length;i++) {
								   gincome2018.push(nationSubjectTotaldata.GWJClist[i].income);
								   gtongbi2018.push(nationSubjectTotaldata.GWJClist[i].tongbiIncrease);
							   }
							   
							   var GmyChart = echarts.init(document.getElementById("GIncomeTrend"));
							   option.series[0].data = gincome2017;
							   option.series[1].data = gincome2018;
							    GmyChart.setOption(option);
							    var GmyChartTB = echarts.init(document.getElementById("GTongbiTrend"));
							    optionTB.series[0].data = gtongbi2017;
							    optionTB.series[1].data = gtongbi2018;
								   GmyChartTB.setOption(optionTB);
				   },error:function(e) {
					   alert("error");
				   }
				   })
				   
				    $('#Gselect').change(function() {
					   var tmpval = $('#Gselect').val();
					   var tmpname = $('#Gselect').text();
					   var tmpdata = '';
					   if(tmpval == 3) {
						   tmpdata = nationSubjectTotaldata.GWJClist;
					   } else if(tmpval == 31) {
						   tmpdata = nationSubjectTotaldata.HLWlist;
					   } else if(tmpval == 32) {
						   tmpdata = nationSubjectTotaldata.GHlist;
					   } else if(tmpval == 33) {
						   tmpdata = nationSubjectTotaldata.SJDYlist;
					   } else if(tmpval == 34) {
						   tmpdata = nationSubjectTotaldata.QTlist;
					   }
					   var gincome2017 = new Array();
					   var gincome2018 = new Array();
					   var gtongbi2017 = new Array();
					   var gtongbi2018 = new Array();
					   for(var i = 0;i < 12;i++) {
						   gincome2017.push(tmpdata[i].income);
						   gtongbi2017.push(tmpdata[i].tongbiIncrease);
					   }
					   for(var i = 12;i < tmpdata.length;i++) {
						   gincome2018.push(tmpdata[i].income);
						   gtongbi2018.push(tmpdata[i].tongbiIncrease);
					   }
					   option.series[0].data = gincome2017;
					   option.series[1].data = gincome2018;
					   var charttmp = echarts.getInstanceByDom(document.getElementById("GIncomeTrend"));
					   charttmp.setOption(option);
					   optionTB.series[0].data = gtongbi2017;
					   optionTB.series[1].data = gtongbi2018;
					   charttmp = echarts.getInstanceByDom(document.getElementById("GTongbiTrend"));
					   charttmp.setOption(optionTB);
				   })
		}
)
</script>
</body>
</html>