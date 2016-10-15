
package M_Controller;

import M_Modelo.Version;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoVirtual_Controller", urlPatterns = {"/ProductoVirtual_Controller"})
public class Version_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            int option = Integer.parseInt(request.getParameter("Opcion"));
            String[] infoVersion = request.getParameterValues("info[]");
            String[] arrayFun = request.getParameterValues("arrayFun[]");
            String[] arrayTemas = request.getParameterValues("arrayTemas[]");
            
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            
            Version ver = new Version();
            switch(option){
                case 1:
                    if(ver.RegistrarOA(infoVersion, arrayFun, arrayTemas)){
                        respuesta.println("Exito");
                    }else{
                        respuesta.println("Falla");
                    }
                    break;
                case 2:
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
