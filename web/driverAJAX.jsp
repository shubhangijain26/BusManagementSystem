

<%@page import="Modal.DriverAdd"%>
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
 String id=request.getParameter("x");  
if(id==null || id.trim().equals("")){  
  
}
    else{
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
        Query query = sess1.createQuery("from DriverAdd where driverID like '%"+id+"%' OR contact like '%"+id+"%'  OR driverName  like '%"+id+"%' ");
        
        List<DriverAdd> records = query.list();
       
        out.print("<table class='table' border='1' cellpadding='2' width='100%'>");  
      out.print("<tr class='success'><th>DriverID</th><th>Contact No</th><th>Driver Name</th> </tr>");
      out.print("<br><br>");
        
         for(DriverAdd d1: records)
           {
               
           out.print("<tr class='info'><td>"+d1.getDriverID()+"</td><td>"+d1.getContact()+"</td><td>"+d1.getDriverName()+"</td></tr>");
              
           }
           out.print("</table>");  
            
          tx.commit();
       
        }
        catch(Exception e){e.printStackTrace();}  

        finally{
          sess1.close();
          sf.close(); 
        }
            }
%>

 </body>
</html>