<%@page import="Modal.BusAdd"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<html>
  <head>
    <title>Bus Management</title>

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
            <li class="active"><a href="home.jsp">Home</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
           <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome  Admin</a></li>
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
              <a href="bus.jsp">Bus Schedules</a>
              <a href="driver.jsp">Driver table</a>
              <a href="route.jsp">Manage routes</a>
              <a href="schedule.jsp">Manage Bus Schedule</a>
          </div>



      <div class="col-sm-10 container content" style="margin-top:50px;">
            <h1 style="margin-bottom:40px">Manage Bus Schedules</h1>


            <ul class="nav nav-pills nav-stacked">
              <li class="active"><a data-toggle="pill" href="#view">View All Buses</a></li>
              <li><a data-toggle="pill" href="#add">Add Bus</a></li>
              <li><a data-toggle="pill" href="#search">Search a Bus</a></li>
              <li><a data-toggle="pill" href="#delete">Edit or delete a Bus</a></l1>
            </ul>

        <div class="tab-content">
            
<script>  
 
var req=new XMLHttpRequest(); 
function sendBus()  
{  
    
 
var url="displayBus.jsp";

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

              <div id="view" class="tab-pane fade in active">
                <h1>Bus Informaton</h1>
                
                
                <button type="button" class="btn btn-info" onclick="sendBus()" >view buses</button>
                <br>
                 <span id="disp"></span>
          </div>

        <div id="add" class="tab-pane fade">
          <h1>Add Bus Informaton</h1>
           <div class="col-sm-3" ></div>
          <div class="col-sm-6">
              
              <form   action="addBusServlet" method="post" >
            <div class="form-group">
             <input type="text" required="" name="busid" class="form-control" id="username"  placeholder="Bus Id" onblur="myFunction()"><br>
            </div>
            <div class="form-group">
             <input type="text" required="" name="licence" class="form-control" maxlength="10" id="phone" placeholder="Licence Number"><br>
            </div>
            <div class="form-group">
             <input type="text" required="" name="color" class="form-control" placeholder="Color"><br>
           </div>
              <br>
              <div class="form-group" align="center">
                <input type="submit" value="Add Bus Info" class="btn btn-success">
                <a value="Cancel" class="btn btn-danger" href="bus.jsp">Cancel</a>
                </div>
              </form>
           </div>
          <div class="col-sm-3"></div>
          </div>
            
            
<script>  
 
var request=new XMLHttpRequest(); 
function sendInfo()  
{  

var v=document.vinform.t1.value;  
var url="displayAjax.jsp?x="+v;  
 
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
 
function getInfo(){ 
    
if(request.readyState==4){    
    var ans = request.responseText;
document.getElementById('searching').innerHTML=ans;  
}  
}  
  
</script> 

          <div id="search" class="tab-pane fade">
            <h1>Search for Bus</h1>
           
            <form name="vinform">
    <input style="background-color:white;color:#585858;padding:5px;margin-left: 120px;" type="text" name="t1" onkeyup="sendInfo()" placeholder="search for bus"  >
            </form>
            
            <span id="searching"></span>
          </div>


         <div id="delete" class="tab-pane fade">
             <br><br>
             

             
                <form   action="EditBusServlet" method="post" >
            <div class="form-group">
             <input type="text" required="" name="beid" class="form-control" id="username"  placeholder="Bus Id" onblur="myFunction()"><br>
            </div>
            <div class="form-group">
             <input type="text" required="" name="belicence"  class="form-control" maxlength="10" id="phone" placeholder="Licence Number"><br>
            </div>
            <div class="form-group">
             <input type="text" required="" name="becolor" class="form-control" placeholder="Color"><br>
           </div>
              <br>
              <div class="form-group" align="center">
                <input type="submit" value="Edit bus" class="btn btn-success">
                <a value="Cancel" class="btn btn-danger" href="bus.jsp">Cancel</a>
                </div>
              </form>
             <br><br>
                
             <h1>Delete bus</h1>
             
             <form   action="deleteBusServlet" method="post" >
            <div class="form-group">
             <input type="text" required="" name="bdel" class="form-control"  placeholder="BUS Id" ><br>
            </div>
            <input type="submit" value="Delete Bus" class="btn btn-danger">
            </form>
             
         </div>
           <br><br>

                <br><br><br>
            </div>            <!-- tab content -->

           </div>  <!--  10 container -->


        </div>

      </div>





    </body>
    </html>
