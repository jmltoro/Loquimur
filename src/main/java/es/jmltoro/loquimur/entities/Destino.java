package es.jmltoro.loquimur.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PU_DESTIN")
public class Destino implements Serializable {
	

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DS_CDESTI")
	protected String id;
	
	@Column(name = "DS_CLUGAR") 
	protected String destino;

	
	
	 public Destino() {
	    super();	
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getDestino() {
		return destino;
	}


	public void setDestino(String destino) {
		this.destino = destino;
	}


	
	 
}
