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

public class DJCorreoHTML {
    public DJCorreoHTML() {
    }
    
    public void mandarCorreo(String destinatario, String asunt,String user,String toq) {
        String destinatarios = destinatario;
        String asunto = asunt;
        // El correo gmail de envío
        String correoEnvia = "SaraPro53@gmail.com";
        String claveCorreo = "7848742juma";

        // La configuración para enviar correo
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "25");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.user", correoEnvia);
        properties.put("mail.password", claveCorreo);
        // Obtener la sesion
        Session session = Session.getInstance(properties, null);

        try {
            MimeMessage mimeMessage = new MimeMessage(session);

            mimeMessage.setFrom(new InternetAddress(correoEnvia, "Sara Pro"));
            
            InternetAddress[] internetAddresses = {new InternetAddress(
                    destinatarios)};
                mimeMessage.setRecipients(Message.RecipientType.TO,
                        internetAddresses);
                // Agregar el asunto al correo
                mimeMessage.setSubject(asunto);
                // Crear el multipart para agregar la parte del mensaje anterior
                Multipart multipart = new MimeMultipart();
                // Leer la plantilla
                
                StringBuffer msjHTML = new StringBuffer("<html>\n" +
        "    <body>\n" +
        "        <div align=\"center\">\n" +
        "            <img src=\"a/darkSoulsFogata.jpg\">              \n" +
        "        </div>\n" +
        "        <div align=\"center\">\n" +
        "            <font size=\"6\" face=\"Candara\">     \n" +
        "            Estimado Funcionario, le informamos que su usuario es: "+user+"\n" +
        "            <br>\n" +
        "            Para confirmar la cuenta debe ingresar al link que se encuentra"
                + "acontinuacion LINK: <a href='http://localhost:8080/sra/ActivacionCuenta_Controller?t="+toq+"&c=1'>link</a>. \n" +
        "            <br>\n" +
        "            <br>\n" +
        "            Gracias por su atencion.\n" +
        "            <br>\n" +
        "            BIENVENIDO A SARA.\n" +
        "            </font>\n" +
        "        </div>\n" +
        "    \n" +
        "    </body>\n" +
        "</html>");
                
                // Url del directorio donde estan las imagenes
                String urlImagenes = "url del directorio donde estan las imagenes";
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
                transport.connect(correoEnvia, claveCorreo);
                transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
                transport.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("Correo enviado");
    }
}
