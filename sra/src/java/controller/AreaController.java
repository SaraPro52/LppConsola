package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Area_Bean;
import modelo.Dao.Area_Dao;

public class AreaController extends HttpServlet {

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
            Area_Bean abean = new Area_Bean();
            abean.setNom_Area(request.getParameter("Nombrea"));
            abean.setLider_Area(request.getParameter("Lider"));
            Area_Dao adao = new Area_Dao(abean);
            switch (opcion) {
                case 1:
                    if ((Boolean) adao.OperacionRegistro("INSERT", 0, 0)) {
                        response.setContentType("application/json;charset=UTF-8");
                        PrintWriter devuelta = response.getWriter();
                        try {
                            devuelta.println(adao.OperacionRegistro("SELECT", 1, 0));
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
                    Area_Bean abean1 = new Area_Bean();
                    Area_Dao adao1 = new Area_Dao(abean1);    
                    try {
                        devuelta.println(adao1.OperacionRegistro("SELECT", 1, 0));
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
