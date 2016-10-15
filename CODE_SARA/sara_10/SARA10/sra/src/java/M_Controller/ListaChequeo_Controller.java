package M_Controller;

import M_Modelo.Lista_Chequeo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListaChequeo_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu de opciones crud
            1.Agregar lista de chequeo
            2.actualizar
            3.consultar
            4.eliminar
            5.Agregar Items*/
            
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            switch (opcion) {
                case 1:
                    String[] lista = request.getParameterValues("lista[]");
                    String[] items = request.getParameterValues("items[]");
                    respuesta.println(new Lista_Chequeo().RegistrarLista(lista, items));
                    break;
                case 2:
                    
                    break;
                case 3:
                    try {
                        respuesta.println(new Lista_Chequeo().Select());
                    } catch (Exception e) {
                        respuesta.println("Falla: " + e.getMessage());
                    }
                    break;
                case 4:
                    break;
                case 5:
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
