/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypack.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Rizwan Jaffer S
 */
public class admin_valid_servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet admin_valid_servlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet admin_valid_servlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            
            String name = request.getParameter("uname");
            String pass = request.getParameter("pswd");
            
            HttpSession session=request.getSession();  
            session.setAttribute("uname",name);  
            
            Admin un = new Admin();
            boolean ans = un.getnamedb(name,pass);
            if(ans == true){
                System.out.println("jsp");
                String welcome = "Welcome "+name;
                request.setAttribute("Greeting", welcome);
                RequestDispatcher rd = request.getRequestDispatcher("admin_valid_success.jsp");
                System.out.println("finished");
                rd.forward(request, response);
                System.out.println("finished");
            }else{
                System.out.println("error jsp");
                session.invalidate();
                String error = "Unsuccessful login!";
                request.setAttribute("Error", error);
                RequestDispatcher rd = request.getRequestDispatcher("admin_login.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception e)
        {
            System.out.println("error : "+e);
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
