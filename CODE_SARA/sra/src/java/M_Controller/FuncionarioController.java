package M_Controller;

import M_Controller.Correos.CorreoController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import M_Modelo.Funcionario;

public class FuncionarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

             PrintWriter devuelta1 = response.getWriter();
            /*Menu de opciondes de crud de funcionario...
            1. Agregar funcionario
            2. Actualizar
            3. Consultar
            4. Eliminar*/
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            switch (opcion) {
                case 1:
                    String [] fun = null;
                    fun[0] = ""+(request.getParameter("STipoUsuario"))+"";
                    fun[1] = ""+(request.getParameter("StipoIdentificacion"))+"";
                    fun[2] = ""+(request.getParameter("CIdentificacion"))+"";
                    fun[3] = ""+(request.getParameter("CNombre"))+"";
                    fun[4] = ""+(request.getParameter("CApellido"))+"";
                    fun[5] = ""+(request.getParameter("CEmail"))+"";
                    fun[6] = ""+(request.getParameter("SCargo"))+"";
                    fun[7] = ""+(request.getParameter("CSena"))+"";
                    fun[8] = ""+(new vasos().getVaso())+"";
                    fun[9] = ""+(request.getParameter("SEstado"))+"";
                    fun[10] = "1";
                    fun[11] = "1";
                    boolean a = (new Funcionario().RegistrarFuncionario(fun));
                    
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        new CorreoController().obtenerMensaje(fun[5],fun[2],fun[8]);
                    } catch (Exception e) {
                        System.out.println("Error: " + e.getMessage());
                    }
                    devuelta.println(a);
                    break;
                case 2:
                    break;
                case 3:
                    response.setContentType("application/json;charset=UTF-8");
                    try {
                        devuelta1.println(new Funcionario().Select());
                    } catch (Exception e) {
                        devuelta1.println("Error: " + e.getMessage());
                    }

                    break;
                case 4:
                    Funcionario fun1 = new Funcionario();
                    fun1.load(new Funcionario().Select(Integer.parseInt(request.getParameter("Id_Fun"))));
                    fun1.atributos.replace("Id_Estado", 3);
                    
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta4 = response.getWriter();
                    try {
                        if(fun1.Update()){
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
