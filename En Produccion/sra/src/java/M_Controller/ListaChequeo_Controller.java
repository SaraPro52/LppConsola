package M_Controller;

import M_Modelo.Lista_Chequeo;
import M_Util.Elomac;
import M_Util.M_Procedure;
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

@WebServlet(name = "ListaChequeo_Controller", urlPatterns = {"/ListaChequeo_Controller"})
public class ListaChequeo_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu de opciones crud
            1.Agregar lista de chequeo
            2.actualizar
            3.consultar
            4.eliminar
            5.Agregar Items*/
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            switch (opcion) {
                case 1:
                    String[] lista = Elomac.M_toArray(jData.getString("lista"));
                    String items = M_Procedure.Group(Elomac.M_toArray(jData.getString("items")),',');
                    try {
                        if(new Lista_Chequeo().RegistrarLista(lista, items))
                            respuesta.println("true$$La Lista fue registrada");
                        else respuesta.println("false$$La lista no fue registrada");
                    } catch (Exception e) {
                        respuesta.println("false$$"+e.getMessage()+"");
                    }
                    break;
                case 2:
                    String[] mLista = Elomac.M_toArray(jData.getString("mLista"));
                    String[] mitems =  Elomac.M_toArray(jData.getString("mItems"));
                    
                    try {
                        if(new Lista_Chequeo().ModificarLista(mLista, mitems))
                            respuesta.println("true$$actualizacion correcta");
                        else respuesta.println("false$$actualizacion fallida");
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 3:
                    try {//Editar Lista Chequeo-Listar todos los items
                        respuesta.println(new Lista_Chequeo().ListaItems(jData.getInt("lista"), jData.getInt("tipoItem")));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
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
            Logger.getLogger(ListaChequeo_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ListaChequeo_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
