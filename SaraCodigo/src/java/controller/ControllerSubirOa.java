package controller;
import model.bean.BeanObjetoaprendizaje;
import model.dao.DaoObjetoaprendizaje;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ControllerSubirOa extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int opcion = Integer.parseInt(request.getParameter("Opcion"));

            switch (opcion) {
                case 1:
                    String Titulo = request.getParameter("Titulo");
                    String Actor = request.getParameter("Actores");
                    String Descripcion = request.getParameter("Descripcion");
                    String Area = request.getParameter("Area");
                    String Programa = request.getParameter("Programa");
                    String Tema = request.getParameter("Tema");
                    String Imagen = request.getParameter("Imagen");
                    String PalabrasClave = request.getParameter("PalabrasClave");
                    String Formato = request.getParameter("Formato");
                    String Requisitos = request.getParameter("Requisitos");
                    String Instruciones = request.getParameter("Instruciones");
                    String Anniadir = request.getParameter("Anniadir");

                    BeanObjetoaprendizaje BObjeto = new BeanObjetoaprendizaje();
                    DaoObjetoaprendizaje Objeto = new DaoObjetoaprendizaje(BObjeto);
                    BObjeto.OADatos(Titulo, Actor, Descripcion, Area, Programa, Tema);
                    BObjeto.OADatos1(Imagen, PalabrasClave, Formato, Requisitos, Instruciones, Anniadir);
                    
                    response.getWriter().write("Esto es java btn subir oa: "+Objeto);
                            
                    if (Objeto.AgregarRegistro()) {
                        response.getWriter().write("OA registrada correctamente Controller");
                    } else {
                        response.getWriter().write("OA NO fue registrada Controller");
                    }
                    break;
                case 2:
                    
                    response.getWriter().write("Esto es java "   + opcion);
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error " + e);
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
