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
            <li class="active"><a href="homeStaff.jsp">Home</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
           <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome  Staff</a></li>
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
             <a href="staffSchedule.jsp">View Schedules</a>
              <a href="staffEdit.jsp">Edit a Schedule</a>
            </div>



      <div class="col-sm-10 container content" style="margin-top:50px;">
            <h1 style="margin-bottom:40px">Edit Schedule</h1>

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
              
        <form   action="EditScheduleServlet" method="post" >
           
            <div class="form-group">
             <input type="text" required="" name="ebusid" class="form-control" id="username"  placeholder="Bus Id" onblur="myFunction()"><br>
            </div>
            
           <%
               
          
         

         out.print( "<h3>Select Driver ID:<h3> <select class='form-control sel1' name='edriverid'>");
       
                    for(DriverAdd d: drecords)
                      {
                       
                         out.println("<option>"+d.getDriverID()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
          
         out.print( "<h3>Select Driver :<h3> <select class='form-control sel1' name='edrivername'>");
       
                    for(DriverAdd d: drecords)
                      {
                       
                         out.println("<option>"+d.getDriverName()+"</option>");
                         
          
                      }
                         
          out.print( "</select>");
          
         out.print( "<h3>Select route:<h3> <select class='form-control sel1' name='eroute'>");
       
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
                <input type="submit" value="Edit Schedue" class="btn btn-success">
                <a value="Cancel" class="btn btn-danger" href="staffEdit.jsp">Cancel</a>
                </div>
        </form>
             <br><br>
             </div>
          <div class="col-sm-3"></div>
              

           </div>  <!--  10 container -->


        </div>

      </div>





    </body>
    </html>
