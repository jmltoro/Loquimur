/**
 * Clase para almacenar las opciones de un listado 'Combo'.
 * 
 * @author Icosis Grupo Avalon S.L.
 * @version v01r00, 02/03/2011
 *
 */
package es.jmltoro.loquimur.utils;

/**
 * Clase para almacenar las opciones de un listado 'Combo'.
 * 
 * @author Icosis Grupo Avalon S.L.
 * 
 */
public class ComboOption {

    /**
     * Almacena el id de la lista 'Combo'
     */
    Object id;

    /**
     * Almacena el valor o etiqueta de la lista 'Combo'
     */
    Object valor;

    /**
	 * 
	 */
    public ComboOption() {
        super();
    }

    /**
     * @param id
     * @param valor
     */
    public ComboOption(Object id, Object valor) {
        super();
        this.id = id;
        this.valor = valor;
    }

    /**
     * @return the id
     */
    public Object getId() {
        return id;
    }

    /**
     * @param id
     *            the id to set
     */
    public void setId(Object id) {
        this.id = id;
    }

    /**
     * @return the valor
     */
    public Object getValor() {
        return valor;
    }

    /**
     * @param valor
     *            the valor to set
     */
    public void setValor(Object valor) {
        this.valor = valor;
    }

}
