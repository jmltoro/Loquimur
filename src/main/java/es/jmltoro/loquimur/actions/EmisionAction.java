package es.jmltoro.loquimur.actions;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.JDBCException;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import es.jmltoro.loquimur.entities.Canal;
import es.jmltoro.loquimur.entities.vistas.VwEmision;
import es.jmltoro.loquimur.services.interfaz.ICanalServicio;
import es.jmltoro.loquimur.services.interfaz.IServicioGenerico;
import es.jmltoro.loquimur.services.interfaz.vistas.IVwEmisionServicio;

public class EmisionAction extends ManejadorGenericoAction {
		
	private VwEmision vwEmision;
	private Long idSeleccionado; 
	private String fechaStr;
    private String comboCanales;
    private List<Canal> listCanales;
    private String claveCanal;
	private IVwEmisionServicio vWemisionServ;
	private List<VwEmision> emisiones;
	public String cadenaJson;

    /**
     * Constructor por defecto
     */
    public EmisionAction() {
        super();
    }
    
    /**
     * Constructor para el manejador de la vista.
     * @param Servicio de la clase VwUsuarios.
     */
    public EmisionAction(IVwEmisionServicio service) {
        super(service);
    }
    
    /**
     * Metodo ejecutado para cargar la pagina por primera vez.
     * 
     * @return SUCCESS.
     */
    public String cargaDatosListado() {
    	//Obtenemos la informacion básica para cargar la página
    	String path = Action.SUCCESS;
    	
    	obtieneDatosListado();
    	
    	return path;
    }
    
    private void obtieneDatosListado(){
      	 
    	//Si hiciese falta cargar algún combo para las búsquedas se haría aquí
    	obtieneComboCanales();
    	
   }
    
    public String realizaBusquedaByFilter() {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	HttpSession session = request.getSession();
    	listaErrores.clear();
    	
    	try {
	    	int id = -1; int paginas=0; int empieza=0;
	    	String[] temp = "".split(" ");
	    	if(request.getParameter("id")!=null){
	    		id = Integer.parseInt(request.getParameter("id"));
	    	}
	    	if( id > -1 ){ 	  //Viene del maestro
	    		
	    	} else {
		    	empieza = Integer.parseInt(request.getParameter("jtStartIndex"));
		    	paginas = Integer.parseInt(request.getParameter("jtPageSize"));
		    	//String orden = request.getParameter("jtSorting");
		    	
		    	//temp = orden.split(" ");    	// contiene codigo ASC. temp[0]=codigo   temp[1]=ASC
	    	}
	        Hashtable<String, List> objetosMapeados = new Hashtable<String, List>();      
	        	        
			if( id > -1 ){ 	  //Viene del maestro
				List<Integer> valores2 = new ArrayList<Integer>();
				valores2.add(id); 
				objetosMapeados.put("", valores2 );
			} else {	
				
	        	String pCanal= request.getParameter("canal") ;
	        	String pFecha= request.getParameter("fecha") ;
	        	String pDestino= request.getParameter("destino") ;
	        	String pTratamiento= request.getParameter("tratamiento") ;
	        	
	        // TORO HACER OJO!!!!!!!
//	        	Este el el select que hay que hacer para traer la descripcion del bloque
//	        	select * from pu_bloque where bl_dfemis="2013-03-10" and bl_canal_ = "1" and bl_tbloqu = "10:30" and bl_cdesti ="0"
	        	
	        	
	        	
	        	// Si se introdujeron datos en el filtro
	        	if ((pCanal!=null && pCanal!="") && 
	        		(pFecha != null && pFecha!="") &&
	        		(pDestino != null && pDestino!="") &&
	        		(pTratamiento != null && pTratamiento!="")
	        		){
					
		        	Date pFechaEmision = new Date();
	        		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	        		try {
						pFechaEmision = sdf.parse(pFecha);
					} catch (Exception e) {
						listaErrores.add(e.getMessage());
						e.printStackTrace();
					}     
	        		
	
					
					// Bloques
					List<VwEmision> listaBloques = null; 
			        IVwEmisionServicio listaBloque = (IVwEmisionServicio) getApplicationContext().getBean("vwEmisionServicio");
			        VwEmision bloque = new VwEmision();
			        bloque.setIdCanal(pCanal);
			        bloque.setFechaEmision(pFechaEmision);
			        bloque.setIdDestino(pDestino);

			        
			        String[] direccionBloque = {"asc", "asc"};
					String[] ordenBloque = {"fechaReal", "bloque"};
					long totalRegistrosBloque = listaBloque.countDameBloquesPaginado(bloque, new String[0], objetosMapeados);
			        listaBloques = listaBloque.dameBloquesPaginado(empieza, paginas, bloque,new String[0], ordenBloque, direccionBloque, objetosMapeados);
			        
					
					// Emisiones
					String[] direccion = {"asc", "asc", "asc", "asc", "asc"};
					String[] orden = {"idTratamiento", "idDestino", "fechaReal", "bloque", "posicion"};		
					
					List<VwEmision> listaEmisiones = null; 
			        IVwEmisionServicio listaEmision = (IVwEmisionServicio) getApplicationContext().getBean("vwEmisionServicio");
			        VwEmision emision = new VwEmision();
			        emision.setIdCanal(pCanal);
			        emision.setFechaEmision(pFechaEmision);
			        emision.setIdDestino(pDestino);
			        emision.setIdTratamiento(pTratamiento);
					long totalRegistros = listaEmision.countFindByExampleLikePaginado(emision, new String[0], "", "asc", objetosMapeados);
			        listaEmisiones = listaEmision.findByExampleLikePaginado(empieza, paginas, emision,new String[0], orden, direccion, objetosMapeados);
				    cadenaJson = " { " +
				         	   " \"Result\":\"OK\", "+
				         	   " \"Records\": ["; 
			     	Iterator<VwEmision> itEmision = listaEmisiones.iterator();
			     	while (itEmision.hasNext()) {
			     		VwEmision sisAux = itEmision.next();
			     		// OJO!!!! que los campos de texto deben ir entre dobles comillas....
						// BucleBusquedaAction					 
						cadenaJson = cadenaJson + "{\"id\":" + sisAux.getId() +  
								",\"idDestino\":\"" + (sisAux.getIdDestino()+"").replace("\"", "'") + "\"" + 
								",\"fechaEmision\":\"" + (sisAux.getFechaEmision()+"").replace("\"", "'") + "\"" +
								",\"idCanal\":\"" + (sisAux.getIdCanal()+"").replace("\"", "'") + "\"" + 
								",\"destino\":\"" + (sisAux.getDestino()+"").replace("\"", "'") + "\"" + 
								",\"idOrdenEmision\":\"" + (sisAux.getIdOrdenEmision()+"").replace("\"", "'") + "\"" + 
								",\"bloque\":\"" + (sisAux.getBloque()+"").replace("\"", "'") + "\"" + 
								",\"posicion\":\"" + (sisAux.getPosicion()+"").replace("\"", "'") + "\"" + 
								",\"anunciante\":\"" + (sisAux.getAnunciante()+"").replace("\"", "'") + "\"" + 
								",\"pelicula\":\"" + (sisAux.getPelicula()+"").replace("\"", "'") + "\"" + 
								",\"idTipoPublicidad\":\"" + (sisAux.getIdTipoPublicidad()+"").replace("\"", "'") + "\"" + 
								",\"ordenAgencia\":\"" + (sisAux.getOrdenAgencia()+"").replace("\"", "'") + "\"" + 
								",\"duracion\":\"" + (sisAux.getDuracion()+"").replace("\"", "'") + "\"" + 
								",\"idPelicula\":\"" + (sisAux.getIdPelicula()+"").replace("\"", "'") + "\"" + 
								",\"idEmisionPelicula\":\"" + (sisAux.getIdEmisionPelicula()+"").replace("\"", "'") + "\"" + 
								",\"precio\":\"" + (sisAux.getPrecio()+"").replace("\"", "'") + "\"" + 
								",\"fechaReal\":\"" + (sisAux.getFechaReal()+"").replace("\"", "'") + "\"" + 
								",\"idTratamientio\":\"" + (sisAux.getIdTratamiento()+"").replace("\"", "'") + "\"" + 
								",\"descripcionTratamiento\":\"" + (sisAux.getDescripcionTratamiento()+"").replace("\"", "'") + "\"" + 
								",\"observaciones\":\"" + (sisAux.getObservaciones()+"").replace("\"", "'") + "\"" + 
								",\"horaReal\":\"" + (sisAux.getHoraReal()+"").replace("\"", "'") + "\"" + 
								",\"tipoInforme\":\"" + (sisAux.getTipoInforme()+"").replace("\"", "'") + "\"" + 
								",\"programa\":\"" + (sisAux.getPrograma()+"").replace("\"", "'") + "\"" + 
								",\"descripcionBloque\":\"" + (sisAux.getDescripcionBloque()+"").replace("\"", "'") + "\"" + 
								"}";						 				        
				     		 
				     		 if(itEmision.hasNext()) {
				     			 cadenaJson = cadenaJson + ",";
				     		 }
			     		}         	   
				    cadenaJson = cadenaJson + "], \"TotalRecordCount\": " + totalRegistros + " }"  ;
	        		
	        	}else{
	        		 cadenaJson = " { " +
	  		         	   " \"Result\":\"OK\", "+
	  		         	   " \"Records\": [], \"TotalRecordCount\": 0 }"  ;	        		
	        	}
	        	
//				if(pCanal!="" && !pCanal.contains("null")  && pCanal != null ){ 
//					List<String> valores1 = new ArrayList<String>();
//					valores1.add(pCanal); 
//					objetosMapeados.put("idCanal", valores1 );				
//				 }else {
//						//Si se elige filtro, no muestro nada. TIENE QUE ELEGIR UN FILTRO, a no ser que tenga la opción de (TT)odos
//						String A3="kk-";
//						List<String> valores3 = new ArrayList<String>();
//						valores3.add(A3); 
//						objetosMapeados.put("idCanal", valores3 );
//				} 
//
//				if (pFecha != null){
//					if(pFecha!="" && !pFecha.contains("null")){ 
//						List<String> valores2 = new ArrayList<String>();
//						valores2.add(pFecha+"00:00");	
//						objetosMapeados.put("fechaEmision", valores2 );
//					}	 
//				}
	 
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
   	 
        } catch (JDBCException e1) {
        	listaErrores.add(e1.getSQLException().toString());
        } catch (Exception e) {
        	listaErrores.add(e.getMessage());
        } 
        
    	
    	if(!listaErrores.isEmpty()){
	        cadenaJson = " { " +
	            	   " \"Result\":\"ERROR\", "+
	            	   " \"Message\": \"" + listaErrores.toString().replaceAll("\"","") + "\""; 
	             	cadenaJson = cadenaJson + " }"  ;
    	}
         	   
                
        return Action.SUCCESS;
        

    }   
    
    
    /**
     * Realiza la búsqueda de emisiones por filtro.
     * 
     * @return SUCCESS.
     */
    public String realizaBusqueda() {    
    	Map<String, Object> session = ActionContext.getContext().getSession();
        Hashtable<String, List> objetosMapeados = new Hashtable<String, List>();
        
        // Obtiene los elementos de mapeo para el filtrado del listado.
        objetosMapeados = obtieneObjetosMapeados();
        
        this.vwEmision = new VwEmision();
        
        //Esto es para buscar por fecha.
        String feciniStr = this.getFechaStr();
        if(feciniStr!=null){		//Si hay rango de fechas, lo comprueba
	        try {  
	        	ArrayList<String> rangoFec = new ArrayList<String>();
	        	
	        	//El rango de fechas llega con un - . Pongo un caracter a cada lado del - para que al dividir la cadena SIEMPRE tenga dos valores.
	        	feciniStr = feciniStr.replace("-", "a-a");
	
		        if( feciniStr!= null && feciniStr.contains("-")) {
			        
			        String[] Aux2 = feciniStr.split("-");
			        
			        if(Aux2.length==2){
			        	if(vwEmision!=null)
			        		vwEmision.setFechaEmision(null);			        	
			        	//Si las fechas son iguales - busca un dia - ponemos que busque desde las 00:00 a las 23:59 
			        	if(Aux2[0].replace("a", "").equals(Aux2[1].replace("a", "")) && Aux2[0].length()>6) {
			        		rangoFec.add(Aux2[0].replace("a", "")+" 00:00");
			        		rangoFec.add(Aux2[1].replace("a", "")+" 23:59");
			        	} else {		        	
				        	if(Aux2[0].length()<6)  rangoFec.add("1/1/1900 00:00"); 
				        	else 
				        		rangoFec.add(Aux2[0].replace("a", "")+" 00:00");
				        	
				        	if(Aux2[1].length()<6) rangoFec.add("31/12/2500 00:00");
				        	else 
				        		rangoFec.add(Aux2[1].replace("a", "")+" 00:00");
			        	}
	
			        	
						objetosMapeados.put("fecha", rangoFec);
			        }
		        }
	        } catch (NullPointerException npe) {
				// TODO Auto-generated catch block
	        	log.error("Error comprobación rango fechas", npe);
				//System.out.println(npe.getMessage());
			} catch (Exception e) {
				log.error("Error comprobación rango fechas", e);
				//e.getStackTrace();
			}
        }else{
        	//no se introdujo fecha
        	ArrayList<String> fechastrsesion = (ArrayList<String>) session.get("fechaStr");
        	if (fechastrsesion != null){
        		// Hay fecha en la sesion
        		objetosMapeados.put("fecha",fechastrsesion);
        	}else{
        		// No hay fecha en la sesion
        		fechastrsesion = new ArrayList<String>();
        		Date now = new Date();
        		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        		SimpleDateFormat sdfh = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        		fechastrsesion.add(sdf.format(now)+" 00:00");        		
        		fechastrsesion.add(sdf.format(now)+" 23:59");
        	}
        }
        
        
        
        //Las busquedas en el listado jquery se hacen por el campo sidx
  		//Como la fecha está como Str, para que realice la ordenación correctamente hay que cambiar el nombre que tiene 
  		//en el listado:fechaStr, por el que usa en la entidad: fecha
  		if (this.getSidx() != null && this.getSidx().contains("fechaStr")) {
              this.setSidx(this.getSidx().replace("fechaStr", "fecha"));
          }
  		
  		if (!objetosMapeados.values().isEmpty()){
	  		// Guardamos los datos de búsqueda en la sesión
	  		
	    	session.put("claveCanal", this.claveCanal);
	    	session.put("fechaStr", objetosMapeados.get("fecha"));
	    	
	        String[] direccion = {"asc", "asc", "asc", "asc", "asc"};
			String[] orden = {"idTratamiento", "idDestino", "fechaReal", "bloque", "posicion"};
			this.obtenerListadoOrdenado(this.getVwEmision(), new String[0], objetosMapeados, orden , direccion);    
  		}
  		
        return Action.SUCCESS;
    }      
    
    /**
     * Obtiene los elementos de mapeo para el filtrado del listado.
     * 
     * @return objetosMapeados.
     */
    private Hashtable<String, List> obtieneObjetosMapeados() {
        Hashtable<String, List> objetosMapeados = new Hashtable<String, List>();  
        // Si se ha filtrado por el canal, hay que añadirlo al filtro       
        if(claveCanal != null){
	        List<String> ids = new ArrayList<String>();
	        ids.add(claveCanal);
	        objetosMapeados.put("claveCanal", ids);
        }      
        return objetosMapeados;
    }
    
    
    /**
     * Obtiene la información necesaria para recargar el formulario de la Emisión
     */
    private void obtieneInfoFormulario() {
    	obtieneComboCanales();      
        setModificado(0);
    }
    
    /**
     * Metodo que obtiene los datos necesarios para la correcta carga de la pagina
     * 
     * @return SUCCESS.
     */
    public String obtieneComboCanales() {
        ICanalServicio canalServicio = (ICanalServicio) getApplicationContext().getBean("canalServicio");
        Hashtable<String, List> objetosMapeados = new Hashtable<String, List>();
        // Obtiene el listado de perfiles
        List<Canal> listaCanales = canalServicio.findByExample(new Canal(), new String[0], "id",
                IServicioGenerico.ORDEN_ASC, objetosMapeados);
        //comboPerfiles = "";
        // Se agrega el menos uno para que empiece en blanco y dar la posiblidad de no filtrar
        // por ese campo
        comboCanales = ":;";
        listCanales = new ArrayList<Canal>();
               
        Iterator<Canal> it = listaCanales.iterator();
        
        while (it.hasNext()) {
        	Canal canal = it.next();
            comboCanales += canal.getIdClaveCanal()+ ":" + canal.getNombre()+ ";";
        }
        // Formatea la cadena generada
        if (comboCanales != null && comboCanales.length() > 1) {
            comboCanales = comboCanales.substring(0, comboCanales.length() - 1);
        }
        listCanales.addAll(listaCanales);
        return Action.SUCCESS;
    }

	public VwEmision getVwEmision() {
		return vwEmision;
	}

	public void setVwEmision(VwEmision vwEmision) {
		this.vwEmision = vwEmision;
	}

	public Long getIdSeleccionado() {
		return idSeleccionado;
	}

	public void setIdSeleccionado(Long idSeleccionado) {
		this.idSeleccionado = idSeleccionado;
	}

	public String getFechaStr() {
		return fechaStr;
	}

	public void setFechaStr(String fechaStr) {
		this.fechaStr = fechaStr;
	}

	public String getComboCanales() {
		return comboCanales;
	}

	public void setComboCanales(String comboCanales) {
		this.comboCanales = comboCanales;
	}

	public List<Canal> getListCanales() {
		return listCanales;
	}

	public void setListCanales(List<Canal> listCanales) {
		this.listCanales = listCanales;
	}

	public String getClaveCanal() {
		return claveCanal;
	}

	public void setClaveCanal(String claveCanal) {
		this.claveCanal = claveCanal;
	}

	public IVwEmisionServicio getvWemisionServ() {
		return vWemisionServ;
	}

	public void setvWemisionServ(IVwEmisionServicio vWemisionServ) {
		this.vWemisionServ = vWemisionServ;
	}

	public List<VwEmision> getEmisiones() {
		return emisiones;
	}

	public void setEmisiones(List<VwEmision> emisiones) {
		this.emisiones = emisiones;
	}

	public String getCadenaJson() {
		return cadenaJson;
	}

	public void setCadenaJson(String cadenaJson) {
		this.cadenaJson = cadenaJson;
	}	
}
