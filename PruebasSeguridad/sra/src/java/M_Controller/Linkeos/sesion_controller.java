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
import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "Pagina_Principal", urlPatterns = {"/sesion_controller"})
public class sesion_controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("application/json;charset=UTF-8");
            HttpSession sesion = request.getSession();
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            switch (opcion) {
                case 1:
                    String usuario = jData.getString("user");
                    String contraseña = DigestUtils.md5Hex(jData.getString("pwd"));
                    String delimitador = "[{colum:4,operador:0,valor1:'\"" + usuario + "\"',añadir:0},{colum:5,operador:0,valor1:'\"" + contraseña + "\"'}]";
                    Elomac elo = new Elomac(19, 2);
                    String fun = elo.Select(delimitador);
                    if (fun != "false") {
                        JSONObject funJ = new JSONArray(fun).getJSONObject(0);
                        int rol = funJ.getInt("Id_Rol");
                        sesion.setAttribute("idUser", funJ.getInt("Id_Funcionario"));
                        sesion.setAttribute("nomUser", funJ.getString("Nom_Funcionario"));
                        sesion.setAttribute("idRol", rol);
                        sesion.setAttribute("idCentro", funJ.getInt("Id_Centro"));
                        switch (rol) {
                            case 1:
                                request.getRequestDispatcher("instructor/instructorPrincipal.jsp").forward(request, response);
                                break;
                            case 2:
                                request.getRequestDispatcher("Equipo/equipoTecnicoPrincipal.jsp").forward(request, response);
                                break;
                            case 3:
                                request.getRequestDispatcher("Equipo/equipoPedagogicoPrincipal.jsp").forward(request, response);
                                break;
                            case 4:
                                request.getRequestDispatcher("coordinador/coordinadorPrincipal.jsp").forward(request, response);
                                break;
                            case 5:
                                request.getRequestDispatcher("administrador/administradorPrincipal.jsp").forward(request, response);
                                break;
                            default:
                                request.getRequestDispatcher("index1.jsp").forward(request, response);
                        }
                    } else {
                        request.getRequestDispatcher("index1.jsp").forward(request, response);
                    }
                    break;
                case 2:
                    try {
                        String da = jData.getString("se");
                        JSONObject jsesion = new JSONArray(da).getJSONObject(0);
                        HttpSession sesioC = request.getSession();
                        sesioC.setAttribute("idUser", jsesion.getInt("idUser"));
                        sesioC.setAttribute("nomUser", jsesion.getString("nomUser"));
                        sesioC.setAttribute("idRol", jsesion.getInt("idRol"));
                        sesioC.setAttribute("idCentro", jsesion.getInt("idCentro"));
                        sesioC.invalidate();
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } catch (Exception e) {
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            request.getRequestDispatcher("index1.jsp").forward(request, response);
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
            Logger.getLogger(sesion_controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(sesion_controller.class.getName()).log(Level.SEVERE, null, ex);
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
