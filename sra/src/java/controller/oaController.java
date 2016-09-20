package controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.Producto_Virtual_Bean;
import modelo.Dao.Producto_Virtual_Dao;

public class oaController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            switch (opcion) {
                case 1:
                    String titulo = request.getParameter("titulo");
                    String autores = request.getParameter("autores");
                    String descripcion = request.getParameter("descripcion");
                    int area = Integer.parseInt(request.getParameter("area"));
                    int programa = Integer.parseInt(request.getParameter("programa"));
                    int tema = Integer.parseInt(request.getParameter("tema"));
                    String palabras = request.getParameter("palabras");
                    int formato = Integer.parseInt(request.getParameter("formato"));
                    String requisitos = request.getParameter("requisitos");
                    String instruciones = request.getParameter("instruciones");
                    Producto_Virtual_Bean oaBean1 = new Producto_Virtual_Bean();
                    oaBean1.setNom_P_Virtual(titulo);
                    oaBean1.setDes_P_Virtual(descripcion);
                    oaBean1.setPalabras_Clave(palabras);
                    oaBean1.setId_Formato(formato);   
                    Producto_Virtual_Dao oaDao1 = new Producto_Virtual_Dao(oaBean1);
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devueta1 = response.getWriter();
                    
                    ArchivosController a = new ArchivosController();
                    //a.Nombre();
                    
//                    try {
//                        oaDao1.OperacionRegistro("INSERT", "", 0);
//                        System.out.println("Hola;)");
//                    } catch (Exception e) {
//                        System.out.println("error"+e.getMessage());
//                    }
                    break;
                case 2:
                    break;
                case 3:
                    Producto_Virtual_Bean oaBEan = new Producto_Virtual_Bean();
                    Producto_Virtual_Dao oaDao = new Producto_Virtual_Dao(oaBEan);
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        devuelta.println(oaDao.OperacionRegistro("SELECT", "-", 0));
                    } catch (Exception e) {
                        devuelta.println("Error: " + e.getMessage());
                    }
                    break;
                case 4:
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
