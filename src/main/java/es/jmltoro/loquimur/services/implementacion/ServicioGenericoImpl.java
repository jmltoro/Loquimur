package es.jmltoro.loquimur.services.implementacion;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

import es.jmltoro.loquimur.services.interfaz.IServicioGenerico;
		

@Transactional
public class ServicioGenericoImpl<T, ID extends Serializable> implements IServicioGenerico<T, ID> {

	/* EntityManager para los accesos a base de datos */
    protected EntityManager em;
    
	/* Clase que manejará el Servicio/DAO.*/
	private Class<T> persistentClass;
	
	/* Tipo de la entidad que manejará el Servicio/DAO.*/
	private EntityType<T> T_;
	
	/* Clase de identificador Servicio/DAO */
	private Class<ID> persistentId;
	
	protected static final Logger log = Logger.getLogger(IServicioGenerico.class);

	public ServicioGenericoImpl(Class<T> persistentClass, Class<ID> persistentId){
    	this.persistentClass = persistentClass;
    	this.persistentId = persistentId;
    }
	
	/*Constructor de la clase, inicializa el valor de la clase que manejará el Servicio/DAO*/
	public ServicioGenericoImpl() {
		 Class clazz = getClass();
		 while (!(clazz.getGenericSuperclass() instanceof ParameterizedType)) {
		       clazz = clazz.getSuperclass();
		 }
		 persistentClass = (Class<T>) ((ParameterizedType)clazz.getGenericSuperclass()).getActualTypeArguments()[0];
		 persistentId = (Class<ID>) ((ParameterizedType)clazz.getGenericSuperclass()).getActualTypeArguments()[1];
		
	}

    private EntityManager getEntityManager() {
        return em;
    }
    
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	
    /**
     * Método que recupera la clase que manejará el Servicio/DAO 
     */
    public Class<T> getPersistentClass() {
    	return persistentClass;
    }
        

    
    @SuppressWarnings("unchecked")
    /**
     * Metodo que obtiene todos los registros
     */
    
    public List<T> findAll() {  
       Session session = (Session) getEntityManager().getDelegate();
          Criteria crit = session.createCriteria(getPersistentClass());
          return crit.list();
      }
      
      @SuppressWarnings("unchecked")
      /**
       * Metodo que obtiene todos los registros, estableciendo un 
       * campo de ordenacion y una direccion en la que ordenar
       */
      public List<T> findAll(String criterioOrdenacion,String orden) {     
         Session session = (Session) getEntityManager().getDelegate();
            Criteria crit = session.createCriteria(getPersistentClass());
            if(this.ORDEN_ASC.equals(orden))
             crit.addOrder(org.hibernate.criterion.Order.asc(criterioOrdenacion));
            else if(this.ORDEN_DESC.equals(orden)) {
             crit.addOrder(org.hibernate.criterion.Order.desc(criterioOrdenacion));
            }
            return crit.list();
      }

    /**
     * Metodo que devuelve la lista completa con los criterios de ordenacion y obteniendo el 
     * conjunto de resultados solicitado
     */
    @SuppressWarnings("unchecked")
    public List<T> findAllPaginado(int desde,int maxResults,String criterioOrdenacion,String orden) {    	
    	CriteriaQuery<T> cq = (CriteriaQuery<T>) em.getCriteriaBuilder().createQuery(getPersistentClass());
    	Root<T> result = cq.from(getPersistentClass());
    	cq.select(result);
    	
    	if (criterioOrdenacion != null){
    		cq.orderBy(this.obtieneOrdenacion(result, criterioOrdenacion, orden));	
    	}
    	
    	
    	Query query = getEntityManager().createQuery(cq);
    	query.setFirstResult(desde);
    	query.setMaxResults(maxResults);
   	
        return query.getResultList();
    }  
        
    /**
     * Metodo para guardar una entidad en base de datos
     */
    public T save(T entidad) {
    	try {
    	    entidad = em.merge(entidad);
    	    em.persist(entidad);    	    
    	} catch (Exception e) {
    		log.error("Error", e);
    		em.persist(entidad); 
		}
    		
    	return entidad;
    }

    /**
     * MEtodo para eliminar una entidad de base de datos
     */
    public void remove(ID id) {    	
    	T entidad = findById(id);
        if (entidad != null) {
            em.remove(entidad);              
        }
    }

    /**
     * Dado un ID, devuelve la entidad solicitada
     */
    public T findById(ID id) {
        return em.find(getPersistentClass(), id);
    } 
    
    /**
     * Dado un ID, devuelve la entidad solicitada dependiendo de si se desea que se cachee la entidad o no
     */
    public T findByIdCheckCacheable(int id, boolean descachear) {
    	if(descachear)
    		em.clear();
        return em.find(getPersistentClass(), id);
    }  

    /**
     * Metodo que obtiene el criterio de ordenacion aplicable a la consulta, partiendo
     * del criterio de ordenacion establecido y el orden solicitado
     * @param result
     * @param criterioOrdenacion
     * @param orden
     * @return
     */
    private Order obtieneOrdenacion(Root<T> result,String criterioOrdenacion,String orden){
    	
    	T_ = em.getMetamodel().entity(getPersistentClass()); 

    	Expression expOrden = result.get(T_.getDeclaredSingularAttribute(criterioOrdenacion));
    	if (ORDEN_ASC.equalsIgnoreCase(orden)){
    		return em.getCriteriaBuilder().asc(expOrden);
    	} else{
    		return em.getCriteriaBuilder().desc(expOrden);
    	}
    	
    }
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el listado de elementos.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExample(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados) {
    	Criteria crit = findByExampleCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);
    	return crit.list();
    }
    
    public List<T> findByExample(T exampleInstance) {
		Criteria crit = findByExampleCrit(exampleInstance);
    	return crit.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<T> findByExampleGt(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados, String campoOrden, Integer valor) {
    	Criteria crit = findByExampleCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);
    	crit.add(Restrictions.gt(campoOrden, valor));
    	return crit.list();
    }
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el listado de elementos.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campos por los cuales ordenar
     * @param direcciones -direcciónes de las ordenaciónes (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleOrder(T exampleInstance, String[] excludeProperty,String[] orden,String[] direcciones,Hashtable objetosMapeados) {
    	Criteria crit = findByExampleCrit(exampleInstance, excludeProperty, orden, direcciones, objetosMapeados);
    	return crit.list();
    }
    
    public Criteria findByExampleCrit(T exampleInstance){
    	Hashtable objetosMapeados = new Hashtable();
		return findByExampleCrit(exampleInstance, new String[0], null, ORDEN_ASC, objetosMapeados);
    }
    
    public Criteria findByExampleCrit(T exampleInstance, String[] excludeProperty){
    	Hashtable objetosMapeados = new Hashtable();
		return findByExampleCrit(exampleInstance, excludeProperty, null, ORDEN_ASC, objetosMapeados);
    }

    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el criteria con la consulta realizada.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public Criteria findByExampleCrit(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados) {
    	Session session = (Session) getEntityManager().getDelegate();
    	
    	Criteria crit = session.createCriteria(getPersistentClass());
    	Example example = excluyePropiedades(exampleInstance, excludeProperty);
    	Set sKeys = objetosMapeados.keySet(); 
    	Vector keys = new Vector(sKeys); 
    	Collections.sort(keys); 
    	Object valor;
    	String propiedad;
    	//Mediante hashAliasJoin llevamos el control de los JOIN realizados, para no repetirlos
    	Hashtable hashAliasJoin=new Hashtable();
    	for(Iterator i = keys.iterator(); i.hasNext(); ) {
    		propiedad=(String)i.next();
    		valor= objetosMapeados.get(propiedad);
    		joinCriteria(crit, hashAliasJoin, propiedad);
    		if(((ArrayList)valor).isEmpty()){
    			return crit;
    		}
    		
    		crit.add(Restrictions.in(propiedad,(ArrayList)valor));

    	}
    	//Establecemos el orden
    	orderCriteria(crit, hashAliasJoin, orden,direccion);
    	if (example!=null){
    		crit.add(example.ignoreCase());
    	}
    	return crit;
    }
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones estrictas.Devuelve el criteria con la consulta realizada.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -direcciónes de las ordenaciónes (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public Criteria findByExampleCrit(T exampleInstance, String[] excludeProperty,String[] orden,String direccion[],Hashtable objetosMapeados) {
    	Session session = (Session) getEntityManager().getDelegate();

    	Criteria crit = session.createCriteria(getPersistentClass());
    	Example example = excluyePropiedades(exampleInstance, excludeProperty);
    	Set sKeys = objetosMapeados.keySet(); 
    	Vector keys = new Vector(sKeys); 
    	Collections.sort(keys); 
    	Object valor;
    	String propiedad;
    	//Mediante hashAliasJoin llevamos el control de los JOIN realizados, para no repetirlos
    	Hashtable hashAliasJoin=new Hashtable();
    	for(Iterator i = keys.iterator(); i.hasNext(); ) {
    		propiedad=(String)i.next();
    		valor= objetosMapeados.get(propiedad);
    		joinCriteria(crit, hashAliasJoin, propiedad);
    		if(((ArrayList)valor).isEmpty()){
    			return crit;
    		}
    		
    		crit.add(Restrictions.in(propiedad,(ArrayList)valor));

    	}
    	//Establecemos el orden
    	orderCriteria(crit, hashAliasJoin, orden,direccion);
    	if (example!=null){
    		crit.add(example.ignoreCase());
    	}
    	return crit;
    }
    
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el listado de elementos.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleLike(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados) {
    	Criteria crit = findByExampleLikeCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);
    	return crit.list();
    }
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el listado de elementos paginado.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public List<T> findByExampleLikePaginado(Integer desde, Integer maxResults, 
    		T exampleInstance, String[] excludeProperty,String orden,
    		String direccion,Hashtable objetosMapeados) {
    	Criteria crit = findByExampleLikeCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);

        if (desde != null && maxResults != null){
    		crit.setFirstResult(desde);
        	crit.setMaxResults(maxResults);	
    	} 
    	    	
    	return crit.list();
    }
    /**
     * TORO Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el listado de elementos paginado.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -LISTA de campos por los que ordenar
     * @param direccion -LISTA de direcciones de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */   
    @SuppressWarnings("unchecked")
    public List<T> findByExampleLikePaginado(Integer desde, Integer maxResults, 
    		T exampleInstance, String[] excludeProperty,String[] orden,
    		String[] direccion,Hashtable objetosMapeados) {
    	Criteria crit = findByExampleLikeCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);

        if (desde != null && maxResults != null){
    		crit.setFirstResult(desde);
        	crit.setMaxResults(maxResults);	
    	} 
    	    	
    	return crit.list();
    }   
    
    public Long countFindByExampleLikePaginado(T exampleInstance, String[] excludeProperty,String orden,
    		String direccion,Hashtable objetosMapeados) {
    	Criteria crit = findByExampleLikeCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);
    	crit.setProjection(Projections.rowCount()); 
    	int tam = (Integer)crit.list().get(0);
    	    	
    	return new Long(tam);
    }
    
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el criteria con la consulta realizada.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public Criteria findByExampleLikeCrit(T exampleInstance, String[] excludeProperty,String orden,String direccion,Hashtable objetosMapeados) {
    	Session session = (Session) getEntityManager().getDelegate();
    	Criteria crit = session.createCriteria(getPersistentClass());
    	Example example = excluyePropiedades(exampleInstance, excludeProperty);
    	
    	Set sKeys = objetosMapeados.keySet(); 
    	Vector keys = new Vector(sKeys); 
    	Collections.sort(keys); 
    	Object valor;
    	String propiedad;
    	//	Mediante hashAliasJoin llevamos el control de los JOIN realizados, para no repetirlos
    	Hashtable hashAliasJoin=new Hashtable();
    	for(Iterator i = keys.iterator(); i.hasNext(); ) {
    		propiedad=(String)i.next();
    		valor= objetosMapeados.get(propiedad);
    		joinCriteria(crit, hashAliasJoin, propiedad);
    		if(((ArrayList)valor).isEmpty()){
    			return crit;
    		}	
    		if(((ArrayList)valor).get(0).getClass().getName().equals(persistentId.getName())){
    			crit.add(Restrictions.in(propiedad,(ArrayList)valor));
    		}else{
    			Criterion auxCriterionLike =null;
    			//Lucas. Añado esta parte para cuando empieza por fech, para fechaHora. OJO: esta comprobación (fech) debe ir antes que la siguiente (fec).
    			if (propiedad.startsWith("fech")) {
    				
    				SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    				ArrayList lstValor=((ArrayList)valor);
    				Iterator it=lstValor.iterator();
    				
    				String strFecha="";
    				ArrayList fecha= new ArrayList();
    				
        			while(it.hasNext()){
        				
        				strFecha = it.next().toString();
        				
        				try {
        	
        						fecha.add(formatoDelTexto.parse(strFecha));
    						
        				} catch (ParseException e) {
        					log.error("Error", e);
    					}
        			}
        		
        			Date vacio = null;
        			try {
						vacio = formatoDelTexto.parse("01/01/1900 00:00");
					} catch (ParseException e) {
						log.error("Error", e);
					}
        			
        			if (!fecha.get(0).equals(vacio) && !fecha.get(1).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.between(propiedad, fecha.get(0), fecha.get(1));
        				
        			} else if (!fecha.get(0).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.ge(propiedad, fecha.get(0));
        				
        			} else {
        				
        				auxCriterionLike=Restrictions.le(propiedad, fecha.get(1));
        			}
        	

    			}
    			//--------------------------
    			else if (propiedad.startsWith("fec")) {
    				SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
    				ArrayList lstValor=((ArrayList)valor);
    				Iterator it=lstValor.iterator();
    				
    				String strFecha="";
    				ArrayList fecha= new ArrayList();
    				
        			while(it.hasNext()){
        				
        				strFecha = it.next().toString();
        				
        				try {
        	
        						fecha.add(formatoDelTexto.parse(strFecha));
    						
        				} catch (ParseException e) {
        					log.error("Error", e);
    					}
        			}
        		
        			Date vacio = null;
        			try {
						vacio = formatoDelTexto.parse("01/01/1900");
					} catch (ParseException e) {
						log.error("Error", e);
					}
        			
        			if (!fecha.get(0).equals(vacio) && !fecha.get(1).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.between(propiedad, fecha.get(0), fecha.get(1));
        				
        			} else if (!fecha.get(0).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.ge(propiedad, fecha.get(0));
        				
        			} else {
        				
        				auxCriterionLike=Restrictions.le(propiedad, fecha.get(1));
        			}    				
    			}

    			else {
    			ArrayList lstValor=((ArrayList)valor);
    			Iterator it=lstValor.iterator();
    			auxCriterionLike=Restrictions.like(propiedad,it.next().toString(),MatchMode.ANYWHERE);
    			while(it.hasNext()){
    				auxCriterionLike=Restrictions.or(auxCriterionLike, Restrictions.like(propiedad,it.next().toString(),MatchMode.ANYWHERE));
    			}
    			}
    			crit.add(auxCriterionLike);
    		}
    	}
    	if (example!=null){
    		crit.add(example.enableLike(MatchMode.ANYWHERE).ignoreCase());
    	}
    	orderCriteria(crit, hashAliasJoin, orden,direccion);
    	return crit;
    }
    /**
     * Recupera los objetos de la clase manejada que cumplan determinadas condiciones flexibles.Devuelve el criteria con la consulta realizada.
     * @param exampleInstance -instancia de un objeto de la clase manejada, cualquier valor no FK discrimina el resultado
     * @param excludeProperty -propiedades del objeto manejado a excluir a la hora de discriminar
     * @param orden -lista de campos por los que ordenar
     * @param direccion -lista de direcciónes de la ordenación (Constantes de la clase GenericDAO)
     * @param objetosMapeados -Hashtable del tipo<String,List> donde la String es el camino desde el objeto de la clase manejada y la lista contiene valores
     */
    @SuppressWarnings("unchecked")
    public Criteria findByExampleLikeCrit(T exampleInstance, String[] excludeProperty,String[] orden,String[] direccion,Hashtable objetosMapeados) {
    	Session session = (Session) getEntityManager().getDelegate();
    	Criteria crit = session.createCriteria(getPersistentClass());
    	Example example = excluyePropiedades(exampleInstance, excludeProperty);
    	
    	Set sKeys = objetosMapeados.keySet(); 
    	Vector keys = new Vector(sKeys); 
    	Collections.sort(keys); 
    	Object valor;
    	String propiedad;
    	//	Mediante hashAliasJoin llevamos el control de los JOIN realizados, para no repetirlos
    	Hashtable hashAliasJoin=new Hashtable();
    	for(Iterator i = keys.iterator(); i.hasNext(); ) {
    		propiedad=(String)i.next();
    		valor= objetosMapeados.get(propiedad);
    		joinCriteria(crit, hashAliasJoin, propiedad);
    		if(((ArrayList)valor).isEmpty()){
    			return crit;
    		}	
    		if(((ArrayList)valor).get(0).getClass().getName().equals(persistentId.getName())){
    			crit.add(Restrictions.in(propiedad,(ArrayList)valor));
    		}else{
    			Criterion auxCriterionLike =null;
    			//Lucas. Añado esta parte para cuando empieza por fech, para fechaHora. OJO: esta comprobación (fech) debe ir antes que la siguiente (fec).
    			if (propiedad.startsWith("fech")) {
    				
    				SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    				ArrayList lstValor=((ArrayList)valor);
    				Iterator it=lstValor.iterator();
    				
    				String strFecha="";
    				ArrayList fecha= new ArrayList();
    				
        			while(it.hasNext()){
        				
        				strFecha = it.next().toString();
        				
        				try {
        	
        						fecha.add(formatoDelTexto.parse(strFecha));
    						
        				} catch (ParseException e) {
    						// TODO Auto-generated catch block
    						e.printStackTrace();
    					}
        			}
        		
        			Date vacio = null;
        			try {
						vacio = formatoDelTexto.parse("01/01/1900 00:00");
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
        			
        			if (!fecha.get(0).equals(vacio) && !fecha.get(1).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.between(propiedad, fecha.get(0), fecha.get(1));
        				
        			} else if (!fecha.get(0).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.ge(propiedad, fecha.get(0));
        				
        			} else {
        				
        				auxCriterionLike=Restrictions.le(propiedad, fecha.get(1));
        			}
        	

    			}
    			//--------------------------
    			else if (propiedad.startsWith("fec")) {
    				SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
    				ArrayList lstValor=((ArrayList)valor);
    				Iterator it=lstValor.iterator();
    				
    				String strFecha="";
    				ArrayList fecha= new ArrayList();
    				
        			while(it.hasNext()){
        				
        				strFecha = it.next().toString();
        				
        				try {
        	
        						fecha.add(formatoDelTexto.parse(strFecha));
    						
        				} catch (ParseException e) {
    						// TODO Auto-generated catch block
    						e.printStackTrace();
    					}
        			}
        		
        			Date vacio = null;
        			try {
						vacio = formatoDelTexto.parse("01/01/1900");
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
        			
        			if (!fecha.get(0).equals(vacio) && !fecha.get(1).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.between(propiedad, fecha.get(0), fecha.get(1));
        				
        			} else if (!fecha.get(0).equals(vacio)){
        				
        				auxCriterionLike=Restrictions.ge(propiedad, fecha.get(0));
        				
        			} else {
        				
        				auxCriterionLike=Restrictions.le(propiedad, fecha.get(1));
        			}    				
    			}

    			else {
    			ArrayList lstValor=((ArrayList)valor);
    			Iterator it=lstValor.iterator();
    			auxCriterionLike=Restrictions.like(propiedad,it.next().toString(),MatchMode.ANYWHERE);
    			while(it.hasNext()){
    				auxCriterionLike=Restrictions.or(auxCriterionLike, Restrictions.like(propiedad,it.next().toString(),MatchMode.ANYWHERE));
    			}
    			}
    			crit.add(auxCriterionLike);
    		}
    	}
    	if (example!=null){
    		crit.add(example.enableLike(MatchMode.ANYWHERE).ignoreCase());
    	}
    	orderCriteria(crit, hashAliasJoin, orden,direccion);
    	return crit;
    }
    
    /**
     * Metodo que dada una propiedad y una lista de valores, devuelve 
     * una lista de aquellos objetos cuya propiedad no es igual a cualquiera de los valores 
     * @param propiedad
     * @param valores
     * @return
     */
    public List findPropiedadNotIn(String propiedad, List valores,Integer desde, Integer maxResults) {
    	Session session = (Session) getEntityManager().getDelegate();
    	Criteria crit = session.createCriteria(persistentClass);
    	    	
    	for(Object obj:valores){
    		crit.add(Restrictions.ne(propiedad, obj));
    	}
    	
    	if (desde != null){
    		crit.setFirstResult(desde);	
    	}
    	
    	if (maxResults != null){
    	    crit.setMaxResults(maxResults);
    	}
    	
    	return crit.list();
    }
    
    /**
     * Metodo que dada una propiedad y una lista de valores, devuelve 
     * una lista de aquellos objetos cuyo valor de la propiedad está incluido
     * en la lista de valores 
     * @param propiedad
     * @param valores
     * @return
     */
    public List findPropiedadIn(String propiedad, List valores,Integer desde, Integer maxResults) {
    	Session session = (Session) getEntityManager().getDelegate();
    	Criteria crit = session.createCriteria(persistentClass);
    	
    	crit.add(Restrictions.in(propiedad,valores));
    	    	
    	if (desde != null){
    		crit.setFirstResult(desde);	
    	}
    	
    	if (maxResults != null){
    	    crit.setMaxResults(maxResults);
    	}
    	
    	return crit.list();
    }
    
    /**
     * Crea un Example de Hibernate a partir de la instancia de ejemplo
     * excluyendo un conjunto de propiedades.
     * @param exampleInstance Instancia de ejemplo.
     * @param excludeProperty Conjunto de propiedades a excluir.
     * @return Objeto Example de Hibernate.
     */
    protected Example excluyePropiedades(T exampleInstance, 
            String[] excludeProperty) {
        Example example = null;
        if (exampleInstance != null) {
            example = Example.create(exampleInstance);
            if (excludeProperty!=null){
                for (String exclude : excludeProperty) {
                    example.excludeProperty(exclude);
                }
            }
        }
        
        return example;
    }
    
    /**
     * Realiza los distintos join a la hora de acceder a una propiedad de otra entidad.
     * @param crit -Criteria donde insertar los alias de los joins
     * @param hashAliasJoin -hash donde se registran los joins dados de alta
     * @param propiedad -propiedad a la cual se accede
     */
    @SuppressWarnings("unchecked")
    protected void joinCriteria(Criteria crit,Hashtable hashAliasJoin, String propiedad) {
    	if(propiedad.split("[.]").length>1){
    		String tipo="";
    		String[] cadenaDesc=propiedad.split("[.]");
    		for(int j=0;j<cadenaDesc.length-1;j++){
    			tipo+=cadenaDesc[j];
    			if(hashAliasJoin.get(tipo)==null){
    				hashAliasJoin.put(tipo, tipo.replaceAll("[.]",""));
    				crit.createAlias(tipo,(String)hashAliasJoin.get(tipo));
    			}
    			if(j!=cadenaDesc.length-2){
    				tipo+=".";
    			}
    		}
    		propiedad=(String)hashAliasJoin.get(tipo)+"."+cadenaDesc[cadenaDesc.length-1];
    	}
    }
    /**
     * Realiza los distintos join a la hora de ordenar por una propiedad de otra entidad.
     * @param crit -Criteria donde insertar los alias de los joins
     * @param hashAliasJoin -hash de los joins dados de alta anteriormente
     * @param orden -campo por el cual ordenar
     * @param direccion -dirección de la ordenación (Constantes de la clase GenericDAO)
     */
    protected void orderCriteria(Criteria crit, Hashtable hashAliasJoin, String orden,String direccion) {
    	if(orden!=null && !orden.equals("")){
    		if(orden.split("[.]").length>1){
    			String tipo="";
    			String[] cadenaDesc=orden.split("[.]");
    			Hashtable hashAlias=new Hashtable();
    			for(int j=0;j<cadenaDesc.length-1;j++){
    				tipo+=cadenaDesc[j];
    				hashAlias.put(tipo, tipo.replaceAll("[.]",""));
    				if(hashAliasJoin.get(tipo)==null){
    					crit.createAlias(tipo,(String)hashAlias.get(tipo));
    				}
    				if(j!=cadenaDesc.length-2){
    					tipo+=".";
    				}
    			}
    			orden=(String)hashAlias.get(tipo)+"."+cadenaDesc[cadenaDesc.length-1];
    		}
    		
    		// Para acceder a la clase Order de hibernate, se usa la nomenclatura
    		// completa de paquetes, ya que existe otra clase ORDER de JPA que 
    		// ya esta siendo utilizada en otra consulta
    		if(direccion!=null && direccion.equals(this.ORDEN_ASC)){
    			crit.addOrder(org.hibernate.criterion.Order.asc(orden));
    		}else{
    			crit.addOrder(org.hibernate.criterion.Order.desc(orden));
    		}
    	}
    }
    
    /**
     * Realiza los distintos join a la hora de ordenar por una propiedad de otra entidad.
     * @param crit -Criteria donde insertar los alias de los joins
     * @param hashAliasJoin -hash de los joins dados de alta anteriormente
     * @param ordenes -campos por los cuales ordenar
     * @param direcciones -direcciónes de las ordenaciónes (Constantes de la clase GenericDAO)
     */
    protected void orderCriteria(Criteria crit, Hashtable hashAliasJoin, String[] ordenes,String[] direcciones) {
    	
    	if (ordenes != null && ordenes.length > 0) {
    	
    		for (int i = 0; i < ordenes.length; i++) {
    			String orden = ordenes[i];
    			String direccion = direcciones[i];
    			
		    	if(orden!=null && !orden.equals("")){
		    		if(orden.split("[.]").length>1){
		    			String tipo="";
		    			String[] cadenaDesc=orden.split("[.]");
		    			Hashtable hashAlias=new Hashtable();
		    			for(int j=0;j<cadenaDesc.length-1;j++){
		    				tipo+=cadenaDesc[j];
		    				hashAlias.put(tipo, tipo.replaceAll("[.]",""));
		    				if(hashAliasJoin.get(tipo)==null){
		    					crit.createAlias(tipo,(String)hashAlias.get(tipo));
		    				}
		    				if(j!=cadenaDesc.length-2){
		    					tipo+=".";
		    				}
		    			}
		    			orden=(String)hashAlias.get(tipo)+"."+cadenaDesc[cadenaDesc.length-1];
		    		}
		    		
		    		// Para acceder a la clase Order de hibernate, se usa la nomenclatura
		    		// completa de paquetes, ya que existe otra clase ORDER de JPA que 
		    		// ya esta siendo utilizada en otra consulta
		    		if(direccion!=null && direccion.equals(this.ORDEN_ASC)){
		    			crit.addOrder(org.hibernate.criterion.Order.asc(orden));
		    		}else{
		    			crit.addOrder(org.hibernate.criterion.Order.desc(orden));
		    		}
		    	}
    		}
    	}
    }
    
    public Integer getMaxPropiedad(Class clase, String propiedad, String campo, Integer valor) {
    	
    	Session session = (Session) getEntityManager().getDelegate();
    	Criteria crit = session.createCriteria(clase);
    	crit.add(Restrictions.eq(campo, valor));
    	
    	Integer orden = null;
    	
    	Object obj = crit.setProjection(Projections.projectionList().add(Projections.max(propiedad))).uniqueResult();
    	
    	if (obj == null) {
    		orden = 0;
    	}
    	else {
    		orden = (Integer)obj;
    	}
    	
    	return orden;
    }
    
}
