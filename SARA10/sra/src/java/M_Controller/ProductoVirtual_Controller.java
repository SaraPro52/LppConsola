package M_Controller;

import M_Controller.Archivos.ArchivosController;
import M_Modelo.Version;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoVirtual_Controller", urlPatterns = {"/ProductoVirtual_Controller"})

public class ProductoVirtual_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            /*Menu controlador Version
                1. Registrar Producto virtual desde 0.
                2. Registrar Una nueva Version.
                3. Correccion - Actualiza solo el url.
                4. Realiza la aprovacion del producto virtual.
             */
            int option = Integer.parseInt(request.getParameter("opcion"));
            String[] infoVersion = request.getParameterValues("info[]");
            String[] arrayFun = request.getParameterValues("arrayFun[]");
            String[] arrayTemas = request.getParameterValues("arrayTemas[]");
            String imagenNom = request.getParameter("imagenNom");
            String archivoNom = request.getParameter("archivoNom");
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            ArchivosController arch = new ArchivosController();
            Version ver = new Version();
            switch (option) {
                case 1:
                    infoVersion[4] =archivoNom;
                    infoVersion[5] = imagenNom;
                    
                    if (ver.RegistrarPV(infoVersion, arrayFun, arrayTemas)) {
                        String nruta = infoVersion[0];
                        arch.CambiarNombre(archivoNom, nruta,"A");
                        arch.CambiarNombre(imagenNom, nruta,"I");
                        respuesta.println("Si Registro");
                    } else {
                        arch.EliminarArchivo(imagenNom);
                        arch.EliminarArchivo(archivoNom);
                        respuesta.println("No Registro");
                    }
                    break;
                case 2:
                    if (ver.RegistrarVersion(infoVersion, arrayFun)) {
                        respuesta.println("Si Registro");
                    } else {
                        respuesta.println("No Registro");
                    }
                    break;
                case 3:
                    String[] correccion = request.getParameterValues("correcion");
                    if (ver.CorreccionVersion(correccion)) {
                        respuesta.println("Si Registro");
                    } else {
                        respuesta.println("No Registro");
                    }
                    break;
                case 4:
                    String[] aprobacion = request.getParameterValues("aprobacion");
                    if (ver.CorreccionVersion(aprobacion)) {
                        respuesta.println("Si Registro");
                    } else {
                        respuesta.println("No Registro");
                    }
                    break;
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
