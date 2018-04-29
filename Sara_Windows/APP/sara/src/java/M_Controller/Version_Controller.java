/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package M_Controller;

import M_Controller.Archivos.ArchivosController;
import M_Modelo.Version;
import M_Util.Elomac;
import M_Util.M_Procedure;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "Version_Controller", urlPatterns = {"/Version_Controller"})
public class Version_Controller extends HttpServlet {

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
            throws ServletException, IOException {
             response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            /*
            1: Consulta Actualizar
            2: Consultas para la vista de actualizar
            3: Registar Actualizacion Version
            */
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            Version  ver = new Version();
            ArchivosController arch = new ArchivosController();
            response.setContentType("application/json;charset=UTF-8");
           PrintWriter respuesta = response.getWriter();
           switch(opcion){
               case 1:
//                   try {
//                       int idfun = jData.getInt("idFun");
//                       respuesta.println(ver.ConsultaActualizar(idfun));
//                   } catch (Exception e) {
//                       respuesta.println("QUEMAS"+e.getMessage());
//                   }
//                   break;
               case 2:
                   try {
                       int idPv = jData.getInt("idPv");
                       int idVer = jData.getInt("idVer");
                       respuesta.println(ver.VistaActualizar(idPv, idVer));
                   } catch (Exception e) {
                       respuesta.println(e.getMessage());
                   }
                   break;
                case 3:
                    String path = request.getRealPath("");
                    String[] infoVersion = null;
                    String arrayFun = null;
                    infoVersion = Elomac.M_toArray(jData.getString("info"));
                    arrayFun = M_Procedure.Group(Elomac.M_toArray(jData.getString("arrayFun")), ',');
                    String[] arrayTemas = Elomac.M_toArray(jData.getString("arrayTemas"));
                    String nomUrl = ver.RegistrarActualizacion(infoVersion, arrayFun,arrayTemas);//16/04/2017
                    if (nomUrl != "null") {
                        arch.CambiarNombre(path,infoVersion[1], nomUrl,0,1);
                        respuesta.println("true$$ fue registrado");
                    } else {
                        respuesta.println("false$$ no fue registrado");
                        arch.EliminarArchivo(path,infoVersion[1],1);
                    }
                   break;
                case 4:
                    //jso[0] = ['Version_Controller','[{opcion:4,idUser:'+idUser+'}']--- Lista de Areas
                    try {
                        respuesta.println(new Version().MisProductos(jData.getString("idUser")));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
           }
        }catch(Exception ex){
            response.getWriter().print(ex.getMessage());
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