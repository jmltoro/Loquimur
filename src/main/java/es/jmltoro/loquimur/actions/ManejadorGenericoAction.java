package es.jmltoro.loquimur.actions;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.transaction.CannotCreateTransactionException;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import es.jmltoro.loquimur.services.interfaz.IServicioGenerico;
import es.jmltoro.loquimur.utils.ComboOption;
import es.jmltoro.loquimur.utils.Constantes;
import es.jmltoro.loquimur.utils.ExcelCreator;
import es.jmltoro.loquimur.utils.ListadoGenericoAction;
import es.jmltoro.loquimur.utils.Utils;

/**
 * Clase para manejar de forma generica las entidades Implementara un metodo abstracto para modificar el listado en
 * funcion de la operacion seleccionada. La eliminacion se llevara a cabo mediante el metodo correspondiente en la clase
 * del ListadoGenerico y el alta y edicion mediante dos metodos abstractos, que tendran que ser implementados por las
 * clases que hereden de esta
 * 
 * @author Icosís Grupo Avalon S.L.
 * 
 */
public abstract class ManejadorGenericoAction extends ListadoGenericoAction implements ApplicationContextAware {

    private ApplicationContext applicationContext;

    /**
     * Logger
     */
    protected static final Logger log = Logger.getLogger(ManejadorGenericoAction.class);

    // Constantes para las operaciones del listado
    /**
     * Constante para la operacion de borrar
     */
    protected static final String OPERACION_BORRAR = "del";

    /**
     * Constante para la operacion de editar
     */
    protected static final String OPERACION_EDITAR = "edit";

    /**
     * Constante para la operacion de alta
     */
    protected static final String OPERACION_ALTA = "add";

    /**
     * Constante para indicar que no se ha seleccionado ningun id
     */
    public static final String ID_REJILLA_VACIO = "_empty";

    private String operacion;

    /*
     * Variable para realizar la exportacion a excel
     */
    protected InputStream inputStream;

    /**
     * Datos para la exportación de listados a excel.
     */
    private String col;

    private String data;

    private Integer maximo;

    protected String[] paramMensaje = new String[5];
    
    /*
     * Parametro para mostrar la lista de errores
     */
    protected ArrayList<String> listaErrores = new ArrayList<String>();

    /*
     * Parametro para mostrar la lista de errores
     */
    protected ArrayList<String> listaOk = new ArrayList<String>();

    /*
     * Parametro para mostrar la lista de errores
     */
    protected ArrayList<String> listaValidaciones = new ArrayList<String>();

    protected String idsSeleccionados;

    /**
     * Información para el combo de activo.
     */
    private String comboActivos;
    private List<ComboOption> listActivos;

    /**
     * Información para el combo de tipos de procedmientos.
     */

    /*
     * Parametro para comprobar que se ha modificado algún campo del formulario y mostrar o no el dialogo de volver.
     */
    protected Integer modificado;

   
    /**
     * Constructor por defecto
     */
    public ManejadorGenericoAction() {
        super();
    }

    public ManejadorGenericoAction(IServicioGenerico dao) {
        super(dao);
    }

    /**
     * Metodo ejecutado para cargar la pagina por primera vez
     * 
     * @return
     */
    public String execute() {
        return Action.SUCCESS;
    }

    public String eliminarServicio(IServicioGenerico dao) {

        listaErrores = new ArrayList<String>();
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = this.getIdsSeleccionados();
        log.info("Se va a proceder a la eliminacion de los registros con id: " + id);
        String[] idSeparados = id.split(",");
        boolean resultado = true;
        for (String idActual : idSeparados) {
            try {
                dao.remove(Integer.parseInt(idActual));
            } catch (CannotCreateTransactionException e) {
                listaErrores.add(getMensaje("error.realizar.peticion"));
                listaErrores.add(getMensaje("contactar.administrador"));
            } catch (ConstraintViolationException ex) {
                if (!listaErrores.contains(getMensaje("error.eliminar.registros.dependencias"))) {
                    listaErrores.add(getMensaje("error.eliminar.registros.dependencias"));
                }
                resultado = false;
            } catch (DataIntegrityViolationException ex1) {
                if (!listaErrores.contains(getMensaje("error.eliminar.registros.dependencias"))) {
                    listaErrores.add(getMensaje("error.eliminar.registros.dependencias"));
                }
                resultado = false;
            } catch (Exception e) {
                if (!listaErrores.contains(getMensaje("error.eliminar.registros"))) {
                    listaErrores.add(getMensaje("error.eliminar.registros"));
                    listaErrores.add(getMensaje("contactar.administrador"));
                }
                resultado = false;
            }
        }
        if (resultado) {
            listaOk.add(getMensaje("exito.eliminar.registros"));
        } else if (listaErrores.isEmpty()) {
            listaErrores.add(getMensaje("error.eliminar.registros"));
        }

        return Action.SUCCESS;
    }

    /**
     * Metodo encargado de elimar registros desde la rejilla
     * 
     * @return
     */
    public String eliminar() {
        return eliminarServicio(servicioGenerico);
    }


    /**
     * Método utilizado para obtener una entidad a partir de su identificador.
     * 
     * @param id
     *            Identificador de la entidad.
     * @return entidad obtenida de base de datos.
     */
    public Object obtenerEntidad(Integer id) {
        Object entidad = null;

        try {
            entidad = this.servicioGenerico.findById(id);
        } catch (NullPointerException e) {
            if (!listaErrores.contains(getMensaje("error.consultar.registro"))) {
                listaErrores.add(getMensaje("error.consultar.registro"));
                listaErrores.add(getMensaje("contactar.administrador"));
            }
        } catch (Exception e) {
            if (!listaErrores.contains(getMensaje("error.consultar.registro"))) {
                listaErrores.add(getMensaje("error.consultar.registro"));
                listaErrores.add(getMensaje("contactar.administrador"));
            }
        }

        if (entidad == null) {
            if (!listaErrores.contains(getMensaje("error.consultar.registro"))) {
                listaErrores.add(getMensaje("error.consultar.registro"));
                listaErrores.add(getMensaje("contactar.administrador"));
            }
        }

        return entidad;
    }

    /**
     * Método utilizado para obtener una entidad a partir de su identificador y su servicio.
     * 
     * @param id
     *            Identificador de la entidad.
     * @param servicio
     *            Servicio de la entidad.
     * @return entidad obtenida de base de datos.
     */
    public Object obtenerEntidadSvc(Integer id, IServicioGenerico servicio) {
        Object entidad = null;

        try {
            entidad = servicio.findById(id);
        } catch (NullPointerException e) {
            if (!listaErrores.contains(getMensaje("error.consultar.registro"))) {
                listaErrores.add(getMensaje("error.consultar.registro"));
                listaErrores.add(getMensaje("contactar.administrador"));
            }
        } catch (Exception e) {
            if (!listaErrores.contains(getMensaje("error.consultar.registro"))) {
                listaErrores.add(getMensaje("error.consultar.registro"));
                listaErrores.add(getMensaje("contactar.administrador"));
            }
        }

        if (entidad == null) {
            if (!listaErrores.contains(getMensaje("error.consultar.registro"))) {
                listaErrores.add(getMensaje("error.consultar.registro"));
                listaErrores.add(getMensaje("contactar.administrador"));
            }
        }

        return entidad;
    }

    /**
     * Metodo utilizado para realizar el alta o actualizacion sobre una entidad
     * 
     * @param entidad
     */

    public Object actualizarEntidad(Object entidad) {
        try {
            entidad = this.servicioGenerico.save(entidad);
        } catch (CannotCreateTransactionException e) {
            listaErrores.add(getMensaje("error.realizar.peticion"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } catch (ConstraintViolationException e) {
            listaErrores.add(getMensaje("error.guardar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } catch (DataIntegrityViolationException e) {
            listaErrores.add(getMensaje("error.guardar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } catch (Exception e) {
            listaErrores.add(getMensaje("error.guardar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        }

        return entidad;
    }

    /**
     * Metodo utilizado para realizar el alta o actualizacion sobre una entidad
     * 
     * @param entidad
     */

    public Object actualizarEntidadServicio(Object entidad, IServicioGenerico servicio) {
        try {
            entidad = servicio.save(entidad);
        } catch (CannotCreateTransactionException e) {
            listaErrores.add(getMensaje("error.realizar.peticion"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } catch (ConstraintViolationException e) {
            listaErrores.add(getMensaje("error.guardar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } catch (DataIntegrityViolationException e) {
            listaErrores.add(getMensaje("error.guardar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        }

        return entidad;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        // TODO Auto-generated method stub
        this.applicationContext = applicationContext;
    }

    /**
     * Obtiene la información para mostrar en el combo de usuario activo.
     * 
     * @return Cadena para montar el combo.
     */
    public String obtieneComboActivos() {

        comboActivos = Constantes.CADENA_COMBO_BOOLEANO;
        // Creamos la lista de comboOptions para la lista de activos
        listActivos = new ArrayList<ComboOption>();
        listActivos.add(new ComboOption(Boolean.TRUE, Constantes.CADENA_SI));
        listActivos.add(new ComboOption(Boolean.FALSE, Constantes.CADENA_NO));

        return Action.SUCCESS;
    }

  

    /**
     * Añade los mensajes a los listados de errores o éxito según proceda.
     * 
     * @param mensaje
     *            Tipo de mensaje a añadir.
     * @param listaOk
     *            Listado mensajes de éxito.
     * @param listaErrores
     *            Listado de mensajes de error.
     */
    public void anyadeMensajes(String mensaje, List<String> listaOk, List<String> listaErrores) {

        if (mensaje != null && mensaje.equals(Constantes.OK_GUARDAR)) {
            listaOk.add(getMensaje("exito.guardar.registro"));
        } else if (mensaje != null && mensaje.equals(Constantes.OK_ELIMINAR)) {
            listaOk.add(getMensaje("exito.eliminar.registro"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_GUARDAR)) {
            listaErrores.add(getMensaje("error.guardar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_GUARDAR_BBDD)) {
            listaErrores.add(getMensaje("error.guardar.registro.bbdd"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_ELIMINAR)) {
            listaErrores.add(getMensaje("error.eliminar.registro"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_ELIMINAR_DEPENDENCIA)) {
            listaErrores.add(getMensaje("error.eliminar.dependencias"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_ELIMINAR_BBDD)) {
            listaErrores.add(getMensaje("error.eliminar.registro.bbdd"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_CONSOLIDAR_BBDD)) {
            listaErrores.add(getMensaje("error.consolidar.bbdd"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_CONSOLIDAR)) {
            listaErrores.add(getMensaje("error.consolidar", "la actividad"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.OK_CONSOLIDAR)) {
            listaOk.add(getMensaje("exito.consolidar", "La actividad"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_DESCONSOLIDAR_BBDD)) {
            listaErrores.add(getMensaje("error.desconsolidar.bbdd"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_DESCONSOLIDAR)) {
            listaErrores.add(getMensaje("error.desconsolidar", "la actividad"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.OK_DESCONSOLIDAR)) {
            listaOk.add(getMensaje("exito.desconsolidar", "La actividad"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_TERMINAR)) {
            listaErrores.add(getMensaje("error.terminar", "la actividad"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_TERMINAR_BBDD)) {
            listaErrores.add(getMensaje("error.terminar.bbdd"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.OK_TERMINAR)) {
            listaOk.add(getMensaje("exito.terminar", "La actividad"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_VALIDAR)) {
            listaErrores.add(getMensaje("error.validar", "la actividad"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.ERROR_VALIDAR_BBDD)) {
            listaErrores.add(getMensaje("error.validar.bbdd"));
            listaErrores.add(getMensaje("contactar.administrador"));
        } else if (mensaje != null && mensaje.equals(Constantes.OK_VALIDAR)) {
            listaOk.add(getMensaje("exito.validar", "La actividad"));
        }
    }

    /**
     * Metodo para la exportacion a excel
     */
    public String exporta() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String col = request.getParameter("col");
        String data = request.getParameter("data");

        if (col == null) {
            col = this.getCol();
            col = Utils.fromDefaultSystemCharsetToIsoLatin1(col);
        }

        if (data == null) {
            data = this.getData();
        }

        HSSFWorkbook workbook = new HSSFWorkbook();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        ExcelCreator excelCreator = new ExcelCreator();
        try {
            workbook = excelCreator.createWorkbook(col, data);
            workbook.write(baos);
        } catch (Exception e) {
            log.error("No se ha podido exportar el listado de datos.");
        }
        InputStream bis = new ByteArrayInputStream(baos.toByteArray());
        setInputStream(bis);
        return Action.SUCCESS;
    }

    
    /**
     * @return the operacion
     */
    public String getOperacion() {
        return operacion;
    }

    /**
     * @param operacion
     *            the operacion to set
     */
    public void setOperacion(String operacion) {
        this.operacion = operacion;
    }

    /**
     * Obtiene una entrada del fichero de propiedades.
     * 
     * @param parametro
     *            Nombre de la entrada del fichero.
     * @return Contenido del fichero de propiedades.
     */
    public String getMensaje(String parametro) {
        return applicationContext.getMessage(parametro, new String[0], Locale.getDefault());
    }

    /**
     * Obtiene una entrada del fichero de propiedades con los parámetros indicados.
     * 
     * @param entrada
     *            Nombre de la entrada del fichero.
     * @param parametros
     *            Parámetros para obtener la entrada.
     * @return Contenido del fichero de propiedades.
     */
    public String getMensaje(String entrada, String... parametros) {
        return applicationContext.getMessage(entrada, parametros, Locale.getDefault());
    }

    /**
     * @return the inputStream
     */
    public InputStream getInputStream() {
        return inputStream;
    }

    /**
     * @param inputStream
     *            the inputStream to set
     */
    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    /**
     * @return the listaErrores
     */
    public ArrayList<String> getListaErrores() {
        if (this.listaErrores == null) {
            this.listaErrores = new ArrayList<String>();
        }
        return listaErrores;
    }

    /**
     * @param listaErrores
     *            the listaErrores to set
     */
    public void setListaErrores(ArrayList<String> listaErrores) {
        this.listaErrores = listaErrores;
    }

    /**
     * @return the listaOk
     */
    public ArrayList<String> getListaOk() {
        return listaOk;
    }

    /**
     * @param listaOk
     *            the listaOk to set
     */
    public void setListaOk(ArrayList<String> listaOk) {
        this.listaOk = listaOk;
    }

    /**
     * @return the listaValidaciones
     */
    public ArrayList<String> getListaValidaciones() {
        return listaValidaciones;
    }

    /**
     * @param listaValidaciones
     *            the listaValidaciones to set
     */
    public void setListaValidaciones(ArrayList<String> listaValidaciones) {
        this.listaValidaciones = listaValidaciones;
    }

    /**
     * @return the idsSeleccionados
     */
    public String getIdsSeleccionados() {
        if (idsSeleccionados == null) {
            idsSeleccionados = Constantes.CADENA_VACIA;
        }
        return idsSeleccionados;
    }

    /**
     * @param idsSeleccionados
     *            the idsSeleccionados to set
     */
    public void setIdsSeleccionados(String idsSeleccionados) {
        this.idsSeleccionados = idsSeleccionados;
    }

    /**
     * @return the comboActivos
     */
    public String getComboActivos() {
        return comboActivos;
    }

    /**
     * @param comboActivos
     *            the comboActivos to set
     */
    public void setComboActivos(String comboActivos) {
        this.comboActivos = comboActivos;
    }

    /**
     * @return the listActivos
     */
    public List<ComboOption> getListActivos() {
        return listActivos;
    }

    /**
     * @param listActivos
     *            the listActivos to set
     */
    public void setListActivos(List<ComboOption> listActivos) {
        this.listActivos = listActivos;
    }

    /**
     * @return the modificado
     */
    public Integer getModificado() {
        return modificado;
    }

    /**
     * @param modificado
     *            the modificado to set
     */
    public void setModificado(Integer modificado) {
        this.modificado = modificado;
    }

    protected void setMensajeError(String mensaje) {
        ActionContext.getContext().getValueStack().set("mensajeTxt", mensaje);
    }

  

    /**
     * @return the col
     */
    public String getCol() {
        return col;
    }

    /**
     * @param col
     *            the col to set
     */
    public void setCol(String col) {
        this.col = col;
    }

    /**
     * @return the data
     */
    public String getData() {
        return data;
    }

    /**
     * @param data
     *            the data to set
     */
    public void setData(String data) {
        this.data = data;
    }

    /**
     * @return the maximo
     */
    public Integer getMaximo() {
        return maximo;
    }

    /**
     * @param maximo
     *            the maximo to set
     */
    public void setMaximo(Integer maximo) {
        this.maximo = maximo;
    }

    /**
     * @return the paramMensaje
     */
    public String[] getParamMensaje() {
        return paramMensaje;
    }

    /**
     * @param paramMensaje
     *            the paramMensaje to set
     */
    public void setParamMensaje(String[] paramMensaje) {
        this.paramMensaje = paramMensaje;
    }
}
