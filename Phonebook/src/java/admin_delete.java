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
import mypack.Userdetails;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Rizwan Jaffer S
 */
public class admin_delete extends HttpServlet {

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
            
            HttpSession session=request.getSession(); 
            System.out.println("session : "+session.getAttribute("uname"));
            
            String phno = request.getParameter("phno");
            
            SessionFactory sf;
            Transaction t;
            Session s;
            sf = HibUtil.getSessionFactory();
            s = sf.openSession();
            t = s.getTransaction();
            t.begin();
//            mypack.Userdetails obj = new mypack.Userdetails(phno);
//            s.delete(obj);
            Userdetails ud = new Userdetails();
            boolean ans = ud.delete(phno);
            if(ans == true){
                String delete1 = "User with phone number "+phno+" has been deleted!";
                request.setAttribute("Message1", delete1);
                RequestDispatcher rd = request.getRequestDispatcher("admin_valid_success.jsp");
                System.out.println("delete1");
                rd.forward(request, response);
            }else{
                String delete2 = "Something went wrong.Unable to delete!";
                request.setAttribute("Message2", delete2);
                RequestDispatcher rd = request.getRequestDispatcher("admin_delete.jsp");
                System.out.println("delete2");
                rd.forward(request, response);
            }
            t.commit();
            s.close();
            
            out.println("<center>Record Deleted Successfully</center>");
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
