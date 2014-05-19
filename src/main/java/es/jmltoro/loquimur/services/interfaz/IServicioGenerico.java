package es.jmltoro.loquimur.services.interfaz;

import java.io.Serializable;
import java.util.Hashtable;
import java.util.List;

import org.hibernate.Criteria;


public interface IServicioGenerico<T, ID extends Serializable> {
	   
	//Constantes definidas con el fin de ordenar los listados
	public static final String ORDEN_ASC = "asc";
	public static final String ORDEN_DESC = "desc";
	
	public List<T> findAll();
	
	public List<T> findAll(String criterioOrdenacion,String orden);
	
	public List<T> findAllPaginado(int desde,int maxResults,String criterioOrdenacion,String orden);
		
    public Object save(T entidad);

    public void remove(ID id) throws Exception;

    public T findById(ID id);
    
    public T findByIdCheckCacheable(int id, boolean descachear);
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el listado de elementos.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExample(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados);
    
    public List<T> findByExample(T exampleInstance);
    
    public List<T> findByExampleGt(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados, String campoOrden, Integer valor);
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el listado de elementos.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campos por los cuales ordenar
     * @param direcciones -direcciónes de las ordenaciónes (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleOrder(T exampleInstance, String[] excludeProperty,String[] orden,String[] direcciones,Hashtable objetosMapeados);
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el criteria con la consulta realizada.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public Criteria findByExampleCrit(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados);
    
    public Criteria findByExampleCrit(T exampleInstance);
    
    public Criteria findByExampleCrit(T exampleInstance, String[] excludeProperty);
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles. Devuelve el listado de elementos.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleLike(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados);
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el listado de elementos paginado.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleLikePaginado(Integer desde, Integer maxResults, T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados);
    /**
     * TORO Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el listado de elementos paginado.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -lista de campos por los que ordenar
     * @param direccion -lista de direcciones de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleLikePaginado(Integer desde, Integer maxResults, T exampleInstance, String[] excludeProperty,String[] orden,String[] direccion,Hashtable objetosMapeados); 
    /**
     * MEtodo para contar los registros resultantes de una consulta
     * @param desde
     * @param maxResults
     * @param exampleInstance
     * @param excludeProperty
     * @param orden
     * @param direccion
     * @param objetosMapeados
     * @return
     */
    public Long countFindByExampleLikePaginado(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados);
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles. Devuelve el criteria con la consulta realizada.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public Criteria findByExampleLikeCrit(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados);
    
    /**
     * Metodo que dada una propiedad y una lista de valores, devuelve 
     * una lista de aquellos objetos cuya propiedad no es igual a cualquiera de los valores 
     * @param propiedad
     * @param valores
     * @return
     */
    public List findPropiedadNotIn(String propiedad, List valores,Integer desde, Integer maxResults);
    
    /**
     * Metodo que dada una propiedad y una lista de valores, devuelve 
     * una lista de aquellos objetos cuyo valor de la propiedad esté incluido
     * en la lista de valores 
     * @param propiedad
     * @param valores
     * @return
     */
    public List findPropiedadIn(String propiedad, List valores,Integer desde, Integer maxResults);
    
    public Integer getMaxPropiedad(Class clase, String propiedad, String campo, Integer valor);
}
