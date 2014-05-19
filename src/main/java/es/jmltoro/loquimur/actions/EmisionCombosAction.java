package es.jmltoro.loquimur.actions;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;

import es.jmltoro.loquimur.actions.model.Valor;
import es.jmltoro.loquimur.entities.Canal;
import es.jmltoro.loquimur.entities.Destino;
import es.jmltoro.loquimur.entities.Tratamiento;
import es.jmltoro.loquimur.services.interfaz.ICanalServicio;
import es.jmltoro.loquimur.services.interfaz.IDestinoServicio;
import es.jmltoro.loquimur.services.interfaz.IServicioGenerico;
import es.jmltoro.loquimur.services.interfaz.ITratamientoServicio;


/**
 * 
 * Clase para manejar las peticiones sobre la 
 * entidad "Emision" y la vista VWEMISION. Es un mantenimiento individual.
 *
 */
public class EmisionCombosAction  {
	
	private List<Valor> listCanal;
	private List<Valor> listDestino;
	private List<Valor> listTratamiento;
	public String cadenaJson;
    /**
     * Esta anotación sustituye a esto otro en el fichero struts.xml, pero no siempre funciona
     * <!-- <property name="listaCategoriaEpg" ref="categoriaEpgServicio" /> -->
     * 
     * Esto lo usamos para que sea Spring quien cree los objetos en lugar de hacerlo nosotros.
     * 
     * La línea anterior evita tener que hacer ICategoriaEpgServicio listaCategoriaEpg = (ICategoriaEpgServicio) getApplicationContext().getBean("categoriaEpgServicio");
     * cada vez que hiciera falta. Así uso listaCategoriaEpg cada vez que me haga falta.
     */
    @Autowired
    private ICanalServicio listaCanal;
    @Autowired
    private IDestinoServicio listaDestino;
    @Autowired
    private ITratamientoServicio listaTratamiento;

    
	/**
     * Constructor por defecto
     */
    public EmisionCombosAction() {
        super();
    }
//    public String obtieneComboDestino() {
//    	Hashtable<String, List<?>> objetosMapeados = new Hashtable<String, List<?>>();
//    	List<Destino> listaDestino = this.listaDestino.findByExample(new Destino(), new String[0], "id",
//                IServicioGenerico.ORDEN_ASC, objetosMapeados);
//   	 	Valor v = new Valor();
//   	 	//Inserto una línea en blanco, pues debe poderse poner para limpiar los destinos.
// 		v.setClave("");
// 		v.setNombre("");
// 		listDestino = new ArrayList<Valor>();
// 		listDestino.add(v);
//   	 	for(Destino a : listaDestino){
//   	 		v = new Valor();
//   	 		v.setClave(a.getId());
//   	 		v.setNombre(a.getDestino());
//   	 		listDestino.add(v);
//   	 	}	   	 
//        return Action.SUCCESS;
//        
//   	}
    
public String cogeDestinos() {
    	
    	HttpServletRequest request = ServletActionContext.getRequest();
    	Hashtable<String, List<?>> objetosMapeados = new Hashtable<String, List<?>>();
    	String tip = request.getParameter("t");
    	int destinos = 0;
         
     	List<Destino> listaDestino = this.listaDestino.findByExample(new Destino(), new String[0], "id",IServicioGenerico.ORDEN_ASC, objetosMapeados);
     	destinos = listaDestino.size();
     	listDestino = new ArrayList<Valor>(); 

     	
      	 
     	if(tip.contentEquals("f")) {  // Si tip es f, hay que devolver los valores para el FILTRO en formato select, no json	     		 
     		cadenaJson = "<option value=\"\">Seleccione ...</option> ";
     		String color = "";
	     	
	     	Valor v = new Valor();	

	     	for(Destino a : listaDestino){
	   	 		v = new Valor();
	   	 		v.setClave(a.getId());
	   	 		v.setNombre(a.getDestino());
	   	 		listDestino.add(v);
		 		cadenaJson += " <option style=\"color:"+color+";font-weight:bold;\" value=\""+a.getId()+"\"> "+ a.getDestino()+"</option> ";	 				
	       	 }	 
	       	 
     	 } else { // Devuelvo valores en formato json, son para el FORMULARIO      	 
      	 
	         cadenaJson = " { " +
		         	   " \"Result\":\"OK\", "+
		         	   " \"Options\": [ {\"DisplayText\":\"\", \"Value\":null},";
	         Valor v = new Valor();	
		     int x = 1;
	         for(Destino a : listaDestino){
	        	 v = new Valor();
	      		 cadenaJson += " {\"DisplayText\":\""+ a.getId() +"\", \"Value\":\""+ a.getDestino() +"\"} ";	      		 
	      		 if(x<destinos) {
	     			 cadenaJson = cadenaJson + ",";
	     			 x++;
	     		 }	
	      	 }
	      	 
		       cadenaJson = cadenaJson + "]}"  ;		  
     	 }	
      	 
			// Para mostrar bien los acentos y demás en JTable hay que cambiarle
			// el charset a la cadena de datos que devuelve
			byte ptext[];
			try {
				ptext = cadenaJson.getBytes("UTF-8");
				cadenaJson = new String(ptext, "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

       return Action.SUCCESS;
       
   }  
    

    public String obtieneComboCanal() {
    	Hashtable<String, List<?>> objetosMapeados = new Hashtable<String, List<?>>();
    	List<Canal> listaCanal = this.listaCanal.findByExample(new Canal(), new String[0], "id",
                IServicioGenerico.ORDEN_ASC, objetosMapeados);
   	 	Valor v = new Valor();
   	 	//Inserto una línea en blanco, pues debe poderse poner para limpiar los canales.
 		v.setClave("");
 		v.setNombre("");
 		listCanal = new ArrayList<Valor>();
 		listCanal.add(v);
   	 	for(Canal a : listaCanal){
   	 		v = new Valor();
   	 		v.setClave(a.getIdClaveCanal());
   	 		v.setNombre(a.getNombre());
   	 		listCanal.add(v);
   	 	}	   	 
        return Action.SUCCESS;
        
   	}
    
    public String cogeCanales() {
    	
    	HttpServletRequest request = ServletActionContext.getRequest();
    	Hashtable<String, List<?>> objetosMapeados = new Hashtable<String, List<?>>();
    	String tip = request.getParameter("t");
    	int canales = 0;
         
     	List<Canal> listaCanal = this.listaCanal.findByExample(new Canal(), new String[0], "id",
                IServicioGenerico.ORDEN_ASC, objetosMapeados);
     	canales = listaCanal.size();
     	listCanal = new ArrayList<Valor>(); 

     	
      	 
     	if(tip.contentEquals("f")) {  // Si tip es f, hay que devolver los valores para el FILTRO en formato select, no json	     		 
     		cadenaJson = "<option value=\"\">Seleccione ...</option> ";
     		String color = "";
	     	
	     	Valor v = new Valor();	

	     	for(Canal a : listaCanal){
	   	 		v = new Valor();
	   	 		v.setClave(a.getIdClaveCanal());
	   	 		v.setNombre(a.getNombre());
	   	 		listCanal.add(v);
		 		cadenaJson += " <option style=\"color:"+color+";font-weight:bold;\" value=\""+a.getIdClaveCanal()+"\"> "+ a.getNombre()+"</option> ";	 				
	       	 }	 
	       	 
     	 } else { // Devuelvo valores en formato json, son para el FORMULARIO      	 
      	 
	         cadenaJson = " { " +
		         	   " \"Result\":\"OK\", "+
		         	   " \"Options\": [ {\"DisplayText\":\"\", \"Value\":null},";
	         Valor v = new Valor();	
		     int x = 1;
	         for(Canal a : listaCanal){
	        	 v = new Valor();
	      		 cadenaJson += " {\"DisplayText\":\""+ a.getIdClaveCanal() +"\", \"Value\":\""+ a.getNombre() +"\"} ";	      		 
	      		 if(x<canales) {
	     			 cadenaJson = cadenaJson + ",";
	     			 x++;
	     		 }	
	      	 }
	      	 
		       cadenaJson = cadenaJson + "]}"  ;		  
     	 }	
      	 
			// Para mostrar bien los acentos y demás en JTable hay que cambiarle
			// el charset a la cadena de datos que devuelve
			byte ptext[];
			try {
				ptext = cadenaJson.getBytes("UTF-8");
				cadenaJson = new String(ptext, "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

       return Action.SUCCESS;
       
   }  
    
public String cogeTratamientos() {
    	
    	HttpServletRequest request = ServletActionContext.getRequest();
    	Hashtable<String, List<?>> objetosMapeados = new Hashtable<String, List<?>>();
    	String tip = request.getParameter("t");
    	int tratamientos = 0;
         
     	List<Tratamiento> listaTratamiento = this.listaTratamiento.findByExample(new Tratamiento(), new String[0], "id",IServicioGenerico.ORDEN_ASC, objetosMapeados);
     	tratamientos = listaTratamiento.size();
     	listTratamiento = new ArrayList<Valor>(); 

     	
      	 
     	if(tip.contentEquals("f")) {  // Si tip es f, hay que devolver los valores para el FILTRO en formato select, no json	     		 
     		cadenaJson = "<option value=\"\">Seleccione ...</option> ";
     		String color = "";
	     	
	     	Valor v = new Valor();	

	     	for(Tratamiento a : listaTratamiento){
	   	 		v = new Valor();
	   	 		v.setClave(a.getId());
	   	 		v.setNombre(a.getTratamiento());
	   	 		listTratamiento.add(v);
		 		cadenaJson += " <option style=\"color:"+color+";font-weight:bold;\" value=\""+a.getId()+"\"> "+ a.getTratamiento()+"</option> ";	 				
	       	 }	 
	       	 
     	 } else { // Devuelvo valores en formato json, son para el FORMULARIO      	 
      	 
	         cadenaJson = " { " +
		         	   " \"Result\":\"OK\", "+
		         	   " \"Options\": [ {\"DisplayText\":\"\", \"Value\":null},";
	         Valor v = new Valor();	
		     int x = 1;
	         for(Tratamiento a : listaTratamiento){
	        	 v = new Valor();
	      		 cadenaJson += " {\"DisplayText\":\""+ a.getId() +"\", \"Value\":\""+ a.getTratamiento() +"\"} ";	      		 
	      		 if(x<tratamientos) {
	     			 cadenaJson = cadenaJson + ",";
	     			 x++;
	     		 }	
	      	 }
	      	 
		       cadenaJson = cadenaJson + "]}"  ;		  
     	 }	
      	 
			// Para mostrar bien los acentos y demás en JTable hay que cambiarle
			// el charset a la cadena de datos que devuelve
			byte ptext[];
			try {
				ptext = cadenaJson.getBytes("UTF-8");
				cadenaJson = new String(ptext, "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

       return Action.SUCCESS;
       
   }  

	public List<Valor> getListCanal() {
		return listCanal;
	}

	public void setListCanal(List<Valor> listCanal) {
		this.listCanal = listCanal;
	}

	public ICanalServicio getListaCanal() {
		return listaCanal;
	}

	public void setListaCanal(ICanalServicio listaCanal) {
		this.listaCanal = listaCanal;
	}

	public String getCadenaJson() {
		return cadenaJson;
	}

	public void setCadenaJson(String cadenaJson) {
		this.cadenaJson = cadenaJson;
	}
	public List<Valor> getListDestino() {
		return listDestino;
	}
	public void setListDestino(List<Valor> listDestino) {
		this.listDestino = listDestino;
	}
	public IDestinoServicio getListaDestino() {
		return listaDestino;
	}
	public void setListaDestino(IDestinoServicio listaDestino) {
		this.listaDestino = listaDestino;
	}

	public List<Valor> getListTratamiento() {
		return listTratamiento;
	}

	public void setListTratamiento(List<Valor> listTratamiento) {
		this.listTratamiento = listTratamiento;
	}

	public ITratamientoServicio getListaTratamiento() {
		return listaTratamiento;
	}

	public void setListaTratamiento(ITratamientoServicio listaTratamiento) {
		this.listaTratamiento = listaTratamiento;
	}    
}
