<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<s:set var="titulo" value="cabecera.listado.lotecerrado" />
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

	function filtra(pagina) {
		var datos = {};
		$('#j_idt46 input').each(function(index) {
			var name = $(this).attr('name');
			datos[name] = $(this).attr('value');
		});

		if (pagina) {
			datos.page = pagina;
		}

		$
				.post(
						'filtrar_lote_fecha',
						datos,
						function(data) {
							$('#j_idt46 thead tr th.ui-datatable-header')
							.html(
									'Listado de socios ('
											+ data.records + ')');
							//Modificamos el número total de resultados
							$('#j_idt46 thead tr th span.ui-paginator-pages')
									.html('');
							$('#j_idt46 tfoot tr td span.ui-paginator-pages')
									.html('');
							$(data.paginas)
									.each(
											function(index) {
												if (data.page == this) {
													$(
															'<span class="ui-paginator-page ui-state-default ui-corner-all ui-state-active" onclick="filtra('
																	+ this
																	+ ');">'
																	+ this
																	+ '</span>')
															.appendTo(
																	$('#j_idt46 thead tr th span.ui-paginator-pages'));
													$(
															'<span class="ui-paginator-page ui-state-default ui-corner-all ui-state-active" onclick="filtra('
																	+ this
																	+ ');">'
																	+ this
																	+ '</span>')
															.appendTo(
																	$('#j_idt46 tfoot tr td span.ui-paginator-pages'));
												} else {
													$(
															'<span class="ui-paginator-page ui-state-default ui-corner-all" onclick="filtra('
																	+ this
																	+ ');">'
																	+ this
																	+ '</span>')
															.appendTo(
																	$('#j_idt46 thead tr th span.ui-paginator-pages'));
													$(
															'<span class="ui-paginator-page ui-state-default ui-corner-all" onclick="filtra('
																	+ this
																	+ ');">'
																	+ this
																	+ '</span>')
															.appendTo(
																	$('#j_idt46 tfoot tr td span.ui-paginator-pages'));
												}
											});
							if (data.paginas.length > 0 && data.page != 1) {
								$(
										'#j_idt46 thead tr th span.ui-paginator-first')
										.removeClass('ui-state-disabled');
								$(
										'#j_idt46 thead tr th span.ui-paginator-first')
										.unbind("click");
								$(
										'#j_idt46 thead tr th span.ui-paginator-first')
										.click(function() {
											filtra(1);
										});
								$('#j_idt46 thead tr th span.ui-paginator-prev')
										.removeClass('ui-state-disabled');
								$('#j_idt46 thead tr th span.ui-paginator-prev')
										.unbind("click");
								$('#j_idt46 thead tr th span.ui-paginator-prev')
										.click(function() {
											filtra(data.page - 1);
										});

								$(
										'#j_idt46 tfoot tr td span.ui-paginator-first')
										.removeClass('ui-state-disabled');
								$(
										'#j_idt46 tfoot tr td span.ui-paginator-first')
										.unbind("click");
								$(
										'#j_idt46 tfoot tr td span.ui-paginator-first')
										.click(function() {
											filtra(1);
										});
								$('#j_idt46 tfoot tr td span.ui-paginator-prev')
										.removeClass('ui-state-disabled');
								$('#j_idt46 tfoot tr td span.ui-paginator-prev')
										.unbind("click");
								$('#j_idt46 tfoot tr td span.ui-paginator-prev')
										.click(function() {
											filtra(data.page - 1);
										});
							} else {
								$(
										'#j_idt46 thead tr th span.ui-paginator-first')
										.addClass('ui-state-disabled');
								$(
										'#j_idt46 thead tr th span.ui-paginator-first')
										.unbind("click");
								$('#j_idt46 thead tr th span.ui-paginator-prev')
										.addClass('ui-state-disabled');
								$('#j_idt46 thead tr th span.ui-paginator-prev')
										.unbind("click");

								$(
										'#j_idt46 tfoot tr td span.ui-paginator-first')
										.addClass('ui-state-disabled');
								$(
										'#j_idt46 tfoot tr td span.ui-paginator-first')
										.unbind("click");
								$('#j_idt46 tfoot tr td span.ui-paginator-prev')
										.addClass('ui-state-disabled');
								$('#j_idt46 tfoot tr td span.ui-paginator-prev')
										.unbind("click");
							}
							if (data.paginas.length > 0
									&& data.page != Math.round(data.records
											/ data.rows)) {
								$('#j_idt46 thead tr th span.ui-paginator-next')
										.removeClass('ui-state-disabled');
								$('#j_idt46 thead tr th span.ui-paginator-next')
										.unbind("click");
								$('#j_idt46 thead tr th span.ui-paginator-next')
										.click(function() {
											filtra(data.page + 1);
										});
								$('#j_idt46 thead tr th span.ui-paginator-last')
										.removeClass('ui-state-disabled');
								$('#j_idt46 thead tr th span.ui-paginator-last')
										.unbind("click");
								$('#j_idt46 thead tr th span.ui-paginator-last')
										.click(
												function() {
													filtra(Math
															.round(data.records
																	/ data.rows));
												});

								$('#j_idt46 tfoot tr td span.ui-paginator-next')
										.removeClass('ui-state-disabled');
								$('#j_idt46 tfoot tr td span.ui-paginator-next')
										.unbind("click");
								$('#j_idt46 tfoot tr td span.ui-paginator-next')
										.click(function() {
											filtra(data.page + 1);
										});
								$('#j_idt46 tfoot tr td span.ui-paginator-last')
										.removeClass('ui-state-disabled');
								$('#j_idt46 tfoot tr td span.ui-paginator-last')
										.unbind("click");
								$('#j_idt46 tfoot tr td span.ui-paginator-last')
										.click(
												function() {
													filtra(Math
															.round(data.records
																	/ data.rows));
												});
							} else {
								$('#j_idt46 thead tr th span.ui-paginator-next')
										.addClass('ui-state-disabled');
								$('#j_idt46 thead tr th span.ui-paginator-next')
										.unbind("click");
								$('#j_idt46 thead tr th span.ui-paginator-last')
										.addClass('ui-state-disabled');
								$('#j_idt46 thead tr th span.ui-paginator-last')
										.unbind("click");

								$('#j_idt46 tfoot tr td span.ui-paginator-next')
										.addClass('ui-state-disabled');
								$('#j_idt46 tfoot tr td span.ui-paginator-next')
										.unbind("click");
								$('#j_idt46 tfoot tr td span.ui-paginator-last')
										.addClass('ui-state-disabled');
								$('#j_idt46 tfoot tr td span.ui-paginator-last')
										.unbind("click");
							}
							$('#j_idt46 tbody').html('');
							$(data.listado)
									.each(
											function(index) {
												var descEstado;
												if (this.estado == 'B') {
													descEstado = 'Pte. Bienvenida';
												} else {
													if (this.estado == 'A') {
														descEstado = 'Socio Activo';
													} else {
														if (this.estado == 'T') {
															descEstado = 'Pte. Tarjeta (Duplicado)';
														}
													}
												}
												var clase = 'ui-datatable-even';
												if (index % 2 == 0) {
													clase = 'ui-datatable-odd';
												}

												$(
														'<tr data-ri="0" class="ui-widget-content ' + clase+ '">'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[0])
																		.attr(
																				'style')
																+ '">'
																+ this.numeroSocio
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[1])
																		.attr(
																				'style')
																+ '">'
																+ descEstado
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[2])
																		.attr(
																				'style')
																+ '">'
																+ this.nombreUsuario
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[3])
																		.attr(
																				'style')
																+ '">'
																+ this.nombre
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[4])
																		.attr(
																				'style')
																+ '">'
																+ this.apellido1
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[5])
																		.attr(
																				'style')
																+ '">'
																+ this.apellido2
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[6])
																		.attr(
																				'style')
																+ '">'
																+ this.nombreTutor
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[7])
																		.attr(
																				'style')
																+ '">'
																+ this.domicilio
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[8])
																		.attr(
																				'style')
																+ '">'
																+ this.escalera
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[9])
																		.attr(
																				'style')
																+ '">'
																+ this.piso
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[10])
																		.attr(
																				'style')
																+ '">'
																+ this.puerta
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[11])
																		.attr(
																				'style')
																+ '">'
																+ this.localidad
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[12])
																		.attr(
																				'style')
																+ '">'
																+ this.provincia
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[13])
																		.attr(
																				'style')
																+ '">'
																+ this.cp
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[14])
																		.attr(
																				'style')
																+ '">'
																+ this.fechaCaducidadString
																+ '</div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[15])
																		.attr(
																				'style')
																+ '"><span style="color: red;">'
																+ this.loteString
																+ '</span></div></td>'
																+ '<td><div class="ui-dt-c" style="'
																+ $(
																		$('#j_idt46 table th div.ui-dt-c')[16])
																		.attr(
																				'style')
																+ '">http://admin.comercialweb.canalsur.es/comercialweb/foto_socio?id='
																+ this.numeroSocio
																+ '</div></td>'
																+ '</div></td></tr>')
														.appendTo(
																$('#j_idt46 tbody'));

											});
						});
	}
	
	function marcarEnviado(){
		if(confirm('Confirma para marcar el lote como enviado')){
			location.href = "marcarLoteEnviado?filtro_fecha=" + $('#filtro_fecha').attr('value');
		}
	}
</script>

<div id="ajaxStatus">
	<div id="ajaxStatus_start" style="display: none">
		<img id="j_idt41" src="images/ajax-loader.gif" alt="" />
	</div>
	<div id="ajaxStatus_complete" style="display: none"></div>
</div>
<script id="ajaxStatus_s" type="text/javascript">
	PrimeFaces.cw('AjaxStatus', 'widget_ajaxStatus', {
		id : 'ajaxStatus'
	});
	widget_ajaxStatus.bindFacet('ajaxStart', 'start');
	widget_ajaxStatus.bindFacet('ajaxComplete', 'complete');
</script>

<div id="seccion">
	<s:text name="cabecera.listado.lotecerrado"></s:text>
</div>
<div style="clear: both;"></div>

<form id="j_idt46" name="j_idt46" method="post"
	action="exporta_carnets"
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt46" value="j_idt46" />
	<input type="hidden" name="page" value="1" />
	<input type="hidden" name="rows" value="25" />
	<input type="hidden" name="filtro_fecha" value="" id="filtro_fecha"/>
	<div id="j_idt46:messages" class="ui-messages ui-widget"></div>
	<div id="j_idt46:fechas" class="ui-datalist ui-widget">
		<div class="ui-datalist-header ui-widget-header ui-corner-top">
			Ningún lote pendiente de marcar</div>
		<div id="j_idt46:fechas_content"
			class="ui-datalist-content ui-widget-content">
			<ul id="j_idt46:fechas_list" class="ui-datalist-data">
				<s:iterator value="fechasLote" var="fecha">
					<li class="ui-datalist-item"><button
						id="j_idt46:fechas:0:j_idt50" name="j_idt46:fechas:0:j_idt50"
						class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
						onclick="$('#filtro_fecha').attr('value','<s:date name="fecha" format="dd/MM/yyyy HH:mm:ss" />');filtra();"
						title="Consultar" type="button">
						<span class="ui-button-icon-left ui-icon ui-icon-search"></span><span
							class="ui-button-text">ui-button</span>
					</button>
					<script id="j_idt46:fechas:0:j_idt50_s" type="text/javascript">
						PrimeFaces.cw('CommandButton',
								'widget_j_idt46_fechas_0_j_idt50', {
									id : 'j_idt46:fechas:0:j_idt50'
								});
					</script><span
					style="margin-left: 10px"><s:date name="fecha" format="dd/MM/yyyy HH:mm:ss" /></span> <br /></li>
				</s:iterator>
				
			</ul>
		</div>
	</div>
	<script id="j_idt46:fechas_s" type="text/javascript">
		$(function() {
			PrimeFaces.cw('DataList', 'widget_j_idt46_fechas', {
				id : 'j_idt46:fechas'
			});
		});
	</script>

	<div style="margin-bottom: 10px; clear: both;"></div>
	<div id="j_idt46:tabla"
		class="ui-datatable ui-widget ui-datatable-scrollable ui-datatable-resizable">
		<div class="ui-widget-header ui-datatable-scrollable-header">
			<div class="ui-datatable-scrollable-header-box">
				<table>
					<thead>
						<tr>
							<th class="ui-datatable-header ui-widget-header" colspan="18">Listado
								de socios (0)</th>
						</tr>
						<tr>
							<th id="j_idt46:tabla_paginator_top"
								class="ui-paginator ui-paginator-top ui-widget-header"
								colspan="17"><span
								class="ui-paginator-first ui-state-default ui-corner-all ui-state-disabled"><span
									class="ui-icon ui-icon-seek-first">p</span></span><span
								class="ui-paginator-prev ui-state-default ui-corner-all ui-state-disabled"><span
									class="ui-icon ui-icon-seek-prev">p</span></span><span
								class="ui-paginator-pages"></span><span
								class="ui-paginator-next ui-state-default ui-corner-all"><span
									class="ui-icon ui-icon-seek-next">p</span></span><span
								class="ui-paginator-last ui-state-default ui-corner-all"><span
									class="ui-icon ui-icon-seek-end">p</span></span></th>
						</tr>
						<tr>
							<th id="j_idt46:tabla:j_idt55"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 73px;">
									<span>NRO SOCIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt58"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 53px;">
									<span>ESTADO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt61"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 119px;">
									<span>NOMBRE USUARIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt67"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 56px;">
									<span>NOMBRE</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt70"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 76px;">
									<span>APELLIDO 1</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt73"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 76px;">
									<span>APELLIDO 2</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt76"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 43px;">
									<span>TUTOR</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt79"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 68px;">
									<span>DOMICILIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt82"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 70px;">
									<span>ESCALERA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt85"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 31px;">
									<span>PISO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt88"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 52px;">
									<span>PUERTA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt91"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 74px;">
									<span>LOCALIDAD</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt94"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 71px;">
									<span>PROVINCIA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt97"
								class="ui-state-default ui-resizable-column"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 17px;">
									<span>CP</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt100"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 75px;">
									<span>CADUCIDAD</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt103"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 82px;">
									<span>FECHA LOTE</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt106"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><span
								class="ui-column-resizer ui-draggable"
								style="position: relative;">&nbsp;</span>
							<div class="ui-dt-c" style="width: 35px;">
									<span>FOTO</span>
								</div></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="ui-datatable-scrollable-body">
			<table>
				<tbody id="j_idt46:tabla_data" class="ui-datatable-data-empty">
					<tr class="ui-widget-content">
						<td colspan="20"><div class="ui-dt-c">Ningún registro</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="ui-widget-header ui-datatable-scrollable-footer">
			<div class="ui-datatable-scrollable-footer-box">
				<table>
					<tfoot>
						<tr>
							<td id="j_idt46:tabla_paginator_bottom"
								class="ui-paginator ui-paginator-bottom ui-widget-header"
								colspan="17"><span
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
			PrimeFaces.cw('DataTable', 'widget_j_idt46_tabla', {
				id : 'j_idt46:tabla',
				paginator : {
					id : [ 'j_idt46:tabla_paginator_top',
							'j_idt46:tabla_paginator_bottom' ],
					rows : 10,
					rowCount : 0,
					page : 0,
					currentPageTemplate : '({currentPage} of {totalPage})'
				},
				scrollable : true,
				liveScroll : false,
				scrollStep : 0,
				scrollLimit : 0,
				resizableColumns : true
			});
		});
	</script>
	<button id="j_idt46:j_idt112" name="accion" value="cerrarLote"
		class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
		onclick=""
		type="submit">
		<span class="ui-button-icon-left ui-icon ui-icon ui-icon-calculator"></span><span
			class="ui-button-text">Exportar excel</span>
	</button>
	<script id="j_idt46:j_idt112_s" type="text/javascript">
		PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt112', {
			id : 'j_idt46:j_idt112'
		});
	
		
	</script>
	<button id="j_idt46:j_idt113" name="accion" value="cerrarLote"
		class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
		onclick="marcarEnviado();"
		type="button">
		<span class="ui-button-icon-left ui-icon ui-icon ui-icon-check"></span><span
			class="ui-button-text">Marcar como enviado</span>
	</button>
	<script id="j_idt46:j_idt113_s" type="text/javascript">
		PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt113', {
			id : 'j_idt46:j_idt113'
		});
	
		
	</script>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="2638118797557331235:-6603911901541678237" autocomplete="off" />
</form>