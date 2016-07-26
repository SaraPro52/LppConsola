package controller;

import extras.Funcionario;
import model.bean.BeanAdministrador;
import model.dao.DaoAdministrador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerAdministrador extends HttpServlet {

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
                String contraseña = request.getParameter("Contraseña");
                BeanAdministrador BeanAdmi = new BeanAdministrador();
                DaoAdministrador DaoAdmi = new DaoAdministrador(BeanAdmi);
                DaoAdmi.AgregarRegistro();
                BeanAdmi.registrofuncionario(numDocumeto, nomFuncionario, tipoDocumento, apelllidos);
                BeanAdmi.registrofuncionario1(correo, cargo, ipSena,contraseña );
                BeanAdmi.setCargo("Administrador");
                
                /*if (DaoAdmi.Consultar) {
                    
                    if (DaoAdmi.AgregarRegistro) {
                        
                    }
                    
                }else{
                
                }

                break;

            case 2:

                BeanAdministrador BeanAdmi1 = new BeanAdministrador();
                BeanAdmi1.setCargo("Administrador");
                break;*/
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
