package es.jmltoro.loquimur.services.interfaz.vistas;

import java.util.Hashtable;
import java.util.List;

import es.jmltoro.loquimur.entities.vistas.VwEmision;
import es.jmltoro.loquimur.services.interfaz.IServicioGenerico;

public interface IVwEmisionServicio extends IServicioGenerico<VwEmision, Integer>{
	 
	public List<VwEmision> dameBloquesPaginado(Integer desde, Integer maxResults, 
			VwEmision exampleInstance, String[] excludeProperty,String[] orden,
			String[] direccion,Hashtable objetosMapeados);	 
	public Long countDameBloquesPaginado(VwEmision exampleInstance, String[] excludeProperty,Hashtable objetosMapeados);

}
