package M_Controller;

import M_Controller.Archivos.ArchivosController;
import M_Modelo.Producto_Virtual;
import M_Modelo.Version;
import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "ProductoVirtual_Controller", urlPatterns = {"/ProductoVirtual_Controller"})

public class ProductoVirtual_Controller extends HttpServlet {

    private PrintWriter respuesta;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu controlador Version
                1. Registrar Producto virtual desde 0.
                2. Registrar Una nueva Version.
                3. Correccion - Actualiza solo el url.
                4. Realiza la aprovacion del producto virtual.
                5. Consultar Productos virtuales Aprovados.*/
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            
            int opcion = jData.getInt("opcion");
            String[] infoVersion = (String[]) Elomac.M_toArray(jData.getString("info"));
            String arrayFun = jData.getString("arrayFun");
            String[] arrayTemas = (String[]) Elomac.M_toArray(jData.getString("arrayTemas"));
            String archivoNom = jData.getString("archivoNom");

            response.setContentType("application/json;charset=UTF-8");

            ArchivosController arch = new ArchivosController();
            respuesta = response.getWriter();
            Version ver = new Version();
            switch (opcion) {
                case 1:
                    infoVersion[4] = archivoNom;
//                    try {

                    String nruta = infoVersion[0];
//                        if (arch.CambiarNombre(archivoNom, nruta, "A")) {
//                            if (arch.CambiarNombre(imagenNom, nruta, "I")) {
//
//                            } else {
//                                arch.EliminarArchivo(imagenNom);
//                            }
//                        } else {
//                            arch.EliminarArchivo(archivoNom);
//                        }
//                    } catch (Exception e) {
//                        System.out.println(e.getMessage());
//                    }

                    if (ver.RegistrarPV(infoVersion, arrayFun, arrayTemas)) {

                        respuesta.println("Si Registro");
                    } else {
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
                    String[] correccion = (String[]) Elomac.M_toArray(jData.getString("correccion"));
                    if (ver.CorreccionVersion(correccion)) {
                        respuesta.println("Si Registro");
                    } else {
                        respuesta.println("No Registro");
                    }
                    break;
                case 4:
                    try {
                        String[] aprobacion = (String[]) Elomac.M_toArray(jData.getString("aprobacion"));
                        if (ver.AprobarPV(aprobacion)) {
                            respuesta.println("Si Registro");
                        } else {
                            respuesta.println("No Registro");
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 5:
                    respuesta.println(new Producto_Virtual().ConsultarProducto());
                    break;
            }
        } catch (Exception falla) {
            respuesta.println("Falla: " + falla.getMessage());
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductoVirtual_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductoVirtual_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
