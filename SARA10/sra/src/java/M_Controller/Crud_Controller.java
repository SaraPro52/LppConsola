
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
@WebServlet(name = "Crud_Controller", urlPatterns = {"/Crud_Controller"})
public class Crud_Controller extends HttpServlet {
    
    private Elomac elo;
    private int tabla = 0;
    private int tipoElo = 0;
    private int option = 0;
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
            1. Añadir Registro.
            2. Actualizar datos.
            3. Obtener datos - Solo para tablas
            4. Eliminar
            5. Obtener datos - Solo para vistas
            */
            tipoElo = 1;
            option = Integer.parseInt(request.getParameter("opcion"));
            tabla = Integer.parseInt(request.getParameter("tabla"));
            datos = request.getParameterValues("datos[]");
            delimitador = request.getParameter("delimitador");
            actualizar = request.getParameter("actualizar");
            optionSelect= Integer.parseInt(request.getParameter("opSelect"));
            id = Integer.parseInt(request.getParameter("id"));
            
            elo = new Elomac(tabla,tipoElo,datos);
           
           switch(option){
               case 1:if(elo.Insert())ManejoDatos();break;
               case 2:
                    elo = new Elomac(tabla,tipoElo);
                    if(elo.Update(elo.Select(Integer.parseInt(request.getParameter("id"))),request.getParameter("actualizar"))){
                        respuesta.println("actualizado");
                    }  
                    else{
                        respuesta.println("no actualizado");
                    } 
                       
                   break;
               case 3:ManejoDatos(); break;
               case 4:
               break;
               case 5:
                   tipoElo = 2;
                   ManejoDatos();
                   break;
           }
        }catch(Exception falla){
            respuesta.println("Falla: "+ falla.getMessage());
        }finally {
            try {
                    elo.cerrarConexiones();
            } catch (SQLException ex) {
                respuesta.println("Falla: "+ ex.getMessage());
            }
        }
    }
    
    private void ManejoDatos() throws IOException{
        response.setContentType("application/json;charset=UTF-8");
                    respuesta = response.getWriter();
                    Elomac elo1 = new Elomac(tabla,tipoElo);
                   try {
                       String[] elegir = request.getParameterValues("elegir[]");
                           switch(optionSelect){
                            case 1:respuesta.println(elo1.Select());break;
                            case 2:respuesta.println(elo1.Select(id)); break;
                            case 3:respuesta.println(elo1.Select(delimitador));break;
                            case 4:respuesta.println(elo1.Select(elegir));break;
                            case 5:respuesta.println(elo1.Select(elegir, id));break;
                            case 6:respuesta.println(elo1.Select(elegir,delimitador));break;
                            default: respuesta.println("Default");break;
                        
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
