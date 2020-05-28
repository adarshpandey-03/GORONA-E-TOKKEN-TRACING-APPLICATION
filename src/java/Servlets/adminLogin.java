package Servlets;

import ConnectionPackage.dbms_Connection;
import DataAccessObject.User_Dao;
import Entities.adminLogin_entities;
import Entities.message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class adminLogin extends HttpServlet {

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
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            adminLogin_entities admin = new adminLogin_entities(username,password);
            
            //create a user dao object
                    User_Dao dao = new User_Dao(dbms_Connection.getConnection());
                    adminLogin_entities ad = dao.getUserByUsernameAndPassword(username, password);
                    
                    if(ad==null)
                    {
                        //login error
                       
                      // out.println("Invalid Details.....try again"); 
                        message msg = new message("Invalid Details ! try with another.","error","alert-danger");
                        HttpSession s  = request.getSession();
                        s.setAttribute("msg", msg);
                        response.sendRedirect("adminpanel.jsp");
                    } else{
                        //login success
                        
                        HttpSession s = request.getSession();
                        s.setAttribute("currentUser", ad);
                        response.sendRedirect("profile.jsp");
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
