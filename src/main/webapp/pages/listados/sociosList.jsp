<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<s:set var="titulo" value="cabecera.listado.socio" />
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

	function limpiaFormulario() {
		$('#j_idt46 input[type="text"]').each(function(index) {
			$(this).attr('value', '');
		});
	}

	function filtra(pagina) {
		var datos = {};
		$('#j_idt46 input').each(function(index) {
			var name = $(this).attr('name');
			datos[name] = $(this).attr('value');
		});

		if (pagina) {
			datos.page = pagina;
		}

		$('#j_idt46 select').each(function(index) {
			var name = $(this).attr('name');
			datos[name] = $(this).attr('value');
		});

		$
				.post(
						'lista_socios',
						datos,
						function(data) {
							if(data.listaErrores.length > 0){
								$('<div class="ui-messages-warn ui-corner-all"><span class="ui-messages-warn-icon"></span><ul><li><span class="ui-messages-warn-summary">Filtro insuficiente</span><span class="ui-messages-warn-detail">Para evitar un resultado excesivamente extenso se requiere que especifíque más filtros o profundice más en los que ya haya usado</span></li></ul></div>').appendTo($('div.ui-messages'));
							}else{
								$('div.ui-messages').html('');
							}
							//alert(data.listado.length);
							//Modificamos el número total de resultados
							$('#j_idt46 thead tr th.ui-datatable-header')
									.html(
											'Listado de socios ('
													+ data.records + ')');
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
							$($('#j_idt46 tbody')[1]).html('');
							$(data.listado)
									.each(
											function(index) {
												var clase = 'ui-datatable-even';
												if (index % 2 == 0) {
													clase = 'ui-datatable-odd';
												}
												$(
														'<tr data-ri="0" class="ui-widget-content ' + clase+'"><td style="text-align:center;"><div class="ui-dt-c">'
																+ this.numeroSocio
																+ '</div></td><td style="text-align:center;"><div class="ui-dt-c">'
																+ this.estado
																+ '</div></td><td style="text-align:center;"><div class="ui-dt-c">'
																+ this.nombreUsuario
																+ '</div></td><td><div class="ui-dt-c">'
																+ this.provincia
																+ '</div></td><td><div class="ui-dt-c">'
																+ this.nombre
																+ '</div></td><td><div class="ui-dt-c">'
																+ this.apellido1
																+ '</div></td><td><div class="ui-dt-c">'
																+ this.apellido2
																+ '</div></td><td style="text-align:center"><div class="ui-dt-c"><button id="j_idt46:tabla:0:j_idt107" name="j_idt46:tabla:0:j_idt107" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left" type="button" onClick="ver('
																+ this.numeroSocio
																+ '); return false;"><span class="ui-button-icon-left ui-icon ui-icon ui-icon-search"></span><span class="ui-button-text">Ver detalle</span></button></div></td></tr>')
														.appendTo(
																$('#j_idt46 tbody')[1]);

											});
						});
	}

	function ver(id) {
		window.location.href = 'ficha?id=' + id;
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
	<s:text name="cabecera.listado.socio"></s:text>
</div>
<div style="clear: both;"></div>
<form id="j_idt46" name="j_idt46" method="post"
	action=""
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt46" value="j_idt46" />
	
	<input type="hidden" name="page" value="1" />
	<input type="hidden" name="rows" value="25" />
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

			<p class="aclaracion">Para filtrar es necesario introducir un
				número de socio o un nombre de usuario de al menos 5 caracteres de
				longitud o bien usar al menos 5 criterios de búsqueda. Los criterios
				de texto deben tener un mínimo de 3 caracteres de logintud para que
				apliquen.</p>
			<table width="100%">
				<tbody>
					<tr>
						<td><label> Número de socio</label></td>
						<td><input id="j_idt46:j_idt50" name="numero_socio"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt50_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt50', {
										id : 'j_idt46:j_idt50'
									});
						</script></td>
						<td><label> Nombre de usuario</label></td>
						<td><input id="j_idt46:j_idt52" name="nombre_usuario"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt52_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt52', {
										id : 'j_idt46:j_idt52'
									});
						</script></td>
						<td><label> Estado</label></td>
						<td><div id="j_idt46:j_idt54"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt46:j_idt54_input" name="estado"><option
											value="A">Activos</option>
										<option value="B">Pendientes bienvenida</option>
										<option value="T">Pte. Tarjeta (Duplicado)</option>
										<option value="" selected="selected">[Cualquiera]</option></select>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right" style="border-top: 0;border-right: 0;">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt46:j_idt54_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Activos</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Pendientes
											bienvenida</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Pte.
											Tarjeta (Duplicado)</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">[Cualquiera]</li>
									</ul>
								</div>
							</div>
							<script id="j_idt46:j_idt54_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt46_j_idt54', {
												id : 'j_idt46:j_idt54',
												effect : 'blind'
											});
								});
							</script></td>
					</tr>
					<tr>
						<td><label> Sexo</label></td>
						<td><div id="j_idt46:j_idt60"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt46:j_idt60_input" name="sexo"><option
											value="V">Niño</option>
										<option value="M">Niña</option>
										<option value="" selected="selected">[Cualquiera]</option></select>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right" style="border-top: 0;border-right: 0;">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt46:j_idt60_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Niño</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Niña</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">[Cualquiera]</li>
									</ul>
								</div>
							</div>
							<script id="j_idt46:j_idt60_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt46_j_idt60', {
												id : 'j_idt46:j_idt60',
												effect : 'blind'
											});
								});
							</script></td>
						<td><label> Nombre</label></td>
						<td><input id="j_idt46:j_idt65" name="nombre"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt65_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt65', {
										id : 'j_idt46:j_idt65'
									});
						</script></td>
						<td><label> Apellido 1</label></td>
						<td><input id="j_idt46:j_idt67" name="apellido1"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt67_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt67', {
										id : 'j_idt46:j_idt67'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Apellido 2</label></td>
						<td><input id="j_idt46:j_idt69" name="apellido2"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt69_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt69', {
										id : 'j_idt46:j_idt69'
									});
						</script></td>
						<td><label> Localidad</label></td>
						<td><input id="j_idt46:j_idt71" name="localidad"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt71_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt71', {
										id : 'j_idt46:j_idt71'
									});
						</script></td>
						<td><label> Provincia</label></td>
						<td><input id="j_idt46:j_idt73" name="provincia"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt73_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt73', {
										id : 'j_idt46:j_idt73'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Nombre tutor</label></td>
						<td><input id="j_idt46:j_idt75" name="nombre_tutor"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt75_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt75', {
										id : 'j_idt46:j_idt75'
									});
						</script></td>
						<td><label> Dni tutor</label></td>
						<td><input id="j_idt46:j_idt77" name="dni_tutor"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt77_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt77', {
										id : 'j_idt46:j_idt77'
									});
						</script></td>
						<td><img id="j_idt46:j_idt78"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt79"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><img id="j_idt46:j_idt80"
							src="images/dot_clear.gif" /></td>
						<td><label class="label_secundaria"> Desde</label></td>
						<td><label class="label_secundaria"> Hasta</label></td>
						<td><img id="j_idt46:j_idt83"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt84"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt85"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><label> Fecha Nacimiento</label></td>
						<td><span id="j_idt46:j_idt87"><input
								id="j_idt46:j_idt87_input" name="nacimiento1"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt87_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt87', {
											id : 'j_idt46:j_idt87',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><span id="j_idt46:j_idt88"><input
								id="j_idt46:j_idt88_input" name="nacimiento2"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt88_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt88', {
											id : 'j_idt46:j_idt88',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><img id="j_idt46:j_idt89"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt90"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt91"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><img id="j_idt46:j_idt92"
							src="images/dot_clear.gif" /></td>
						<td><label class="label_secundaria"> Desde</label></td>
						<td><label class="label_secundaria"> Hasta</label></td>
						<td><img id="j_idt46:j_idt95"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt96"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt97"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><label> Fecha Alta</label></td>
						<td><span id="j_idt46:j_idt99"><input
								id="j_idt46:j_idt99_input" name="alta1"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt99_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt99', {
											id : 'j_idt46:j_idt99',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><span id="j_idt46:j_idt100"><input
								id="j_idt46:j_idt100_input" name="alta2"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt100_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt100', {
											id : 'j_idt46:j_idt100',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><img id="j_idt46:j_idt101"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt102"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt103"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><img id="j_idt46:j_idt104"
							src="images/dot_clear.gif" /></td>
						<td><label class="label_secundaria"> Desde</label></td>
						<td><label class="label_secundaria"> Hasta</label></td>
						<td><img id="j_idt46:j_idt107"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt108"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt109"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><label> Intervalo número socio</label></td>
						<td><input id="j_idt46:j_idt111" name="intervalo_socio1"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt111_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt111', {
										id : 'j_idt46:j_idt111'
									});
						</script></td>
						<td><input id="j_idt46:j_idt112" name="intervalo_socio2"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt46:j_idt112_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt46_j_idt112', {
										id : 'j_idt46:j_idt112'
									});
						</script></td>
						<td><img id="j_idt46:j_idt113"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt114"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt115"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><img id="j_idt46:j_idt116"
							src="images/dot_clear.gif" /></td>
						<td><label class="label_secundaria"> Desde</label></td>
						<td><label class="label_secundaria"> Hasta</label></td>
						<td><img id="j_idt46:j_idt119"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt120"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt121"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><label> Fecha último envío</label></td>
						<td><span id="j_idt46:j_idt123"><input
								id="j_idt46:j_idt123_input" name="ultimo_envio1"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt123_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt123', {
											id : 'j_idt46:j_idt123',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><span id="j_idt46:j_idt124"><input
								id="j_idt46:j_idt124_input" name="ultimo_envio2"
								type="text"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt46:j_idt124_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt46_j_idt124', {
											id : 'j_idt46:j_idt124',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><img id="j_idt46:j_idt125"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt126"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt46:j_idt127"
							src="images/dot_clear.gif" /></td>
					</tr>
				</tbody>
			</table>
			<button id="j_idt46:j_idt128" name="j_idt46:j_idt128"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
				onclick="filtra();"
				type="button">
				<span class="ui-button-text">Aceptar</span>
			</button>
			<script id="j_idt46:j_idt128_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt128', {
					id : 'j_idt46:j_idt128'
				});
			</script>
			<button id="j_idt46:j_idt129" name="j_idt46:j_idt129"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
				onclick="limpiaFormulario();"
				type="button">
				<span class="ui-button-text">Limpiar</span>
			</button>
			<script id="j_idt46:j_idt129_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt129', {
					id : 'j_idt46:j_idt129'
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
	<div id="j_idt46:tabla" class="ui-datatable ui-widget">
		<table>
			<thead>
				<tr>
					<th class="ui-datatable-header ui-widget-header" colspan="8">Listado
						de socios (0)</th>
				</tr>
				<tr>
					<th id="j_idt46:tabla_paginator_top"
						class="ui-paginator ui-paginator-top ui-widget-header" colspan="8"><span
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
					<th id="j_idt46:tabla:j_idt131" class="ui-state-default"
						style="text-align: center"><div class="ui-dt-c">
							<span>NRO SOCIO</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt134" class="ui-state-default"
						style="text-align: center"><div class="ui-dt-c">
							<span>ESTADO</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt137" class="ui-state-default"
						style="text-align: left"><div class="ui-dt-c">
							<span>NOMBRE USUARIO</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt140" class="ui-state-default"
						style="text-align: left"><div class="ui-dt-c">
							<span>PROVINCIA</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt143" class="ui-state-default"
						style="text-align: left"><div class="ui-dt-c">
							<span>NOMBRE</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt146" class="ui-state-default"
						style="text-align: left"><div class="ui-dt-c">
							<span>APELLIDO 1</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt149" class="ui-state-default"
						style="text-align: left"><div class="ui-dt-c">
							<span>APELLIDO 2</span>
						</div></th>
					<th id="j_idt46:tabla:j_idt152" class="ui-state-default"
						style="text-align: center"><div class="ui-dt-c">
							<span>OPCIONES</span>
						</div></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td id="j_idt46:tabla_paginator_bottom"
						class="ui-paginator ui-paginator-bottom ui-widget-header"
						colspan="8"><span
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
			<tbody id="j_idt46:tabla_data" class="ui-datatable-data-empty">
				<tr class="ui-widget-content">
					<td colspan="8"><div class="ui-dt-c">Ningún registro</div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<script id="j_idt46:tabla_s" type="text/javascript">$(function() {PrimeFaces.cw('DataTable','widget_j_idt46_tabla',{id:'j_idt46:tabla',paginator:{id:['j_idt46:tabla_paginator_top','j_idt46:tabla_paginator_bottom'],rows:50,rowCount:0,page:0,currentPageTemplate:'({currentPage} of {totalPage})'}});});</script>
	<button id="j_idt46:j_idt154" name="j_idt46:j_idt154"
		class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
		onclick="alert('Por implementar');"
		type="button">
		<span class="ui-button-icon-left ui-icon ui-icon ui-icon-calculator"></span><span
			class="ui-button-text">Exportar excel</span>
	</button>
	<script id="j_idt46:j_idt154_s" type="text/javascript">PrimeFaces.cw('CommandButton','widget_j_idt46_j_idt154',{id:'j_idt46:j_idt154'});</script>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="-7161034117709492510:-1162364852646520907" autocomplete="off" />
</form>