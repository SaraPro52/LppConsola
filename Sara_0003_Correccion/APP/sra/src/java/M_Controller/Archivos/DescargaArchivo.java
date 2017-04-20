package M_Controller.Archivos;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DescargaArchivo", urlPatterns = {"/DescargaArchivo"})

public class DescargaArchivo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        try {
            String nombre = "archivo";
            String tipo = "pdf";
            Archivos archivo1 = new Archivos();
            String archivos1 = archivo1.getBase();
            String archivo = archivos1 + request.getParameter("archivo");
            String[] parts = archivo.split("\\.");
            nombre =request.getParameter("archivo");
            int i = parts.length - 1;
            tipo = parts[i];
            File f = new File(archivo);
            response.setContentType("application/" + tipo + "");
            response.setHeader("Content-Disposition", "attachment; filename= "+nombre+"  ");
            InputStream in = new FileInputStream(f);
            ServletOutputStream outs = response.getOutputStream();
            int bit = 256;
            try {
                while ((bit) >= 0) {
                    bit = in.read();
                    outs.write(bit);
                }
            } catch (IOException ioe) {
                ioe.printStackTrace(System.out);
            }
            outs.flush();
            outs.close();
            in.close();
        } finally {
            //out.close();
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
