
package M_Controller;

import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Crud_Controller", urlPatterns = {"/Crud_Controller"})
public class Crud_Controller extends HttpServlet {
    
    private Elomac elo;
    private int tabla = 0;
    private int tipoElo = 1;
    private String delimitador;
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
            String[] datos = request.getParameterValues("datos[]");
            int option = Integer.parseInt(request.getParameter("opcion"));
            tabla = Integer.parseInt(request.getParameter("tabla"));
            delimitador = request.getParameter("delimitador");
            
           elo = new Elomac(tabla,tipoElo,datos);
           switch(option){
               case 1:if(elo.Insert()){ 
                   recargarDatos();
               }
                   break;
               case 2:
                    elo = new Elomac(tabla,tipoElo);
                    if(elo.Update(elo.Select(Integer.parseInt(request.getParameter("id"))),request.getParameter("jsonActualizar")))
                        recargarDatos();
                   break;
               case 3:recargarDatos(); break;
               case 4:break;
               case 5:
                   tipoElo = 2;
                   recargarDatos();
                   break;
           }
        }catch(Exception falla){
            respuesta.println("Falla: "+ falla.getMessage());
        }
    }
    
    public void recargarDatos() throws IOException{
        
        response.setContentType("application/json;charset=UTF-8");
                    respuesta = response.getWriter();
                    int optionSelect = Integer.parseInt(request.getParameter("opSelect"));
                    Elomac elo1 = new Elomac(tabla,tipoElo);
                   try {
                       //String[] elegir = request.getParameterValues("elegir[]");
                       String[] elegir = null;
                       //int id = Integer.parseInt(request.getParameter("id"));
                       int id = 0;
                        switch(optionSelect){
                            case 1:respuesta.println(elo1.Select());
                                System.out.println(elo1.Select());
                            break;
                            case 2:respuesta.println(elo1.Select(id)); break;
                            case 3:respuesta.println(elo1.Select(delimitador));break;
                            case 4:respuesta.println(elo1.Select(elegir));break;
                            case 5:respuesta.println(elo1.Select(elegir, id));break;
                            case 6:respuesta.println(elo1.Select(elegir,delimitador));break;
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
