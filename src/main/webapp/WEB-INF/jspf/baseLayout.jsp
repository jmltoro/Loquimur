<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%><%@ taglib prefix="s" uri="/struts-tags"
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es" xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/general.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/theme.css"/>
<link type="text/css" rel="stylesheet"	href="${pageContext.servletContext.contextPath}/css/menuHorizontal_style.css"/>
<link type="text/css" rel="stylesheet"	href="${pageContext.servletContext.contextPath}/css/jQueryTimePicker.css"/>

<link rel="SHORTCUT ICON" href="favicon.ico">
	
<link href="${pageContext.servletContext.contextPath}/css/dialogoConfirmacion.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.servletContext.contextPath}/css/themes/lightcolor/blue/jtable.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.servletContext.contextPath}/css/themes/redmond/jquery-ui-1.10.1.custom.css" rel="stylesheet" type="text/css" /> 

<script src="${pageContext.servletContext.contextPath}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/js/mensajes.js"	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/js/utils.js"	type="text/javascript" charset="utf-8"></script>
<script	src="${pageContext.servletContext.contextPath}/js/jquery.tmpl.min.js"	type="text/javascript"></script>

<%--  Estas dos líneas siguientes son para el desplegable con imágenes --%>
<script src="${pageContext.servletContext.contextPath}/js/jquery.dd.js" type="text/javascript"></script> 
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/dd.css" /> 

<script src="${pageContext.servletContext.contextPath}/js/jquery-ui-1.9.2.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.jtable.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.jtable.es.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.tablesorter.min.js" type="text/javascript"></script> 

<!-- Import CSS file for validation engine (in Head section of HTML) -->
<link href="${pageContext.servletContext.contextPath}/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
 
<!-- Import Javascript files for validation engine (in Head section of HTML) -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.validationEngine-es.js"></script>



<%-- Para las ayudas con introJS styles --%>
    <%-- <link href="${pageContext.servletContext.contextPath}/js/introjs/bootstrap.min.css" rel="stylesheet"> --%>
    <!-- Add IntroJs styles -->
    <link href="${pageContext.servletContext.contextPath}/js/introjs/introjs.css" rel="stylesheet">
    <%-- <link href="${pageContext.servletContext.contextPath}/js/introjs/bootstrap-responsive.min.css" rel="stylesheet"> --%>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/introjs/intro.js"></script>


<!--  Para las alertas con Jquery  -->
<script src="${pageContext.servletContext.contextPath}/js/jquery.alerts.js" type="text/javascript"></script>
<link href="${pageContext.servletContext.contextPath}/css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<!-- --------------- -->

<%-- Ponemos el datepicker en español --%>
<script type="text/javascript">
$.datepicker.regional['español'] = {clearText: 'Borrar', clearStatus: '',
    closeText: 'Cerrar', closeStatus: 'Cerrar sin cambios',
    prevText: 'Anterior', prevStatus: 'Ver mes anterior',
    nextText: 'Siguiente', nextStatus: 'Ver mes siguiente',
    currentText: 'Actual', currentStatus: 'Ver mes actual',
    monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
    monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
    monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
    weekHeader: 'Sm', weekStatus: '',
    dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'],
    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
    dayStatus: 'Use DD como primer día de la semana', dateStatus: 'Elija DD, MM d',
    dateFormat: 'dd/mm/yy', firstDay: 1, 
    initStatus: 'Elija la fecha', isRTL: false};
 $.datepicker.setDefaults($.datepicker.regional['español']);
</script>

<script type="text/javascript">
	$(function() {
		setTimeout(function() {
			$("select option").each(function() {
				this.title = $(this).html();
			});
		}, 1/2 * 1000);
	});
	
	
	</script>



<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>


	<tiles:insertAttribute name="header" />
	<div id="nav">
	<tiles:insertAttribute name="menuHorizontal" />
	</div>
	<div class="clearboth"></div>
	
	<tiles:insertAttribute name="body" />


	<div id="pie"></div>

</body>