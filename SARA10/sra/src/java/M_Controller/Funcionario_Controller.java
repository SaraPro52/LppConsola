package M_Controller;

import M_Controller.Correos.CorreoController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import M_Modelo.Funcionario;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Funcionario_Controller", urlPatterns = {"/Funcionario_Controller"})

public class Funcionario_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Cambio previsto ahora no se tlvez toque esperar 1 minuto
            PrintWriter devuelta1 = response.getWriter();
            /*Menu de opciondes de crud de funcionario...
            1. Agregar funcionario
            2. Actualizar
            3. Consultar
            4. Deshabilitar*/
            int opcion = Integer.parseInt(request.getParameter("opcion"));
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();

            switch (opcion) {
                case 1:
                    String[] fun = request.getParameterValues("datos[]");
                    fun[8] = new vasos().getVaso();
                    try {
                        if (new Funcionario().RegistrarFuncionario(fun)) {
                            CorreoController jj = new CorreoController();
                            jj.sendEmail("Sara ", "Buen dia ::::::: eres un nuevo funcionario de Sara pro\n Tu usuario es:"+fun[2]+" \ttu contraseña: "+fun[8]+"", fun[5]);
                            respuesta.println("Si Registro");

                        } else {
                            respuesta.println("No Registro");
                        }
                    } catch (Exception e) {
                        respuesta.println(e.getMessage());
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
