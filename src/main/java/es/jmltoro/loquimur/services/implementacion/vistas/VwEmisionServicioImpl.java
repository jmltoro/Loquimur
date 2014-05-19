package es.jmltoro.loquimur.services.implementacion.vistas;

import java.util.Hashtable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;

import es.jmltoro.loquimur.entities.vistas.VwEmision;
import es.jmltoro.loquimur.services.implementacion.ServicioGenericoImpl;
import es.jmltoro.loquimur.services.interfaz.vistas.IVwEmisionServicio;


public class VwEmisionServicioImpl extends ServicioGenericoImpl<VwEmision,Integer> implements IVwEmisionServicio {


	
	public List<VwEmision> dameBloquesPaginado(Integer desde, Integer maxResults, 
			VwEmision exampleInstance, String[] excludeProperty,String[] orden,
			String[] direccion,Hashtable objetosMapeados){
		
		ProjectionList projectList = Projections.projectionList();
		Criteria crit = this.findByExampleCrit(exampleInstance, excludeProperty, orden, direccion, objetosMapeados);
		projectList.add(Projections.groupProperty("fechaReal"));
		projectList.add(Projections.groupProperty("bloque"));
		projectList.add(Projections.groupProperty("descripcionBloque"));
		crit.setProjection(projectList);	
		
        if (desde != null && maxResults != null){
    		crit.setFirstResult(desde);
        	crit.setMaxResults(maxResults);	
    	} 
		
		return crit.list();
	}
	
    public Long countDameBloquesPaginado(VwEmision exampleInstance, String[] excludeProperty,Hashtable objetosMapeados) {
    	
    	ProjectionList projectList = Projections.projectionList();
		projectList.add(Projections.countDistinct("bloque"));
		Criteria crit = this.findByExampleCrit(exampleInstance, excludeProperty, "", "", objetosMapeados);
		crit.setProjection(projectList);			
    	int tam = (Integer)crit.list().get(0); 	
    	return new Long(tam);
    }
	
}
