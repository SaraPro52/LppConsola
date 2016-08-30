package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Funcionario_Bean;
import modelo.Dao.Funcionario_Dao;

public class FuncionarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            /*Menu de opciondes de crud de funcionario...
            1. Agregar funcionario
            2. Actualizar
            3. Consultar
            4. Eliminar*/
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            switch (opcion) {
                case 1:
                    int tipo = Integer.parseInt(request.getParameter("STipoUsuario"));
                    Funcionario_Bean fBean = new Funcionario_Bean();
                    fBean.setNom_Funcionario(request.getParameter("CNombre"));
                    fBean.setId_Tipo_Documento(Integer.parseInt(request.getParameter("StipoIdentificacion")));
                    fBean.setApellidos((request.getParameter("CApellido")));
                    fBean.setNum_Documento(Double.parseDouble(request.getParameter("CIdentificacion")));
                    fBean.setCorreo(request.getParameter("CEmail"));
                    fBean.setCargo(request.getParameter("SCargo"));
                    fBean.setIp_Sena(request.getParameter("CSena"));
                    vasos contra = new vasos();
                    contra.AVasos();
                    fBean.setContraseña(contra.getVaso());
                    fBean.setId_Estado(Integer.parseInt(request.getParameter("SEstado")));
                    fBean.setId_Area_Centro(Integer.parseInt(request.getParameter("SArea")));
                    Funcionario_Dao fDao = new Funcionario_Dao(fBean);
                    Boolean a = (Boolean) fDao.OperacionRegistro("INSERT", 1, tipo);
                    CorreoController ce = new CorreoController();
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        ce.obtenerMensaje(fBean.getCorreo(), fBean.getNum_Documento(), fBean.getContraseña());
                    } catch (Exception e) {
                        System.out.println("Error: " + e.getMessage());
                    }
                    devuelta.println(a);
                    break;
                case 2:
                    break;
                case 3:
                    Funcionario_Bean fBean1 = new Funcionario_Bean();
                    Funcionario_Dao fDao1 = new Funcionario_Dao(fBean1);
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta1 = response.getWriter();
                    try {
                        devuelta1.println(fDao1.OperacionRegistro("SELECT", 1, 0));
                    } catch (Exception e) {
                        devuelta1.println("Error: " + e.getMessage());
                    }

                    break;
                case 4:
                    Funcionario_Dao fDao4 = new Funcionario_Dao();
                    Funcionario_Bean fBean4 = (Funcionario_Bean) fDao4.OperacionRegistro("SELECT", 2, (Integer.parseInt(request.getParameter("Id_Fun"))));
                    fBean4.setId_Estado(3);
                    fDao4 = new Funcionario_Dao(fBean4);
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta4 = response.getWriter();
                    try {
                        if((Boolean)fDao4.OperacionRegistro("UPDATE", 0, 0)){
                            devuelta4.println("Verdadero");
                        }else{
                            devuelta4.println("Falso");
                        }
                    } catch (Exception e) {
                        devuelta4.println("Error: " + e.getMessage());
                    }
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
