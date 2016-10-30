package M_Controller.Linkeos;

import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "sesion_controller", urlPatterns = {"/sesion_controller"})
public class sesion_controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();

            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("contraseña");

            String[] numsTablas = {"1","4","7","13"};
            String delimitador = "[{colum:7,operador:0,valor1:'\""+usuario+"\"',anadir:0},{colum:13,operador:0,valor1:"+contraseña+"}]";
            Elomac elo = new Elomac(7,2);

            String user = "null";
            user = elo.Select(numsTablas,delimitador);
            if(user != "null"){
                respuesta.println(user);
            }else{
                respuesta.println(user);
            }

            switch (opcion) {
                case 0:
                    request.getRequestDispatcher("administrador/administradorPrincipal.jsp").forward(request, response);
                    break;
                case 1:
                    request.getRequestDispatcher("coordinador/coordinadorPrincipal.jsp").forward(request, response);
                    break;
                case 2:
                    request.getRequestDispatcher("Equipo/equipoTecnicoPrincipal.jsp").forward(request, response);
                    break;
                case 3:
                    request.getRequestDispatcher("Equipo/equipoPedagogicoPrincipal.jsp").forward(request, response);
                    break;
                case 4:
                    request.getRequestDispatcher("instrutor/instrutorPrincipal.jsp").forward(request, response);
                    break;
                case 5:
                    request.getRequestDispatcher("instrutor/registroOA/registroOA.jsp").forward(request, response);
                    break;
                case 6:
                    request.getRequestDispatcher("Equipo/ModificarLista/modificarLista.jsp").forward(request, response);
                    break;
                case 7:
                    request.getRequestDispatcher("Equipo/CalificarOa/calificarOa.jsp").forward(request, response);
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
