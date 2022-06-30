var pivot = new WebDataRocks({
	// or can use ***container: "#wdr-component",***
  containter:"#wdr-component",  
	toolbar: true,
	height: 450,
  customizeCell: customizeCellFunction,
	report: {
    dataSource: {
      filename: "https://cdn.webdatarocks.com/data/data.csv"
  }
},

"slice": {
  "rows": [{
      "uniqueName": "Country"
  }],
  "columns": [{
          "uniqueName": "Category"
      },
      {
          "uniqueName": "Measures"
      }
  ],
  "measures": [{
      "uniqueName": "Price",
      "aggregation": "sum"
  }]
        },

//  add an event handler to the pivot instance -->
reportcomplete: function() {
    pivot.off("reportcomplete");
    createFusionChart();
    }

});

function createFusionChart() {
  var chart = new FusionCharts({
      "type": "stackedcolumn2d",
      "renderAt": "fusionchartContainer",
      "width": "100%",
      "height": 350
  });

  pivot.fusioncharts.getData({
      type: chart.chartType()
  }, function(data) {
      chart.setJSONData(data);
      chart.setChartAttribute("theme", "fusion"); // apply the FusionCharts theme
      chart.render();
  }, function(data) {
      chart.setJSONData(data);
      chart.setChartAttribute("theme", "fusion");
  });
}

// var pivotTableReportComplete = false;
// var googleChartsLoaded = false;

// google.charts.load('current', {
//   'packages':['corechart']
// });

// //  Set the onGoogleChartsLoaded() function as a callback to the google.charts event handler: -->
// google.charts.setOnLoadCallback(onGoogleChartsLoaded);


// function onGoogleChartsLoaded() {
    googleChartsLoaded = true;
    if (pivotTableReportComplete) {
        createBarChart();

    function createBarChart() {
          if (googleChartsLoaded) {
              pivot.googlecharts.getData({
                      type: "bar",

//     }
// }
// //  Define the createGoogleChart() and onGoogleChartsLoaded() functions: -->
// function createGoogleChart() {
// 	if (googleChartsLoaded) {

// 		pivot.googlecharts.getData({ 
//             type: "bar" 
//         },
// 			  drawChart,
// 			  drawChart
// 		);
// 	}
// }
// //  Write a function which is called once the data is ready or updated -->
// function drawChart(_data) {
//     var data = google.visualization.arrayToDataTable(_data.data);

//     var options = {
//         title: "Sample_1",
//         height: 300,
//         legend: {
//             position: 'top'
//         },
//         is3D: true
//     };
//     var chart = new google.visualization.PieChart(document.getElementById('googlechartContainer'));
//     chart.draw(data, options); 
//     }

  //   function customizeCellFunction(cell, data) {
  //     if (data.rows) {
  //         for (var i = 0; i < data.rows.length; i++) {
  //             if (data.rows[i]["hierarchyCaption"] == "Business Type" && data.rows[i]["caption"] == "Specialty Bike Shop") {
  //                 cell.attr["hierarchy"] = data.rows[i]["hierarchyCaption"];
  //                 cell.attr["member"] = data.rows[i]["caption"];
  //             } else if (data.rows[i]["hierarchyCaption"] == "Business Type" && data.rows[i]["caption"] == "Value Added Reseller") {
  //                 cell.attr["hierarchy"] = data.rows[i]["hierarchyCaption"];
  //                 cell.attr["member"] = data.rows[i]["caption"];
  //             } else if (data.rows[i]["hierarchyCaption"] == "Business Type" && data.rows[i]["caption"] == "Warehouse") {
  //                 cell.attr["hierarchy"] = data.rows[i]["hierarchyCaption"];
  //                 cell.attr["member"] = data.rows[i]["caption"];
  //             } 
  //         }
  //     }
  // }
  