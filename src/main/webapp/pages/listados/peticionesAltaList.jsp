<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<s:set var="titulo" value="cabecera.listado.peticiones_alta" />
<s:set var="contenido" />

<script type="text/javascript">
	PrimeFaces.locales['es'] = {
		closeText : 'Cerrar',
		prevText : 'Anterior',
		nextText : 'Siguiente',
		currentText : 'Inicio',
		monthNames : [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
				'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre',
				'Diciembre' ],
		monthNamesShort : [ 'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul',
				'Ago', 'Sep', 'Oct', 'Nov', 'Dic' ],
		dayNames : [ 'Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves',
				'Viernes', 'Sábado' ],
		dayNamesShort : [ 'Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab' ],
		dayNamesMin : [ 'D', 'L', 'M', 'X', 'J', 'V', 'S' ],
		weekHeader : 'Semana',
		firstDay : 1,
		isRTL : false,
		showMonthAfterYear : false,
		yearSuffix : '',
		timeOnlyTitle : 'Sólo hora',
		timeText : 'Tempo',
		hourText : 'Hora',
		minuteText : 'Minuto',
		secondText : 'Segundo',
		currentText : 'Fecha actual',
		ampm : false,
		month : 'Mes',
		week : 'Semana',
		day : 'Día',
		allDayText : 'Todo el día'
	};
	
	function limpiaFormulario(){
		$('#j_idt52 input[type="text"]').each(function(index){
			$(this).attr('value', '');
		});
	}
	
	function filtra(pagina){
		var datos = {};
		$('#j_idt52 input').each(function(index){
			var name = $(this).attr('name');
			if(name== 'j_idt52:j_idt55'){
				datos.nombre_usuario=$(this).attr('value');
			}else if(name== 'j_idt52:j_idt65'){
				datos.nombre=$(this).attr('value');
			}else if(name== 'j_idt52:j_idt77_input'){
				datos.fecha1=$(this).attr('value');
			}else if(name== 'j_idt52:j_idt78_input'){
				datos.fecha2=$(this).attr('value');
			}else if(name== 'j_idt52:j_idt67'){
				datos.apellido1=$(this).attr('value');
			}else if(name== 'j_idt52:j_idt69'){
				datos.apellido2=$(this).attr('value');
			}else{
				datos[name]=$(this).attr('value');
			}
		});
		
		if(pagina){
			datos.page = pagina;
		}
		
		$('#j_idt52 select').each(function(index){
			var name = $(this).attr('name');
			if(name== 'j_idt52:j_idt57_input'){
				datos.estado=$(this).attr('value');
			}
		});
		
		$.post('lista_peticiones_alta', datos, function(data){
			//alert(data.listado.length);
			//Modificamos el número total de resultados
			$('#j_idt52 thead tr th.ui-datatable-header').html('Peticiones de alta ('+ data.records +')');
			$('#j_idt52 thead tr th span.ui-paginator-pages').html('');
			$('#j_idt52 tfoot tr td span.ui-paginator-pages').html('');
			$(data.paginas).each(function(index){
				if(data.page == this){
					$('<span class="ui-paginator-page ui-state-default ui-corner-all ui-state-active" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt52 thead tr th span.ui-paginator-pages'));
					$('<span class="ui-paginator-page ui-state-default ui-corner-all ui-state-active" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt52 tfoot tr td span.ui-paginator-pages'));
				}else{
					$('<span class="ui-paginator-page ui-state-default ui-corner-all" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt52 thead tr th span.ui-paginator-pages'));
					$('<span class="ui-paginator-page ui-state-default ui-corner-all" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt52 tfoot tr td span.ui-paginator-pages'));
				}
			});
			if(data.paginas.length > 0 && data.page != 1){
				$('#j_idt52 thead tr th span.ui-paginator-first').removeClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-first').unbind( "click" );
				$('#j_idt52 thead tr th span.ui-paginator-first').click(function(){
					filtra(1);
				});
				$('#j_idt52 thead tr th span.ui-paginator-prev').removeClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-prev').unbind( "click" );
				$('#j_idt52 thead tr th span.ui-paginator-prev').click(function(){
					filtra(data.page-1);
				});
				
				$('#j_idt52 tfoot tr td span.ui-paginator-first').removeClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-first').unbind( "click" );
				$('#j_idt52 tfoot tr td span.ui-paginator-first').click(function(){
					filtra(1);
				});
				$('#j_idt52 tfoot tr td span.ui-paginator-prev').removeClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-prev').unbind( "click" );
				$('#j_idt52 tfoot tr td span.ui-paginator-prev').click(function(){
					filtra(data.page-1);
				});
			}else{
				$('#j_idt52 thead tr th span.ui-paginator-first').addClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-first').unbind( "click" );
				$('#j_idt52 thead tr th span.ui-paginator-prev').addClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-prev').unbind( "click" );
				
				$('#j_idt52 tfoot tr td span.ui-paginator-first').addClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-first').unbind( "click" );
				$('#j_idt52 tfoot tr td span.ui-paginator-prev').addClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-prev').unbind( "click" );
			}
			if(data.paginas.length > 0 && data.page != Math.round(data.records/data.rows)){
				$('#j_idt52 thead tr th span.ui-paginator-next').removeClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-next').unbind( "click" );
				$('#j_idt52 thead tr th span.ui-paginator-next').click(function(){
					filtra(data.page+1);
				});
				$('#j_idt52 thead tr th span.ui-paginator-last').removeClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-last').unbind( "click" );
				$('#j_idt52 thead tr th span.ui-paginator-last').click(function(){
					filtra(Math.round(data.records/data.rows));
				});
				
				$('#j_idt52 tfoot tr td span.ui-paginator-next').removeClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-next').unbind( "click" );
				$('#j_idt52 tfoot tr td span.ui-paginator-next').click(function(){
					filtra(data.page+1);
				});
				$('#j_idt52 tfoot tr td span.ui-paginator-last').removeClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-last').unbind( "click" );
				$('#j_idt52 tfoot tr td span.ui-paginator-last').click(function(){
					filtra(Math.round(data.records/data.rows));
				});
			}else{
				$('#j_idt52 thead tr th span.ui-paginator-next').addClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-next').unbind( "click" );
				$('#j_idt52 thead tr th span.ui-paginator-last').addClass('ui-state-disabled');
				$('#j_idt52 thead tr th span.ui-paginator-last').unbind( "click" );
				
				$('#j_idt52 tfoot tr td span.ui-paginator-next').addClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-next').unbind( "click" );
				$('#j_idt52 tfoot tr td span.ui-paginator-last').addClass('ui-state-disabled');
				$('#j_idt52 tfoot tr td span.ui-paginator-last').unbind( "click" );
			}
			$($('#j_idt52 tbody')[1]).html('');
			$(data.listado).each(function(index){
				var estado;
				if(this.codEstado == 'P'){
					estado = 'Pendiente';
				}
				var clase = 'ui-datatable-even';
				if(index%2 == 0){
					clase = 'ui-datatable-odd';
				}
				$('<tr data-ri="0" class="ui-widget-content ' + clase+'"><td style="text-align:center;"><div class="ui-dt-c">' + this.id 
				+'</div></td><td style="text-align:center;"><div class="ui-dt-c">' + estado + 
				'</div></td><td style="text-align:center;"><div class="ui-dt-c">' + this.FEntradaString +
				'</div></td><td><div class="ui-dt-c">' + this.nombreUsuario + 
				'</div></td><td><div class="ui-dt-c">' + this.apellido1 + 
				'</div></td><td><div class="ui-dt-c">' + this.apellido2 +
				'</div></td><td><div class="ui-dt-c">' + this.nombre +
				'</div></td><td style="text-align:center;"><div class="ui-dt-c">' + this.solicitaCarnet + 
				'</div></td><td style="text-align:center"><div class="ui-dt-c"><button id="j_idt52:tabla:0:j_idt107" name="j_idt52:tabla:0:j_idt107" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left" type="submit" onClick="ver('+this.id+'); return false;"><span class="ui-button-icon-left ui-icon ui-icon ui-icon-search"></span><span class="ui-button-text">Ver detalle</span></button></div></td></tr>').appendTo($('#j_idt52 tbody')[1]);
				
			});
		});
	}
	
	function ver(id){
		window.location.href = 'peticion_alta?id='+id;
		return false;
	}
	
</script>

<div id="ajaxStatus">
	<div id="ajaxStatus_start" style="display:none">
		<img id="j_idt41" src="images/ajax-loader.gif" alt="" />
	</div>
	<div id="ajaxStatus_complete" style="display:none"></div>
</div>
<script id="ajaxStatus_s" type="text/javascript">
	PrimeFaces.cw('AjaxStatus','widget_ajaxStatus',{id:'ajaxStatus'});
	widget_ajaxStatus.bindFacet('ajaxStart', 'start');
	widget_ajaxStatus.bindFacet('ajaxComplete', 'complete');
</script>

<div id="seccion" style="margin-top: 25px;">
	<s:text name="cabecera.listado.peticiones_alta"></s:text>
</div>
<div style="clear: both;"></div>
<sec:authorize access="hasRole('gestor')">
	<form id="j_idt46" name="j_idt46" method="post"
		action="peticion_alta_siguiente"
		enctype="application/x-www-form-urlencoded">
		<input type="hidden" name="j_idt46" value="j_idt46" />
		<button id="j_idt46:j_idt47" name="j_idt46:j_idt47"
			class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
			type="submit">
			<span
				class="ui-button-icon-left ui-icon ui-icon ui-icon-arrowthick-1-e"></span><span
				class="ui-button-text">Ir a siguiente</span>
		</button>
		<script id="j_idt46:j_idt47_s" type="text/javascript">
			PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt47', {
				id : 'j_idt46:j_idt47'
			});
		</script>
		<div id="j_idt46:j_idt48" class="ui-messages ui-widget"></div>
		<input type="hidden" name="javax.faces.ViewState"
			id="javax.faces.ViewState"
			value="2059402716268548927:-1275722448995066392" autocomplete="off" />
	</form>
</sec:authorize>
<form id="j_idt49" name="j_idt49" method="post"
	action="/comercialwebWeb/peticiones_alta.jsf"
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt49" value="j_idt49" />
	<div id="j_idt49:j_idt51" class="ui-messages ui-widget"></div>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="2059402716268548927:-1275722448995066392" autocomplete="off" />
</form>
<form id="j_idt52" name="j_idt52" method="post"
	action="/comercialwebWeb/peticiones_alta.jsf"
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt52" value="j_idt52" />
	<input type="hidden" name="rows" value="25" />
	<input type="hidden" name="page" value="1" />
	<div id="j_idt52:filtro"
		class="ui-panel ui-widget ui-widget-content ui-corner-all"
		style="margin-bottom: 10px;">
		<div id="j_idt52:filtro_header"
			class="ui-panel-titlebar ui-widget-header ui-corner-all">
			<span class="ui-panel-title">Filtro</span><a
				href="javascript:void(0)"
				class="ui-panel-titlebar-icon ui-corner-all ui-state-default"><span
				id="j_idt52:filtro_toggler" class="ui-icon ui-icon-minusthick"></span></a>
		</div>
		<div id="j_idt52:filtro_content"
			class="ui-panel-content ui-widget-content">
			<table width="100%">
				<tbody>
					<tr>
						<td><label> Nombre usuario</label></td>
						<td><input id="j_idt52:j_idt55" name="j_idt52:j_idt55"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt52:j_idt55_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt52_j_idt55', {
										id : 'j_idt52:j_idt55'
									});
						</script></td>
						<td><label> Estado</label></td>
						<td><div id="j_idt52:j_idt57"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt52:j_idt57_input" name="j_idt52:j_idt57_input"><option
											value="P" selected="selected">Pendientes</option>
										<option value="I">Pte. Incidencia</option></select>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right" style="border-top: 0;border-right: 0;">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt52:j_idt57_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Pendientes</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Pte.
											Incidencia</li>
									</ul>
								</div>
							</div>
							<script id="j_idt52:j_idt57_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt52_j_idt57', {
												id : 'j_idt52:j_idt57',
												effect : 'blind'
											});
								});
							</script></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label> Nombre</label></td>
						<td><input id="j_idt52:j_idt65" name="j_idt52:j_idt65"
							type="text" value=""
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt52:j_idt65_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt52_j_idt65', {
										id : 'j_idt52:j_idt65'
									});
						</script></td>
						<td><label> Apellido 1</label></td>
						<td><input id="j_idt52:j_idt67" name="j_idt52:j_idt67"
							type="text" value=""
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt52:j_idt67_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt52_j_idt67', {
										id : 'j_idt52:j_idt67'
									});
						</script></td>
						<td><label> Apellido 2</label></td>
						<td><input id="j_idt52:j_idt69" name="j_idt52:j_idt69"
							type="text" value=""
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt52:j_idt69_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt52_j_idt69', {
										id : 'j_idt52:j_idt69'
									});
						</script></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="label_secundaria"> Desde</label></td>
						<td><label class="label_secundaria"> Hasta</label></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label> Fecha Entrada</label></td>
						<td><span id="j_idt52:j_idt77"><input
								id="j_idt52:j_idt77_input" name="j_idt52:j_idt77_input"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt52:j_idt77_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt52_j_idt77', {
											id : 'j_idt52:j_idt77',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y',
											changeMonth : true,
											changeYear : true
										});
							});
						</script></td>
						<td><span id="j_idt52:j_idt78"><input
								id="j_idt52:j_idt78_input" name="j_idt52:j_idt78_input"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt52:j_idt78_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt52_j_idt78', {
											id : 'j_idt52:j_idt78',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y',
											changeMonth : true,
											changeYear : true
										});
							});
						</script></td>
					</tr>
				</tbody>
			</table>
			<button id="j_idt52:j_idt79" name="j_idt52:j_idt79"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
				onclick="filtra();return false;"
				type="submit">
				<span class="ui-button-text">Aceptar</span>
			</button>
			<script id="j_idt52:j_idt79_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt52_j_idt79', {
					id : 'j_idt52:j_idt79'
				});
			</script>
			<button id="j_idt52:j_idt80" name="j_idt52:j_idt80"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
				onclick="limpiaFormulario();return false;"
				type="submit">
				<span class="ui-button-text">Limpiar</span>
			</button>
			<script id="j_idt52:j_idt80_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt52_j_idt80', {
					id : 'j_idt52:j_idt80'
				});
			</script>
		</div>
		<input type="hidden" id="j_idt52:filtro_collapsed"
			name="j_idt52:filtro_collapsed" value="false" />
	</div>
	<script id="j_idt52:filtro_s" type="text/javascript">
		PrimeFaces.cw('Panel', 'widget_j_idt52_filtro', {
			id : 'j_idt52:filtro',
			toggleable : true,
			toggleSpeed : 500,
			collapsed : false
		});
	</script>
	<div id="j_idt52:messages" class="ui-messages ui-widget"></div>
	<div id="j_idt52:tabla" class="ui-datatable ui-widget">
		<table>
			<thead>
				<tr>
					<th class="ui-datatable-header ui-widget-header" colspan="9">Peticiones
						de alta (0)</th>
				</tr>
				<tr>
					<th id="j_idt52:tabla_paginator_top"
						class="ui-paginator ui-paginator-top ui-widget-header" colspan="9"><span
						class="ui-paginator-first ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-first">p</span></span><span
						class="ui-paginator-prev ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-prev">p</span></span><span
						class="ui-paginator-pages"></span><span
						class="ui-paginator-next ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-next">p</span></span><span
						class="ui-paginator-last ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-end">p</span></span></th>
				</tr>
				<tr>
					<th id="j_idt52:tabla:j_idt82" class="ui-state-default"
						style="text-align: center;"><div class="ui-dt-c">
							<span>ID PETICION</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt85" class="ui-state-default"
						style="text-align: center;"><div class="ui-dt-c">
							<span>ESTADO</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt88" class="ui-state-default"
						style="text-align: center;"><div class="ui-dt-c">
							<span>ENTRADA</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt91" class="ui-state-default"><div
							class="ui-dt-c">
							<span>NOMBRE USUARIO</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt94" class="ui-state-default"><div
							class="ui-dt-c">
							<span>APELLIDO 1</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt97" class="ui-state-default"><div
							class="ui-dt-c">
							<span>APELLIDO 2</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt100" class="ui-state-default"><div
							class="ui-dt-c">
							<span>NOMBRE</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt103" class="ui-state-default"
						style="text-align: center;"><div class="ui-dt-c">
							<span>SOLICITA CARNET</span>
						</div></th>
					<th id="j_idt52:tabla:j_idt106" class="ui-state-default"
						style="text-align: center"><div class="ui-dt-c">
							<span>OPCIONES</span>
						</div></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td id="j_idt52:tabla_paginator_bottom"
						class="ui-paginator ui-paginator-bottom ui-widget-header"
						colspan="9"><span
						class="ui-paginator-first ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-first">p</span></span><span
						class="ui-paginator-prev ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-prev">p</span></span><span
						class="ui-paginator-pages"></span><span
						class="ui-paginator-next ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-next">p</span></span><span
						class="ui-paginator-last ui-state-default ui-corner-all ui-state-disabled"><span
							class="ui-icon ui-icon-seek-end">p</span></span></td>
				</tr>
			</tfoot>
			<tbody id="j_idt52:tabla_data" class="ui-datatable-data-empty">
				
			</tbody>
		</table>
	</div>
	<script id="j_idt52:tabla_s" type="text/javascript">
		$(function() {
			PrimeFaces.cw('DataTable', 'widget_j_idt52_tabla', {
				id : 'j_idt52:tabla',
				paginator : {
					id : [ 'j_idt52:tabla_paginator_top',
							'j_idt52:tabla_paginator_bottom' ],
					rows : 25,
					rowCount : 0,
					page : 0,
					currentPageTemplate : '({currentPage} of {totalPage})'
				}
			});
		});
	</script>
	<button id="j_idt52:j_idt108" name="j_idt52:j_idt108"
		class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
		type="submit" onclick="alert('Por implementar'); return false;">
		<span class="ui-button-icon-left ui-icon ui-icon ui-icon-calculator"></span><span
			class="ui-button-text">Exportar excel</span>
	</button>
	<script id="j_idt52:j_idt108_s" type="text/javascript">
		PrimeFaces.cw('CommandButton', 'widget_j_idt52_j_idt108', {
			id : 'j_idt52:j_idt108'
		});
	</script>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="2059402716268548927:-1275722448995066392" autocomplete="off" />
</form>

