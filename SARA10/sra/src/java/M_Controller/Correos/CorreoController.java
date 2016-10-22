//CorreoController
package M_Controller.Correos;
import M_Controller.Correos.Correo;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "CorreoController", urlPatterns = {"/CorreoController"})
public class CorreoController {
    public void obtenerMensaje(String correo, String Documento, String Contraseña) {
        boolean a = false;
        try {
            Correo c = new Correo();
            String destino = (correo);
            String asunto = "¿Nuevo en saraPro?";
            String descripcion = "Hola: Este es un correo con un usuario y contraseña temporales son Usuario" + Documento + " contraseña: " + Contraseña + "PD:Hay que cambiar este mensaje";
            c.setMensaje(descripcion);
            c.setAsunto(asunto);
            c.setDestino(destino);
            a = enviarCorreo(c);
            if (a == true) {
                System.out.println("Envio correcto, mira tu correo ;)");
            } else {
                System.out.println("Ups...");
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
    }

    public boolean enviarCorreo(Correo c) {
        Boolean a = false;
        try {
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", c.getUsuarioCorreo());
            p.setProperty("mail.smtp.auth", "true");
            Session s = Session.getDefaultInstance(p, null);
            BodyPart texto = new MimeBodyPart();
            texto.setText(c.getMensaje());
            //Codigo para enviar algo adjunto...
            /*BodyPart adjunto =new MimeBodyPart();
            if (!c.getRutaArchivo().equals("")) {
                adjunto.setDataHandler(new DataHandler(new FileDataSource(c.getRutaArchivo())));
                adjunto.setFileName(c.getNombreArchivo());
            }*/

            MimeMultipart m = new MimeMultipart();
            m.addBodyPart(texto);

            /*if (!c.getRutaArchivo().equals("")) {
                m.addBodyPart(adjunto);
            }*/
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(c.getUsuarioCorreo()));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(c.getDestino()));

            mensaje.setSubject(c.getAsunto());
            mensaje.setContent(m);

            Transport t = s.getTransport("smtp");
            t.connect(c.getUsuarioCorreo(), c.getContrasenia());
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();
            a = true;
        } catch (Exception e) {
            System.out.println("Error" + e);
            a = false;
        }
        return a;
    }
}
