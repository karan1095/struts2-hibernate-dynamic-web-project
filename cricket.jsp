<%@page import="com.project.Cricket"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<s:head />
   
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	 
    	 dataTable = new google.visualization.DataTable();
   
          var newData = [
                         ['Teams', 'Matches Won','Matches Loss','Matches Tied','No Result'],
                         <c:forEach items="${crickets}" var="entry">
         				 [ '${entry.team_name}',${entry.match_win},${entry.match_loss},${entry.match_tied},${no_result}],
         				 </c:forEach>
          ];

          // determine the number of rows and columns.
          var numRows = newData.length;
          var numCols = newData[0].length;

          // in this case the first column is of type 'string'.
          dataTable.addColumn('string', newData[0][0]);

          // all other columns are of type 'number'.
          for (var i = 1; i < numCols; i++)
            dataTable.addColumn('number', newData[0][i]);           

          // now add the rows.
          for (var i = 1; i < numRows; i++)
            dataTable.addRow(newData[i]);            

        var options = {
          chart: {
            title: 'Team Performance',
            subtitle: 'Matches won by Teams: 2012-2016',
          },
          bars: 'vertical' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(dataTable, options);
      }
      
    </script>
   
</head>
<body>

 <div id="barchart_material" style="width: 500px; height: 500px;"></div>
 

 </body>
</html>



