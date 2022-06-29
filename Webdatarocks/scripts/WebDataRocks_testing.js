// <%
// JSP code
// long ts = (new Date()).getTime(); //Used to prevent JS/CSS caching
// %>

// ***********************************************************

var pivot = new WebDataRocks({
	// or can use ***container: "#wdr-component",***
  containter:"#pivot-container",  
	toolbar: true,
	height: 395,
	report: {
    dataSource: {
      filename: "https://cdn.webdatarocks.com/data/data.csv"
    }
  }
});