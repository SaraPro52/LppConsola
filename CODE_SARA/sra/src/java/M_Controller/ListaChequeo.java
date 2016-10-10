package M_Controller;

import M_Modelo.Lista_Chequeo;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListaChequeo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu de opciones crud
            1.agregar item
            2.actualizar
            3.consultar
            4.eliminar
            5. Agregar lista de chequeo*/
            
            int opcion = Integer.parseInt(request.getParameter("Opcion"));
            Lista_Chequeo listaChe = new Lista_Chequeo();
            switch (opcion) {
                case 1:
                    String[] infoLista = null;
                    infoLista[0] = request.getParameter("nombreL");
                    infoLista[1] = request.getParameter("descripcion");
                    infoLista[2] = request.getParameter("funcionario");
                    String[] items = new Gson().fromJson(request.getParameter("array"),  String[].class);
                    PrintWriter devueltas = response.getWriter();
                    if (listaChe.RegistrarLista(infoLista, items)) {
                        response.setContentType("application/json;charset=UTF-8");
                        devueltas.println(listaChe.RegistrarLista(infoLista, items));
                    } else {
                        devueltas.println(listaChe.RegistrarLista(infoLista, items));
                    }
                    break;
                case 2:
                    
                    break;
                case 3:
                    response.setContentType("application/json;charset=UTF-8");
                    PrintWriter devuelta = response.getWriter();
                    try {
                        devuelta.println(listaChe.Select());
                    } catch (Exception e) {
                        devuelta.println("Error: " + e.getMessage());
                    }
                    break;
                case 4:
                    break;
                case 5:
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
