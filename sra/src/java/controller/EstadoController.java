package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Estado_Bean;
import modelo.Dao.Estado_Dao;

public class EstadoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu de opciones crud
            1.agregar
            2.actualizar
            3.consultar
            4.eliminar*/
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            Estado_Bean ebean = new Estado_Bean();
            ebean.setNom_Estado(request.getParameter("estado"));
            ebean.setId_Tipo_Estado(Integer.parseInt(request.getParameter("tipo")));
            Estado_Dao edao = new Estado_Dao(ebean);
            switch (opcion) {
                case 1:
                    if ((Boolean)edao.OperacionRegistro("INSERT", 0, 0)) {
                        response.setContentType("application/json;charset=UTF-8");
                        PrintWriter devuelta = response.getWriter();
                        try {
                            devuelta.println(edao.OperacionRegistro("SELECT", 1, 0));
                        } catch (Exception e) {
                            devuelta.println("Error: " + e.getMessage());
                        }
                    }
                    break;
                case 2:
                    break;
                case 3:
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        devuelta.println(edao.OperacionRegistro("SELECT", 1, 0));
                    } catch (Exception e) {
                        devuelta.println("Error: " + e.getMessage());
                    }
                    break;
                    
                case 4:
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
