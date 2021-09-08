/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.Userdetails;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Rizwan Jaffer S
 */
public class admin_search extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet admin_search</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet admin_search at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phno = request.getParameter("phno");
            String addr = request.getParameter("addr");
            String city = request.getParameter("city");
            String pin = request.getParameter("pin");
            
            List<Userdetails> list = new ArrayList<>();
            Userdetails ud = new Userdetails();
            if(fname != null) {
                list = ud.getfnameDb(fname);
                for(int i=0;i<list.size();i++) {
                    ud = list.get(i);
                    out.println("fname : "+ud.getFirstname());
                    out.println("lname : "+ud.getLastname());
                    out.println("phno : "+ud.getPhoneNumber());
                    out.println("addr : "+ud.getAddress());
                    out.println("city : "+ud.getCity());
                    out.println("pin : "+ud.getPin());
                }
            }
            else if(lname != null) {
                list = ud.getlnameDb(lname);
                for(int i=0;i<list.size();i++) {
                    ud = list.get(i);
                    out.println("fname : "+ud.getFirstname());
                    out.println("lname : "+ud.getLastname());
                    out.println("phno : "+ud.getPhoneNumber());
                    out.println("addr : "+ud.getAddress());
                    out.println("city : "+ud.getCity());
                    out.println("pin : "+ud.getPin());
                }
            }else if(phno != null) {
                list = ud.getphnoDb(phno);
                for(int i=0;i<list.size();i++) {
                    ud = list.get(i);
                    out.println("fname : "+ud.getFirstname());
                    out.println("lname : "+ud.getLastname());
                    out.println("phno : "+ud.getPhoneNumber());
                    out.println("addr : "+ud.getAddress());
                    out.println("city : "+ud.getCity());
                    out.println("pin : "+ud.getPin());
                }
            }else if(addr != null) {
                list = ud.getaddrDb(addr);
                for(int i=0;i<list.size();i++) {
                    ud = list.get(i);
                    out.println("fname : "+ud.getFirstname());
                    out.println("lname : "+ud.getLastname());
                    out.println("phno : "+ud.getPhoneNumber());
                    out.println("addr : "+ud.getAddress());
                    out.println("city : "+ud.getCity());
                    out.println("pin : "+ud.getPin());
                }
            }
                else if(city != null) {
                list = ud.getcityDb(city);
                for(int i=0;i<list.size();i++) {
                    ud = list.get(i);
                    out.println("fname : "+ud.getFirstname());
                    out.println("lname : "+ud.getLastname());
                    out.println("phno : "+ud.getPhoneNumber());
                    out.println("addr : "+ud.getAddress());
                    out.println("city : "+ud.getCity());
                    out.println("pin : "+ud.getPin());
                }
            }else if(pin != null) {
                list = ud.getpinDb(pin);
                for(int i=0;i<list.size();i++) {
                    ud = list.get(i);
                    out.println("fname : "+ud.getFirstname());
                    out.println("lname : "+ud.getLastname());
                    out.println("phno : "+ud.getPhoneNumber());
                    out.println("addr : "+ud.getAddress());
                    out.println("city : "+ud.getCity());
                    out.println("pin : "+ud.getPin());
                }
            }
            
//            SessionFactory sf;
//            Transaction t;
//            Session s;
//            sf = HibUtil.getSessionFactory();
//            s = sf.openSession();
//            t = s.getTransaction();
//            t.begin();
//            mypack.Userdetails obj = new mypack.Userdetails(fname, lname, phno, addr, city, pin);
//            s.save(obj);
//            t.commit();
//            s.close();
//            out.println("Successful insertion into db");
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
