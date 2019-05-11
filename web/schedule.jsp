<%@page import="Modal.RouteAdd"%>
<%@page import="Modal.DriverAdd"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
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
              <li class="active"><a data-toggle="pill" href="#manage">Manage Bus Schedule</a></li>
              <li><a data-toggle="pill" href="#view">View Schedule</a></li>
            </ul>

        <div class="tab-content">
            


              <div id="manage" class="tab-pane fade in active">
            
        
          <h1>Select the routes of bus</h1>
           <div class="col-sm-3" ></div>
          <div class="col-sm-6">
             
         <%
              Configuration cf = null;
              SessionFactory sf= null;
              Session sess1 = null;
              
         try
          {
            
        
        cf = new Configuration();
       cf.configure("cfgpackage/hibernate.cfg.xml");
       sf=cf.buildSessionFactory();
       sess1 = sf.openSession();
       
       Transaction tx = sess1.beginTransaction();
       Query Busquery = sess1.createQuery("from BusAdd");
       List<BusAdd> brecords = Busquery.list();
         
       Query Driverquery = sess1.createQuery("from DriverAdd");
       List<DriverAdd> drecords = Driverquery.list();
       
       Query Routequery = sess1.createQuery("from RouteAdd");
       List<RouteAdd> rrecords = Routequery.list();
        %>
              
        <form   action="addScheduleServlet" method="post" >
           
           <%
               out.print("<br><br>");
          out.print( "<h3>Select Bus ID:<h3> <select class='form-control sel1' name='sbusid'>");
       
                    for(BusAdd b: brecords)
                      {
                       
                         out.println("<option>"+b.getBusID()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
          
         

         out.print( "<h3>Select Driver ID:<h3> <select class='form-control sel1' name='sdriverid'>");
       
                    for(DriverAdd d: drecords)
                      {
                       
                         out.println("<option>"+d.getDriverID()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
          
         out.print( "<h3>Select Driver :<h3> <select class='form-control sel1' name='sdrivername'>");
       
                    for(DriverAdd d: drecords)
                      {
                       
                         out.println("<option>"+d.getDriverName()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
          
         out.print( "<h3>Select Driver contact:<h3> <select class='form-control sel1' name='scontact'>");
       
                    for(DriverAdd d: drecords)
                      {
                       
                         out.println("<option>"+d.getContact()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
                  
             
          out.print( "<h3>Select route:<h3> <select class='form-control sel1' name='sroute'>");
       
                    for(RouteAdd r: rrecords)
                      {
                       
                         out.println("<option>"+r.getRouteInfo()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
                          
                          
                          
                          
                          
                     %>     

                     
          
             <%
                     tx.commit();
       
                   }
                catch(Exception e){e.printStackTrace();}  

                finally{
                  sess1.close();
                  sf.close(); 
                  }

             %>
           
          <br><br>
                <div class="form-group" align="center">
                <input type="submit" value="Add a Schedue" class="btn btn-success">
                <a value="Cancel" class="btn btn-danger" href="schedule.jsp">Cancel</a>
                </div>
        </form>
          <br><br>
          
          
          
          </div>
          <div class="col-sm-3"></div>
          </div>
            
            
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


          <div id="view" class="tab-pane fade">
            <h1>View All Schedules</h1>
           
            <button type="button" class="btn btn-info" onclick="sendBus()" >view schedule</button>
                <br>
                 <span id="disp"></span>
            
            <span id="searching"></span>
          </div>


        
           <br><br>

                <br><br><br>
            </div>            <!-- tab content -->

           </div>  <!--  10 container -->


        </div>

      </div>





    </body>
    </html>
