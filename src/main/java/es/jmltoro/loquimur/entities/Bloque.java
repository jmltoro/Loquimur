package es.jmltoro.loquimur.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "PU_BLOQUE")
@IdClass(BloquePk.class)
public class Bloque implements Serializable {
	

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "BL_CANAL_")
	protected String canal;
	
	@Id
	@Column(name = "BL_CDESTI") 
	protected String destino;

	@Id
	@Column(name = "BL_DFEMIS") 
	protected java.util.Date fechaEmision;
	
	@Id
	@Column(name = "BL_TBLOQU") 
	protected java.util.Date bloque;
	
	@Column(name = "BL_CDESCR") 
	protected String descripcion;
	
	@Column(name = "BL_CDESCO") 
	protected String desco;
	
	@Column(name = "BL_VMDURA") 
	protected String vmdura;
	
	@Column(name = "BL_CTRATA") 
	protected String tratamiento;
	
	 public Bloque() {
	    super();	
	}

	public String getCanal() {
		return canal;
	}

	public void setCanal(String canal) {
		this.canal = canal;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public java.util.Date getFechaEmision() {
		return fechaEmision;
	}

	public void setFechaEmision(java.util.Date fechaEmision) {
		this.fechaEmision = fechaEmision;
	}

	public java.util.Date getBloque() {
		return bloque;
	}

	public void setBloque(java.util.Date bloque) {
		this.bloque = bloque;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDesco() {
		return desco;
	}

	public void setDesco(String desco) {
		this.desco = desco;
	}

	public String getVmdura() {
		return vmdura;
	}

	public void setVmdura(String vmdura) {
		this.vmdura = vmdura;
	}

	public String getTratamiento() {
		return tratamiento;
	}

	public void setTratamiento(String tratamiento) {
		this.tratamiento = tratamiento;
	}

	 
}

class BloquePk implements Serializable{

	@Column(name = "BL_CANAL_")
	protected String canal;
	
	@Column(name = "BL_CDESTI") 
	protected String destino;

	@Column(name = "BL_DFEMIS") 
	protected java.util.Date fechaEmision;
	
	@Column(name = "BL_TBLOQU") 
	protected java.util.Date bloque;

	public String getCanal() {
		return canal;
	}

	public void setCanal(String canal) {
		this.canal = canal;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public java.util.Date getFechaEmision() {
		return fechaEmision;
	}

	public void setFechaEmision(java.util.Date fechaEmision) {
		this.fechaEmision = fechaEmision;
	}

	public java.util.Date getBloque() {
		return bloque;
	}

	public void setBloque(java.util.Date bloque) {
		this.bloque = bloque;
	}



    /* Override Equals And HashCode */

}
