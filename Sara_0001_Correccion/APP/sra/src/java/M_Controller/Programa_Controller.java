
package M_Controller;

import M_Modelo.Programa;
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

@WebServlet(name = "Programa_Controller", urlPatterns = {"/Programa_Controller"})
public class Programa_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            
           response.setContentType("application/json;charset=UTF-8");
           PrintWriter respuesta = response.getWriter();
           switch(opcion){
               case 1:
                   String[] programainfo =  Elomac.M_toArray(jData.getString("infoP"));
                   String[] areas =  Elomac.M_toArray(jData.getString("areas"));
                   String[] temas =  Elomac.M_toArray(jData.getString("temas"));
                   
                   Programa p = new Programa();
                   try {
                       if(p.RegistrarPrograma(programainfo, areas, temas))
                            respuesta.println("[{valor:true,mensaje:'Registro Completo'}]");
                        else
                            respuesta.println("[{valor:false,mensaje:'Registro Fallido'}]");
                    } catch (Exception e) {
                         respuesta.println("[{valor:false,mensaje:'"+e.getMessage()+"'}]");
                    }
                   break;
           }
        }catch(Exception ex){
            response.getWriter().print(ex.getMessage());
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
