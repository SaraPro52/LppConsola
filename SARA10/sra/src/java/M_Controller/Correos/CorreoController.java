//CorreoController
package M_Controller.Correos;

import M_Controller.Correos.Correo;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "CorreoController", urlPatterns = {"/CorreoController"})
public class CorreoController {

   
    private final Properties properties = new Properties();
    private Session session;

    private void init() {
        properties.put("proxySet", "true");
        properties.put("socksProxyHost", "192.168.155.1");
        properties.put("socksProxyPort", "1080");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", 25);
        properties.put("mail.smtp.mail.sender", "SaraPro53@gmail.com");
        properties.put("mail.smtp.user", "SaraPro53@gmail.com");
        properties.put("mail.smtp.auth", "true");

        session = Session.getDefaultInstance(properties);
    }

    public void sendEmail(String asunto, String texto, String correo) {

        init();
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            //  message.setDataHandler(new DataHandler(new FileDataSource("nombreArchivo.pdf")));
            message.setSubject(asunto);
            message.setText(texto);

            message.setFileName("asd.txt");
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(message, "text/html");
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
////Se adjuntan los archivos al correo
//            //adjuntos arrelo de rutas
//            if (adjuntos != null && adjuntos.size() > 0) {
//                for (String rutaAdjunto : adjuntos) {
//                    messageBodyPart = new MimeBodyPart();
//                    File f = new File(rutaAdjunto);
//                    if (f.exists()) {
//                        DataSource source = new FileDataSource(rutaAdjunto);
//                        messageBodyPart.setDataHandler(new DataHandler(source));
//                        messageBodyPart.setFileName(f.getName());
//                        multipart.addBodyPart(messageBodyPart);
//                    }
//                }
//            }
//            message.setContent(multipart);
            Transport t = session.getTransport("smtp");
            t.connect((String) properties.get("SaraPro53@gmail.com"), "7848742juma");
            t.sendMessage(message, message.getAllRecipients());
            t.close();
        } catch (MessagingException me) {
            System.out.println(me);
            return;
        }

    }

}
