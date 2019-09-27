<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
window.onload = function () {
var chart = new CanvasJS.Chart("chartContainer", {
	title: {
		text: "Stock Comparison Graph"
	},
	axisX: {
		valueFormatString: "MMM YYYY"
	},
	axisY2: {
		title: "Stock Price",
		prefix: "\u20B9",
		suffix: "K"
	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		verticalAlign: "top",
		horizontalAlign: "center",
		dockInsidePlotArea: true,
		itemclick: toogleDataSeries
	},
	data: [{
		type:"line",
		axisYType: "secondary",
		name: "U.P. Stock Exchange",
		showInLegend: true,
		markerSize: 0,
		yValueFormatString: "\u20B9 #,###k",
		dataPoints: [		
			{ x: new Date(2014, 00, 01), y: 850 },
			{ x: new Date(2014, 01, 01), y: 50 },
			{ x: new Date(2017, 05, 01), y: 1170 }
		]
	},
	{
		type: "line",
		axisYType: "secondary",
		name: "Vadodara Stock Exchange",
		showInLegend: true,
		markerSize: 0,
		yValueFormatString: "\u20B9 #,###k",
		dataPoints: [
			{ x: new Date(2014, 00, 01), y: 200 },
			{ x: new Date(2014, 01, 01), y: 1700 },
			{ x: new Date(2017, 05, 01), y: 30 }
		]
	},
	{
		type: "line",
		axisYType: "secondary",
		name: "Koyambtour Stock Exchange",
		showInLegend: true,
		markerSize: 0,
		yValueFormatString: "\u20B9 #,###k",
		dataPoints: [
			{ x: new Date(2014, 00, 01), y: 40 },
			{ x: new Date(2014, 01, 01), y: 415 },
			{ x: new Date(2017, 05, 01), y: 875 }
		]
	},
	{
		type: "line",
		axisYType: "secondary",
		name: "Meerut Stock Exchange",
		showInLegend: true,
		markerSize: 0,
		yValueFormatString: "\u20B9 #,###k",
		dataPoints: [
			{ x: new Date(2014, 00, 01), y: 529 },
			{ x: new Date(2017, 04, 01), y: 1749 },
			{ x: new Date(2017, 05, 01), y: 740 }
		]
	}]
});
chart.render();
function toogleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else{
		e.dataSeries.visible = true;
	}
	chart.render();
}
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>