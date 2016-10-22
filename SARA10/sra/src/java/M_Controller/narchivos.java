package M_Controller;
//narchivos
import M_Controller.Archivos.Archivos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "archivos", urlPatterns = {"/archivos"})

public class narchivos extends HttpServlet {

    private static final long serialVersionID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        Archivos a = new Archivos();
        a.setRuta("Teleinformatica", "ADSI", "JAVA");
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                String nombreArchivo="";
                List<FileItem> multiparts = upload.parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        nombreArchivo = new File(item.getName()).getName();
                        item.write(new File(a.getBase() + nombreArchivo));
                    }
                }
                Nombre(a.getBase(),nombreArchivo);
            } catch (Exception e) {
                System.out.println("Error al cargar el archivo" + e);
            }
            //request.getRequestDispatcher("instrutor/registroOA/registroOA.jsp").forward(request, response);
        }

    }
    public void Nombre(String ruta,String nombre){
        
        System.out.println("Ruta del archivo "+ruta+"Nombre"+nombre);
    }
    public void CambiarRuta() {
        System.out.println("Metodos ??");
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
