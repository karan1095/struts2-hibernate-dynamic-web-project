<%@page import="com.project.Cricket"%>
<%@page import="com.project.India"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sports Dashboard</title>

<s:head />

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script type="text/javascript">
document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');
</script>

<script type="text/javascript">


google.load('visualization', '1.0', {'packages':['corechart']});
google.setOnLoadCallback(drawChart);
function drawChart() {
	 
	dataTable = new google.visualization.DataTable();

    var newData = [
                   ['Teams', 'Matches Won','Matches Loss','Matches Tied','No Result'],
                   <c:forEach items="${crickets}" var="entry">
   				 [ '${entry.team_name}',${entry.match_win},${entry.match_loss},${entry.match_tied},${entry.no_result}],
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

  
    var data = new google.visualization.DataTable();
    data.addColumn('string','Year');
    data.addColumn('number','Matches Won' );
    data.addColumn('number','Matches Loss' );
 
    data.addRows([
                  <c:forEach items="${indias}" var="entry">
				  	 [ '${entry.year}',${entry.match_win},${entry.match_loss}],
		 		  </c:forEach>
				]);
  
 
    
	 dataTable3 = new google.visualization.DataTable();
	   
     var newData3 = [
                    ['Players', 'Matches','Goals','Assist'],
                    <c:forEach items="${FootballPlayers}" var="entry">
    				 [ '${entry.player_name}',${entry.total_matches},${entry.goals},${entry.assist}],
    				 </c:forEach>
     ];

     // determine the number of rows and columns.
     var numRows = newData3.length;
     var numCols = newData3[0].length;

     // in this case the first column is of type 'string'.
     dataTable3.addColumn('string', newData3[0][0]);

     // all other columns are of type 'number'.
     for (var i = 1; i < numCols; i++)
       dataTable3.addColumn('number', newData3[0][i]);           

     // now add the rows.
     for (var i = 1; i < numRows; i++)
       dataTable3.addRow(newData3[i]);            


     var data_pie = google.visualization.arrayToDataTable([
                                                       ['Teams', 'win'],
                                                       <c:forEach items="${crickets}" var="entry">
                                                       ['${entry.team_name}',${entry.match_win}],
                                                       </c:forEach>
                                                     ]);
     
    var options = {
	        title: 'Team Performance : 2012-2016',
	        subtitle: 'Matches won by Teams: 2012-2016',
	        hAxis: {
	          title: 'Teams',
	      
	          viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          }
	        },
	        vAxis: {
	          title: 'Matches'
	        }
	      };

  var options2 = {
		 
		  title: 'Team india performance : 2012-2016',
	       
		  hAxis: {
	          title: 'Year'
	        },
	        vAxis: {
	          title: 'Matches'
	        },
	        colors: ['#a52714', '#097138'],
	       };

  var options3 = {
	        title: 'Top Players in past ten years',
	        
	        hAxis: {
	          title: 'Players',
	      
	         
	        },
	        vAxis: {
	          title: 'Matches'
	        }
	      };
  
  var options_pie = {
          title: 'Matches Won By Teams'
        };

  
  var chart1 = new google.visualization.ColumnChart(document.getElementById('barchart'));
  chart1.draw(dataTable, options);
 
  var chart2 = new google.visualization.LineChart(document.getElementById('line_top_x'));
  chart2.draw(data, options2);

  var chart3 = new google.visualization.ColumnChart(document.getElementById('barchart_material1'));
  chart3.draw(dataTable3, options3);
 
  var chart4 = new google.visualization.PieChart(document.getElementById('piechart'));
  chart4.draw(data_pie, options_pie);

 
}


</script>

   		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		

</head>
	
	<body style="background-image: url(/project1/WebContent/img/background.jpg);">
		<div class="container">
			<header class="clearfix">
				<h1>Sports Graphs And Charts</h1>
				<nav>
				</nav>
			</header>	
			<div id="tabs" class="tabs">
				<nav>
					<ul>
						<li><a href="#section-1" class="icon-shop"><span>Cricket</span></a></li>
						<li><a href="#section-2" class="icon-cup"><span>Football</span></a></li>
						<li><a href="#section-3" class="icon-food"><span>Athletics</span></a></li>
						<li><a href="#section-4" class="icon-lab"><span>SportsNews</span></a></li>
					</ul>
				</nav>
				<div class="content">
					
			   <section id="section-1">
					  <h5>Current Matches</h5>
					<table>
				<tr>
			    <td>
					 <!-- start feedwind code --><script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script><script type="text/javascript">(function() {var params = {rssmikle_url: "http://static.cricinfo.com/rss/livescores.xml",rssmikle_frame_width: "300",rssmikle_frame_height: "400",frame_height_by_article: "0",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "Cricket Live Score",rssmikle_title_link: "",rssmikle_title_bgcolor: "#9ACD32",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "#FFFFFF",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#0066FF",rssmikle_item_border_bottom: "on",rssmikle_item_description: "on",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "auto",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script><div style="font-size:10px; text-align:center; width:300px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;"></a><!--Please display the above link in your web page according to Terms of Service.--></div><!-- end feedwind code --><!--  end  feedwind code -->
					    </td>
			    <td>
			    <!-- start feedwind code --><script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script><script type="text/javascript">(function() {var params = {rssmikle_url: "http://feeds.feedburner.com/NDTV-Cricket",rssmikle_frame_width: "300",rssmikle_frame_height: "400",frame_height_by_article: "0",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "Cricket News",rssmikle_title_link: "",rssmikle_title_bgcolor: "#0066FF",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#0066FF",rssmikle_item_border_bottom: "on",rssmikle_item_description: "content_only",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "auto",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script><div style="font-size:10px; text-align:center; width:300px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;"></a><!--Please display the above link in your web page according to Terms of Service.--></div><!-- end feedwind code --><!--  end  feedwind code -->
			    </td>		    
		        </tr>
		        <tr>
					 <td>
					  <div id="barchart" style="width: 600px; height: 450px;"></div>
			         </td> 
			          <td>
			         <div id="line_top_x" style="width: 600px; height: 450px;"></div>
      				 </td>
      			</tr>
      			<tr>
      				<td>
      				<div id="piechart" style="width: 600px; height: 450px;"></div>
      				</td> 
      			
      				<td style="width: 550px; height: 400px;">
      			
      				<s:form action="addCricket">
 					<s:textfield name="player_name" label="Name"/>
 			    	<s:textfield name="total_matches" label="Matches"/>
  					<s:textfield name="match_win"  label="Win"/>
  					<s:textfield name="match_loss" label="Loss"/>
  			    	<s:textfield name="match_tied" label="Tied"/>
   			   		<s:textfield name="no_result"  label="No Result"/>
   				    <s:submit/>
   				    <hr/>
  			     	</s:form>
  
      			</td>
      			</tr>	  
				</table> 	
				</section>
				
				<section id="section-2">
		              
		        <div style="width: 700px; height: 550px;"> 
		             
 				<div id="barchart_material1" style="width: 700px; height: 550px;"></div>
 		      
		        </div>
		        </section>
					
				
				<section id="section-3">
					
				<jsp:include page="athletics.jsp" />		
						
				</section>
					
			 <section id="section-4">
				<table>
				<tr>
				<td>
			  <script type="text/javascript" src="http://output25.rssinclude.com/output?type=js&amp;id=1074807&amp;hash=39e41ec4d71a3c834c20d82da88efbf3"></script>			
			    </td>
			   
			    <td>
					    <!-- start feedwind code --><script type="text/javascript">document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script><script type="text/javascript">(function() {var params = {rssmikle_url: "http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/football/rss.xml",rssmikle_frame_width: "300",rssmikle_frame_height: "400",frame_height_by_article: "0",rssmikle_target: "_blank",rssmikle_font: "Arial, Helvetica, sans-serif",rssmikle_font_size: "12",rssmikle_border: "off",responsive: "off",rssmikle_css_url: "",text_align: "left",text_align2: "left",corner: "off",scrollbar: "on",autoscroll: "on",scrolldirection: "up",scrollstep: "3",mcspeed: "20",sort: "Off",rssmikle_title: "on",rssmikle_title_sentence: "",rssmikle_title_link: "",rssmikle_title_bgcolor: "#0066FF",rssmikle_title_color: "#FFFFFF",rssmikle_title_bgimage: "",rssmikle_item_bgcolor: "#FFFFFF",rssmikle_item_bgimage: "",rssmikle_item_title_length: "55",rssmikle_item_title_color: "#47A3DA",rssmikle_item_border_bottom: "on",rssmikle_item_description: "on",item_link: "off",rssmikle_item_description_length: "150",rssmikle_item_description_color: "#666666",rssmikle_item_date: "gl1",rssmikle_timezone: "Etc/GMT",datetime_format: "%b %e, %Y %l:%M %p",item_description_style: "text+tn",item_thumbnail: "full",item_thumbnail_selection: "auto",article_num: "15",rssmikle_item_podcast: "off",keyword_inc: "",keyword_exc: ""};feedwind_show_widget_iframe(params);})();</script><div style="font-size:10px; text-align:center; width:300px;"><a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a><!--Please display the above link in your web page according to Terms of Service.--></div><!-- end feedwind code --><!--  end  feedwind code -->
		        </td>
		        </tr>
		        </table>
 			 </section>
		</div>
		
		</div>
			
		</div>
		<script src="js/cbpFWTabs.js"></script>
		<script>
			new CBPFWTabs( document.getElementById( 'tabs' ) );
		</script>
	</body>
</html>
