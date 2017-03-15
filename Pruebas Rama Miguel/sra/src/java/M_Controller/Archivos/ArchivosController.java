package M_Controller.Archivos;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Normalizer;
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

/**
 * La clase ArchivosController se encarga de gestionar los archivos de los
 * productos virtuales crear eliminar modificar
 *
 * @author Juan Lopez Alvarez
 * @version 30/11/2016 v3
 *
 */
@WebServlet(name = "archivos", urlPatterns = {"/archivos"})

public class ArchivosController extends HttpServlet {

    private static final long serialVersionID = 1L;

    /**
     * El metodo processRequest crear el archivo dentro de una carpeta
     * especifica del servidor.
     *
     * @param Archivo request Este parametro tiene contenido el archivo o los
     * archivos que se quieren ingresar.
     * @param String response Este parametro devuelve un valor para saber si se
     * creo el archivo correctamente o no.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        Archivos a = new Archivos();
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                String nombreArchivo = "";
                List<FileItem> multiparts = upload.parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        nombreArchivo = new File(item.getName()).getName();
                        item.write(new File(a.rutaTem() + nombreArchivo));
                    }
                }
            } catch (Exception e) {
                System.out.println("Error al cargar el archivo" + e);
            }
        }
    }

    /**
     * El metodo EliminarArchivo busay elimina un archiv en especifico en la
     * carpeta del servidor.
     *
     * @param nombre Nombre del archivo que se desea eliminar.
     */
    //---------- Cambio
    public void EliminarArchivo(String nombre,int val) { //1:rutaTem 2: getbase
        Archivos a = new Archivos();
        String ruta;
        if(val == 1) ruta = a.rutaTem() + nombre;
        else ruta = a.getBase() + nombre;
        File archivo = new File(ruta);
        archivo.delete();
    }
    //---------- Cambio

    public void MoverArchivo(String nomArchivo) {
        try {
            Archivos bs = new Archivos();
            File archivo = new File(bs.rutaTem() + nomArchivo);
            File NuNombre = new File(bs.getBase() + nomArchivo);

            if (archivo.renameTo(NuNombre)) {
                System.out.println("Si");
            } else {
                System.out.println(archivo.renameTo(NuNombre));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
    }
    /**
     * Metodo CambiarNombre este metodo realiza el cambio de nombre de un
     * archivo.
     *
     * @param AnNombre Nombre actual del archivo
     * @param NuevoNombre Nuevo nombre del archivo
     * @return String devuelve del nombre del archivo.
     */
    public String CambiarNombre(String AnNombre, String NuevoNombre) {
        String nombre = "";
        NuevoNombre = NuevoNombre.replace(' ', '_');

        String cadenaNormalize = Normalizer.normalize(NuevoNombre, Normalizer.Form.NFD);
        String cadenaSinAcentos = cadenaNormalize.replaceAll("[^\\p{ASCII}]", "");

        NuevoNombre = cadenaSinAcentos;
        try {
            Archivos bs = new Archivos();
            String ext2 = FilenameUtils.getExtension(AnNombre);
            File archivo = new File(bs.rutaTem() + AnNombre);
            File NuNombre = new File(bs.rutaTem() + NuevoNombre + '.' + ext2);
            if (archivo.renameTo(NuNombre)) {
                nombre = NuevoNombre + '.' + ext2;
            } else {
                nombre = AnNombre + '.' + ext2;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return nombre;
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
