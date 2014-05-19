package es.jmltoro.loquimur.entities.vistas;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "VWEMISION")
public class VwEmision implements Serializable, Cloneable{
	
	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
    @Column(name = "EM_IDENTI") 
	protected Integer id;
	
	@Column(name = "EM_CDESTI") 
	protected String idDestino;
    
	@Column(name = "EM_DFEMIS")
	protected java.util.Date fechaEmision;
	
	@Column(name = "EM_CANAL_") 
	protected String idCanal;
	
	@Column(name = "DS_CLUGAR") 
	protected String destino;
	
	@Column(name = "EM_CORDEN") 
	protected String idOrdenEmision;

	@Column(name = "EM_TBLOQU")
	protected java.util.Date bloque;
	
	@Column(name = "EM_IPOSIC")
	protected Integer posicion;	
	
	@Column(name = "AN_CNOMBR") 
	protected String anunciante;

	@Column(name = "PE_CPRODU") 
	protected String pelicula;	

	@Column(name = "OD_CCODTP") 
	protected String idTipoPublicidad;	

	@Column(name = "OD_CORAGE") 
	protected String ordenAgencia;	

	@Column(name = "PE_VDUREA") 
	protected String duracion;	

	@Column(name = "EM_CCLAVE") 
	protected String idPelicula;	

	@Column(name = "PE_CCODEM") 
	protected String idEmisionPelicula;	

	@Column(name = "EM_FPRECI") 
	protected Double precio;	
	
	@Column(name = "EM_DFECHR")
	protected java.util.Date fechaReal;

	@Column(name = "EM_CTRATA") 
	protected String idTratamiento;	

	@Column(name = "TR_CDESCR") 
	protected String descripcionTratamiento;
	
	@Column(name = "EM_COBSER") 
	protected String observaciones;	
		
	@Column(name = "EM_THORAR")
	protected java.util.Date horaReal;

	@Column(name = "TR_TIPOIN") 
	protected Integer tipoInforme;	
	
	@Column(name = "PR_CDENOM")
	protected String programa;

	@Column(name = "BL_CDESCR")
	protected String descripcionBloque;	
	
	 public VwEmision() {
	    	super();	
		}

	 public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIdDestino() {
		return idDestino;
	}

	public void setIdDestino(String idDestino) {
		this.idDestino = idDestino;
	}

	public java.util.Date getFechaEmision() {
		return fechaEmision;
	}

	public void setFechaEmision(java.util.Date fechaEmision) {
		this.fechaEmision = fechaEmision;
	}

	public String getIdCanal() {
		return idCanal;
	}

	public void setIdCanal(String idCanal) {
		this.idCanal = idCanal;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public String getIdOrdenEmision() {
		return idOrdenEmision;
	}

	public void setIdOrdenEmision(String idOrdenEmision) {
		this.idOrdenEmision = idOrdenEmision;
	}

	public java.util.Date getBloque() {
		return bloque;
	}

	public void setBloque(java.util.Date bloque) {
		this.bloque = bloque;
	}

	public Integer getPosicion() {
		return posicion;
	}

	public void setPosicion(Integer posicion) {
		this.posicion = posicion;
	}

	public String getAnunciante() {
		return anunciante;
	}

	public void setAnunciante(String anunciante) {
		this.anunciante = anunciante;
	}

	public String getPelicula() {
		return pelicula;
	}

	public void setPelicula(String pelicula) {
		this.pelicula = pelicula;
	}

	public String getIdTipoPublicidad() {
		return idTipoPublicidad;
	}

	public void setIdTipoPublicidad(String idTipoPublicidad) {
		this.idTipoPublicidad = idTipoPublicidad;
	}

	public String getOrdenAgencia() {
		return ordenAgencia;
	}

	public void setOrdenAgencia(String ordenAgencia) {
		this.ordenAgencia = ordenAgencia;
	}

	public String getDuracion() {
		return duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public String getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(String idPelicula) {
		this.idPelicula = idPelicula;
	}

	public String getIdEmisionPelicula() {
		return idEmisionPelicula;
	}

	public void setIdEmisionPelicula(String idEmisionPelicula) {
		this.idEmisionPelicula = idEmisionPelicula;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public java.util.Date getFechaReal() {
		return fechaReal;
	}

	public void setFechaReal(java.util.Date fechaReal) {
		this.fechaReal = fechaReal;
	}

	public String getIdTratamiento() {
		return idTratamiento;
	}

	public void setIdTratamiento(String idTratamiento) {
		this.idTratamiento = idTratamiento;
	}

	public String getDescripcionTratamiento() {
		return descripcionTratamiento;
	}

	public void setDescripcionTratamiento(String descripcionTratamiento) {
		this.descripcionTratamiento = descripcionTratamiento;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public java.util.Date getHoraReal() {
		return horaReal;
	}

	public void setHoraReal(java.util.Date horaReal) {
		this.horaReal = horaReal;
	}

	public Integer getTipoInforme() {
		return tipoInforme;
	}

	public void setTipoInforme(Integer tipoInforme) {
		this.tipoInforme = tipoInforme;
	}

	public String getPrograma() {
		return programa;
	}

	public void setPrograma(String programa) {
		this.programa = programa;
	}

	public String getDescripcionBloque() {
		return descripcionBloque;
	}

	public void setDescripcionBloque(String descripcionBloque) {
		this.descripcionBloque = descripcionBloque;
	}

	@Override
		public Object clone() throws CloneNotSupportedException {
			VwEmision res = new VwEmision();
			res.setId(this.getId());
			res.setIdDestino(this.getIdDestino());  
			res.setFechaEmision(this.getFechaEmision());		
			res.setIdCanal(this.getIdCanal());			
			res.setDestino(this.getIdDestino());			
			res.setIdOrdenEmision(this.getIdOrdenEmision());
			res.setBloque(this.getBloque());			
			res.setPosicion(this.getPosicion());				
			res.setAnunciante(this.getAnunciante());
			res.setPelicula(this.getPelicula());	
			res.setIdTipoPublicidad(this.getIdTipoPublicidad());	
			res.setOrdenAgencia(this.getOrdenAgencia());	
			res.setDuracion(this.getDuracion());				
			res.setIdPelicula(this.getIdPelicula());	
			res.setIdEmisionPelicula(this.getIdEmisionPelicula());				
			res.setPrecio(this.getPrecio());				
			res.setFechaReal(this.getFechaReal());			
			res.setIdTratamiento(this.getIdTratamiento());			
			res.setDescripcionTratamiento(this.getIdTratamiento());			
			res.setObservaciones(this.getObservaciones());			
			res.setHoraReal(this.getHoraReal());
			res.setTipoInforme(this.getTipoInforme());		
			res.setPrograma(this.getPrograma());
			res.setDescripcionBloque(this.getDescripcionBloque());	
			return res;
		}

}
