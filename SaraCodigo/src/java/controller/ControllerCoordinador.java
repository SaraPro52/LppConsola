/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.bean.BeanAdministrador;
import model.bean.BeanCoordinador;
import model.dao.DaoAdministrador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author root
 */
public class ControllerCoordinador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int opcion = Integer.parseInt(request.getParameter("Opcion"));
        switch (opcion) {
            case 1:
                double numDocumeto = Double.parseDouble(request.getParameter("NumDocument"));
                String nomFuncionario = request.getParameter("NomFuncionario");
                String tipoDocumento = request.getParameter("TipoDocumento");
                String apelllidos = request.getParameter("Apellidos");
                String correo = request.getParameter("Correo");
                String cargo = request.getParameter("Cargo");
                String ipSena = request.getParameter("IpSena");
                String cooreo = request.getParameter("Coorreo");
                BeanAdministrador Beancoor = new BeanAdministrador();
                DaoAdministrador DaoAdmi = new DaoAdministrador(Beancoor);
                Beancoor.registrofuncionario(numDocumeto, nomFuncionario, tipoDocumento, apelllidos);

                Beancoor.registrofuncionario1(correo, cargo, ipSena, cooreo);
                break;
            case 2:
                //             BeanAdministr BeanAdmi = new BeanAdministrador();
                //           BeanAdmi.setCargo("Administrador");
                break;
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
