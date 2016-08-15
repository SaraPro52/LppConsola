package Controller;

import com.sun.xml.internal.fastinfoset.EncodingConstants;
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
                if (fDao.AgregarFuncionario(tipo)) {
                    Correo c = new Correo();
                    String destino = (fBean.getCorreo());
                    String asunto = "¿Nuevo en saraPro?";
                    String descripcion = "Hola: Este es un correo con un usuario y contraseña temporales son Usuario" + fBean.getNum_Documento() + " contraseña: " + fBean.getContraseña() + "PD:Hay que cambiar este mensaje";
                    c.setMensaje(descripcion);
                    c.setAsunto(asunto);
                    c.setDestino(destino);
                    CorreoController ce = new CorreoController();
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        devuelta.println("Envio Correcto");
                    } catch (Exception e) {
                        devuelta.println("Error: " + e.getMessage());
                    }
                    if (ce.enviarCorreo(c)) {
                        System.out.println("Envio correcto, mira tu correo ;)");
                    } else {
                        System.out.println("Error");
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
