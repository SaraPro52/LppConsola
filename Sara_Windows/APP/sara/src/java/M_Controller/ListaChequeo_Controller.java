package M_Controller;

import M_Modelo.Lista_Chequeo;
import M_Util.Elomac;
import M_Util.M_Procedure;
import M_Vistas._13_V_listas_Chequeo;
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
            3.consultar items lista
            4.Agregar Items
            5.listas ha modificar*/
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            Lista_Chequeo listaC = new Lista_Chequeo();
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            switch (opcion) {
                case 1:
                    String[] lista = Elomac.M_toArray(jData.getString("lista"));
                    String items = M_Procedure.Group(Elomac.M_toArray(jData.getString("items")),',');
                    try {
                        if(listaC.RegistrarLista(lista, items))
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
                        if(listaC.ModificarLista(mLista, mitems)){
                            String resulta = listaModificar(jData.getInt("idRol")); //24/04/2017
                            respuesta.println("true$$actualizacion correcta$$"+resulta);
                        }    
                        else{
                            respuesta.println("false$$actualizacion fallida");
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 3:
                    try {//Editar Lista Chequeo-Listar todos los items
                        respuesta.println(listaC.ListaItems(jData.getInt("lista"), jData.getInt("tipoItem")));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 4:
                    String[] datosItem = Elomac.M_toArray(jData.getString("datosItem"));//20/04/2017
                    String nuevoItem = listaC.RegistrarItemLista(datosItem);
                    if(nuevoItem != "null"){
                        respuesta.print("true$$se registro correctamente$$"+nuevoItem);
                    } else {
                        respuesta.print("false$$no se registro");
                    }
                    break;
                case 5:
                     //24/04/2017
                    String resulta = listaModificar(jData.getInt("idRol"));
                    if(resulta != "false")
                        respuesta.println(resulta);
                    else respuesta.println("Existe un error");
                    break;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    //24/04/2017
    public static String listaModificar(int idRol){
        try {
            String[] columnas = {"0","1","2","3"};
            String delimitador = "[{colum:5,operador:0,valor1:" + idRol + "}]";
            _13_V_listas_Chequeo listaV = new _13_V_listas_Chequeo();
            return listaV.Select(columnas, delimitador);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "false";
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
