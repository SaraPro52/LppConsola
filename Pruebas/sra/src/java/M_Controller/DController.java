package M_Controller;

import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DController", urlPatterns = {"/DController"})
public class DController extends HttpServlet {

    private Elomac elo;
    private int tabla = 0;
    private int tipoElo = 0;
    private int option = 0;
    private String delimitador;

    private int optionSelect = 0;
    private int id = 0;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private PrintWriter respuesta;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu - Crud_Controller
            1. Añadir Registro.
            2. Actualizar datos.
            3. Obtener datos - Solo para tablas
            4. Eliminar
            5. Obtener datos - Solo para vistas
             */
            tipoElo = 1;

            option = Integer.parseInt(request.getParameter("opcion"));

//            String dat = request.getParameter("datos");
//            Gson d = new Gson();
//            d.toJson(dat);
//            Properties json = d.fromJson(dat, Properties.class);

            tipoElo = 1;
            option = Integer.parseInt(request.getParameter("opcion"));
            tabla = Integer.parseInt(request.getParameter("tabla"));
            
            optionSelect = Integer.parseInt(request.getParameter("opSelect"));
            id = Integer.parseInt(request.getParameter("id"));

            elo = new Elomac(tabla, tipoElo);

            switch (option) {
                case 1:
                    if (elo.Insert()) {
                        ManejoDatos();
                    }
                    break;
                case 2:
                    elo = new Elomac(tabla, tipoElo);
                    if (elo.Update(elo.Select(Integer.parseInt(request.getParameter("id"))), request.getParameter("actualizar"))) {
                        break;
                    }
                case 3:
                    ManejoDatos();
                    break;
                case 4:
                    break;
                case 5:
                    tipoElo = 2;
                    ManejoDatos();
                    break;
            }
        } catch (Exception falla) {
            respuesta.println("Falla: " + falla.getMessage());
        }
    }

    private void ManejoDatos() throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        respuesta = response.getWriter();
        String elegir = request.getParameter("elegir");
        String elegir1 = request.getParameter("elegir1");
        String[] elegirArray= new String[2];
        elegirArray[0]=elegir;
        elegirArray[1]=elegir;
        
        Elomac elo1 = new Elomac(tabla, tipoElo);
        try {
            switch (optionSelect) {
                case 1:
                    respuesta.println(elo1.Select());
                    break;
                case 2:
                    respuesta.println(elo1.Select(id));
                    break;
                case 3:
                    respuesta.println(elo1.Select(delimitador));
                    break;
                case 4:
                    respuesta.println(elo1.Select(elegirArray));
                    break;
                case 5:
                    respuesta.println(elo1.Select(elegirArray, id));
                    break;
                case 6:
                    respuesta.println(elo1.Select(elegirArray, delimitador));
                    break;

            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            respuesta.println(e.getMessage());
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
