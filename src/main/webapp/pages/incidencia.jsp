<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:set var="titulo" value="cabecera.nueva.incidencia" />
<s:set var="contenido" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#j_idt47').validate({
			focusInvalid: false,
			onfocusout: false,	
			onkeyup: false,
			showErrors: function(errorMap, errorList) 
	        {        
	            //cuando entra aqui recorre los campos en cuales hay error de validacion
            	jQuery('#contenidoError').html('');               
                
                var summary = '<ul>';
                jQuery.each(errorList, function() 
                { 	                 
                    summary +='<li><span class="ui-messages-error-summary">'+this.message+'</span></li>';
                });
                summary += '</ul>';
                

                //hacemos visible el contenedor de errores
                jQuery('#contenidoError').show();

                //mostrar en pantalla los errores
                $('<div class="ui-messages-error ui-corner-all"><span class="ui-messages-error-icon"></span></div>').appendTo('#contenidoError');
                $(summary).appendTo('#contenidoError div.ui-messages-error');
	        },  
	        submitHandler: function(form)
	        {
	            //cuando entra aqui es porque todo los campos fueron validado correctamente

	            //limpiamos la zona de errores
	            jQuery('#contenidoError').html('');
	            //ocultamos
	            jQuery('contenidoError').hide();
	            // enviamos
	            form.submit();
	                         
	        },
			rules : {
				nombre : "required",
				apellido1 : "required",
				apellido2 : "required",
			},
			messages : {
				nombre : "Introduce el nombre",
				apellido1 : "Introduce el apellido 1",
				apellido2 : "Introduce el apellido 2",
			}
		});
	});	
</script>

<script type="text/javascript">

PrimeFaces.locales['es'] = {
        closeText: 'Cerrar',
        prevText: 'Anterior',
        nextText: 'Siguiente',
        currentText: 'Inicio',
        monthNames: ['Enero','Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
        dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
        dayNamesShort: ['Dom','Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
        dayNamesMin: ['D','L','M','X','J','V','S'],
        weekHeader: 'Semana',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: '',
        timeOnlyTitle: 'Sólo hora',
        timeText: 'Tempo',
        hourText: 'Hora',
        minuteText: 'Minuto',
        secondText: 'Segundo',
        currentText: 'Fecha actual',
        ampm: false,
        month: 'Mes',
        week: 'Semana',
        day: 'Día',
        allDayText : 'Todo el día'
    };

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
	<s:text name="cabecera.nueva.incidencia.seccion"></s:text>
</div>
<div style="clear: both;"></div>

<div id="j_idt46"
	class="ui-panel ui-widget ui-widget-content ui-corner-all">
	<div id="j_idt46_header"
		class="ui-panel-titlebar ui-widget-header ui-corner-all">
		<span class="ui-panel-title">Nueva incidencia</span>
	</div>
	<div id="j_idt46_content" class="ui-panel-content ui-widget-content">
		<form id="j_idt47" name="j_idt47" method="post"
			action="guardaIncidencia"
			enctype="application/x-www-form-urlencoded">
			<input type="hidden" name="j_idt47" value="j_idt47" />
			<div id="contenidoError" class="ui-messages ui-widget">
			</div>
			
			<table cellpadding="2" cellspacing="2" width="100%">
				<tbody>
					<tr>
						<td><label> Número socio</label></td>
						<td><input id="j_idt47:j_idt51" name="numeroSocio"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt51_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt51', {
										id : 'j_idt47:j_idt51'
									});
						</script></td>
						<td><label> Nombre *</label></td>
						<td><input id="j_idt47:j_idt53" name="nombre"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt53_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt53', {
										id : 'j_idt47:j_idt53'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Apellido 1*</label></td>
						<td><input id="j_idt47:j_idt55" name="apellido1"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt55_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt55', {
										id : 'j_idt47:j_idt55'
									});
						</script></td>
						<td><label> Apellido 2*</label></td>
						<td><input id="j_idt47:j_idt57" name="apellido2"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt57_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt57', {
										id : 'j_idt47:j_idt57'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Domicilio</label></td>
						<td><input id="j_idt47:j_idt59" name="domicilio"
							type="text" maxlength="40"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt59_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt59', {
										id : 'j_idt47:j_idt59'
									});
						</script></td>
						<td><label> Localidad</label></td>
						<td><input id="j_idt47:j_idt61" name="localidad"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt61_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt61', {
										id : 'j_idt47:j_idt61'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Provincia</label></td>
						<td><input id="j_idt47:j_idt63" name="provincia"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt63_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt63', {
										id : 'j_idt47:j_idt63'
									});
						</script></td>
						<td><label> Teléfono</label></td>
						<td><input id="j_idt47:j_idt65" name="telefono"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt65_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt65', {
										id : 'j_idt47:j_idt65'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Email</label></td>
						<td><input id="j_idt47:j_idt67" name="email"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt67_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt67', {
										id : 'j_idt47:j_idt67'
									});
						</script></td>
						<td><label> Nombre tutor</label></td>
						<td><input id="j_idt47:j_idt69" name="nombreTutor"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt69_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt69', {
										id : 'j_idt47:j_idt69'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Email tutor</label></td>
						<td><input id="j_idt47:j_idt71" name="emailTutor"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt71_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt71', {
										id : 'j_idt47:j_idt71'
									});
						</script></td>
						<td><label> Dni tutor</label></td>
						<td><input id="j_idt47:j_idt73" name="dniTutor"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt73_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt73', {
										id : 'j_idt47:j_idt73'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Origen</label></td>
						<td><div id="j_idt47:j_idt75"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix" style="width: 100px;">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt47:j_idt75_input" name="origen"><option
											value="A">Alta</option>
										<option value="M">Modificación</option></select>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt47:j_idt75_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Alta</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Modificación</li>
									</ul>
								</div>
							</div>
							<script id="j_idt47:j_idt75_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt47_j_idt75', {
												id : 'j_idt47:j_idt75',
												effect : 'blind'
											});
								});
							</script></td>
						<td><label> Comentario socio</label></td>
						<td><input id="j_idt47:j_idt79" name="comentarioSocio"
							type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt79_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt79', {
										id : 'j_idt47:j_idt79'
									});
						</script></td>
					</tr>
				</tbody>
			</table>
			<button id="j_idt47:j_idt80" name="j_idt47:j_idt80"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				type="submit">
				<span class="ui-button-icon-left ui-icon ui-icon ui-icon-disk"></span><span
					class="ui-button-text">Guardar</span>
			</button>
			<script id="j_idt47:j_idt80_s" type="text/javascript">PrimeFaces.cw('CommandButton','widget_j_idt47_j_idt80',{id:'j_idt47:j_idt80'});</script>
			<input type="hidden" name="javax.faces.ViewState"
				id="javax.faces.ViewState"
				value="-3768873330606534068:-2665262197301789494" autocomplete="off" />
		</form>
	</div>
</div>
<script id="j_idt46_s" type="text/javascript">PrimeFaces.cw('Panel','widget_j_idt46',{id:'j_idt46'});</script>