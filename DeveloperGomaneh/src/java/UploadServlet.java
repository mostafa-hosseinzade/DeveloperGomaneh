/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author nima
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/upload"})
@MultipartConfig
public class UploadServlet extends HttpServlet {

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
        Part filePart = request.getPart("upload"); // Retrieves <input type="file" name="file">
        String fileName = FilenameUtils.getName(filePart.getSubmittedFileName());
        InputStream fileContent = filePart.getInputStream();
        String tempfilename = (Math.round(Math.random() * 1000)) + "_" + System.currentTimeMillis()+"." + FilenameUtils.getExtension(fileName);
        String newFileName = request.getRealPath("")+"/resources/images";
        File dir=new File(newFileName);
        if(!dir.exists()){
           Files.createDirectories(dir.toPath());
        }
        Files.copy(filePart.getInputStream(), (new File(newFileName+"/"+tempfilename)).toPath(), new CopyOption[]{StandardCopyOption.REPLACE_EXISTING});
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.append("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('1', '"+request.getContextPath()+"/resources/images/"+tempfilename+"');</script>");
        }

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