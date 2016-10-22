package M_Controller.Linkeos;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Administrador_Controller", urlPatterns = {"/Administrador_Controller"})
public class Administrador_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            switch (opcion) {                
                case 0:
                    request.getRequestDispatcher("administrador/registroFuncionario/registrofuncionario.jsp").forward(request, response);
                    break; 
                case 1:
                    request.getRequestDispatcher("administrador/deshabilitarFuncionario/deshabilitarFuncionario.jsp").forward(request, response);
                    break;
                case 2:
                    request.getRequestDispatcher("administrador/Formato/Formato.jsp").forward(request, response);
                    break;
                case 3:
                    request.getRequestDispatcher("administrador/area/area.jsp").forward(request, response);
                    break;
                case 4:
                    request.getRequestDispatcher("administrador/ciudad/ciudad.jsp").forward(request, response);
                    break;
                case 5:
                    request.getRequestDispatcher("administrador/programa/Programa.jsp").forward(request, response);
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
