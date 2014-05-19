<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="es">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords"	content="struts2, jQuery, jquery-ui, UI, plugin, showcase, jqgrid, datepicker, timepicker, datetime, time, format" />

<sj:head locale="es" compressed="false" 
	         jqueryui="true" scriptPath="/sensores/struts/"
	         jquerytheme="sensoresTheme"
	         customBasepath="/sensores/themes"
	         defaultIndicator="myDefaultIndicator"
	          />
	
<%--           --%>


<style>#iframe1{visibility:hiden;}</style>
<%-- <link type="text/css" rel="stylesheet"	href="${pageContext.servletContext.contextPath}/css/general.css" /> --%>
<link type="text/css" rel="stylesheet"	href="${pageContext.servletContext.contextPath}/css/medidas.css" />
<link type="text/css" rel="stylesheet"	href="${pageContext.servletContext.contextPath}/css/sensoresor-one.css" />
<%-- <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/themes/ui-lightness/jquery-ui-1.8.2.custom.css" /> --%>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/themes/sensoresTheme/jquery-ui-1.8.2.custom.css" />
<link type="text/css" rel="stylesheet"	href="${pageContext.servletContext.contextPath}/css/jQueryTimePicker.css" />




<link rel="SHORTCUT ICON" href="images/favicon.ico">
<!--[if IE 7]>
	      <link href="${pageContext.servletContext.contextPath}/css/general_ie7.css" type="text/css" rel="stylesheet" />
	<![endif]-->
<!--[if IE 6]>
		  <link href="${pageContext.servletContext.contextPath}/css/general_ie7.css" type="text/css" rel="stylesheet" />
	      <link href="${pageContext.servletContext.contextPath}/css/general_ie6.css" type="text/css" rel="stylesheet" />
	<![endif]-->
<!--[if gt IE 7]>
        <link href="${pageContext.servletContext.contextPath}/css/general_ie8_up.css" type="text/css" rel="stylesheet" />
	<![endif]-->
	
 
<link href="${pageContext.servletContext.contextPath}/css/dialogoConfirmacion.css"	type="text/css" rel="stylesheet" />


<script	src="${pageContext.servletContext.contextPath}/js/jquery.validate.js"	type="text/javascript"></script>
<script	src="${pageContext.servletContext.contextPath}/js/validaciones.js"	type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/js/mensajes.js"	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.servletContext.contextPath}/js/utils.js"	type="text/javascript" charset="utf-8"></script>
<script	src="${pageContext.servletContext.contextPath}/js/jqGridUtils.js"	type="text/javascript"></script>
<script	src="${pageContext.servletContext.contextPath}/js/jquery.tmpl.min.js"	type="text/javascript"></script>
<script	src="${pageContext.servletContext.contextPath}/js/widgetCriterios.js"	type="text/javascript"></script>



<script	src="${pageContext.servletContext.contextPath}/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>

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

<!-- 	<div class="clearboth"></div>  -->
	<!-- <div style="width: 100%"> -->

		<!-- <div style="width: 100%"> -->

			<div id="cuerpo" class="margen">
				<tiles:insertAttribute name="body" />
			</div>
		<!-- </div> -->
<!-- 		<div class="clearboth"></div> -->
<!-- 	</div> -->


<%-- 	<div style="display: none;">
		<!-- Ventana modal para mostrar mensajes de alerta -->
		<sj:dialog id="dialogAlerta" autoOpen="false" modal="true"
			height="160" width="320" position="center" href=""
			title="Advertencia" draggable="true" resizable="false">

			<label id="label_msj"></label>
			<div class="botonera"
				style="margin-top: 10px; text-align: center; width: 100%;">
				<input type="button" class="btn" value="Aceptar"
					onclick="javascript: cerrarDialog('dialogAlerta');" />
			</div>
		</sj:dialog>
	</div> --%>

</body>