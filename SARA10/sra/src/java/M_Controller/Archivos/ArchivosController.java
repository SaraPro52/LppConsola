package M_Controller.Archivos;

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
import org.apache.commons.io.FilenameUtils;

@WebServlet(name = "archivos", urlPatterns = {"/archivos"})

public class ArchivosController extends HttpServlet {

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
                String nombreArchivo = "";
                List<FileItem> multiparts = upload.parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        nombreArchivo = new File(item.getName()).getName();
                        item.write(new File(a.getBase() + nombreArchivo));
                    }
                }
            } catch (Exception e) {
                System.out.println("Error al cargar el archivo" + e);
            }
            //request.getRequestDispatcher("instrutor/registroOA/registroOA.jsp").forward(request, response);
        }

    }

    public void EliminarArchivo(String nombre) {
        File archivo = new File(nombre);
        archivo.delete();
    }

    public boolean CambiarNombre(String AnNombre, String NuevoNombre, String tip) {
        Archivos bs = new Archivos();
        boolean res = false;
        if (tip.equals("I")) {
            String ext2 = FilenameUtils.getExtension(AnNombre);
            File archivo = new File(bs.getBase()+ AnNombre);
            File NuNombre = new File(NuevoNombre+tip + ext2);
            archivo.renameTo(NuNombre);
        } else {
            String ext2 = FilenameUtils.getExtension(AnNombre);
            File archivo = new File(AnNombre);
            File NuNombre = new File(NuevoNombre + ext2);
            archivo.renameTo(NuNombre);
        }

        return res;
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
