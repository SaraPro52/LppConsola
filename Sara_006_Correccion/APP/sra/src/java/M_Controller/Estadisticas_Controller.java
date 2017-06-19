
package M_Controller;

import M_Modelo.Estadisticas;
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

@WebServlet(name = "Estadisticas_Controller", urlPatterns = {"/Estadisticas_Controller"})
public class Estadisticas_Controller extends HttpServlet {

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
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            PrintWriter respuesta = response.getWriter();
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            
            switch (opcion) {
//                case 1:
//                    try {
//                        String[] fechas = Elomac.M_toArray(jData.getString("fechas"));
//                        int diagrama = jData.getInt("diagrama"); 
//                        respuesta.println(new Estadisticas().EstadisticaFecha(fechas, diagrama));
//                    } catch (Exception e) {
//                        respuesta.println(e.getMessage());
//                    }
//                    break;
                case 1://REPORTES
                    try {
                        String[] parametrosReportes = Elomac.M_toArray(jData.getString("reportes"));
                        respuesta.println(new Estadisticas().ConsultaReportes(parametrosReportes));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 2://GRAFICAS
                    try {
                        String[] parametrosGraficas = Elomac.M_toArray(jData.getString("graficas"));
                        respuesta.println(new Estadisticas().ConsultaGraficas(parametrosGraficas));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                default:
                    throw new AssertionError();
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Estadisticas_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Estadisticas_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
