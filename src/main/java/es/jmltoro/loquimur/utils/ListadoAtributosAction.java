package es.jmltoro.loquimur.utils;

import java.util.List;

import org.apache.log4j.Logger;

public class ListadoAtributosAction {
		
	protected static final long serialVersionUID = 1L;
	
	/**
	 * Logger
	 */
	private static final Logger log = Logger.getLogger(ListadoAtributosAction.class);
	
		
	/**
	 * Lista de resultados
	 */
	protected List<Object> listado;	
	
	/**
	 * Operacion que se esta llevando a cabo
	 */
	protected String oper;
	
	/**
	 * Total de paginas que componen el listado
	 */
	private Integer total = 0;
	
	/**
	 * Pagina que esta siendo solicitada
	 */
	private Integer page = 0;
	
	/**
	* Numero de registros que se tendran en la rejilla
	*/
	private Integer rows = 0;	
	
	/**
	 * Numero total de registros que componen el listado
	 */
	private Integer records = 0;
	
	/**
	 * Orden seleccionado para la ordenacion (ascendente o 
	 * descendente)
	 */
	private String sord;

	/**
	 * Columna por la que se ordena
	 */
	private String sidx;
	
	/**
	 * Id de la fila seleccionada para editar/borrar
	 */
	private String id;
	
    /**
     * Campo de busqueda
     */
	private String searchField;

    /**
     * Campo de busqueda
     */
	private String searchOper;
	
    /**
     * Cadena de busqueda
     */
	private String searchString;
	
	
	/**
	 * Constructor por defecto
	 * @param service
	 * @param generoService
	 */
	public ListadoAtributosAction() {
		super();
    }


	/**
	 * @return the listado
	 */
	public List<Object> getListado() {
		return listado;
	}


	/**
	 * @param listado the listado to set
	 */
	public void setListado(List<Object> listado) {
		this.listado = listado;
	}


	/**
	 * @return the oper
	 */
	public String getOper() {
		return oper;
	}


	/**
	 * @param oper the oper to set
	 */
	public void setOper(String oper) {
		this.oper = oper;
	}


	/**
	 * @return the total
	 */
	public Integer getTotal() {
		return total;
	}


	/**
	 * @param total the total to set
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}


	/**
	 * @return the page
	 */
	public Integer getPage() {
		return page;
	}


	/**
	 * @param page the page to set
	 */
	public void setPage(Integer page) {
		this.page = page;
	}


	/**
	 * @return the rows
	 */
	public Integer getRows() {
		return rows;
	}


	/**
	 * @param rows the rows to set
	 */
	public void setRows(Integer rows) {
		this.rows = rows;
	}


	/**
	 * @return the records
	 */
	public Integer getRecords() {
		return records;
	}


	/**
	 * @param records the records to set
	 */
	public void setRecords(Integer records) {
		this.records = records;
	}


	/**
	 * @return the sord
	 */
	public String getSord() {
		return sord;
	}


	/**
	 * @param sord the sord to set
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}


	/**
	 * @return the sidx
	 */
	public String getSidx() {
		return sidx;
	}


	/**
	 * @param sidx the sidx to set
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}


	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}


	/**
	 * @return the searchField
	 */
	public String getSearchField() {
		return searchField;
	}


	/**
	 * @param searchField the searchField to set
	 */
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}


	/**
	 * @return the searchOper
	 */
	public String getSearchOper() {
		return searchOper;
	}


	/**
	 * @param searchOper the searchOper to set
	 */
	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}


	/**
	 * @return the searchString
	 */
	public String getSearchString() {
		return searchString;
	}


	/**
	 * @param searchString the searchString to set
	 */
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}


	/**
	 * @return the log
	 */
	public static Logger getLog() {
		return log;
	}
	

	
	
}
