
package Controller;

import Modal.ScheduleAdd;
import Modal.scheduleDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class EditScheduleServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         Configuration cf = null;
        SessionFactory sf= null;
        Session session = null;
        
        
        String ebusid = request.getParameter("ebusid");
           String eid = request.getParameter("edriverid");
           String ename = request.getParameter("edrivername");
           String eroute = request.getParameter("eroute");
          
      try
      {
       cf = new Configuration();
       cf.configure("cfgpackage/hibernate.cfg.xml");
       sf=cf.buildSessionFactory();
       session = sf.openSession();
       
       Transaction tx = session.beginTransaction();
            ScheduleAdd si =( ScheduleAdd)session.get( ScheduleAdd.class, ebusid);
          
       if(si==null)
       {
           
          
       }
       else
       {
             
           si.setDriverID(eid);
           si.setDriverName(ename);
           si.setRouteInfo(eroute);
           session.update(si);
            RequestDispatcher rd=request.getRequestDispatcher("staffSchedule.jsp");  
            rd.forward(request,response);
       }
       tx.commit();
       }
       catch(Exception e)
      {
        e.printStackTrace();
      }
       finally{
          session.close();
          sf.close();
      }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
