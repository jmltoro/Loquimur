package es.jmltoro.loquimur.utils;

import java.util.Hashtable;
import java.util.List;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.Action;

import es.jmltoro.loquimur.services.interfaz.IServicioGenerico;

public class ListadoGenericoAction extends ListadoAtributosAction {
		
	protected static final long serialVersionUID = 1L;
	
	/**
	 * Logger
	 */
	private static final Logger log = Logger.getLogger(ListadoGenericoAction.class);
	
	
	/**
	 * Servicio generico para obtener el listado
	 */
	protected IServicioGenerico servicioGenerico;	
		
	
	/**
	 * Constructor por defecto
	 * @param service
	 * @param generoService
	 */
	public ListadoGenericoAction() {
		super();
    }
	
	/**
	 * Constructor
	 * @param service
	 * @param generoService
	 */
	public ListadoGenericoAction(IServicioGenerico service) {        
		this.servicioGenerico = service;
    }
	
	
    /**
     * Metodo que obtiene el listado de elementos
     * @return
     */
    public String obtenerListado(Object entidad, String[] exclude, Hashtable<String, List> objMapeados) {  	    	    	    	
	    // Se establecen los parametros de ordenacion por defecto	  	
		String criterioOrdenacion = null;
		String orden = null;  
		    		
		// Se calcula el total de registros del conjunto completo
		log.info("Calculando el total de resultados....");
		
		Long tam = servicioGenerico.countFindByExampleLikePaginado(entidad, exclude, criterioOrdenacion, orden, objMapeados);
		
		setRecords(tam.intValue());
		
		log.info("....el numero de registros obtenidos es " + getRecords());
    	// Se valida que no se solicite una pagina fuera de rango
    	int temp = (int) Math.ceil((double) getRecords() / (double) getRows());        	
    	if (temp<getPage()){
    		setPage(1);
    	}
    	
    	// Calcular el numero maximo de resultados que se mostraran
		int maxResults = (getRows() * getPage());
	    int desde = maxResults - getRows();
		
	    // Recalculamos limite para la ultima pagina
	    if (maxResults > getRecords()){
	    	maxResults = getRecords();
	    }
	           	   
	    // Comprobacion del criterio de ordenacion y el orden (asc/desc)
	    if (getSord() != null && !getSord().equalsIgnoreCase(Constantes.CADENA_VACIA)){
	    	orden = getSord(); 
	    }
	    
	   
	    if (getSidx() != null && !getSidx().equalsIgnoreCase(Constantes.CADENA_VACIA)){
	    	String [] ordenacion = getSidx().split("\\.");
	    	criterioOrdenacion = ordenacion[ordenacion.length - 1];
	    	//Para la ordenacion por criterios con varios niveles de profundidad de relaciones
	    	//(por ejemplo los activo, que son de listaValor (activo.valor))
	    	if(ordenacion.length>1){
	    		for(int i=1;i<ordenacion.length;i++){
	    			if(i!=1)
	    				criterioOrdenacion = criterioOrdenacion + "." +ordenacion[i];
	    			else
	    				criterioOrdenacion = ordenacion[i];
	    		}
	    	}
    		
	    }
	    
	    log.info("Obteniendo listado....");
    
   	    // Se realiza la consulta obteniendo el listado paginado
	    //listado = servicioGenerico.findAllPaginado(desde, maxResults,criterioOrdenacion,orden);
	    listado = servicioGenerico.findByExampleLikePaginado(desde, maxResults, entidad, exclude, criterioOrdenacion, orden, objMapeados);
	    
		// Se establece el numero total de registros
		setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));	     
    	
		log.info("Datos del listado....");
		log.info("Registros: " + getRecords() + " - Paginas: " + getTotal());
		log.info("Criterio de ordenacion: " + getSidx() + " - Ordena: " + getSord());
		log.info("....................");
    	return Action.SUCCESS;
    }
    
    /**
     * Metodo que obtiene el listado de elementos
     * @return
     */
    public String obtenerListadoOrdenado(Object entidad, String[] exclude, Hashtable<String, List> objMapeados, String[] orden, String[] direccion) {  	    	    	    	
	    // Se establecen los parametros de ordenacion por defecto	  	
		String criterioOrdenacion = null;
		    		
		// Se calcula el total de registros del conjunto completo
		log.info("Calculando el total de resultados....");
		
		Long tam = servicioGenerico.countFindByExampleLikePaginado(entidad, exclude, criterioOrdenacion, null, objMapeados);
		
		setRecords(tam.intValue());
		
		log.info("....el numero de registros obtenidos es " + getRecords());
    	// Se valida que no se solicite una pagina fuera de rango
    	int temp = (int) Math.ceil((double) getRecords() / (double) getRows());        	
    	if (temp<getPage()){
    		setPage(1);
    	}
    	
    	// Calcular el numero maximo de resultados que se mostraran
    	int maxResults = tam.intValue();
    	if (!getRows().equals (-1)){
    		maxResults = (getRows() * getPage());
    	} 	
    	int desde = 0;
    	if (!getRows().equals (-1)){
    		desde = maxResults - getRows();
    	}
	           	   
	    // Comprobacion del criterio de ordenacion y el orden (asc/desc)
//	    if (getSord() != null && !getSord().equalsIgnoreCase(Constantes.CADENA_VACIA)){
//	    	orden = getSord(); 
//	    }
	    
	   
	    if (getSidx() != null && !getSidx().equalsIgnoreCase(Constantes.CADENA_VACIA)){
	    	String [] ordenacion = getSidx().split("\\.");
	    	
	    	criterioOrdenacion = ordenacion[ordenacion.length - 1];
	    	//Para la ordenacion por criterios con varios niveles de profundidad de relaciones
	    	//(por ejemplo los activo, que son de listaValor (activo.valor))
	    	if(ordenacion.length>1){
	    		for(int i=1;i<ordenacion.length;i++){
	    			if(i!=1)
	    				criterioOrdenacion = criterioOrdenacion + "." +ordenacion[i];
	    			else
	    				criterioOrdenacion = ordenacion[i];
	    		}
	    	}
    		
	    }
	    
	    log.info("Obteniendo listado....");
    
   	    // Se realiza la consulta obteniendo el listado paginado
	    //listado = servicioGenerico.findByExampleOrder(desde, maxResults,criterioOrdenacion,orden);
	    listado = servicioGenerico.findByExampleLikePaginado(desde, maxResults, entidad, exclude, orden, direccion, objMapeados);
	    
		// Se establece el numero total de registros
		setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));	     
    	
		log.info("Datos del listado....");
		log.info("Registros: " + getRecords() + " - Paginas: " + getTotal());
		log.info("Criterio de ordenacion: " + getSidx() + " - Ordena: " + getSord());
		log.info("....................");
    	return Action.SUCCESS;
    }
    

    /**
     * Metodo que obtiene el listado de elementos
     * @return
     */
    public String obtenerListadoConServicio(Object entidad, String[] exclude, Hashtable<String, List> objMapeados, IServicioGenerico servicio) {  	    	    	    	
	    // Se establecen los parametros de ordenacion por defecto	  	
		String criterioOrdenacion = null;
		String orden = null;  
		    		
		// Se calcula el total de registros del conjunto completo
		log.info("Calculando el total de resultados....");
		
		Long tam = servicio.countFindByExampleLikePaginado(entidad, exclude, criterioOrdenacion, orden, objMapeados);
		setRecords(tam.intValue());
		
		log.info("....el numero de registros obtenidos es " + getRecords());
    	// Se valida que no se solicite una pagina fuera de rango
    	int temp = (int) Math.ceil((double) getRecords() / (double) getRows());        	
    	if (temp<getPage()){
    		setPage(1);
    	}
    	
    	// Calcular el numero maximo de resultados que se mostraran
		int maxResults = (getRows() * getPage());
	    int desde = maxResults - getRows();
		
	    // Recalculamos limite para la ultima pagina
	    if (maxResults > getRecords()){
	    	maxResults = getRecords();
	    }
	           	   
	    // Comprobacion del criterio de ordenacion y el orden (asc/desc)
	    if (getSord() != null && !getSord().equalsIgnoreCase(Constantes.CADENA_VACIA)){
	    	orden = getSord(); 
	    }
	    
	   
	    if (getSidx() != null && !getSidx().equalsIgnoreCase(Constantes.CADENA_VACIA)){
	    	String [] ordenacion = getSidx().split("\\.");
	    	criterioOrdenacion = ordenacion[ordenacion.length - 1];
	    	//Para la ordenacion por criterios con varios niveles de profundidad de relaciones
	    	//(por ejemplo los activo, que son de listaValor (activo.valor))
	    	if(ordenacion.length>1){
	    		for(int i=1;i<ordenacion.length;i++){
	    			if(i!=1)
	    				criterioOrdenacion = criterioOrdenacion + "." +ordenacion[i];
	    			else
	    				criterioOrdenacion = ordenacion[i];
	    		}
	    	}
    		
	    }
	    
	    log.info("Obteniendo listado....");
    
   	    // Se realiza la consulta obteniendo el listado paginado
	    //listado = servicioGenerico.findAllPaginado(desde, maxResults,criterioOrdenacion,orden);
	    listado = servicio.findByExampleLikePaginado(desde, maxResults, entidad, exclude, criterioOrdenacion, orden, objMapeados);
	    
		// Se establece el numero total de registros
		setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));	     
    	
		log.info("Datos del listado....");
		log.info("Registros: " + getRecords() + " - Paginas: " + getTotal());
		log.info("Criterio de ordenacion: " + getSidx() + " - Ordena: " + getSord());
		log.info("....................");
    	return Action.SUCCESS;
    }
    
    
    /**
     * Metodo que obtiene el listado de elementos
     * @return
     */
    public void obtenerParametrosDesdeListado(List lista) {  	    	    	    	
		    		
		// Se calcula el total de registros del conjunto completo
		log.info("Calculando el total de resultados....");
		
		setRecords(lista.size());
		int maxResults = 0;
		log.info("....el numero de registros obtenidos es " + getRecords());
    	// Se valida que no se solicite una pagina fuera de rango
		if(getRows()>0){
	    	int temp = (int) Math.ceil((double) getRecords() / (double) getRows());        	
	    	if (temp<getPage()){
	    		setPage(1);
	    	}
	    	maxResults = (getRows() * getPage());
	    	setTotal((int) Math.ceil((double) getRecords() / (double) getRows()));	   
		}
		else {
			setPage(1);
			maxResults = getRecords();
			setTotal(1);
		}
    	
	    // Recalculamos limite para la ultima pagina
	    if (maxResults > getRecords()){
	    	maxResults = getRecords();
	    }
	           	   
		log.info("Datos del listado....");
		log.info("Registros: " + getRecords() + " - Paginas: " + getTotal());
		log.info("....................");
    }

    
    /**
     * Metodo que obtiene el listado de elementos
     * 
     * @return
     */
    public String obtenerListadoExportacion(Integer maximo, Object entidad, String[] exclude,
            Hashtable<String, List> objMapeados) {
        // Se establecen los parametros de ordenacion por defecto
        String criterioOrdenacion = null;
        String orden = null;

        // Comprobacion del criterio de ordenacion y el orden (asc/desc)
        if (getSord() != null && !getSord().equalsIgnoreCase(Constantes.CADENA_VACIA)) {
            orden = getSord();
        }

        if (getSidx() != null && !getSidx().equalsIgnoreCase(Constantes.CADENA_VACIA)) {
            String[] ordenacion = getSidx().split("\\.");
            criterioOrdenacion = ordenacion[ordenacion.length - 1];
            // Para la ordenacion por criterios con varios niveles de profundidad de relaciones
            // (por ejemplo los activo, que son de listaValor (activo.valor))
            if (ordenacion.length > 1) {
                for (int i = 1; i < ordenacion.length; i++) {
                    if (i != 1)
                        criterioOrdenacion = criterioOrdenacion + "." + ordenacion[i];
                    else
                        criterioOrdenacion = ordenacion[i];
                }
            }

        }

        log.info("Obteniendo listado para exportaciÃ³n....");

        // Se realiza la consulta obteniendo el listado paginado
        listado = servicioGenerico.findByExampleLikePaginado(Integer.valueOf(0), maximo, entidad, exclude,
                criterioOrdenacion, orden, objMapeados);

        log.info("Registros: " + listado.size());
        log.info("Criterio de ordenacion: " + getSidx() + " - Ordena: " + getSord());
        log.info("....................");

        return Action.SUCCESS;
    }
}
