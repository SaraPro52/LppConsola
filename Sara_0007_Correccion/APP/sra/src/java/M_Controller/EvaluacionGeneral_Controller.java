package M_Controller;

import M_Modelo.Evaluacion_General;
import M_Modelo.Notificacion;
import M_Util.Elomac;
import M_Util.M_Crud;
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

/**
 * La clase EvaluacionGeneral_Controller gestiona el envio de json y la
 * obtencion de json del cliente al servidor y viceversa generando asi la crud
 * de la misma evaluacion
 *
 * @author Judini
 * @version 25/11/2016 v5
 */
@WebServlet(urlPatterns = {"/EvaluacionGeneral_Controller"})

public class EvaluacionGeneral_Controller extends HttpServlet {

    /**
     * El metodo processRequest obtiene las peticion del cliente y devuelve la
     * informacion requerida.
     *
     * @param String request Este parametro tiene contenido el json que se envia
     * desde el lado del cliente.
     * @param String response Este parametro devuelve un valor para saber si se
     * creo el archivo correctamente o no.
     * @return String este parametro devuelve los datos requerido de la peticion
     * si todo sale correctamente si no simplemente retorna una respuesta falsa
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String data = request.getParameter("data");

            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");

            Evaluacion_General evaluacion = new Evaluacion_General();
            response.setContentType("appication/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();

            switch (opcion) {
                case 1:
                    try {
                        String[] infoEva = Elomac.M_toArray(jData.getString("infoEva"));
                        if (infoEva[5].equals("yyyy-MM-dd")) {
                            infoEva[5] = "null";
                        } else if (infoEva[5] != "yyyy-MM-dd") {
                            infoEva[5] = M_Crud.M_Format(infoEva[5]);
                        }

                        String[] infoItem = Elomac.M_toArray(jData.getString("infoItem"));
                        if (evaluacion.RegistrarEvaluacion(infoEva, infoItem)) {
                            respuesta.println("true$$El producto virtual se evaluo Correctamente");
                            int idNoti = jData.getInt("idNoti");
                            Notificacion noti = new Notificacion();
                            noti.load(noti.Select(idNoti));
                            noti.atributos.replace("Estado", 1);
                            noti.Update();
                        } else {
                            respuesta.println("false$$El producto no se evaluado");
                        }
                    } catch (Exception e) {
                        respuesta.println("[{valor:false,mensaje:'" + e.getMessage() + "'}]");
                    }
                    break;
                case 2:
                    try {
                        int idEva = jData.getInt("idEvalua");
                        int resultado = jData.getInt("resultado");

                        respuesta.println(new Evaluacion_General().ConsultarEvaluacion(idEva, resultado));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
//                case 3: //------------------
//                    try {
//                        int opt = jData.getInt("opt");
//                        String[] elegir = Elomac.M_toArray(jData.getString("elegir"));
//                        if(opt == 1){
//                            String delimitador = jData.getString("delimitador");
//                            respuesta.println(new Notificacion().NotificacionAR(elegir, delimitador));
//                        }else{
//                            // Elegir array[2] tipoNotificacion, estado version
//                            respuesta.println(new Notificacion().ConsultaNotificacion(elegir));//--14/04/2017
//                        }
//                    } catch (Exception e) {
//                        respuesta.println(e.getMessage());
//                        }
//                    break;//------------------
            }
            
        } catch (Exception falla) {
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EvaluacionGeneral_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EvaluacionGeneral_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
