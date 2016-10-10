
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
    public Elomac elo;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     
            String[] json = request.getParameterValues("array[]");
            int option = Integer.parseInt(request.getParameter("Opcion"));
            int tabla = Integer.parseInt(request.getParameter("tabla"));
            
           elo = new Elomac(tabla,json);
           switch(option){
               case 1:
                   if(elo.Insert()){ recargarDatos(response);}
                   break;
               case 2:
                    elo = new Elomac(tabla);
                   if(elo.Update(elo.Select(Integer.parseInt(request.getParameter("id"))),request.getParameter("multi"))){
                       recargarDatos(response);
                   }
                   break;
               case 3:
                    recargarDatos(response);
                   break;
               case 4:
                   break;
           }
        }
    }
    
    public void recargarDatos(HttpServletResponse response) throws IOException{
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter respuesta = response.getWriter();
        try {
            respuesta.println(elo.Select());
        } catch (Exception e) {
            respuesta.println("Falla: "+e.getMessage());
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
