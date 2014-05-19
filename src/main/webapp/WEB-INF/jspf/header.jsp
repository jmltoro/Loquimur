<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- BLOQUE CABECERA -->
<div id="cabecera">
	<div id="zona_usuario">
		<span class="icono icono_user"><sec:authentication property="principal.nombre" /> <sec:authentication property="principal.apellidos" /></span>
	</div>
	<div id="nombre_aplicacion">
		<span>Listado de Emisiones</span>
	</div>
</div>

<div style="clear: both;"></div>