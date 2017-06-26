
package M_Controller;

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

@WebServlet(name = "Rankin_Controller", urlPatterns = {"/Rankin_Controller"})
public class Rankin_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            PrintWriter respuesta = response.getWriter();
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            String[] paramRankin;
            switch(opcion){
                case 1://Aumenta una unidad a la cantidad de visitas que tiene un pv
                    //jso[0] = ['Rankin_Controller','[{opcion:1,paramRankin:[0,'+idVersion+',0,0]}]';
                    paramRankin = Elomac.M_toArray(jData.getString("paramRankin"));
                    paramRankin[0] = "1";
                    if(new Rankin().RegistrarRankin(paramRankin)){
                        System.out.println("Exito");
                    }else{
                        System.out.println("Fallo");
                    }
                break;
                case 2: //Aumenta una unidad a la cantidad de Descargas que tiene la version
                    //jso[0] = ['Rankin_Controller','[{opcion:2,paramRankin:[0,'+idVersion+',0,0]}]';
                    paramRankin = Elomac.M_toArray(jData.getString("paramRankin"));
                    paramRankin[0] = "2";
                    if(new Rankin().RegistrarRankin(paramRankin)){
                        respuesta.println("Exito");
                    }else{
                        respuesta.println("Fallo");
                    }
                break;
                case 3://Inserta o actualiza el voto que tiene un determinado usuario con respecto a una determinada version
                    //jso[0] = ['Rankin_Controller','[{opcion:3,paramRankin:[0,'+idVersion+','+idUser+','+voto+']}]';
                    paramRankin = Elomac.M_toArray(jData.getString("paramRankin"));
                    paramRankin[0] = "3";
                    if(new Rankin().RegistrarRankin(paramRankin)){
                        respuesta.println("true$$");
                    }else{
                        respuesta.println("false$$");
                    }
                break;
            }
            
            
        }catch (Exception falla) {
            response.getWriter().println("Falla: " + falla.getMessage());
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
