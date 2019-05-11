
package Controller;

import Modal.SignInDAO;
import Modal.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter() ;
           String uname = request.getParameter("username");
           String pass = request.getParameter("password");
           String utype = request.getParameter("utype");
           
           User u= new User();
           
           u.setUname(uname);
           u.setPwd(pass);
           u.setUserType(utype);
           
           SignInDAO access = new SignInDAO();
           User ch = access.check(u);
           
           
           if(ch==null)
          {
             response.sendRedirect("newhtml.html");
          }
           
         else 
          {
              if(!(ch.getUserType().equals(u.getUserType())&&ch.getUname().equals(u.getUname())))
              {
                  response.sendRedirect("newhtml.html");
              }
              else
              {
              if(ch.getUserType().equals("Student or Faculty"))
              {
                  RequestDispatcher rd = request.getRequestDispatcher("homeStudent.jsp");
                  rd.forward(request,response);
              }
              if(ch.getUserType().equals("Staff"))
              {
                  RequestDispatcher rd = request.getRequestDispatcher("homeStaff.jsp");
                  rd.forward(request,response);
              }
              if(ch.getUserType().equals("Admin"))
              {
                  RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                  rd.forward(request,response);
              }
              }
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
