<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
.suaviza td { 
	height: 22px;
    padding-left: 7px !important;
    white-space: normal !important;
    background-color: #f8f8f8;
	color: #B3D8D1;
}
div.filtering{
    border: 1px solid #ccc;
    margin-bottom: 5px;
    padding: 10px;
    background-color: #EEE;
}
</style>
<script src="${pageContext.servletContext.contextPath}/js/moment.min.js")" type="text/javascript"></script>

<%-- El .js esta comprimido y ofuscado con yuicompressor --%>
<script type="text/javascript" 
		src="${pageContext.servletContext.contextPath}/pages/listados/js/emisionList.js">
</script>
<div class="filtering" >
    <form>
		CANAL: <select id="xcanal" name="xcanal" style="width:200px"></select>	        
		DESTINO: <select id="xdestino" name="xdestino" style="width:200px"></select>	
		FECHA: <input type="text" name="xfecha" id="xfecha" />
		TRATAMIENTO: <select id="xtratamiento" name="xtratamiento" style="width:200px"></select>
        
        <button type="submit" id="LoadRecordsButton">Filtrar</button>
        <button type="submit" id="LimpiarFiltro">Limpiar</button>
    </form>
</div>
<script type="text/javascript">
	$.ajaxSetup({cache: false});   //IE  tiene Ajax caching, lo que no borra los datos que había. Hay que quitarlo para que la carga se efectúe bien
	$("#xcanal").load("${pageContext.servletContext.contextPath}/selectdeCanales?t=f"); 	
	$("#xfecha").datepicker({ changeYear: true, changeMonth: true, dateFormat: 'dd/mm/yy'});
	$("#xdestino").load("${pageContext.servletContext.contextPath}/selectdeDestinos?t=f"); 	
	$("#xtratamiento").load("${pageContext.servletContext.contextPath}/selectdeTratamientos?t=f"); 
</script>

<div id="XTableContainer" style="width: 100%;"></div>

 
<div id="dlgConfirm" title="¿Seguro que quiere eliminar estos registros?">

</div>
