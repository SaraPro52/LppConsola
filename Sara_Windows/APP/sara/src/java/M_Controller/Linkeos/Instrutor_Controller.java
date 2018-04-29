package M_Controller.Linkeos;

import M_Modelo.Rankin;
import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "Instrutor_Controller", urlPatterns = {"/Instrutor_Controller"})
public class Instrutor_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int tip = jData.getInt("ti");
            if (tip == 1) {
                int opcion = jData.getInt("opcion");
                switch (opcion) {
                    case 0:
                        request.getRequestDispatcher("instructor/ConsultaOa/consultarOa.jsp").forward(request, response);
                        break;
                    case 1:
                        request.getRequestDispatcher("instructor/registroOA/registroOA.jsp").forward(request, response);
                        break;
                    case 2:
                        request.getRequestDispatcher("instructor/Correcion/correcion.jsp").forward(request, response);
                        break;
                    case 3:
                        request.getRequestDispatcher("instructor/Notificacion/notificacion.jsp").forward(request, response);
                        break;
                    case 4:
                        request.getRequestDispatcher("perfil/perfilUsuario.jsp").forward(request, response);
                        break;
                    case 5:
                        request.getRequestDispatcher("instructor/DetallesConsultaP/DetallessPV.jsp").forward(request, response);
                        break;
                    case 6:
                        request.getRequestDispatcher("instructor/ActualizarOa/Actualizar.jsp").forward(request, response);
                        break;
                    case 7:
                        request.getRequestDispatcher("instructor/misProductosVirtuales/misProductos.jsp").forward(request, response);
                        break;
                }
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

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
