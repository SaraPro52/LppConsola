package M_Controller;

import M_Modelo.Evaluacion_General;
import M_Modelo.Notificacion;
import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(urlPatterns = {"/EvaluacionGeneral_Controller"})
public class EvaluacionGeneral_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");

            String[] infoEva = Elomac.M_toArray(jData.getString("infoEva"));
            if (infoEva[5].equals("yyyy-MM-dd")) {
                infoEva[5] = "null";
            } else if (infoEva[5] != "yyyy-MM-dd") {
                Date d = new Date(infoEva[5]);
                SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
                infoEva[5] = f.format(d);
            }

            String[] infoItem = Elomac.M_toArray(jData.getString("infoItem"));

            Evaluacion_General evaluacion = new Evaluacion_General();
            response.setContentType("appication/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();

            switch (opcion) {
                case 1:
                    try {
                        if (evaluacion.RegistrarEvaluacion(infoEva, infoItem)) {
                            respuesta.println("true$$El producto virtual se evaluo Correctamente");
                            int idNoti = jData.getInt("idNoti");
                            Notificacion noti = new Notificacion();
                            noti.load(noti.Select(idNoti));
                            noti.atributos.replace("Estado", 1);
                            if (noti.Update()) {
                                respuesta.println("true$$actualizo");
                            } else {
                                respuesta.println("false$$no actualizo");
                            }
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
