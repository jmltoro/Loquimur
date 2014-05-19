package es.jmltoro.loquimur.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PU_TRATAM")
public class Tratamiento implements Serializable {
	

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TR_CTRATA")
	protected String id;	
	
	@Column(name = "TR_CDESCR") 
	protected String tratamiento;
	
	@Column(name = "TR_TIPOIN") 
	protected Integer tipoIn;
	
	
	 public Tratamiento() {
	    super();	
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTratamiento() {
		return tratamiento;
	}


	public void setTratamiento(String tratamiento) {
		this.tratamiento = tratamiento;
	}


	public Integer getTipoIn() {
		return tipoIn;
	}


	public void setTipoIn(Integer tipoIn) {
		this.tipoIn = tipoIn;
	}


	
	 
}
