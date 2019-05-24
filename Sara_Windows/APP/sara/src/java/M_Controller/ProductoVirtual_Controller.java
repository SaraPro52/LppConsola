package M_Controller;

import M_Controller.Archivos.ArchivosController;
import M_Modelo.Notificacion;
import M_Modelo.Producto_Virtual;
import M_Modelo.Version;
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

@WebServlet(name = "ProductoVirtual_Controller", urlPatterns = {"/ProductoVirtual_Controller"})

public class ProductoVirtual_Controller extends HttpServlet {

    private PrintWriter respuesta;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu controlador Version
                1. Registrar Producto virtual desde 0.
                2. Registrar Una nueva Version.
                3. Correccion - Actualiza solo el url.
                4. Realiza la aprovacion del producto virtual.
                5. Consultar Productos virtuales Aprovados.
            WHEN 0 THEN SET @Nom_P_Virtual = @valor;
			WHEN 1 THEN SET @Des_P_Virtual = @valor;
			WHEN 2 THEN SET @Palabras_Clave = @valor;
			WHEN 3 THEN SET @Id_Formato = @valor;
			WHEN 4 THEN SET @Url_Version = @valor;
			WHEN 5 THEN SET @Url_Img = @valor;
			WHEN 6 THEN SET @Inst_Instalacion= @valor;
			WHEN 7 THEN SET @Reqst_Instalacion = @valor;
			WHEN 8 THEN SET @ArrayFuncionario = @valor;
			WHEN 9 THEN SET @ArrayTema = @valor;
            
             */
            String nomUrl = "null";
            String[] infoVersion = null;
            String arrayFun = null;
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);

            int opcion = jData.getInt("opcion");

            response.setContentType("application/json;charset=UTF-8");

            ArchivosController arch = new ArchivosController();
            respuesta = response.getWriter();
            Version ver = new Version();
            String path = request.getRealPath("");
            switch (opcion) {
                case 1:
                    infoVersion = Elomac.M_toArray(jData.getString("info"));
                    arrayFun = M_Procedure.Group(Elomac.M_toArray(jData.getString("arrayFun")), ',');
                    String[] arrayTemas = Elomac.M_toArray(jData.getString("arrayTemas"));
                    String archivoNom = jData.getString("archivoNom");
                    infoVersion[4] = archivoNom;
                    nomUrl = ver.RegistrarPV(infoVersion, arrayFun, arrayTemas);//16/04/2017
                    if (nomUrl != "null") {
                        arch.CambiarNombre(path,archivoNom, nomUrl, 0, 1);
                        respuesta.println("true$$ fue registrado");
                        arch.MoverArchivo(path,nomUrl);
                    } else {
                        respuesta.println("false$$ no fue registrado");
                        arch.EliminarArchivo(path,archivoNom, 1);
                    }
                    break;
                case 2:
                    infoVersion = Elomac.M_toArray(jData.getString("info"));
                    arrayFun = M_Procedure.Group(Elomac.M_toArray(jData.getString("arrayFun")), ',');
                    String archivoNom1 = jData.getString("archivoNom");
                    nomUrl = ver.RegistrarVersion(infoVersion, arrayFun);//16/04/2017
                    if (nomUrl != "null") {
                        arch.CambiarNombre(path,archivoNom1, nomUrl, 0, 1);
                        respuesta.println("true$$ fue registrado");
                        arch.MoverArchivo(path,nomUrl);
                    } else {
                        respuesta.println("false$$ no fue registrado");
                        arch.EliminarArchivo(path,archivoNom1, 1);
                    }
                    break;
                case 3:
                    //-------CAMBIADO
                    try {
                        String[] correccion = Elomac.M_toArray(jData.getString("correccion"));
                        String archivoNom2 = jData.getString("archivoNom");
                        nomUrl = ver.CorreccionVersion(correccion);//16/04/2017
                        if (nomUrl != "null") {
                            arch.CambiarNombre(path,archivoNom2, nomUrl, 0, 1);
                            respuesta.println("true$$ fue Corregido");

                            //---CAMBIO 2 Elimina el archivo que se encontraba subido (Antiguo)
                            arch.EliminarArchivo(path,jData.getString("url"), 2);
                            //---Cambio
                            arch.MoverArchivo(path,nomUrl);
                            int idNoti = jData.getInt("idNot");
                            Notificacion noti = new Notificacion();
                            noti.load(noti.Select(idNoti));
                            noti.atributos.replace("Estado", 1);
                            noti.Update();
                        } else {
                            respuesta.println("false$$ no fue Corregido");
                            arch.EliminarArchivo(path,archivoNom2, 1);
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    //-------CAMBIADO
                    break;
                case 4:
                    try {
                        String[] aprobacion = Elomac.M_toArray(jData.getString("aprobacion"));
                        String[] aT = {"5"};
                        String delimi = "[{colum:0,operador:0,valor1:" + aprobacion[1] + "}]";
                        String nomUrlOld = new JSONArray(new Version().Select(aT, delimi)).getJSONObject(0).getString("url_version");
                        nomUrl = ver.AprobarPV(aprobacion);//16/04/2017
                        if (nomUrl != "null") {
                            arch.CambiarNombre(path,nomUrlOld, nomUrl, 1, 1);
                            respuesta.println("true$$Habilitado");
                        } else {
                            respuesta.println("false$$no pudo ser habilitado");
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 5:
                    String[] filtrar = Elomac.M_toArray(jData.getString("filtrar"));
                    int caso = jData.getInt("caso");
                    String consulta = new Producto_Virtual().ConsultarProducto(filtrar, caso);
                    if (consulta != "null") {
                        respuesta.println(consulta);
                    } else {
                        respuesta.println("false$$No se Encuentran Registros");
                    }
                    break;
                case 6:
                    int idPV = jData.getInt("idPV");
                    respuesta.println(new Producto_Virtual().DetallesConsulta(idPV));
                    break;
            }
        } catch (Exception falla) {
            respuesta.println("Falla: " + falla.getMessage());
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
            Logger.getLogger(ProductoVirtual_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductoVirtual_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
