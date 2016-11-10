
package M_Controller.Correos;

import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CargarHTML {
    private String user;
    private String toq;
    
    public CargarHTML(String user, String toq){
        this.user = user;
        this.toq = toq;
    }
    
    public void crear(String url){
        FileWriter creando = null;
        try {
            String html = cargar();
            creando = new FileWriter(url);
            
            for (int i = 0; i < html.length(); i++) {
                creando.write(html.charAt(i));
            }
        } catch (IOException ex) {
            Logger.getLogger(CargarHTML.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                creando.close();
            } catch (IOException ex) {
                Logger.getLogger(CargarHTML.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public String cargar(){
        String todo = "<html>\n" +
        "    <body>\n" +
        "        <div align=\"center\">\n" +
        "            <img src=\"a/darkSoulsFogata.jpg\">              \n" +
        "        </div>\n" +
        "        <div align=\"center\">\n" +
        "            <font size=\"6\" face=\"Candara\">     \n" +
        "            Estimado Funcionario, le informamos que su usuario es: "+this.user+"\n" +
        "            <br>\n" +
        "            Para confirmar la cuenta debe ingresar al link que se encuentra"
                + "acontinuacion LINK: <a href='http://localhost:8080/sra/ActivacionCuenta_Controller?t="+this.toq+"&c=1'>Confirmacion de cuenta</a>. \n" +
        "            <br>\n" +
        "            <br>\n" +
        "            Gracias por su atencion.\n" +
        "            <br>\n" +
        "            BIENVENIDO A SARA.\n" +
        "            </font>\n" +
        "        </div>\n" +
        "    \n" +
        "    </body>\n" +
        "</html>";
        return todo;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getToq() {
        return toq;
    }

    public void setToq(String toq) {
        this.toq = toq;
    }
    
}
