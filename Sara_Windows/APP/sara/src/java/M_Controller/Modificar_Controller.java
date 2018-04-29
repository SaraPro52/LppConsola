
package M_Controller;

import M_Controller.Archivos.ArchivosController;
import M_Modelo.Area;
import M_Modelo.Centro;
import M_Modelo.Formato;
import M_Modelo.Programa;
import M_Modelo.Tema;
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

@WebServlet(name = "Modificar_Controller", urlPatterns = {"/Modificar_Controller"})
public class Modificar_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            response.setContentType("appication/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            
            switch(opcion){
                case 1: //MODIFICAR TEMA
                    //jso[0] = ['Modificar_Controller','[{opcion:1,TemaAdmin:[1,0,'+nomTema+','+desTema+']}]']--- Crear Tema
                    //jso[0] = ['Modificar_Controller','[{opcion:1,TemaAdmin:[2,'+idTema+','+nomTema+','+desTema+']}]']--- Modificar Tema
                    //jso[0] = ['Modificar_Controller','[{opcion:1,TemaAdmin:[0,0,0,0]}]']--- Retorna todos los Temas
                    try {
                        String[] parametrosTemaAdmin = Elomac.M_toArray(jData.getString("TemaAdmin"));
                        respuesta.println(new Tema().TemaAdmin(parametrosTemaAdmin));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 2: //MODIFICAR PROGRAMA
                    //jso[0] = ['Modificar_Controller','[{opcion:2,ProgramaAdmin:[1,0,'+nomPrograma+','+nivel+','+arrayTemas+']}]']--- Crear Programa
                    //jso[0] = ['Modificar_Controller','[{opcion:2,ProgramaAdmin:[2,'+idPrograma+','+nomPrograma+','+nivel+','+arrayTemas+']}]']--- Modificar Programa
                    //jso[0] = ['Modificar_Controller','[{opcion:2,ProgramaAdmin:[3,'+idPrograma+',0,0,0]}]']--- Tipo 1 Temas del Programa, Tipo 0 Temas que nos son
                    //jso[0] = ['Modificar_Controller','[{opcion:2,ProgramaAdmin:[0,0,0,0,0]}]']--- Lista de PROGRAMAS
                    try {
                        String[] parametrosProgramaAdmin = Elomac.M_toArray(jData.getString("ProgramaAdmin"));
                        respuesta.println(new Programa().ProgramaAdmin(parametrosProgramaAdmin));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 3: //MODIFICAR AREA
                    //jso[0] = ['Modificar_Controller','[{opcion:3,AreaAdmin:[1,0,'+nomArea+','+lider+','+arrayProgramas+']}]']--- Crear Area
                    //jso[0] = ['Modificar_Controller','[{opcion:3,AreaAdmin:[2,'+idArea+','+nomArea+','+lider+','+arrayProgramas+']}]']--- Modificar Area
                    //jso[0] = ['Modificar_Controller','[{opcion:3,AreaAdmin:[3,'+idArea+',0,0,0]}]']--- Tipo 1 Programas del Area, Tipo 0 Programas que nos son
                    //jso[0] = ['Modificar_Controller','[{opcion:3,AreaAdmin:[0,0,0,0,0]}]']--- Lista de Areas
                    try {
                        String[] parametrosAreaAdmin = Elomac.M_toArray(jData.getString("AreaAdmin"));
                        respuesta.println(new Area().AreaAdmin(parametrosAreaAdmin));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 4: //MODIFICAR CENTRO
                    //jso[0] = ['Modificar_Controller','[{opcion:4,CentroAdmin:[1,0,'+nomCentro+','+numCentro+','+direccion+','+idCiudad+','+arrayAreas+']}]']--- Crear Centro
                    //jso[0] = ['Modificar_Controller','[{opcion:4,CentroAdmin:[2,'+idCentro+','+nomCentro+','+numCentro+','+direccion+','+idCiudad+','+arrayAreas+']}]']--- Modificar Centro
                    //jso[0] = ['Modificar_Controller','[{opcion:4,CentroAdmin:[3,'+idCentro+',0,0,0,0,0]}]']--- Tipo 1 Areas del Centro, Tipo 0 Areas que nos son
                    //jso[0] = ['Modificar_Controller','[{opcion:4,CentroAdmin:[0,0,0,0,0,0,0]}]']--- Lista de Areas
                    try {
                        String[] parametrosCentroAdmin = Elomac.M_toArray(jData.getString("CentroAdmin"));
                        respuesta.println(new Centro().CentroAdmin(parametrosCentroAdmin));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 5: //MODIFICAR FORMATO
                    //jso[0] = ['Modificar_Controller','[{opcion:5,FormatoAdmin:[1,0,'+nomFormato+','+desFormato+','+idTipoFormato+']}]']--- Crear Formato
                    //jso[0] = ['Modificar_Controller','[{opcion:5,FormatoAdmin:[2,'+idFormato+','+nomFormato+','+desFormato+','+idTipoFormato+']}]']--- Modificar Tema
                    //jso[0] = ['Modificar_Controller','[{opcion:5,FormatoAdmin:[0,0,0,0]}]']--- Retorna todos los Formatos
                    try {
                        String[] parametrosFormatoAdmin = Elomac.M_toArray(jData.getString("FormatoAdmin"));
                        
                        
                        respuesta.println(new Formato().FormatoAdmin(parametrosFormatoAdmin));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
                case 6: //MODIFICAR TIPO FORMATO
                    //jso[0] = ['Modificar_Controller','[{opcion:6,TipoFormatoAdmin:[1,0,'+nomTipoFormato+','+urlTipoFormato+']}]']--- Crear Tipo Formato
                    //jso[0] = ['Modificar_Controller','[{opcion:6,TipoFormatoAdmin:[2,'+idTipoFormato+','+nomTipoFormato+','+urlTipoFormato+']}]']--- Modificar Tipo Formato
                    //jso[0] = ['Modificar_Controller','[{opcion:6,TipoFormatoAdmin:[0,0,0,0]}]']--- Retorna todos los Tipos Formatos
                    try {
                        String[] parametrosTipoFormatoAdmin = Elomac.M_toArray(jData.getString("TipoFormatoAdmin"));
                           
                        ArchivosController arch = new ArchivosController();
                        //parametrosTipoFormatoAdmin[3]  Nombre Archivo Real
                        //parametrosTipoFormatoAdmin[2]  Nombre TipoFormato
                        String nombreNuevo = parametrosTipoFormatoAdmin[2]+".png";
                        String path = request.getRealPath("");
                          arch.CambiarNombre(path,parametrosTipoFormatoAdmin[3], nombreNuevo,0,3);
                        respuesta.println(new Formato().TipoFormatoAdmin(parametrosTipoFormatoAdmin));
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                break;
            
            }
            
        }catch (Exception falla) {
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
