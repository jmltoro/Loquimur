<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">

$(document).ready(function(){
	var estado = '<s:property value="socio.estado" />';
	if(estado){
		$('#j_idt47 ul li.'+estado).click();
	}
});

</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#j_idt47').validate({
			focusInvalid: false,
			//onfocusout: false,	
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
				sigla : "required",
				domicilio : "required",
				localidad : "required",
				provincia : "required",
				cp : "required",
				telefono : "required",
				fechaCaducidad : "required",
				fFechaNacimiento : "required",
				sexo : "required"
			},
			messages : {
				nombre : "Introduce el nombre",
				apellido1 : "Introduce el primer apellido",
				apellido2 : "Introduce el segundo apellido",
				sigla : "Introduca la sigla",
				domicilio : "Introduce el domicilio",
				localidad : "Introduce el localidad",
				provincia : "Introduce el provincia",
				cp : "Introduce el código postal",
				telefono : "Introduce el teléfono",
				fechaCaducidad : "Introduce la fecha de caducidad",
				fFechaNacimiento : "Introduce la fecha de nacimiento",
				sexo : "Introduce el sexo"
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

<div id="seccion" style="margin-top: 25px;">
	<span><s:property value="socio.nombre" /> <s:property
			value="socio.apellido1" /> <s:property value="socio.apellido2" /> (<s:property
			value="socio.id" />)</span>
</div>
<div style="clear: both;"></div>
<div id="j_idt46"
	class="ui-panel ui-widget ui-widget-content ui-corner-all">
	<div id="j_idt46_header"
		class="ui-panel-titlebar ui-widget-header ui-corner-all">
		<span class="ui-panel-title">Modificar socio</span>
	</div>
	<div id="j_idt46_content" class="ui-panel-content ui-widget-content">
		<form id="j_idt47" name="j_idt47" method="post"
			action="guarda_socio"
			enctype="application/x-www-form-urlencoded">
			<input type="hidden" name="j_idt47" value="j_idt47" />
			<input type="hidden" name="id" value="<s:property value="socio.id" />" />
			<div id="contenidoError" class="ui-messages ui-widget"></div>
			<table cellpadding="2" cellspacing="2" width="100%">
				<tbody>
					<tr>
						<td><label> Estado</label></td>
						<td><div id="j_idt47:j_idt51"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt47:j_idt51_input" name="estado">
										<s:if test="%{socio.estado == \"A\"}">
											<option	value="A" selected="selected">Activos</option>
											<option value="B">Pendientes bienvenida</option>
											<option value="T">Pte. Tarjeta (Duplicado)</option>
											<option value="">[Cualquiera]</option>
										</s:if>
										<s:elseif test="%{socio.estado == \"B\"}">
											<option	value="A">Activos</option>
											<option value="B" selected="selected">Pendientes bienvenida</option>
											<option value="T">Pte. Tarjeta (Duplicado)</option>
											<option value="">[Cualquiera]</option>
										</s:elseif>
										<s:elseif test="%{socio.estado == \"T\"}">
											<option	value="A">Activos</option>
											<option value="B">Pendientes bienvenida</option>
											<option value="T" selected="selected">Pte. Tarjeta (Duplicado)</option>
											<option value="">[Cualquiera]</option>
										</s:elseif>
										<s:else>
											<option	value="A">Activos</option>
											<option value="B">Pendientes bienvenida</option>
											<option value="T">Pte. Tarjeta (Duplicado)</option>
											<option value="" selected="selected">[Cualquiera]</option>
										</s:else>
										
										</select>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt47:j_idt51_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all A">Activos</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all B">Pendientes
											bienvenida</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all T">Pte.
											Tarjeta (Duplicado)</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">[Cualquiera]</li>
									</ul>
								</div>
							</div>
							<script id="j_idt47:j_idt51_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt47_j_idt51', {
												id : 'j_idt47:j_idt51',
												effect : 'blind'
											});
								});
							</script></td>
						<td><label> Lote</label></td>
						<td><label> <s:date name="socio.lote" format="yyyy-MM-dd HH:mm:ss" /></label></td>
					</tr>
					<tr>
						<td><label> Nombre usuario</label></td>
						<td><input id="j_idt47:j_idt59" name="nombreUsuario"
							type="text" value="<s:property value="socio.nombreUsuario" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt59_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt59', {
										id : 'j_idt47:j_idt59'
									});
						</script></td>
						<td><label> Nombre *</label></td>
						<td><input id="j_idt47:j_idt61" name="nombre"
							type="text" value="<s:property value="socio.nombre" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt61_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt61', {
										id : 'j_idt47:j_idt61'
									});
						</script></td>
					</tr>
					<tr>
						<td>

							<p class="aclaracion">
								[El campo nombre de usuario no será actualizado<br /> en la
								entrada ldap correspondiente. Asegurese que<br />el valor que
								introduce coincide con el presente en la entrada ldap]
							</p>
						</td>
						<td><img id="j_idt47:j_idt63"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt47:j_idt64"
							src="images/dot_clear.gif" /></td>
						<td><img id="j_idt47:j_idt65"
							src="images/dot_clear.gif" /></td>
					</tr>
					<tr>
						<td><label> Apellido1 *</label></td>
						<td><input id="j_idt47:j_idt67" name="apellido1"
							type="text" value="<s:property value="socio.apellido1" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt67_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt67', {
										id : 'j_idt47:j_idt67'
									});
						</script></td>
						<td><label> Apellido2 *</label></td>
						<td><input id="j_idt47:j_idt69" name="apellido2"
							type="text" value="<s:property value="socio.apellido2" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt69_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt69', {
										id : 'j_idt47:j_idt69'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Sigla *</label></td>
						<td><div id="j_idt47:j_idt71"
								class="ui-selectonemenu ui-widget ui-state-default ui-corner-all ui-helper-clearfix">
								<div class="ui-helper-hidden-accessible" style="clip: rect(1px 1px 1px 1px);">
									<select id="j_idt47:j_idt71_input" name="sigla">
										<option	value="">--</option>
										<s:if test="%{socio.sigla == \"AG\"}">
											<option value="AG" selected="selected">Agrupación</option>
										</s:if>
										<s:else>
											<option value="AG">Agrupación</option>
										</s:else>
										<s:if test="%{socio.sigla == \"AL\"}">
											<option value="AL" selected="selected">Alameda</option>
										</s:if>
										<s:else>
											<option value="AL">Alameda</option>
										</s:else>
										<s:if test="%{socio.sigla == \"AN\"}">
											<option value="AN" selected="selected">AN</option>
										</s:if>
										<s:else>
											<option value="AN">AN</option>
										</s:else>
										<s:if test="%{socio.sigla == \"AP\"}">
											<option value="AP" selected="selected">Apartamento</option>
										</s:if>
										<s:else>
											<option value="AP">Apartamento</option>
										</s:else>
										<s:if test="%{socio.sigla == \"AV\"}">
											<option value="AV" selected="selected">Avenida</option>
										</s:if>
										<s:else>
											<option value="AV">Avenida</option>
										</s:else>
										<s:if test="%{socio.sigla == \"BC\"}">
											<option value="BC" selected="selected">Barranco</option>
										</s:if>
										<s:else>
											<option value="BC">Barranco</option>
										</s:else>
										<s:if test="%{socio.sigla == \"BD\"}">
											<option value="BD" selected="selected">Bajada</option>
										</s:if>
										<s:else>
											<option value="BD">Bajada</option>
										</s:else>
										<s:if test="%{socio.sigla == \"BL\"}">
											<option value="BL" selected="selected">Bloque</option>
										</s:if>
										<s:else>
											<option value="BL">Bloque</option>
										</s:else>
										<s:if test="%{socio.sigla == \"BO\"}">
											<option value="BO" selected="selected">Barrio</option>
										</s:if>
										<s:else>
											<option value="BO">Barrio</option>
										</s:else>
										<s:if test="%{socio.sigla == \"BR\"}">	
											<option value="BR" selected="selected">Barriada</option>
										</s:if>
										<s:else>
											<option value="BR">Barriada</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CH\"}">
											<option value="CH" selected="selected">Chalet</option>
										</s:if>
										<s:else>
											<option value="CH">Chalet</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CJ\"}">
											<option value="CJ" selected="selected">Callejon, calleja</option>
										</s:if>
										<s:else>
											<option value="CJ">Callejon, calleja</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CL\"}">
											<option value="CL" selected="selected">Calle</option>
										</s:if>
										<s:else>
											<option value="CL">Calle</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CM\"}">
											<option value="CM" selected="selected">Camino</option>
										</s:if>
										<s:else>
											<option value="CM">Camino</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CN\"}">
											<option value="CN" selected="selected">CN</option>
										</s:if>
										<s:else>
											<option value="CN">CN</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CO\"}">
											<option value="CO" selected="selected">Colonia</option>
										</s:if>
										<s:else>
											<option value="CO">Colonia</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CP\"}">
											<option value="CP" selected="selected">CP</option>
										</s:if>
										<s:else>
											<option value="CP">CP</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CR\"}">
											<option value="CR" selected="selected">Carretera</option>
										</s:if>
										<s:else>
											<option value="CR">Carretera</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CS\"}">
											<option value="CS" selected="selected">Casa</option>
										</s:if>
										<s:else>
											<option value="CS">Casa</option>
										</s:else>
										<s:if test="%{socio.sigla == \"CT\"}">
											<option value="CT" selected="selected">Cuesta</option>
										</s:if>
										<s:else>
											<option value="CT">Cuesta</option>
										</s:else>
										<s:if test="%{socio.sigla == \"DS\"}">
											<option value="DS" selected="selected">Diseminados</option>
										</s:if>
										<s:else>
											<option value="DS">Diseminados</option>
										</s:else>
										<s:if test="%{socio.sigla == \"ED\"}">
											<option value="ED" selected="selected">Edificio</option>
										</s:if>
										<s:else>
											<option value="ED">Edificio</option>
										</s:else>
										<s:if test="%{socio.sigla == \"FC\"}">
											<option value="FC" selected="selected">FC</option>	
										</s:if>
										<s:else>
											<option value="FC">FC</option>
										</s:else>
										<s:if test="%{socio.sigla == \"GL\"}">
											<option value="GL" selected="selected">Glorieta</option>
										</s:if>
										<s:else>
											<option value="GL">Glorieta</option>
										</s:else>
										<s:if test="%{socio.sigla == \"GR\"}">
											<option value="GR" selected="selected">Grupo</option>
										</s:if>
										<s:else>
											<option value="GR">Grupo</option>
										</s:else>
										<s:if test="%{socio.sigla == \"HC\"}">
											<option value="HC" selected="selected">HC</option>
										</s:if>
										<s:else>
											<option value="HC">HC</option>
										</s:else>
										<s:if test="%{socio.sigla == \"LG\"}">
											<option value="LG" selected="selected">Lugar</option>
										</s:if>
										<s:else>
											<option value="LG">Lugar</option>
										</s:else>
										<s:if test="%{socio.sigla == \"MC\"}">
											<option value="MC" selected="selected">Mercado</option>
										</s:if>
										<s:else>
											<option value="MC">Mercado</option>
										</s:else>
										<s:if test="%{socio.sigla == \"NR\"}">
											<option value="NR" selected="selected">NR</option>
										</s:if>
										<s:else>
											<option value="NR">NR</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PA\"}">
											<option value="PA" selected="selected">PA</option>
										</s:if>
										<s:else>
											<option value="PA">PA</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PB\"}">
											<option value="PB" selected="selected">Poblado</option>
										</s:if>
										<s:else>
											<option value="PB">Poblado</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PD\"}">
											<option value="PD" selected="selected">Partida</option>
										</s:if>
										<s:else>
											<option value="PD">Partida</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PG\"}">
											<option value="PG" selected="selected">Poligono</option>
										</s:if>
										<s:else>
											<option value="PG">Poligono</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PJ\"}">
											<option value="PJ" selected="selected">Pasaje</option>
										</s:if>
										<s:else>
											<option value="PJ">Pasaje</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PL\"}">
											<option value="PL" selected="selected">Plazuela</option>
										</s:if>
										<s:else>
											<option value="PL">Plazuela</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PQ\"}">
											<option value="PQ" selected="selected">Parque</option>
										</s:if>
										<s:else>
											<option value="PQ">Parque</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PR\"}">
											<option value="PR" selected="selected">Prolongacion</option>
										</s:if>
										<s:else>
											<option value="PR">Prolongacion</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PS\"}">
											<option value="PS" selected="selected">Paseo</option>
										</s:if>
										<s:else>
											<option value="PS">Paseo</option>
										</s:else>
										<s:if test="%{socio.sigla == \"PZ\"}">
											<option value="PZ" selected="selected">Plaza</option>
										</s:if>
										<s:else>
											<option value="PZ">Plaza</option>
										</s:else>
										<s:if test="%{socio.sigla == \"RB\"}">
											<option value="RB" selected="selected">Rambla</option>
										</s:if>
										<s:else>
											<option value="RB">Rambla</option>
										</s:else>
										<s:if test="%{socio.sigla == \"RC\"}">
											<option value="RC" selected="selected">RC</option>
										</s:if>
										<s:else>
											<option value="RC">RC</option>
										</s:else>
										<s:if test="%{socio.sigla == \"RD\"}">
											<option value="RD" selected="selected">Ronda</option>
										</s:if>
										<s:else>
											<option value="RD">Ronda</option>
										</s:else>
										<s:if test="%{socio.sigla == \"RS\"}">
											<option value="RS" selected="selected">RS</option>
										</s:if>
										<s:else>
											<option value="RS">RS</option>
										</s:else>
										<s:if test="%{socio.sigla == \"RT\"}">
											<option value="RT" selected="selected">RT</option>
										</s:if>
										<s:else>
											<option value="RT">RT</option>
										</s:else>
										<s:if test="%{socio.sigla == \"SD\"}">
											<option value="SD" selected="selected">Subida</option>
										</s:if>
										<s:else>
											<option value="SD">Subida</option>
										</s:else>
										<s:if test="%{socio.sigla == \"SL\"}">
											<option value="SL" selected="selected">Solar</option>
										</s:if>
										<s:else>
											<option value="SL">Solar</option>
										</s:else>
										<s:if test="%{socio.sigla == \"SN\"}">
											<option value="SN" selected="selected">Senda</option>
										</s:if>
										<s:else>
											<option value="SN">Senda</option>
										</s:else>
										<s:if test="%{socio.sigla == \"TR\"}">
											<option value="TR" selected="selected">Travesia</option>
										</s:if>
										<s:else>
											<option value="TR">Travesia</option>
										</s:else>
										<s:if test="%{socio.sigla == \"TT\"}">
											<option value="TT" selected="selected">Torrente</option>
										</s:if>
										<s:else>
											<option value="TT">Torrente</option>
										</s:else>
										<s:if test="%{socio.sigla == \"TV\"}">
											<option value="TV" selected="selected">TV</option>
										</s:if>
										<s:else>
											<option value="TV">TV</option>
										</s:else>
										<s:if test="%{socio.sigla == \"UB\"}">
											<option value="UB" selected="selected">UB</option>
										</s:if>
										<s:else>
											<option value="UB">UB</option>
										</s:else>
										<s:if test="%{socio.sigla == \"UR\"}">
											<option value="UR" selected="selected">Urbanizacion</option>
										</s:if>
										<s:else>
											<option value="UR">Urbanizacion</option>
										</s:else>
										<s:if test="%{socio.sigla == \"VL\"}">
											<option value="VL" selected="selected">VL</option></select>
										</s:if>
										<s:else>
											<option value="VL">VL</option></select>
										</s:else>
								</div>
								<a href="#" class="ui-selectonemenu-label-container"><label
									class="ui-selectonemenu-label ui-corner-all">&nbsp;</label></a>
								<div
									class="ui-selectonemenu-trigger ui-state-default ui-corner-right">
									<span class="ui-icon ui-icon-triangle-1-s"></span>
								</div>
								<div id="j_idt47:j_idt71_panel"
									class="ui-selectonemenu-panel ui-widget-content ui-corner-all ui-helper-hidden"
									style="height: 200px">
									<ul
										class="ui-selectonemenu-items ui-selectonemenu-list ui-widget-content ui-widget ui-corner-all ui-helper-reset">
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">--</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Agrupación</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Alameda</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">AN</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Apartamento</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Avenida</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Barranco</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Bajada</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Bloque</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Barrio</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Barriada</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Chalet</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Callejon,
											calleja</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Calle</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Camino</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">CN</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Colonia</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">CP</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Carretera</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Casa</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Cuesta</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Diseminados</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Edificio</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">FC</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Glorieta</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Grupo</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">HC</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Lugar</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Mercado</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">NR</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">PA</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Poblado</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Partida</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Poligono</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Pasaje</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Plazuela</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Parque</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Prolongacion</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Paseo</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Plaza</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Rambla</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">RC</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Ronda</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">RS</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">RT</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Subida</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Solar</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Senda</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Travesia</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Torrente</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">TV</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">UB</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">Urbanizacion</li>
										<li
											class="ui-selectonemenu-item ui-selectonemenu-list-item ui-corner-all">VL</li>
									</ul>
								</div>
							</div>
							<script id="j_idt47:j_idt71_s" type="text/javascript">
								$(function() {
									PrimeFaces.cw('SelectOneMenu',
											'widget_j_idt47_j_idt71', {
												id : 'j_idt47:j_idt71',
												effect : 'blind'
											});
								});
							</script></td>
						<td><label> Domicilio *</label></td>
						<td><input id="j_idt47:j_idt74" name="domicilio"
							type="text" value="<s:property value="socio.domicilio" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt74_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt74', {
										id : 'j_idt47:j_idt74'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Número</label></td>
						<td><input id="j_idt47:j_idt76" name="numero"
							type="text" value="<s:property value="socio.numero" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt76_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt76', {
										id : 'j_idt47:j_idt76'
									});
						</script></td>
						<td><label> Escalera</label></td>
						<td><input id="j_idt47:j_idt78" name="escalera"
							type="text" value="<s:property value="socio.escalera" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt78_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt78', {
										id : 'j_idt47:j_idt78'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Piso</label></td>
						<td><input id="j_idt47:j_idt80" name="piso"
							type="text" value="<s:property value="socio.piso" />" maxlength="10"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt80_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt80', {
										id : 'j_idt47:j_idt80'
									});
						</script></td>
						<td><label> Puerta</label></td>
						<td><input id="j_idt47:j_idt82" name="puerta"
							type="text" value="<s:property value="socio.puerta" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt82_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt82', {
										id : 'j_idt47:j_idt82'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Localidad *</label></td>
						<td><input id="j_idt47:j_idt84" name="localidad"
							type="text" value="<s:property value="socio.localidad" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt84_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt84', {
										id : 'j_idt47:j_idt84'
									});
						</script></td>
						<td><label> Provincia *</label></td>
						<td><input id="j_idt47:j_idt86" name="provincia"
							type="text" value="<s:property value="socio.provincia" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt86_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt86', {
										id : 'j_idt47:j_idt86'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Código Postal *</label></td>
						<td><input id="j_idt47:j_idt88" name="cp"
							type="text" value="<s:property value="socio.cp" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt88_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt88', {
										id : 'j_idt47:j_idt88'
									});
						</script></td>
						<td><label> Teléfono *</label></td>
						<td><input id="j_idt47:j_idt90" name="telefono"
							type="text" value="<s:property value="socio.telefono" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt90_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt90', {
										id : 'j_idt47:j_idt90'
									});
						</script></td>
					</tr>
					<tr>
						<td><label> Email</label></td>
						<td><input id="j_idt47:j_idt92" name="email"
							type="text" value="<s:property value="socio.email" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt92_s" type="text/javascript">
							PrimeFaces.cw('InputText',
									'widget_j_idt47_j_idt92', {
										id : 'j_idt47:j_idt92'
									});
						</script></td>
						<td><label> Fecha de Nacimiento *</label></td>
						<td><span id="j_idt47:j_idt94"><input
								id="j_idt47:j_idt94_input" name="nacimiento"
								type="text" value="<s:date name="socio.fFechaNacimiento" format="dd/MM/yy" />"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt47:j_idt94_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt47_j_idt94', {
											id : 'j_idt47:j_idt94',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y',
											defaultDate : '19/05/99'
										});
							});
						</script></td>
					</tr>
					<tr>
						<td><label> Fecha de Caducidad *</label></td>
						<td><span id="j_idt47:j_idt96"><input
								id="j_idt47:j_idt96_input" name="fechaCaducidad"
								type="text" value="<s:date name="socio.fechaCaducidad" format="dd/MM/yyyy" />"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt47:j_idt96_s" type="text/javascript">
							$(function() {
								PrimeFaces.cw('Calendar',
										'widget_j_idt47_j_idt96', {
											id : 'j_idt47:j_idt96',
											popup : true,
											locale : 'es',
											dateFormat : 'd/mm/y'
										});
							});
						</script></td>
						<td><label> Sexo *</label></td>
						<td><table id="j_idt47:j_idt98"
								class="ui-selectoneradio ui-widget">
								<td><div class="ui-radiobutton ui-widget">
									<s:if test="%{socio.sexo == \"V\"}">
										<div class="ui-helper-hidden">
											
												<input id="j_idt47:j_idt98:0" name="sexo"
												type="radio" value="V" checked="checked" />
											
										</div>
										<div
											class="ui-radiobutton-box ui-widget ui-corner-all ui-radiobutton-relative ui-state-default ui-state-active">
											<span class="ui-radiobutton-icon ui-icon ui-icon-bullet"></span>
										</div>
										</s:if>
										<s:else>
											<div class="ui-helper-hidden">
												<input id="j_idt47:j_idt98:0" name="sexo"
												type="radio" value="V" />
											</div>
											<div
											class="ui-radiobutton-box ui-widget ui-corner-all ui-radiobutton-relative ui-state-default">
											<span class="ui-radiobutton-icon"></span>
										</div>
										</s:else>
									</div></td>
								<td><label for="j_idt47:j_idt98:0">Niño</label></td>
								<td><div class="ui-radiobutton ui-widget">
									<s:if test="%{socio.sexo == \"M\"}">
										<div class="ui-helper-hidden">
											
												<input id="j_idt47:j_idt98:1" name="sexo"
													type="radio" value="M" checked="checked" />
										</div>
										<div
											class="ui-radiobutton-box ui-widget ui-corner-all ui-radiobutton-relative ui-state-default ui-state-active">
											<span class="ui-radiobutton-icon ui-icon ui-icon-bullet"></span>
										</div>
									</s:if>
									<s:else>
										<div class="ui-helper-hidden">
												<input id="j_idt47:j_idt98:1" name="sexo"
												type="radio" value="M" />
										</div>
										<div
											class="ui-radiobutton-box ui-widget ui-corner-all ui-radiobutton-relative ui-state-default">
											<span class="ui-radiobutton-icon"></span>
										</div>
									</s:else>
									</div></td>
								<td><label for="j_idt47:j_idt98:1">Niña</label></td>
							</table>
							<script id="j_idt47:j_idt98_s" type="text/javascript">PrimeFaces.cw('SelectOneRadio','widget_j_idt47_j_idt98',{id:'j_idt47:j_idt98'});</script></td>
					</tr>
					<tr>
						<td><label> Nombre del tutor</label></td>
						<td><input id="j_idt47:j_idt105" name="nombreTutor"
							type="text" value="<s:property value="socio.nombreTutor" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt105_s" type="text/javascript">PrimeFaces.cw('InputText','widget_j_idt47_j_idt105',{id:'j_idt47:j_idt105'});</script></td>
						<td><label> Email tutor</label></td>
						<td><input id="j_idt47:j_idt107" name="emialTutor"
							type="text" value="<s:property value="socio.emailTutor" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt107_s" type="text/javascript">PrimeFaces.cw('InputText','widget_j_idt47_j_idt107',{id:'j_idt47:j_idt107'});</script></td>
					</tr>
					<tr>
						<td><label> DNI del tutor</label></td>
						<td><input id="j_idt47:j_idt109" name="dniTutor"
							type="text" value="<s:property value="socio.dniTutor" />"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all" />
						<script id="j_idt47:j_idt109_s" type="text/javascript">PrimeFaces.cw('InputText','widget_j_idt47_j_idt109',{id:'j_idt47:j_idt109'});</script></td>
						<td><label> Correspondencia devuelta</label></td>
						<td><div id="j_idt47:j_idt111" class="ui-chkbox ui-widget">
								<div class="ui-helper-hidden">
									<s:if test="devCorrespon">
										<input id="j_idt47:j_idt111_input"
										name="devCorrespon" type="checkbox" checked="checked"/>
									</s:if>
									<s:else>
										<input id="j_idt47:j_idt111_input"
										name="devCorrespon" type="checkbox" />
									</s:else>
								</div>
								<div
									class="ui-chkbox-box ui-widget ui-corner-all ui-state-default">
									<span class="ui-chkbox-icon"></span>
								</div>
							</div>
							<script id="j_idt47:j_idt111_s" type="text/javascript">PrimeFaces.cw('SelectBooleanCheckbox','widget_j_idt47_j_idt111',{id:'j_idt47:j_idt111'});</script></td>
					</tr>
					<tr>
						<td><label> Fecha devolución correspondencia</label></td>
						<td><span id="j_idt47:j_idt113"><input
								id="j_idt47:j_idt113_input" name="fechaDevCorrespon"
								type="text" value="<s:date name="socio.fechaDevCorrespon" format="dd/MM/yyyy" />"
								class="ui-inputfield ui-widget ui-state-default ui-corner-all" /></span>
						<script id="j_idt47:j_idt113_s" type="text/javascript">$(function(){PrimeFaces.cw('Calendar','widget_j_idt47_j_idt113',{id:'j_idt47:j_idt113',popup:true,locale:'es',dateFormat:'d/mm/y'});});</script></td>
					</tr>
				</tbody>
			</table>
			<div id="j_idt47:j_idt114" class="ui-chkbox ui-widget">
				<div class="ui-helper-hidden">
					<s:if test="modificacionRegistrable">
						<input id="j_idt47:j_idt114_input" name="modificacionRegistrable"
						type="checkbox" checked="checked" />
					</s:if>
					<s:else>
						<input id="j_idt47:j_idt114_input" name="modificacionRegistrable"
							type="checkbox" />
					</s:else>
				</div>
				<div
					class="ui-chkbox-box ui-widget ui-corner-all ui-state-default ui-state-active">
					<span class="ui-chkbox-icon ui-icon ui-icon-check"></span>
				</div>
			</div>
			<script id="j_idt47:j_idt114_s" type="text/javascript">PrimeFaces.cw('SelectBooleanCheckbox','widget_j_idt47_j_idt114',{id:'j_idt47:j_idt114'});</script>
			<label> Registrar modificación</label>


			<div style="clear: both;"></div>
			<button id="j_idt47:j_idt118" name="j_idt47:j_idt118"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				type="submit">
				<span class="ui-button-icon-left ui-icon ui-icon ui-icon-disk"></span><span
					class="ui-button-text">Guardar modificación</span>
			</button>
			<script id="j_idt47:j_idt118_s" type="text/javascript">PrimeFaces.cw('CommandButton','widget_j_idt47_j_idt118',{id:'j_idt47:j_idt118'});</script>
			<input type="hidden" name="javax.faces.ViewState"
				id="javax.faces.ViewState"
				value="7934772893664161190:-8538385279652160382" autocomplete="off" />
		</form>
	</div>
</div>
<script id="j_idt46_s" type="text/javascript">PrimeFaces.cw('Panel','widget_j_idt46',{id:'j_idt46'});</script>