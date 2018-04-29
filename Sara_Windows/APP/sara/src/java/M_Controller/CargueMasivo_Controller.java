package M_Controller;

import M_Controller.Archivos.ArchivosController;
import M_Util.CargaDatos;
import M_Util.EstructuraDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "CargueMasivo_Controller", urlPatterns = {"/CargueMasivo_Controller"})
public class CargueMasivo_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            PrintWriter respuesta = response.getWriter();
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");

            switch (opcion) {
                case 1: //REALIZA EL CARGUE DE LA INFORMACION
                    //jso[0] = ['CargueMasivo_Controller','[{opcion:1,archivo:'+archivoCSV+',tabla:'+tabla+'}]'];
                    try {
                        String path = request.getRealPath("");
                        ArchivosController arch = new ArchivosController();
                        if (arch.MoverArchivoCsv(path, jData.getString("archivo"))) {
                            if (new CargaDatos().cargaMasiva(path,jData.getString("archivo"), jData.getString("tabla"))) {
                                respuesta.println("true$$exitosa");
                            } else {
                                respuesta.println("false$$fallida");
                            }
                        } else {
                            arch.EliminarArchivo(path, jData.getString("archivo"), 1);
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 2://CONSULTA TODAS LAS TABLAS
                    //jso[0] = ['CargueMasivo_Controller','[{opcion:2}]'];
                    try {
                        respuesta.println(new EstructuraDB().ListaTablas());
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }

                    break;
            }

        } catch (Exception falla) {
            response.getWriter().println("Falla: " + falla.getMessage());
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
