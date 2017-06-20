package M_Controller;

import M_Modelo.Categoria;
import M_Util.Elomac;
import M_Util.M_Procedure;
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
import org.json.JSONObject;

@WebServlet(name = "Categoria_Controller", urlPatterns = {"/Categoria_Controller"})

public class Categoria_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            PrintWriter respuesta = response.getWriter();
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            
            Categoria cate = new Categoria();
            switch (opcion) {
                case 1:
                    String[] categoria = Elomac.M_toArray(jData.getString("catego"));
                    String temas = M_Procedure.Group(Elomac.M_toArray(jData.getString("temas")), ',');
                    if (cate.RegistrarCategoria(categoria, temas)) {
                        respuesta.print("true$$se registro correctamente");
                    } else {
                        respuesta.print("false$$no se registro");
                    }
                    break;
                case 2:
                    String[] datosTema = Elomac.M_toArray(jData.getString("datosTema"));//20/04/2017
                    String nuevoTema = cate.RegistrarTemaCategoria(datosTema);
                    if(nuevoTema != "null"){
                        
                        respuesta.print("true$$se registro correctamente$$"+nuevoTema);
                    } else {
                        respuesta.print("false$$no se registro");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Categoria_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(Categoria_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
