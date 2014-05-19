package es.jmltoro.loquimur.utils;

import java.util.Properties;

import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.ModificationItem;

import org.apache.log4j.Logger;

public class LdapConexion
{
  private String ldapServerName;
  private String ldapPort;
  private String rootdn;
  private String rootpass;
  private String rootContext;
  private DirContext contexto;
  
  protected static final Logger log = Logger.getLogger(LdapConexion.class);

  public String getLdapServerName()
  {
    return this.ldapServerName;
  }

  public void setLdapServerName(String ldapServerName) {
    this.ldapServerName = ldapServerName;
  }

  public String getLdapPort() {
    return this.ldapPort;
  }

  public void setLdapPort(String ldapPort) {
    this.ldapPort = ldapPort;
  }

  public String getRootdn() {
    return this.rootdn;
  }

  public void setRootdn(String rootdn) {
    this.rootdn = rootdn;
  }

  public String getRootpass() {
    return this.rootpass;
  }

  public void setRootpass(String rootpass) {
    this.rootpass = rootpass;
  }

  public String getRootContext() {
    return this.rootContext;
  }

  public void setRootContext(String rootContext) {
    this.rootContext = rootContext;
  }

  public DirContext getContexto()
  {
    return this.contexto;
  }

  public void setContexto(DirContext contexto) {
    this.contexto = contexto;
  }

  public LdapConexion(String ldapServerName, String ldapPort, String rootdn, String rootpass, String rootContext)
  {
    this.ldapServerName = ldapServerName;
    this.ldapPort = ldapPort;
    this.rootdn = rootdn;
    this.rootpass = rootpass;
    this.rootContext = rootContext;
  }

  public void conectar()
    throws NamingException
  {
    Properties env = new Properties();

    env.put("java.naming.factory.initial", 
      "com.sun.jndi.ldap.LdapCtxFactory");
    env.put("java.naming.provider.url", "ldap://" + getLdapServerName() + ":" + 
      getLdapPort() + "/" + getRootContext());

    env.put("java.naming.security.authentication", "simple");
    env.put("java.naming.security.principal", getRootdn());
    env.put("java.naming.security.credentials", getRootpass());

    setContexto(new InitialDirContext(env));
    log.debug("Conectado! Contexto establecido");
  }

  public void cerrarConexion() throws NamingException {
    getContexto().close();
    log.debug("Conexión cerrada");
  }

  public void modificarEntrada(String entrada, ModificationItem[] mods) throws NamingException {
    getContexto().modifyAttributes(entrada, mods);
  }

  public void borrarEntrada(String entrada) throws NamingException {
    getContexto().destroySubcontext(entrada);
  }

  public static void main(String[] args)
  {
	  log.debug("main...");

    String host = "10.240.234.213";
    String puerto = "389";
    String rootdn = "cn=admin,c=es";
    String clave = "secret";
    String rootContext = "o=usuarios,o=rtva,c=es";

    LdapConexion ldapConexion = new LdapConexion(host, puerto, rootdn, clave, rootContext);
    try {
      ldapConexion.conectar();
    }
    catch (NamingException e) {
      log.error("Error", e);
    }

    String entrada = "uid=012268";
    try
    {
      ldapConexion.borrarEntrada(entrada);
    }
    catch (NamingException e1) {
    	log.error("Error", e1);
    }

    try
    {
      ldapConexion.cerrarConexion();
    } catch (NamingException e) {
      log.error("Fallo al cerrar la conexión", e);
    }
  }
}