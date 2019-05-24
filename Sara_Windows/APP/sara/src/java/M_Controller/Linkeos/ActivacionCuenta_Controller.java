package M_Controller.Linkeos;

import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "ActivacionCuenta_Controller", urlPatterns = {"/ActivacionCuenta_Controller"})
public class ActivacionCuenta_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String toq = request.getParameter("t");
            int opcion = 1;
            response.setContentType("appication/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            HttpSession sesion1 = request.getSession();
            opcion = Integer.parseInt(request.getParameter("c"));
            Elomac t = new Elomac(23, 2);
            String delimitador = "[{colum:0,operador:0,valor1:'\"" + toq + "\"'}]";
            String datos = t.Select(delimitador);
            try {
                if (datos != null) {
                    JSONObject toqJ = new JSONArray(datos).getJSONObject(0);
                    sesion1.setAttribute("fun", toqJ.getString("funcionario"));
                    request.getRequestDispatcher("inicio/ConfirmacionCon/ConfirmarCon.jsp").forward(request, response);
                }
                if (Integer.parseInt(request.getParameter("c")) != 1 || datos == null) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    sesion1.invalidate();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
                sesion1.invalidate();
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
