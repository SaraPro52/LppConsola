
package M_Controller;

import M_Modelo.Notificacion;
import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "Notificaciones_Controller", urlPatterns = {"/Notificaciones_Controller"})
public class Notificaciones_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            response.setContentType("appication/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            String[] parametros = Elomac.M_toArray(jData.getString("parametros"));
            Notificacion noti = new Notificacion();
            
            switch(opcion){
                case 1: //CONSULTA INSTRUCTOR-FUNCIONARIO/PRINCIPAL 
                    try {
                        parametros[2] = "1";
                        respuesta.println(noti.ConsultarNotificacion_M(parametros));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 2: //CONSULTA CORRECCION
                    try {
                        parametros[2] = "2";
                        respuesta.println(noti.ConsultarNotificacion_M(parametros));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 3: //CONSULTA NOTIFICACIONES DE EVALUACION (PARA EL ROL Y USUARIO DETERMINADO)
                    try {
                        parametros[2] = "3";
                        respuesta.println(noti.ConsultarNotificacion_M(parametros));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 4: //CONSULTA HABILITAR PRODUCTO VIRTUAL
                    try {
                        parametros[2] = "4";
                        respuesta.println(noti.ConsultarNotificacion_M(parametros));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 5: //CONSULTA ACTUALIZAR PRODUCTO VIRTUAL
                    try {
                        parametros[2] = "5";
                        respuesta.println(noti.ConsultarNotificacion_M(parametros));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
            }
            
        }catch (Exception falla) {
            System.out.println(falla.getMessage());
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
