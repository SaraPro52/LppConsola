package M_Controller;

import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "Crud_Controller", urlPatterns = {"/Crud_Controller"})
public class Crud_Controller extends HttpServlet {

    private Elomac elo;
    private JSONObject jData;
    private int tabla = 0;
    private int tipoElo = 0;
    private int opcion = 0;
    private String delimitador;
    private String[] datos = null;
    private String actualizar = "";
    private int optionSelect = 0;
    private int id = 0;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private PrintWriter respuesta;
    
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu - Crud_Controller
            1. AÃ±adir Registro.
            2. Actualizar datos.
            3. Obtener datos - Solo para tablas
            4. Eliminar
            5. Obtener datos - Solo para vistas*/
           String data = request.getParameter("data");
            jData = new JSONArray(data).getJSONObject(0);
            
            tipoElo = 1;
            tabla =         jData.getInt("tabla");
            opcion =        jData.getInt("opcion");
            id =            jData.getInt("id");
            optionSelect =  jData.getInt("opSelect");
            
            switch (opcion) {
                case 1:
                    datos = (String[]) Elomac.M_toArray(jData.getString("datos"));
                    elo = new Elomac(tabla, tipoElo, datos);
                    if (elo.Insert()) {
                        ManejoDatos();
                    }
                    break;
                case 2:
                    actualizar = jData.getString("actualizar");
                    elo = new Elomac(tabla, tipoElo);
                    try {
                        if (elo.Update(elo.Select(id), actualizar)) {
                            respuesta.println("actualizado");
                        } else {
                            respuesta.println("no actualizado");
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
                    }
                    break;
                case 3:
                    ManejoDatos();
                    break;
                case 4:
                    break;
                case 5:
                    tipoElo = 2;
                    ManejoDatos();
                    break;
            }
        } catch (Exception falla) {
            respuesta.println("Falla: " + falla.getMessage());
        } finally {
            try {
                elo.cerrarConexiones();
            } catch (SQLException ex) {
                respuesta.println("Falla: " + ex.getMessage());
            }
        }
    }

    private void ManejoDatos() throws Exception {
        response.setContentType("application/json;charset=UTF-8");
        respuesta = response.getWriter();
        Elomac elo1 = new Elomac(tabla, tipoElo);
        delimitador = jData.getString("delimitador");
        String[] elegir = Elomac.M_toArray(jData.getString("elegir"));
        try {
            switch (optionSelect) {
                case 1:respuesta.println(elo1.Select());break;
                case 2:respuesta.println(elo1.Select(id));break;
                case 3:respuesta.println(elo1.Select(delimitador));break;
                case 4:respuesta.println(elo1.Select(elegir));break;
                case 5:respuesta.println(elo1.Select(elegir, id));break;
                case 6:respuesta.println(elo1.Select(elegir, delimitador));break;
                default:respuesta.println("Default");break;
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            respuesta.println(e.getMessage());
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
        System.out.println(request);
        System.out.println(response);
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
        System.out.println(request);
        System.out.println(response);
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
