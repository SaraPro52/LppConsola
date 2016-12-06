package M_Controller.Linkeos;

import M_Util.Elomac;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "sesion_controller", urlPatterns = {"/sesion_controller"})
public class sesion_controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();
            HttpSession sesion = request.getSession();

            String usuario = request.getParameter("user");
            String contraseña = request.getParameter("pwd");
            if (usuario.equals("1019") && contraseña.equals("Sena")) {
                sesion.setAttribute("ami", "1019");
                request.getRequestDispatcher("administrador/administradorPrincipal.jsp").forward(request, response);
                if (request.getParameter("cerrar") != null) {
                    sesion.invalidate();
                }
            } else {
                contraseña = DigestUtils.md5Hex(request.getParameter("pwd"));
                String delimitador = "[{colum:4,operador:0,valor1:'\"" + usuario + "\"',añadir:0},{colum:5,operador:0,valor1:'\"" + contraseña + "\"'}]";
                Elomac elo = new Elomac(19, 2);

                try {
                    String fun = elo.Select(delimitador);

                    if (fun != "") {
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
                        }

                        //                }else if(ad != ""){
                        //                    
                        //                    JSONObject admin = new JSONArray(ad).getJSONObject(0);
                        //                    sesion.setAttribute("usuAdmin",admin.getString("Usuario"));
                        //                    sesion.setAttribute("contra",admin.getString("Contraseña"));
                        //                    
                        //                    request.getRequestDispatcher("administrador/administradorPrincipal.jsp").forward(request, response);
                        //                    
                    }
                    if (request.getParameter("cerrar") != null) {
                        sesion.invalidate();
                    }
                } catch (Exception e) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    sesion.invalidate();
                }
            }

//            switch (opcion) {
//                case 0:
//                    request.getRequestDispatcher("administrador/administradorPrincipal.jsp").forward(request, response);
//                    break;
//                case 1:
//                    request.getRequestDispatcher("coordinador/coordinadorPrincipal.jsp").forward(request, response);
//                    break;
//                case 2:
//                    request.getRequestDispatcher("Equipo/equipoTecnicoPrincipal.jsp").forward(request, response);
//                    break;
//                case 3:
//                    request.getRequestDispatcher("Equipo/equipoPedagogicoPrincipal.jsp").forward(request, response);
//                    break;
//                case 4:
//                    request.getRequestDispatcher("instrutor/instrutorPrincipal.jsp").forward(request, response);
//                    break;
//                case 5:
//                    request.getRequestDispatcher("instrutor/registroOA/registroOA.jsp").forward(request, response);
//                    break;
//                case 6:
//                    request.getRequestDispatcher("Equipo/ModificarLista/modificarLista.jsp").forward(request, response);
//                    break;
//                case 7:
//                    request.getRequestDispatcher("Equipo/CalificarOa/calificarOa.jsp").forward(request, response);
//                    break;
//            }
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
