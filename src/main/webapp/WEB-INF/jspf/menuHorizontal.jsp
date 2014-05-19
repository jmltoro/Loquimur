<%@ page
	import="org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint"%> 
<%@ page
	import="org.springframework.security.core.AuthenticationException"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div id="j_idt17:j_idt18" class="ui-menu ui-menubar ui-widget ui-widget-content ui-corner-all ui-helper-clearfix">
	<sec:authorize access="isAuthenticated()">
		
	<ul class="ui-menu-list ui-helper-reset">
		<li class="ui-menuitem ui-widget ui-corner-all">
			<a href="cuadro_mandos" class="ui-menuitem-link ui-corner-all">
				<span class="ui-menuitem-icon ui-icon ui-icon ui-icon-home"></span>
				<span class="ui-menuitem-text">Inicio</span>
			</a>
		</li>

			<li class="ui-widget ui-menuitem ui-corner-all ui-menu-parent"><a
				href="javascript:void(0)" class="ui-menuitem-link ui-corner-all"><span
					class="ui-menuitem-icon ui-icon ui-icon ui-icon-folder-collapsed"></span><span
					class="ui-menuitem-text">Peticiones</span><span
					class="ui-icon ui-icon-triangle-1-s"></span></a>
			<ul
					class="ui-widget-content ui-menu-list ui-corner-all ui-helper-clearfix ui-menu-child"
					style="z-index: 1007; left: 0px; top: 27px; display: none;">
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt21" class="ui-menuitem-link ui-corner-all"
						href="peticiones_alta"
						onclick=""><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-plusthick"></span><span
							class="ui-menuitem-text">Altas</span></a></li>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt22" class="ui-menuitem-link ui-corner-all"
						href="reexpediciones"
						onclick=""><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-arrowrefresh-1-e"></span><span
							class="ui-menuitem-text">Reexpediciones</span></a></li>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt23" class="ui-menuitem-link ui-corner-all"
						href="peticiones_modificacion"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-pencil"></span><span
							class="ui-menuitem-text">Modificaciones</span></a></li>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt24" class="ui-menuitem-link ui-corner-all"
						href="peticiones_baja"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-minusthick"></span><span
							class="ui-menuitem-text">Bajas</span></a></li>
				</ul></li>
			<li class="ui-widget ui-menuitem ui-corner-all ui-menu-parent"><a
				href="javascript:void(0)" class="ui-menuitem-link ui-corner-all"><span
					class="ui-menuitem-icon ui-icon ui-icon ui-icon-person"></span><span
					class="ui-menuitem-text">Socios</span><span
					class="ui-icon ui-icon-triangle-1-s"></span></a>
			<ul
					class="ui-widget-content ui-menu-list ui-corner-all ui-helper-clearfix ui-menu-child"
					style="z-index: 1011; left: 0px; top: 27px; display: none;">
					<sec:authorize access="hasRole('gestor')">	
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt27" class="ui-menuitem-link ui-corner-all"
						href="http://comercialweb.canalsur.es/portal/lb-elclub_nuevosocio-.html"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-plusthick"></span><span
							class="ui-menuitem-text">Alta</span></a></li>
					</sec:authorize>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt27" class="ui-menuitem-link ui-corner-all"
						href="socios"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-person"></span><span
							class="ui-menuitem-text">Listado</span></a></li>
				</ul></li>
				<sec:authorize access="hasRole('gestor')">	
			<li class="ui-widget ui-menuitem ui-corner-all ui-menu-parent"><a
				href="javascript:void(0)" class="ui-menuitem-link ui-corner-all"><span
					class="ui-menuitem-icon ui-icon ui-icon ui-icon-suitcase"></span><span
					class="ui-menuitem-text">Paquetes bienvenida</span><span
					class="ui-icon ui-icon-triangle-1-s"></span></a>
					
			<ul
					class="ui-widget-content ui-menu-list ui-corner-all ui-helper-clearfix ui-menu-child"
					style="z-index: 1011; left: 0px; top: 27px; display: none;">
					
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt27" class="ui-menuitem-link ui-corner-all"
						href="proximoLote"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-clipboard"></span><span
							class="ui-menuitem-text">Próximo lote</span></a></li>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt27" class="ui-menuitem-link ui-corner-all"
						href="lotesCerrados"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-locked"></span><span
							class="ui-menuitem-text">Lotes cerrados</span></a></li>
				</ul></li>
				</sec:authorize>
			<li class="ui-widget ui-menuitem ui-corner-all ui-menu-parent"><a
				href="javascript:void(0)" class="ui-menuitem-link ui-corner-all"><span
					class="ui-menuitem-icon ui-icon ui-icon ui-icon-alert"></span><span
					class="ui-menuitem-text">Incidencias</span><span
					class="ui-icon ui-icon-triangle-1-s"></span></a>
			<ul
					class="ui-widget-content ui-menu-list ui-corner-all ui-helper-clearfix ui-menu-child"
					style="z-index: 1009; left: 0px; top: 27px; display: none;">
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt33" class="ui-menuitem-link ui-corner-all"
						href="http://" onclick="javascript:window.location='incidencias'; return false "><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-alert"></span><span
							class="ui-menuitem-text">Listado</span></a></li>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt34" class="ui-menuitem-link ui-corner-all"
						href="http://" onclick="javascript:window.location='nuevaIncidencia'; return false "><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-plusthick"></span><span
							class="ui-menuitem-text">Nueva Incidencia</span></a></li>
				</ul></li>
			<li class="ui-widget ui-menuitem ui-corner-all ui-menu-parent"><a
				href="javascript:void(0)" class="ui-menuitem-link ui-corner-all"><span
					class="ui-menuitem-icon ui-icon ui-icon ui-icon-clipboard"></span><span
					class="ui-menuitem-text" style="color:#D6D6D6;">Informes</span><span
					class="ui-icon ui-icon-triangle-1-s"></span></a>
			<ul
					class="ui-widget-content ui-menu-list ui-corner-all ui-helper-clearfix ui-menu-child"
					style="z-index: 1010; left: 0px; top: 27px; display: none; color:#DDD6D6">
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt35" class="ui-menuitem-link ui-corner-all"
						href="javascript:alert('Por implementar');"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-image"></span><span
							class="ui-menuitem-text" style="color:#D6D6D6;">Estadísticas</span></a></li>
					<li class="ui-menuitem ui-widget ui-corner-all"><a
						id="j_idt17:j_idt36" class="ui-menuitem-link ui-corner-all"
						href="javascript:alert('Por implementar');"><span
							class="ui-menuitem-icon ui-icon ui-icon ui-icon-script"></span><span
							class="ui-menuitem-text" style="color:#D6D6D6;">Conceptos facturables</span></a></li>
				</ul></li>
			<li class="ui-menuitem ui-widget ui-corner-all"><a
				id="j_idt17:j_idt38" class="ui-menuitem-link ui-corner-all"
				href="j_spring_security_logout"><span
					class="ui-menuitem-icon ui-icon ui-icon ui-icon-circle-close"></span><span
					class="ui-menuitem-text">Salir</span></a></li>
	</ul>
	
	<script id="j_idt17:j_idt18_s" type="text/javascript">PrimeFaces.cw('Menubar','widget_j_idt17_j_idt18',{id:'j_idt17:j_idt18'});</script>
		
	</sec:authorize>
</div>
