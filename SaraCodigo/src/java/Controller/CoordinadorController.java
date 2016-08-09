package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Area_Bean;
import modelo.Bean.Estado_Bean;
import modelo.Dao.Area_Dao;
import modelo.Dao.Estado_Dao;

public class CoordinadorController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            int selector = Integer.parseInt(request.getParameter("selector"));
            //3: rellena selecciones;
            switch (opcion) {
                case 1:
                    //Ingreso de coordinador
                    String nombre = request.getParameter("Nombre");
                    String apellido = request.getParameter("Apellido");
                    String tipoIdentificacion = request.getParameter("TipoIdentificacion");
                    Double identificacion = Double.parseDouble(request.getParameter("identificacion"));
                    String contrasena = request.getParameter("Contrasena");
                    String email = request.getParameter("Email");
                    String sena = request.getParameter("Sena");
                    String cargo = request.getParameter("Cargo");
                    String centro = request.getParameter("Centro");
                    String area = request.getParameter("Area");
                    String estado = request.getParameter("Estado");
                    //Funcionario_Bean coordiandor= new Funcionario_Bean(identificacion, nombre, apellido, email, cargo, sena, contrasena, area, 1);
                    break;
                case 2:
                    break;
                case 3:
                    switch (selector) {
                        case 1:
                            Estado_Bean ebean = new Estado_Bean();
                            Estado_Dao edao = new Estado_Dao(ebean);
                            response.setContentType("application/json;charset=UTF-8");
                            PrintWriter estadodevuelta = response.getWriter();
                            try {
                                estadodevuelta.println(edao.getEstados());
                            } catch (Exception e) {
                                estadodevuelta.println("Error: " + e.getMessage());
                            }
                            
                            break;
                        case 2:
                            Area_Bean abean = new Area_Bean();
                            Area_Dao adao = new Area_Dao(abean);
                            response.setContentType("application/json;charset=UTF-8");
                            PrintWriter areadevuelta = response.getWriter();
                            try {
                                areadevuelta.println(adao.getAreas());
                            } catch (Exception e) {
                                areadevuelta.println("Error: " + e.getMessage());
                            }
                            break;
                    }
                    break;
                case 4:
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
