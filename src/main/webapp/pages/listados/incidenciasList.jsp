<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<s:set var="titulo" value="cabecera.listado.incidencias" />
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
		$('#j_idt46 input[type="text"]').each(function(index){
			$(this).attr('value', '');
		});
	}
	
	function filtra(pagina){
		var datos = {};
		$('#j_idt46 input').each(function(index){
			var name = $(this).attr('name');
			if(name== 'j_idt46:j_idt49'){
				datos.nombre_usuario=$(this).attr('value');
			}else if(name== 'j_idt46:j_idt58'){
				datos.nombre=$(this).attr('value');
			}else if(name== 'j_idt46:j_idt70_input'){
				datos.fecha1=$(this).attr('value');
			}else if(name== 'j_idt46:j_idt71_input'){
				datos.fecha2=$(this).attr('value');
			}else if(name== 'j_idt46:j_idt60'){
				datos.apellido1=$(this).attr('value');
			}else if(name== 'j_idt46:j_idt62'){
				datos.apellido2=$(this).attr('value');
			}else{
				datos[name]=$(this).attr('value');
			}
		});
		
		if(pagina){
			datos.page = pagina;
		}
		
		$('#j_idt46 select').each(function(index){
			var name = $(this).attr('name');
			if(name== 'j_idt46:j_idt51_input'){
				datos.estado=$(this).attr('value');
			}
		});
		
		$.post('lista_incidencias', datos, function(data){
			//alert(data.listado.length);
			//Modificamos el número total de resultados
			$('#j_idt46 thead tr th.ui-datatable-header').html('Listado de incidencias ('+ data.records +')');
			$('#j_idt46 thead tr th span.ui-paginator-pages').html('');
			$('#j_idt46 tfoot tr td span.ui-paginator-pages').html('');
			$(data.paginas).each(function(index){
				if(data.page == this){
					$('<span class="ui-paginator-page ui-state-default ui-corner-all ui-state-active" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt46 thead tr th span.ui-paginator-pages'));
					$('<span class="ui-paginator-page ui-state-default ui-corner-all ui-state-active" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt46 tfoot tr td span.ui-paginator-pages'));
				}else{
					$('<span class="ui-paginator-page ui-state-default ui-corner-all" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt46 thead tr th span.ui-paginator-pages'));
					$('<span class="ui-paginator-page ui-state-default ui-corner-all" onclick="filtra('+this+');">' + this + '</span>').appendTo($('#j_idt46 tfoot tr td span.ui-paginator-pages'));
				}
			});
			if(data.paginas.length > 0 && data.page != 1){
				$('#j_idt46 thead tr th span.ui-paginator-first').removeClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-first').unbind( "click" );
				$('#j_idt46 thead tr th span.ui-paginator-first').click(function(){
					filtra(1);
				});
				$('#j_idt46 thead tr th span.ui-paginator-prev').removeClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-prev').unbind( "click" );
				$('#j_idt46 thead tr th span.ui-paginator-prev').click(function(){
					filtra(data.page-1);
				});
				
				$('#j_idt46 tfoot tr td span.ui-paginator-first').removeClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-first').unbind( "click" );
				$('#j_idt46 tfoot tr td span.ui-paginator-first').click(function(){
					filtra(1);
				});
				$('#j_idt46 tfoot tr td span.ui-paginator-prev').removeClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-prev').unbind( "click" );
				$('#j_idt46 tfoot tr td span.ui-paginator-prev').click(function(){
					filtra(data.page-1);
				});
			}else{
				$('#j_idt46 thead tr th span.ui-paginator-first').addClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-first').unbind( "click" );
				$('#j_idt46 thead tr th span.ui-paginator-prev').addClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-prev').unbind( "click" );
				
				$('#j_idt46 tfoot tr td span.ui-paginator-first').addClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-first').unbind( "click" );
				$('#j_idt46 tfoot tr td span.ui-paginator-prev').addClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-prev').unbind( "click" );
			}
			if(data.paginas.length > 0 && data.page != Math.round(data.records/data.rows)){
				$('#j_idt46 thead tr th span.ui-paginator-next').removeClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-next').unbind( "click" );
				$('#j_idt46 thead tr th span.ui-paginator-next').click(function(){
					filtra(data.page+1);
				});
				$('#j_idt46 thead tr th span.ui-paginator-last').removeClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-last').unbind( "click" );
				$('#j_idt46 thead tr th span.ui-paginator-last').click(function(){
					filtra(Math.round(data.records/data.rows));
				});
				
				$('#j_idt46 tfoot tr td span.ui-paginator-next').removeClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-next').unbind( "click" );
				$('#j_idt46 tfoot tr td span.ui-paginator-next').click(function(){
					filtra(data.page+1);
				});
				$('#j_idt46 tfoot tr td span.ui-paginator-last').removeClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-last').unbind( "click" );
				$('#j_idt46 tfoot tr td span.ui-paginator-last').click(function(){
					filtra(Math.round(data.records/data.rows));
				});
			}else{
				$('#j_idt46 thead tr th span.ui-paginator-next').addClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-next').unbind( "click" );
				$('#j_idt46 thead tr th span.ui-paginator-last').addClass('ui-state-disabled');
				$('#j_idt46 thead tr th span.ui-paginator-last').unbind( "click" );
				
				$('#j_idt46 tfoot tr td span.ui-paginator-next').addClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-next').unbind( "click" );
				$('#j_idt46 tfoot tr td span.ui-paginator-last').addClass('ui-state-disabled');
				$('#j_idt46 tfoot tr td span.ui-paginator-last').unbind( "click" );
			}
			$($('#j_idt46 tbody')[1]).html('');
			$(data.listado).each(function(index){
				
				var descEstado;
				if(this.estado == 'P'){
					descEstado = 'Pendiente';
				}else{
					if(this.estado == 'C'){
						descEstado = 'Cerrada';
					}	
				}
				var clase = 'ui-datatable-even';
				if(index%2 == 0){
					clase = 'ui-datatable-odd';
				}
	
				$('<tr data-ri="0" class="ui-widget-content ' + clase+ '">' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[0]).attr('style')+'">' + descEstado + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[1]).attr('style')+'">' + this.origen + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[2]).attr('style')+'">' + this.FFechaNacimientoString + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[3]).attr('style')+'">' + this.FFechaAltaString + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[4]).attr('style')+'">' + this.nombreUsuario + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[5]).attr('style')+'">' + this.nombre + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[6]).attr('style')+'">' + this.apellido1 + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[7]).attr('style')+'">' + this.apellido2 + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[8]).attr('style')+'">' + this.sigla + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[9]).attr('style')+'">' + this.domicilio + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[10]).attr('style')+'">' + this.localidad + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[11]).attr('style')+'">' + this.provincia + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[12]).attr('style')+'">' + this.telefono + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[13]).attr('style')+'">' + this.email + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[14]).attr('style')+'">' + this.nombreTutor + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[15]).attr('style')+'">' + this.emailTutor + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[16]).attr('style')+'">' + this.dniTutor + '</div></td>' +
				'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[17]).attr('style')+'">' + this.comentarioSocio + '</div></td>' +
				'<td style="text-align:center">'+
				'<div class="ui-dt-c"><button id="j_idt46:tabla:0:j_idt107" '+
					'name="accion" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left" '+
					'type="button" onClick="cierra('+this.id+');" value="cerrar">'+
					'<span class="ui-button-icon-left ui-icon ui-icon ui-icon-search"></span>'+
					'<span class="ui-button-text">Cerrar</span></button></div></td></tr>').appendTo($('#j_idt46 tbody')[1]);
				
			});
		});
	}
	
	function cierra(id){
		if(confirm('Confirma para cerrar')){
			//window.location.href = 'incidencia?id='+id;
			$.post('cerrarIncidencia', {id:id, accion:"cerrar"}, function(data){
				filtra();
			});
		}
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

<div id="seccion">
	<s:text name="cabecera.listado.incidencias.seccion"></s:text>
</div>
<div style="clear: both;"></div>

<form id="j_idt46" name="j_idt46" method="post"
	action=""
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt46" value="j_idt46" />
	<input type="hidden" name="rows" value="25" />
	<input type="hidden" name="page" value="1" />
	<div id="j_idt46:filtro"
		class="ui-panel ui-widget ui-widget-content ui-corner-all"
		style="margin-bottom: 10px;">
		<div id="j_idt46:filtro_header"
			class="ui-panel-titlebar ui-widget-header ui-corner-all">
			<span class="ui-panel-title">Filtro</span><a
				href="javascript:void(0)"
				class="ui-panel-titlebar-icon ui-corner-all ui-state-default"><span
				id="j_idt46:filtro_toggler" class="ui-icon ui-icon-minusthick"></span></a>
		</div>
		<div id="j_idt46:filtro_content"
			class="ui-panel-content ui-widget-content">
			<table width="100%">
				<tbody>
					<tr>
						<td><label> Nombre de usuario</label></td>
						<td><input id="j_idt46:j_idt49" name="j_idt46:j_idt49"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt49_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt49', {
										id : 'j_idt46:j_idt49'
									});
						</script></td>
						<td><label> Estado</label></td>
						<td><div id="j_idt46:j_idt51"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix" style="width: 100px;">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt46:j_idt51_input" name="j_idt46:j_idt51_input"><option
											value="P">Pendiente</option>
										<option value="C">Cerrada</option>
										<option value="" selected="selected">[Cualquiera]</option></select>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right style="border-top: 0;border-right: 0;"">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt46:j_idt51_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Pendiente</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Cerrada</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">[Cualquiera]</li>
									</ul>
								</div>
							</div>
							<script id="j_idt46:j_idt51_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt46_j_idt51', {
												id : 'j_idt46:j_idt51',
												effect : 'blind'
											});
								});
							</script></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label> Nombre</label></td>
						<td><input id="j_idt46:j_idt58" name="j_idt46:j_idt58"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt58_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt58', {
										id : 'j_idt46:j_idt58'
									});
						</script></td>
						<td><label> Apellido 1</label></td>
						<td><input id="j_idt46:j_idt60" name="j_idt46:j_idt60"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt60_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt60', {
										id : 'j_idt46:j_idt60'
									});
						</script></td>
						<td><label> Apellido 2</label></td>
						<td><input id="j_idt46:j_idt62" name="j_idt46:j_idt62"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt62_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt62', {
										id : 'j_idt46:j_idt62'
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
						<td><label> Fecha Alta</label></td>
						<td><span id="j_idt46:j_idt70"><input
								id="j_idt46:j_idt70_input" name="j_idt46:j_idt70_input"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt70_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt70', {
											id : 'j_idt46:j_idt70',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><span id="j_idt46:j_idt71"><input
								id="j_idt46:j_idt71_input" name="j_idt46:j_idt71_input"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt71_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt71', {
											id : 'j_idt46:j_idt71',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
					</tr>
				</tbody>
			</table>
			<button id="j_idt46:j_idt72" name="j_idt46:j_idt72"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
				onclick="filtra();return false;"
				type="submit">
				<span class="ui-button-text">Aceptar</span>
			</button>
			<script id="j_idt46:j_idt72_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt72', {
					id : 'j_idt46:j_idt72'
				});
			</script>
			<button id="j_idt46:j_idt73" name="j_idt46:j_idt73"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
				onclick="limpiaFormulario();return false;"
				type="submit">
				<span class="ui-button-text">Limpiar</span>
			</button>
			<script id="j_idt46:j_idt73_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt73', {
					id : 'j_idt46:j_idt73'
				});
			</script>
		</div>
		<input type="hidden" id="j_idt46:filtro_collapsed"
			name="j_idt46:filtro_collapsed" value="false" />
	</div>
	<script id="j_idt46:filtro_s" type="text/javascript">
		PrimeFaces.cw('Panel', 'widget_j_idt46_filtro', {
			id : 'j_idt46:filtro',
			toggleable : true,
			toggleSpeed : 500,
			collapsed : false
		});
	</script>
	<div id="j_idt46:messages" class="ui-messages ui-widget"></div>
	<div id="j_idt46:tabla"
		class="ui-datatable ui-widget ui-datatable-scrollable ui-datatable-resizable">
		<div class="ui-widget-header ui-datatable-scrollable-header">
			<div class="ui-datatable-scrollable-header-box">
				<table>
					<thead>
						<tr>
							<th class="ui-datatable-header ui-widget-header" colspan="20">Listado
								de incidencias (0)</th>
						</tr>
						<tr>
							<th id="j_idt46:tabla_paginator_top"
								class="ui-paginator ui-paginator-top ui-widget-header"
								colspan="20"><span
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
							<th id="j_idt46:tabla:j_idt75"
								class="ui-state-default ui-resizable-column" title="Estado"><div
									class="ui-dt-c">
									<span>ESTADO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt78"
								class="ui-state-default ui-resizable-column" title="Origen"><div
									class="ui-dt-c">
									<span>ORIGEN</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt81"
								class="ui-state-default ui-resizable-column" title="Fecha de nacimiento"><div
									class="ui-dt-c">
									<span>F. NACIMIENTO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt84"
								class="ui-state-default ui-resizable-column" title="Fecha de alta"><div
									class="ui-dt-c">
									<span>F. ALTA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt87"
								class="ui-state-default ui-resizable-column" title="Nombre de usuario"><div
									class="ui-dt-c">
									<span>NOMB. USUARIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt90"
								class="ui-state-default ui-resizable-column" title="Nombre"><div
									class="ui-dt-c">
									<span>NOMBRE</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt93"
								class="ui-state-default ui-resizable-column" title="Primer apellido"><div
									class="ui-dt-c">
									<span>APELLIDO 1</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt96"
								class="ui-state-default ui-resizable-column" title="Segundo apellido"><div
									class="ui-dt-c">
									<span>APELLIDO 2</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt99"
								class="ui-state-default ui-resizable-column" title="Sigla"><div
									class="ui-dt-c">
									<span>SIGLA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt102"
								class="ui-state-default ui-resizable-column" title="Domicilio"><div
									class="ui-dt-c">
									<span>DOMICILIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt105"
								class="ui-state-default ui-resizable-column" title="Localidad"><div
									class="ui-dt-c">
									<span>LOCALIDAD</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt108"
								class="ui-state-default ui-resizable-column" title="Provincia"><div
									class="ui-dt-c">
									<span>PROVINCIA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt114"
								class="ui-state-default ui-resizable-column" title="Tel&eacute;fono"><div
									class="ui-dt-c">
									<span>TLF</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt117"
								class="ui-state-default ui-resizable-column" title="Email"><div
									class="ui-dt-c">
									<span>EMAIL</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt120"
								class="ui-state-default ui-resizable-column" title="Nombre del tutor"><div
									class="ui-dt-c">
									<span>NOMBRE TUTOR</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt123"
								class="ui-state-default ui-resizable-column" title="Email del tutor"><div
									class="ui-dt-c">
									<span>EMAIL TUTOR</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt126"
								class="ui-state-default ui-resizable-column" title="DNI del tutor"><div
									class="ui-dt-c">
									<span>DNI TUTOR</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt129"
								class="ui-state-default ui-resizable-column" title="Comentario"><div
									class="ui-dt-c">
									<span>COMENTARIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt132"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>OPCIONES</span>
								</div></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="ui-datatable-scrollable-body">
			<table style="width: 100%">
				<tbody id="j_idt46:tabla_data" class="ui-datatable-data-empty">
					<tr class="ui-widget-content">
						<td colspan="20"><div class="ui-dt-c">Ningún registro</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="ui-widget-header ui-datatable-scrollable-footer">
			<div class="ui-datatable-scrollable-footer-box">
				<table style="width: 100%">
					<tfoot>
						<tr>
							<td id="j_idt46:tabla_paginator_bottom"
								class="ui-paginator ui-paginator-bottom ui-widget-header"
								colspan="20"><span
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
				</table>
			</div>
		</div>
	</div>
	<!-- 	Formateo de tabla -->
	<script id="j_idt46:tabla_s" type="text/javascript">
		$(function() {
			PrimeFaces.cw('DataTable','widget_j_idt46_tabla',
				{id:'j_idt46:tabla',
				paginator:{id:['j_idt46:tabla_paginator_top','j_idt46:tabla_paginator_bottom'],
					rows:10,
					rowCount:0,
					page:0,
					currentPageTemplate:'({currentPage} of {totalPage})'
				},
				scrollable:true,
				liveScroll:false,
				scrollStep:0,
				scrollLimit:0,
				resizableColumns:true
				});
			});
	</script>
	<button id="j_idt46:j_idt134" name="j_idt46:j_idt134"
		class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
		onclick="alert('Por implementar');"
		type="button">
		<span class="ui-button-icon-left ui-icon ui-icon ui-icon-calculator"></span><span
			class="ui-button-text">Exportar excel</span>
	</button>
	<script id="j_idt46:j_idt134_s" type="text/javascript">PrimeFaces.cw('CommandButton','widget_j_idt46_j_idt134',{id:'j_idt46:j_idt134'});</script>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="-4872282813965625408:2676459715509296954" autocomplete="off" />
</form>