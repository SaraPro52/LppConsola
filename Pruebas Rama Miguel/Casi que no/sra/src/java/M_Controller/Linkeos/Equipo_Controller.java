package M_Controller.Linkeos;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "Equipo_Controller", urlPatterns = {"/Equipo_Controller"})
public class Equipo_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int tip = jData.getInt("ti");
            if ((tip == 2) || (tip == 3)) {
                int opcion = jData.getInt("opcion");
                switch (opcion) {
                    case 0:
                        request.getRequestDispatcher("perfil/perfilUsuario.jsp").forward(request, response);
                        break;
                    case 1:
                        request.getRequestDispatcher("Equipo/ListaChequeo/listaChequeo.jsp").forward(request, response);
                        break;
                    case 2:
                        request.getRequestDispatcher("Equipo/ConsultarOa/consultarOa.jsp").forward(request, response);
                        break;
                    case 3:
                        request.getRequestDispatcher("Equipo/ModificarLista/modificarLista.jsp").forward(request, response);
                        break;
                    case 4:
                        request.getRequestDispatcher("Equipo/CalificarOa/calificarOa.jsp").forward(request, response);
                        break;
                }
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(Equipo_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(Equipo_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
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
