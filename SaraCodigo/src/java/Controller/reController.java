/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Funcionario_Bean;
import modelo.Dao.Funcionario_Dao;

/**
 *
 * @author root
 */
public class reController extends HttpServlet {

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
                    int tipo = Integer.parseInt(request.getParameter("STipoUsuario"));
                    String nombre = (request.getParameter("CNombre"));
                    String apellido=(request.getParameter("CApellido"));
                    Double identificacion=(Double.parseDouble(request.getParameter("CIdentificacion")));
                    String correo=(request.getParameter("CEmail"));
                    String cargo=(request.getParameter("SCargo"));
                    String sena=(request.getParameter("CSena"));
                    vasos contra = new vasos();
                    contra.AVasos();
                    String contr = (contra.getVaso());
                    int estado=(Integer.parseInt(request.getParameter("SEstado")));
                    int area=(Integer.parseInt(request.getParameter("SArea")));
                    Funcionario_Bean fBean = new Funcionario_Bean(identificacion,nombre,apellido,correo,cargo,sena,contr,estado,area);
                    Funcionario_Dao fDao = new Funcionario_Dao(fBean);
                    if (fDao.AgregarFuncionario(tipo)) {
                        Correo c = new Correo();
                        String destino = (fBean.getCorreo());
                        String asunto = "Nuevo en saraPro?";
                        String descripcion = "Hola:  Este es un correo con un usuario y contraseña temporales son Usuario" + fBean.getNum_Documento() + " contraseña: " + fBean.getContraseña();
                        c.setMensaje(descripcion);
                        c.setAsunto(asunto);
                        c.setDestino(destino);
                        CorreoController ce = new CorreoController();
                        if (ce.enviarCorreo(c)) {
                            System.out.println("Envio correcto, mira tu correo ;)");
                        } else {
                            System.out.println("Error");
                        }
                        response.setContentType("application/json;charset=UTF-8");
                        PrintWriter devuelta = response.getWriter();
                        try {
                            devuelta.println(fDao.listar());
                        } catch (Exception e) {
                            devuelta.println("Error: " + e.getMessage());

                        }
                    }

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
