package es.jmltoro.loquimur.utils;

/**
 * Clase que almacenara todas las constantes que se usan
 * en la aplicacion
 * @author aleon
 *
 */
public class Constantes
{
	/**
	 * Constante que representa una cadena vacia
	 */
	public static final String VERSION_APLICACION = "1.0";
	
	public static final String CADENA_VACIA = "";
	
    // Cadena de texto para montar un combo tipo SI/NO.
    public static final String CADENA_SI = "Si";
    public static final String CADENA_NO = "No";
    public static final String CADENA_COMBO_BOOLEANO = ":;true:Si;false:No";
    
    // Paso de mensajes al action.
    public static final String OK_GUARDAR = "OK_GUARDAR";
    public static final String OK_ELIMINAR = "OK_ELIMINAR";

    public static final String ERROR_GUARDAR = "ERROR_GUARDAR";
    public static final String ERROR_GUARDAR_BBDD = "ERROR_GUARDAR_BBDD";

    public static final String ERROR_ELIMINAR = "ERROR_ELIMINAR";
    public static final String ERROR_ELIMINAR_DEPENDENCIA = "ERROR_ELIMINAR_DEPENDENCIA";
    public static final String ERROR_ELIMINAR_BBDD = "ERROR_ELIMINAR_BBDD";

    public static final String ERROR_CONSOLIDAR_BBDD = "ERROR_CONSOLIDAR_BBDD";
    public static final String ERROR_CONSOLIDAR = "ERROR_CONSOLIDAR";
    public static final String OK_CONSOLIDAR = "OK_CONSOLIDAR";

    public static final String ERROR_DESCONSOLIDAR_BBDD = "ERROR_DESCONSOLIDAR_BBDD";
    public static final String ERROR_DESCONSOLIDAR = "ERROR_DESCONSOLIDAR";
    public static final String OK_DESCONSOLIDAR = "OK_DESCONSOLIDAR";

    public static final String ERROR_TERMINAR_BBDD = "ERROR_TERMINAR_BBDD";
    public static final String ERROR_TERMINAR = "ERROR_TERMINAR";
    public static final String OK_TERMINAR = "OK_TERMINAR";

    public static final String ERROR_VALIDAR_BBDD = "ERROR_VALIDAR_BBDD";
    public static final String ERROR_VALIDAR = "ERROR_VALIDAR";
    public static final String OK_VALIDAR = "OK_VALIDAR";
    
    public static final String ACCION_ERROR_LOGIN = "errorLogin";
    
    // Para la redirección en caso de ser usuario promotor
    public static final String ACCION_SUCCESS_ENTIDAD = "successEntidad";
    public static final String ACCION_ERROR = "error";
    public static final String ACCION_JSON_PREF = "Json";
	
    // TORO -- Para la redirección en caso de ser Lector
    public static final String ACCION_SUCCESS_LECTOR = "successLector";	
}