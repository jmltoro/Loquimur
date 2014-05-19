package es.jmltoro.loquimur.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

public class MailSender
{
  private static final String PROTOCOLO = "smtp";
  private String smtp_server;
  private String smtp_port;
  private String from;
  private String user;
  private String password;
  private Properties props;
  
  protected static final Logger log = Logger.getLogger(MailSender.class);

  public MailSender(String smtp_server, String smtp_port, String from, String user, String password, boolean requiereAutenticacion)
  {
    this.smtp_server = smtp_server;
    this.smtp_port = smtp_port;
    this.from = from;
    this.user = user;
    this.password = password;
    this.props = configuracion(smtp_server, smtp_port, user, password, 
      requiereAutenticacion);
  }

  private Properties configuracion(String smtp_server, String smtp_port, String user, String password, boolean requiereAutenticacion)
  {
    Properties props = new Properties();
    props.setProperty("mail.transport.protocol", "smtp");
    props.setProperty("mail.smtp.host", smtp_server);
    props.setProperty("mail.smtp.port", smtp_port);

    props.setProperty("mail.smtp.user", user);

    props.setProperty("mail.smtp.auth", 
      String.valueOf(requiereAutenticacion));

    return props;
  }

  public void sendMail(String asunto, String cuerpoTexto, String cuerpoHtml, String destinatario, String copia)
    throws MessagingException
  {
    log.debug("MailSender: Enviando mail a " + destinatario);

    Session session = Session.getDefaultInstance(getProps(), null);

    MimeMessage message = new MimeMessage(session);
    message.setFrom(new InternetAddress(getFrom()));

    if ((destinatario != null) && (destinatario.length() > 0)) {
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
    }

    if ((copia != null) && (copia.length() > 0)) {
      message.addRecipient(Message.RecipientType.CC, new InternetAddress(copia));
    }

    message.setSentDate(Tools.fechaActual());

    message.setSubject(asunto);

    cuerpoHtml = cuerpoHtml + "<p><img src=\"http://www.canalsur.es/html/programas/la_banda/img/pie-mail.png\" /></p>";

    message.setContent(cuerpoHtml, "text/html");

    Transport t = session.getTransport();
    t.connect();
    t.sendMessage(message, message.getAllRecipients());

    t.close();

    log.debug("Email Enviado!");
  }

  public String getSmtp_server() {
    return this.smtp_server;
  }

  public void setSmtp_server(String smtp_server) {
    this.smtp_server = smtp_server;
  }

  public String getSmtp_port() {
    return this.smtp_port;
  }

  public void setSmtp_port(String smtp_port) {
    this.smtp_port = smtp_port;
  }

  public String getFrom() {
    return this.from;
  }

  public void setFrom(String from) {
    this.from = from;
  }

  public String getUser() {
    return this.user;
  }

  public void setUser(String user) {
    this.user = user;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Properties getProps() {
    return this.props;
  }

  public static void main(String[] args)
  {
    MailSender mailSenderLaBanda = new MailSender("smtp.1and1.es", "25", "no_reply@andaluciacuponline.com", "no_reply@andaluciacuponline.com", "Andcmail13", true);
    try
    {
      InternetAddress[] destinatarios = { new InternetAddress("jaime.poch@alteda.com"), new InternetAddress("jpochguardado@gmail.com") };

      mailSenderLaBanda.sendMail("Prueba de mail", "texto cuerpo", "<h1>Estimado amigo</h1><p>Esto es un <strong>mensaje</strong></p>", "jaime.poch@alteda.com", "jaime.poch@alteda.com");
    } catch (MessagingException e) {
      log.error("Fallo al enviar mail", e);
    }
  }
}

/* Location:           /home/ajcastillo/workspaces/la_banda/utilidades/ImportedClasses/
 * Qualified Name:     com.alteda.utilidades.MailSender
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.5.3
 */