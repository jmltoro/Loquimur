<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<s:set var="titulo" value="cabecera.listado.peticiones_modificacion" />
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
		$('#j_idt52 input').each(function(index){
			var name = $(this).attr('name');
			datos[name]=$(this).attr('value');
		});
		
		if(pagina){
			datos.page = pagina;
		}
		
		$.post('lista_peticiones_modificacion', datos, function(data){
			//alert(data.listado.length);
			//Modificamos el número total de resultados
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
			$('#j_idt52 tbody').html('');
			$(data.listado).each(function(index){
				var estado;
				if(this.codEstado == 'P'){
					estado = 'Pendiente';
				}
				var clase = 'ui-datatable-even';
				if(index%2 == 0){
					clase = 'ui-datatable-odd';
				}
				$('<tr data-ri="0" class="ui-widget-content ' + clase +'"><td style="text-align:center;"><div class="ui-dt-c">' + this.id 
				+'</div></td><td style="text-align:center;"><div class="ui-dt-c">' + this.codEstado + 
				'</div></td><td style="text-align:center;"><div class="ui-dt-c">' + this.FEntradaString + 
				'</div></td><td style="text-align:center;"><div class="ui-dt-c">' + this.numeroSocio +
				'</div></td><td style="text-align:center"><div class="ui-dt-c"><button id="j_idt46:tabla:0:j_idt63" name="j_idt46:tabla:0:j_idt63" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left" onclick="return ver('+this.id+');" type="submit"><span class="ui-button-icon-left ui-icon ui-icon ui-icon-search"></span><span class="ui-button-text">Ver detalle</span></button></div></td></tr>').appendTo($('#j_idt52 tbody'));
				
			});
		});
	}
	
	function ver(id){
		window.location.href = 'peticion_modificacion?accion=&id='+id;
		return false;
	}
	
	 $( document ).ready(function() {
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

<div id="seccion" style="margin-top: 25px;">
	<s:text name="cabecera.listado.peticiones_modificacion"></s:text>
</div>
<div style="clear: both;"></div>

<form id="j_idt52" name="j_idt52" method="post"
	action=""
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt52" value="j_idt52" />
	<input type="hidden" name="rows" value="25" />
	<input type="hidden" name="page" value="1" />
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
						de modificacion</th>
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
							<span>NÚMERO SOCIO</span>
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

