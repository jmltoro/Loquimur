<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<s:set var="titulo" value="cabecera.listado.lote" />
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
	
	function filtra(pagina){
		var datos = {};
		$('#j_idt46 input').each(function(index){
			var name = $(this).attr('name');
			datos[name]=$(this).attr('value');
		});
		
		if(pagina){
			datos.page = pagina;
		}
		
		$.post('listaLote', datos, function(data){
			//Modificamos el número total de resultados
			$('#j_idt46 thead tr th.ui-datatable-header').html('Listado de socios ('+ data.records +')');
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
			$('#j_idt46 tbody').html('');
			$(data.listado).each(function(index){
				var descEstado;
				if(this.estado == 'B'){
					descEstado = 'Pte. Bienvenida';
				}else{
					if(this.estado == 'A'){
						descEstado = 'Socio Activo';
					}else{
						if(this.estado == 'T'){
							descEstado = 'Pte. Tarjeta (Duplicado)';
						}	
					}
				}
				var clase = 'ui-datatable-even';
				if(index%2 == 0){
					clase = 'ui-datatable-odd';
				}
				
				$('<tr data-ri="0" class="ui-widget-content ' + clase+ '">' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[0]).attr('style')+'">' + this.numeroSocio + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[1]).attr('style')+'">' + descEstado + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[2]).attr('style')+'">' + this.nombreUsuario + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[3]).attr('style')+'">' + this.claveUsuario + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[4]).attr('style')+'">' + this.nombre + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[5]).attr('style')+'">' + this.apellido1 + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[6]).attr('style')+'">' + this.apellido2 + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[7]).attr('style')+'">' + this.nombreTutor + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[8]).attr('style')+'">' + this.domicilio + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[9]).attr('style')+'">' + this.escalera + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[10]).attr('style')+'">' + this.piso + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[11]).attr('style')+'">' + this.puerta + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[12]).attr('style')+'">' + this.localidad + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[13]).attr('style')+'">' + this.provincia + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[14]).attr('style')+'">' + this.cp + '</div></td>' +
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[15]).attr('style')+'">' + this.fechaCaducidad + '</div></td>' +					
						'<td><div class="ui-dt-c" style="'+$($('#j_idt46 table th div.ui-dt-c')[16]).attr('style')+'">' + this.lote||"" + '</div></td>' +
						'</div></td></tr>').appendTo($('#j_idt46 tbody'));
				
			});
		});
	}
	function cierraLote(){
		if(confirm('Confirma para cerrar el lote')){
			
			$.post('cerrarElLote', {accion:"cerrarLote"}, function(data){
				filtra();
			});
		}
		return false;
	}
	
	$(document).ready(function(){
		filtra();
	});
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
	<s:text name="cabecera.listado.lote.seccion"></s:text>
</div>
<div style="clear: both;"></div>

<form id="j_idt46" name="j_idt46" method="post"
	action="cerrarElLote"
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt46" value="j_idt46" />
	<input type="hidden" name="rows" value="25" />
	<input type="hidden" name="page" value="1" />
	<div id="j_idt46:messages" class="ui-messages ui-widget"></div>
	<span class="aclaracion">Se buscan todos los socios que están en
		estado B (Pendiente de paquete de bienvenida) y no tienen asignado
		fecha de lote, o bien los que están en estado T (Pendiente duplicado
		tarjeta) e igualmente no tienen asignado fecha de lote
	</span>
	<div id="j_idt46:tabla"
		class="ui-datatable ui-widget ui-datatable-scrollable ui-datatable-resizable">
		<div class="ui-widget-header ui-datatable-scrollable-header">
			<div class="ui-datatable-scrollable-header-box">
				<table>
					<thead>
						<tr>
							<th class="ui-datatable-header ui-widget-header" colspan="16">Listado
								de socios </th>
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
								style="text-align: center"><div class="ui-dt-c">
									<span>NRO SOCIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt58"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><div class="ui-dt-c">
									<span>ESTADO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt61"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>NOMBRE USUARIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt64"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>CLAVE</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt67"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>NOMBRE</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt70"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>APELLIDO 1</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt73"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>APELLIDO 2</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt76"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>TUTOR</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt79"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>DOMICILIO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt82"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>ESCALERA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt85"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>PISO</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt88"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>PUERTA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt91"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>LOCALIDAD</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt94"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>PROVINCIA</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt97"
								class="ui-state-default ui-resizable-column"><div
									class="ui-dt-c">
									<span>CP</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt100"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><div class="ui-dt-c">
									<span>CADUCIDAD</span>
								</div></th>
							<th id="j_idt46:tabla:j_idt103"
								class="ui-state-default ui-resizable-column"
								style="text-align: center"><div class="ui-dt-c">
									<span>FECHA LOTE</span>
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
	<button id="j_idt46:j_idt112" name="accion" value="cerrarElLote"
		class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
		onclick="return confirm('Confirma para cerrar el Lote');" type="submit">
		<span class="ui-button-icon-left ui-icon ui-icon ui-icon-locked"></span><span
			class="ui-button-text">Cerrar lote</span>
	</button>
	<script id="j_idt46:j_idt112_s" type="text/javascript">
		PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt112', {
			id : 'j_idt46:j_idt112'
		});
	</script>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="2638118797557331235:-6603911901541678237" autocomplete="off" />
</form>