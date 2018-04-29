package M_Controller.Correos;

import java.io.File;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Clase DJCorreoHTML se encarga de enviar orreo electronicos con la informacion
 * requerida para los usuarios de la aplicacion
 *
 * @author Juan lopez alvarez
 * @version 21/11/2017 v4
 */
public class DJCorreoHTML {

    Properties properties = new Properties();

    // La configuración para enviar correo
    public DJCorreoHTML() {

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "25");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.user", "SaraPro53@gmail.com");
        properties.put("mail.password", "7848742juma");

    }

    public void mandarCorreo(String destinatario, String asunt, String user, String toq) {
        String destinatarios = destinatario;
        String asunto = asunt;
        Session session = Session.getInstance(properties, null);

        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("SaraPro53@gmail.com", "Sara Pro"));
            InternetAddress[] internetAddresses = {new InternetAddress(
                destinatarios)};
            mimeMessage.setRecipients(Message.RecipientType.TO,
                    internetAddresses);
            // Agregar el asunto al correo
            mimeMessage.setSubject(asunto);
            // Crear el multipart para agregar la parte del mensaje anterior
            Multipart multipart = new MimeMultipart();
            // Leer la plantilla
            StringBuffer msjHTML = new StringBuffer("<html>\n"
                    + "    <body>\n"
                    + "        <div align=\"center\">\n"
                    + "            <img src=\"inicio/ConfirmacionCon/img/saraBlue.png\">              \n"
                    + "        </div>\n"
                    + "        <div align=\"center\">\n"
                    + "            <font size=\"6\" face=\"Candara\">     \n"
                    + "            Estimado Funcionario, le informamos que su usuario es: " + user + "\n"
                    + "            <br>\n"
                    + "            Para confirmar la cuenta debe ingresar al link que se encuentra"
                    + "a continuacion LINK: <a href='http://172.16.255.225:8083/sara/ActivacionCuenta_Controller?t=" + toq + "&c=1'>link</a>. \n"
                    + "            <br>\n"
                    + "            <br>\n"
                    + "            Gracias por su atencion.\n"
                    + "            <br>\n"
                    + "            BIENVENIDO A SARA.\n"
                    + "            </font>\n"
                    + "        </div>\n"
                    + "    \n"
                    + "    </body>\n"
                    + "</html>");

            // Url del directorio donde estan las imagenes
            String urlImagenes = "inicio/ConfirmacionCon/img";
            File directorio = new File(urlImagenes);
            // Obtener los nombres de las imagenes en el directorio
            String[] imagenesDirectorio = directorio.list();
            // Creo la parte del mensaje HTML
            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent(msjHTML.toString(), "text/html");
            // Validar que el directorio si tenga las imagenes
            if (imagenesDirectorio != null) {
                for (int count = 0; count < imagenesDirectorio.length; count++) {
                    MimeBodyPart imagePart = new MimeBodyPart();
                    imagePart.setHeader("Content-ID", "<"
                            + imagenesDirectorio[count] + ">");
                    imagePart.setDisposition(MimeBodyPart.INLINE);
                    imagePart.attachFile(urlImagenes
                            + imagenesDirectorio[count]);
                    multipart.addBodyPart(imagePart);
                }
            } else {
                System.out.println("No hay imagenes en el directorio");
            }

            // Agregar la parte del mensaje HTML al multiPart
            multipart.addBodyPart(mimeBodyPart);

            // Agregar el multipart al cuerpo del mensaje
            mimeMessage.setContent(multipart);

            // Enviar el mensaje
            Transport transport = session.getTransport("smtp");
            transport.connect("SaraPro53@gmail.com", "7848742juma");
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void mensajeContrasena(String destinatario, String asunt) {
        String destinatarios = destinatario;
        String asunto = asunt;
        Session session = Session.getInstance(properties, null);

        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("SaraPro53@gmail.com", "Sara Pro"));
            InternetAddress[] internetAddresses = {new InternetAddress(
                destinatarios)};
            mimeMessage.setRecipients(Message.RecipientType.TO,
                    internetAddresses);
            // Agregar el asunto al correo
            mimeMessage.setSubject(asunto);
            // Crear el multipart para agregar la parte del mensaje anterior
            Multipart multipart = new MimeMultipart();
            // Leer la plantilla

            StringBuffer msjHTML = new StringBuffer("<html>\n"
                    + "    <body>\n"
                    + "        <div align=\"center\">\n"
                    + "            <img src=\"ConfirmacionCon/img/saraBlue.png\">              \n"
                    + "        </div>\n"
                    + "        <div align=\"center\">\n"
                    + "            <font size=\"6\" face=\"Candara\">     \n"
                    + "            Estimado usuario, le informamos que su contraseña ha sido modificada correctamente"
                    + "            <br>\n"
                    + "            si usted no ha realizado este cambio. Contáctese con el administrador del sistema."
                    + "        </div>\n"
                    + "    </body>\n"
                    + "</html>");

            // Url del directorio donde estan las imagenes
            String urlImagenes = "ConfirmacionCon/img";
            File directorio = new File(urlImagenes);
            // Obtener los nombres de las imagenes en el directorio
            String[] imagenesDirectorio = directorio.list();
            // Creo la parte del mensaje HTML
            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent(msjHTML.toString(), "text/html");
            // Validar que el directorio si tenga las imagenes
            if (imagenesDirectorio != null) {
                for (int count = 0; count < imagenesDirectorio.length; count++) {
                    MimeBodyPart imagePart = new MimeBodyPart();
                    imagePart.setHeader("Content-ID", "<"
                            + imagenesDirectorio[count] + ">");
                    imagePart.setDisposition(MimeBodyPart.INLINE);
                    imagePart.attachFile(urlImagenes
                            + imagenesDirectorio[count]);
                    multipart.addBodyPart(imagePart);
                }
            } else {
                System.out.println("No hay imagenes en el directorio");
            }

            // Agregar la parte del mensaje HTML al multiPart
            multipart.addBodyPart(mimeBodyPart);

            // Agregar el multipart al cuerpo del mensaje
            mimeMessage.setContent(multipart);

            // Enviar el mensaje
            Transport transport = session.getTransport("smtp");
            transport.connect("SaraPro53@gmail.com", "7848742juma");
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
