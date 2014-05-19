package es.jmltoro.loquimur.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PU_CANALES")
public class Canal implements Serializable {
	

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CA_ICODCAN")
	protected String id;
	
	@Column(name = "CA_CCLACAN") 
	protected String idClaveCanal;

	@Column(name = "CA_IDEMPRE") 
	protected String idEmpresa;
	
	@Column(name = "CA_CNOMBRE") 
	protected String nombre;
	
	@Column(name = "CA_CNOMCOR") 
	protected String nombreCorto;
	
	
	 public Canal() {
	    super();	
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getIdClaveCanal() {
		return idClaveCanal;
	}


	public void setIdClaveCanal(String idClaveCanal) {
		this.idClaveCanal = idClaveCanal;
	}


	public String getIdEmpresa() {
		return idEmpresa;
	}


	public void setIdEmpresa(String idEmpresa) {
		this.idEmpresa = idEmpresa;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getNombreCorto() {
		return nombreCorto;
	}


	public void setNombreCorto(String nombreCorto) {
		this.nombreCorto = nombreCorto;
	}
	 
}
