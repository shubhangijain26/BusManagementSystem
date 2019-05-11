

<%@page import="Modal.RouteAdd"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.io.PrintWriter"%>

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
        
   

<%
   
         Configuration cf = null;
        SessionFactory sf= null;
        Session sess = null;
        try
        {
            
        
        cf = new Configuration();
       cf.configure("cfgpackage/hibernate.cfg.xml");
       sf=cf.buildSessionFactory();
       sess = sf.openSession();
       
       Transaction tx = sess.beginTransaction();
        Query query = sess.createQuery("from RouteAdd ");
        
        List<RouteAdd> records = query.list();
       
        out.print("<table class='table' border='1' cellpadding='2' width='100%'>");  
      out.print("<tr class='success'><th>RouteID</th><th>Route Info</th> </tr>");
      out.print("<br><br>");
        
         for(RouteAdd r1: records)
           {
               
           out.print("<tr class='info'><td>"+r1.getRouteID()+"</td><td>"+r1.getRouteInfo()+"</td></tr>");
              
           }
           out.print("</table>");  
            
          tx.commit();
       
        }
        catch(Exception e){e.printStackTrace();}  

        finally{
          sess.close();
          sf.close(); 
        }

%>

 </body>
</html>