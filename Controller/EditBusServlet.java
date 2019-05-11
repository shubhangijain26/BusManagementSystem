package Controller;



import Modal.BusAdd;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class EditBusServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       
        Configuration cf = null;
        SessionFactory sf= null;
        Session session = null;

         String busid = request.getParameter("beid");
           String lno = request.getParameter("belicence");
           String color = request.getParameter("becolor");
          
      try
      {
       cf = new Configuration();
       cf.configure("cfgpackage/hibernate.cfg.xml");
       sf=cf.buildSessionFactory();
       session = sf.openSession();
       
       Transaction tx = session.beginTransaction();
       
       BusAdd bi =(BusAdd)session.get(BusAdd.class, busid);
       if(bi==null)
       {
           
          
       }
       else
       {
            bi.setBusID(busid);
           bi.setLicenceNo(lno);
           bi.setColor(color);
           session.update(bi);
           RequestDispatcher rd=request.getRequestDispatcher("bus.jsp");  
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
