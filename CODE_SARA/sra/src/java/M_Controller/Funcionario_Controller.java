package M_Controller;
import M_Controller.Correos.CorreoController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import M_Modelo.Funcionario;

public class Funcionario_Controller extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

             PrintWriter devuelta1 = response.getWriter();
            /*Menu de opciondes de crud de funcionario...
            1. Agregar funcionario
            2. Actualizar
            3. Consultar
            4. Deshabilitar*/
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            
            switch (opcion) {
                case 1:
                    String[] fun = request.getParameterValues("array[]");
                    boolean a = (new Funcionario().RegistrarFuncionario(fun));
                    if(a){
                        try {
                           new CorreoController().obtenerMensaje(fun[5],fun[2],fun[8]);
                        } catch (Exception e) {
                            System.out.println("Error: " + e.getMessage());
                        }
                    }
                    respuesta.println(a);
                    break;
                case 2:
                    break;
                case 3:
                    try {
                        respuesta.println(new Funcionario().Select());
                    } catch (Exception e) {
                        respuesta.println("Falla: " + e.getMessage());
                    }
                    break;
                case 4:
                    Funcionario fun1 = new Funcionario();
                    fun1.load(fun1.Select(Integer.parseInt(request.getParameter("Id_Fun"))));
                    fun1.atributos.replace("Id_Estado", 3);
                    try {
                        if(fun1.Update()){
                            respuesta.println("Verdadero");
                        }else{
                            respuesta.println("Falso");
                        }
                    } catch (Exception e) {
                        respuesta.println("Falla: " + e.getMessage());
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
