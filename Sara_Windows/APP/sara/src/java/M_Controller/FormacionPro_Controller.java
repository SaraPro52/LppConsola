/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package M_Controller;

import M_Modelo.Area;
import M_Modelo.Programa;
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

/**
 *
 * @author migue
 */
@WebServlet(name = "FormacionPro_Controller", urlPatterns = {"/FormacionPro_Controller"})
public class FormacionPro_Controller extends HttpServlet {

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
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");

            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            switch (opcion) {
                case 1:
                    String[] programainfo = Elomac.M_toArray(jData.getString("datos"));
                    String[] areas = Elomac.M_toArray(jData.getString("areas"));
                    String[] temas = Elomac.M_toArray(jData.getString("temas"));
                    Programa p = new Programa();
                    try {
                        if (p.RegistrarPrograma(programainfo, areas, temas)) {
                            respuesta.println("true$$registro correctamente");
                        } else {
                            respuesta.println("false$$el registro fallo");
                        }
                    } catch (Exception e) {
                        respuesta.println("false$$" + e.getMessage() + "");
                    }
                    break;
                case 2:
                    String[] infoAre = Elomac.M_toArray(jData.getString("datos"));
                    int idCentro = jData.getInt("idC");
                    Area a = new Area();
                    try {
                        if (a.RegistrarArea(infoAre, idCentro)) {
                            respuesta.println("true$$registro correctamente");
                        } else {
                            respuesta.println("false$$no se registro");
                        }
                    } catch (Exception e) {
                        respuesta.println("false$$" + e.getMessage() + "");
                    }
                    break;
                case 3:
                    Area aM = new Area();
                    String[] infoArea = Elomac.M_toArray(jData.getString("datos"));
                    int idCentros = jData.getInt("idC");
                    try {
                        if (aM.ModificarArea(infoArea, idCentros)) {
                            respuesta.println("true$$no se modifico correctamente");
                        }
                    } catch (Exception e) {
                        respuesta.println("false$$no se modifico");
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(FormacionPro_Controller.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FormacionPro_Controller.class
                    .getName()).log(Level.SEVERE, null, ex);
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
