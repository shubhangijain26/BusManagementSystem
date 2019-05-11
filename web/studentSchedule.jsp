<%@page import="Modal.BusAdd"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<html>
  <head>
    <title>View Schedules</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



    <link rel="stylesheet" href="animate.css">
    <link href="homestyle.css" rel="stylesheet">


    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>


  <body>
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Bus Management site</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li class="active"><a href="homeStudent.jsp">Home</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
           <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome  Student</a></li>
           <li><a href="index.html"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
          </ul>
        </div>
      </div>
      </nav>

      <script>
    $(document).ready(function () {
        console.log("-> " + window.location.pathname);
        if (window.location.pathname == "/eprofile" || window.location.pathname == "/uprofile" || window.location.pathname == "/upload") {
            $("[href='/home']").addClass('active');
        }
        if (window.location.pathname == "/edit_user") {
            $("[href='/ulist']").addClass('active');
        }
    });
</script>

      <script>
          $(document).ready(function () {
              $(".sidebar a").each(function () {
                  console.log($(this).attr('href'));
                  if ((window.location.pathname.indexOf($(this).attr('href'))) > -1) {
                      $(this).addClass('active');
                  }
              });
          });
      </script>


      <div class="container-fluid text-center">
        <div class="row content">

            <div class="col-sm-2 sidebar text-center text-capitalize" style="padding-right: 0px;padding-left: 0px;">
             <a href="studentSchedule.jsp">View Schedules</a>
              <a href="studentSearch.jsp">Search for a Schedule</a>
            </div>



      <div class="col-sm-10 container content" style="margin-top:50px;">
            <h1 style="margin-bottom:40px">View details of bus and routes</h1>


            
<script>  
 
var req=new XMLHttpRequest(); 
function sendBus()  
{  
    
 
var url="viewStudent.jsp";

try  
{  
req.onreadystatechange=getDisp;  
req.open("GET",url,true);  
req.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
 
function getDisp(){ 
    
if(req.readyState==4){    
    var result=req.responseText;
document.getElementById('disp').innerHTML=result;  
}  
}  
  
</script>

              <button type="button" class="btn btn-info" onclick="sendBus()" >view schedules</button>
                <br>
                 <span id="disp"></span>

           </div>  <!--  10 container -->


        </div>

      </div>





    </body>
    </html>
