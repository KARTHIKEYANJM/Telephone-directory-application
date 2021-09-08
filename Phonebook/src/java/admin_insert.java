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
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Rizwan Jaffer S
 */
public class admin_insert extends HttpServlet {

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
//            out.println("<title>Servlet admin_insert</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet admin_insert at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            
            HttpSession session=request.getSession(); 
            System.out.println("session : "+session.getAttribute("uname"));

            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phno = request.getParameter("phno");
            String addr = request.getParameter("addr");
            String city = request.getParameter("city");
            String pin = request.getParameter("pin");
            
            boolean ans = false;
            if(fname!=""&&lname!=""&&phno!=""&&addr!=""&&city!=""&&pin!=""){
                SessionFactory sf;
                Transaction t;
                Session s;
                sf = HibUtil.getSessionFactory();
                s = sf.openSession();
                t = s.getTransaction();
                t.begin();
                mypack.Userdetails obj = new mypack.Userdetails(fname, lname, phno, addr, city, pin);
                s.save(obj);
                ans = true;
                t.commit();
                s.close();
            }else{
                ans = false;
            }
            
            
            if(ans == true){
                String success = "User data inserted successfully ";
                request.setAttribute("Successinsert", success);
                RequestDispatcher rd = request.getRequestDispatcher("admin_insert.jsp");
                System.out.println("finished insert");
                rd.forward(request, response);
            }else{
                String error = "Unable to insert data ";
                request.setAttribute("Failinsert", error);
                RequestDispatcher rd = request.getRequestDispatcher("admin_insert.jsp");
                System.out.println("error insert");
                rd.forward(request, response);
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
