// Initialized arrays
let names = []
let greekNames = []
let romanNames = []
let greekSearchResults = []
let romanSearchResults = []

// For loop to populate arrays
//   HINT: you cand use my_arr.push(1) to insert 1 to the array `my_arr`
for (let i in searchResults) {
  row = searchResults[i];
  names.push(row.pair);
  greekNames.push(row.greekName);
  romanNames.push(row.romanName);
  greekSearchResults.push(row.greekSearchResults);
  romanSearchResults.push(row.romanSearchResults);
}

// Trace 1 for the Greek Data
let trace1 = {
  x: names,
  y: greekSearchResults,
  text: greekNames,
  name: "Greek",
  type: "bar"
};

// Trace 2 for the Roman Data
let trace2 = {
  x: names,
  y: romanSearchResults,
  text: romanNames,
  name: "Roman",
  type: "bar"
};

// Define data variable
let data = [trace1, trace2];

// Define the layout with a title and y-axis label
let layout = {
  title: "Greek vs Roman gods search results",
  yaxis: {
    title: "Search counts"
  }
};

// Render the plot to the div tag with id "plot"
Plotly.newPlot("plot", data, layout);