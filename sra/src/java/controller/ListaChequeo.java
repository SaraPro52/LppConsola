package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Lista_Chequeo_Bean;
import modelo.Dao.Lista_Chequeo_Dao;

public class ListaChequeo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu de opciones crud
            1.agregar item
            2.actualizar
            3.consultar
            4.eliminar
            5. Agregar lista de chequeo*/
            
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            Lista_Chequeo_Bean lBean = new Lista_Chequeo_Bean();
            switch (opcion) {
                case 1:
                    lBean.setNom_Lista_Chequeo(request.getParameter("nombreL"));
                    lBean.setId_Lista_Chequeo(Integer.parseInt(request.getParameter("tipoLista")));
                    lBean.setDes_Lista_Chequeo(request.getParameter("descripcion"));
                    String arr = request.getParameter("array");
                    String[] arr1 = new Gson().fromJson(arr,  String[].class);
                    lBean.setId_Funcionario(Integer.parseInt(request.getParameter("funcionario")));
                    Lista_Chequeo_Dao lDao = new Lista_Chequeo_Dao(lBean);
                    PrintWriter devueltas = response.getWriter();
                    if ((Boolean) lDao.OperacionRegistro("INSERT", 1, arr1)) {
                        response.setContentType("application/json;charset=UTF-8");
                        devueltas.println(lDao.OperacionRegistro("INSERT", 1, arr1));
                    } else {
                        devueltas.println(lDao.OperacionRegistro("INSERT", 1, arr));
                    }
                    break;
                case 2:
                    break;
                case 3:
                    Lista_Chequeo_Dao lDao1 = new Lista_Chequeo_Dao(lBean);
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        devuelta.println(lDao1.OperacionRegistro("SELECT", 1, 0));
                    } catch (Exception e) {
                        devuelta.println("Error: " + e.getMessage());
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
