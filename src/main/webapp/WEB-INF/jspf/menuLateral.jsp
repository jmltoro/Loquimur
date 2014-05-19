<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="bloque_menu">
	<ul>
		<sec:authorize access="isAuthenticated()">
			<li><span class="mn01"></span>
				<ul>
					<li><span class="mn02"><a href="mantenimientoUsuarios"><s:text
									name="menu.usuario" /></a></span></li>
					<li><span class="mn02"><a href="sensorListado"><s:text
									name="menu.sensor" /></a></span></li>
					<li><span class="mn02"><a href="lectorListado"><s:text
									name="menu.lector" /></a></span></li>
					<li><span class="mn02"><a href="parametroListado"><s:text
									name="menu.parametro" /></a></span></li>
				</ul></li>
		</sec:authorize>
	</ul>
</div>
