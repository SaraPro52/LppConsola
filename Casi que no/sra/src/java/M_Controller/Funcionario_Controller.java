package M_Controller;

import M_Controller.Correos.DJCorreoHTML;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import M_Modelo.Funcionario;
import M_Util.Elomac;
import M_Util.M_Crud;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "Funcionario_Controller", urlPatterns = {"/Funcionario_Controller"})

public class Funcionario_Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*Menu de opciondes de crud de funcionario...
            1. Agregar funcionario
            2. Actualizar
            3. Consultar
            4. Deshabilitar*/
            String data = request.getParameter("data");
            JSONObject jData = new JSONArray(data).getJSONObject(0);
            int opcion = jData.getInt("opcion");
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter respuesta = response.getWriter();

            switch (opcion) {
                case 1:
                    String[] fun =  Elomac.M_toArray(jData.getString("datos"));
                    fun[8] = new vasos().getVaso();
                    try {
                        if (new Funcionario().RegistrarFuncionario(fun)) {
                            DJCorreoHTML correoHTML = new DJCorreoHTML();
                            correoHTML.mandarCorreo(fun[5], "Confirmacion de Cuenta SARA PRO1",fun[2],fun[8]);
                            respuesta.println("true$$'Registro Completo");
                        } else {
                            respuesta.println("false$$Registro Fallido");
                        }
                    } catch (Exception e) {
                        respuesta.println("[{valor:false,mensaje:'"+e.getMessage()+"'}]");
                    }
                    break;
                case 2:
                    String centro = jData.getString("centro");
                    try {
                        respuesta.println("[{valor:true,mensaje:'"+new Funcionario().ListaAsignarRoles(centro)+"'}]");
                    } catch (Exception e) {
                        respuesta.println("[{valor:false,mensaje:'"+e.getMessage()+"'}]");
                    }
                    break;
                case 3:
                    Elomac fun1 = new Elomac(18, 1);
                    if (fun1.Update(fun1.Select(jData.getInt("id")), "[{'8':'" + DigestUtils.md5Hex(jData.getString("con")) + "','9':'1'}]")) {
                        respuesta.println("[{valor:true,mensaje:'Actualizacion Complea'}]");
                    } else {
                        respuesta.println("[{valor:false,mensaje:'Actualizacion Fallida'}]");
                    }
                    break;
                case 4:
                    String[] datos = Elomac.M_toArray(jData.getString("datos"));
                    Elomac funAsignar = new Elomac(26,1,datos);
                    System.out.println(new Funcionario().Select(27));//OBTENER EL ID DEL FUNCIONARIO
                    String funSelect = new Funcionario().Select(27);
                    
                    if(funAsignar.Insert() == true && funSelect != null){
                        Elomac  fu  = new Elomac(18,1);
                        fu.load(funSelect);
                        String[] fun2 = M_Crud.M_toArray(fu.atributos, 2);
                        fun2[8] = new vasos().getVaso();
                        DJCorreoHTML correoHTML = new DJCorreoHTML();
                        correoHTML.mandarCorreo(fun2[5], "Confirmacion de Cuenta SARA PRO1",fun2[2],fun2[8]);
                        respuesta.println("true$$El Funcionario fue Registrado");
                    } else {
                        respuesta.println("false$$El Funcionario no fue Registrado");
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
            Logger.getLogger(Funcionario_Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Funcionario_Controller.class.getName()).log(Level.SEVERE, null, ex);
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