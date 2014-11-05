package com.iteso.sweng.SignIn;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Created by Daniel on 13/10/14.
 */
public class SignInEmail {

    public static void EmailSend(String email, String name, String code)
    {
        try
        {
            // Propiedades de la conexión
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", "tandero.com@gmail.com");
            props.setProperty("mail.smtp.auth", "true");

            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);

            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("tandero.com@gmail.com"));
            message.addRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(""+ email + ""));
            message.setSubject("Active Account - Tandero");
            message.setText("<p>" + name + ",</p>\n" +
                            "<p>Welcome to tandero.com, we give you the following code to active your account: </p>" + code +
                            "\n<p>Enter in tandero.com, login your account and insert the activation code: <a href=\"http://localhost:8080/tandero/\">Link</a></p>\n" +
                            "<p>Regards.</p>",
                    "ISO-8859-1",
                    "html");

            // Lo enviamos.
            Transport t = session.getTransport("smtp");
            t.connect("tandero.com@gmail.com", "localhost");
            t.sendMessage(message, message.getAllRecipients());

            // Cierre.
            t.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}
