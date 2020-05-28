package Servlets;

import ConnectionPackage.dbms_Connection;
import DataAccessObject.User_Dao;
import Entities.suggestionForm_entities;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class suggestionServlet extends HttpServlet {

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

            String salutation = request.getParameter("salutation");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String emailID = request.getParameter("emailID");
            String phoneNumber = request.getParameter("phoneNumber");
            String qualification = request.getParameter("qualification");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String suggestionDescription = request.getParameter("suggestion");
            Part doc = request.getPart("document");
            Part img = request.getPart("image");
            Part video = request.getPart("video");
            String fileName = doc.getSubmittedFileName();
            String imgName = img.getSubmittedFileName();
            String videoName = video.getSubmittedFileName();
            //out.println(fileName);
            //Upload...
            InputStream isDoc = doc.getInputStream();
            InputStream isImg = img.getInputStream();
            InputStream isVideo = video.getInputStream();
            
            byte[] file = new byte[isDoc.available()];     //to read data 
            isDoc.read(file);
            String docpath = request.getRealPath("/") + "files" + File.separator + fileName;
            //out.println(path);
            FileOutputStream fos = new FileOutputStream(docpath);
            fos.write(file);
            fos.close();
            
             byte[] imgFile = new byte[isDoc.available()];     //to read data 
            isDoc.read(imgFile);
            String imgpath = request.getRealPath("/") + "files" + File.separator + imgName;
            //out.println(path);
            FileOutputStream imgfos = new FileOutputStream(imgpath);
            imgfos.write(file);
            imgfos.close();
            
            byte[] videoFile = new byte[isDoc.available()];     //to read data 
            isDoc.read(videoFile);
            String videopath = request.getRealPath("/") + "files" + File.separator + videoName;
            //out.println(path);
            FileOutputStream videofos = new FileOutputStream(videopath);
            videofos.write(file);
            videofos.close();

            suggestionForm_entities suggest = new suggestionForm_entities(salutation,firstName,lastName,emailID,phoneNumber,qualification,address,city,state,suggestionDescription,docpath,imgpath,videopath);

            //create a user dao object
            User_Dao dao = new User_Dao(dbms_Connection.getConnection());

            if (dao.saveSuggestion(suggest)) {
                //save...
                out.println("Successfully Registered");
            } else {
                out.println("Error!!");
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
