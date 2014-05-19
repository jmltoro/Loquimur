<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="seccion" style="margin-top: 25px;">
	Petición de modificación (<s:property value="peticion.numeroSocio" />)
</div>
<div style="clear: both;"></div>
<form id="j_idt46" name="j_idt46" method="post"
	action="peticion_modificacion"
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt46" value="j_idt46" />
	<input type="hidden" name="id" value="<s:property value="peticion.id" />" />
	<div id="j_idt46:j_idt47"
		class="ui-panel ui-widget ui-widget-content ui-corner-all">
		<div id="j_idt46:j_idt47_header"
			class="ui-panel-titlebar ui-widget-header ui-corner-all">
			<span class="ui-panel-title">Petición de modificación</span>
		</div>
		<div id="j_idt46:j_idt47_content"
			class="ui-panel-content ui-widget-content">
			<s:if test="listaErrores.size() > 0">
			<div id="j_idt46:j_idt48" class="ui-messages ui-widget">
				<div class="ui-messages-error ui-corner-all">
					<span class="ui-messages-error-icon"></span>
					<ul>
						<s:iterator id="listado" value="listaErrores" status="it">
							<li><span class="ui-messages-error-summary">La
									validación no se realizó correctamente</span><span
								class="ui-messages-error-detail"><s:property
										escape="false" /><br /></span></li>
						</s:iterator>
					</ul>
				</div>
				</div>
			</s:if>
			<span style="float: left; width: 49%"><fieldset
					id="j_idt46:j_idt50"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Datos
						del registro</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">ID</td>
									<td class=" ficha_valor"><s:property value="peticion.id" /></td>
									<td class=" ficha_etiqueta">COD ESTADO</td>
									<td class=" ficha_valor"><s:property value="peticion.codEstado" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">ULT. MODIFICACIÓN</td>
									<td class=" ficha_valor">24/02/2014</td>
									<td class=" ficha_etiqueta">FECHA ENTRADA</td>
									<td class=" ficha_valor">26/10/2013</td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">NRO SOCIO</td>
									<td class=" ficha_valor"><s:property value="peticion.numeroSocio" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<script id="j_idt46:j_idt50_s" type="text/javascript">
					PrimeFaces.cw('Fieldset', 'widget_j_idt46_j_idt50', {
						id : 'j_idt46:j_idt50'
					});
				</script>
				<fieldset id="j_idt46:j_idt62"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Domicilio</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">SIGLA</td>
									<td class=" ficha_valor"><s:property value="peticion.sigla" /></td>
									<td class=" ficha_etiqueta">DOMICILIO</td>
									<td class=" ficha_valor"><s:property value="peticion.domicilio" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">NRO</td>
									<td class=" ficha_valor"><s:property value="peticion.numero" /></td>
									<td class=" ficha_etiqueta">ESCALERA</td>
									<td class=" ficha_valor"><s:property value="peticion.escalera" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">PISO</td>
									<td class=" ficha_valor"><s:property value="peticion.piso" /></td>
									<td class=" ficha_etiqueta">PUERTA</td>
									<td class=" ficha_valor"><s:property value="peticion.puerta" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">CP</td>
									<td class=" ficha_valor"><s:property value="peticion.cp" /></td>
									<td class=" ficha_etiqueta">LOCALIDAD</td>
									<td class=" ficha_valor"><s:property value="peticion.localidad" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">PROVINCIA</td>
									<td class=" ficha_valor"><s:property value="peticion.provincia" /></td>
									<td class=" ficha_etiqueta">TELEFONO</td>
									<td class=" ficha_valor"><s:property value="peticion.telefono" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<script id="j_idt46:j_idt62_s" type="text/javascript">
					PrimeFaces.cw('Fieldset', 'widget_j_idt46_j_idt62', {
						id : 'j_idt46:j_idt62'
					});
				</script></span><span
				style="float: right; width: 49%"><fieldset
					id="j_idt46:j_idt85"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all"
					style="text-align: center;">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Foto</legend>
					<div class="ui-fieldset-content">
						<img id="j_idt46:j_idt86" src="peticion_modificacion_foto?id=<s:property value="peticion.id" />" alt="" height="200px;" />
					</div>
				</fieldset>
				<script id="j_idt46:j_idt85_s" type="text/javascript">
					PrimeFaces.cw('Fieldset', 'widget_j_idt46_j_idt85', {
						id : 'j_idt46:j_idt85'
					});
				</script>

				<div style="clear: both;"></div>
				<fieldset id="j_idt46:j_idt88"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Tutor</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">TUTOR</td>
									<td class=" ficha_valor"><s:property value="peticion.nombreTutor" /></td>
									<td class=" ficha_etiqueta">DNI TUTOR</td>
									<td class=" ficha_valor"><s:property value="peticion.dniTutor" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">EMAIL TUTOR</td>
									<td class=" ficha_valor"><s:property value="peticion.emailTutor" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<script id="j_idt46:j_idt88_s" type="text/javascript">
					PrimeFaces.cw('Fieldset', 'widget_j_idt46_j_idt88', {
						id : 'j_idt46:j_idt88'
					});
				</script>
				<fieldset id="j_idt46:j_idt96"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Socio</legend>
					<div class="ui-fieldset-content"><s:property value="nombreSocio" /> [<s:property value="peticion.numeroSocio" />]</div>
				</fieldset>
				<script id="j_idt46:j_idt96_s" type="text/javascript">
					PrimeFaces.cw('Fieldset', 'widget_j_idt46_j_idt96', {
						id : 'j_idt46:j_idt96'
					});
				</script></span>







			<div style="clear: both;"></div>
			<button id="j_idt46:j_idt99" name="accion" value="validar"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				onclick="return confirm('Confirma para validar');" type="submit">
				<span class="ui-button-icon-left ui-icon ui-icon ui-icon-check"></span><span
					class="ui-button-text">Validar</span>
			</button>
			<script id="j_idt46:j_idt99_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt99', {
					id : 'j_idt46:j_idt99'
				});
			</script>
			<button id="j_idt46:j_idt100" name="accion" value="descartar"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				onclick="return confirm('Confirma para descartar');"
				style="float: right;" type="submit">
				<span
					class="ui-button-icon-left ui-icon ui-icon ui-icon-circle-close"></span><span
					class="ui-button-text">Descartar</span>
			</button>
			<script id="j_idt46:j_idt100_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt100', {
					id : 'j_idt46:j_idt100'
				});
			</script>
			<button id="j_idt46:j_idt101" name="j_idt46:j_idt101"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				onclick="dlg.show();" style="float: right;" type="button">
				<span class="ui-button-icon-left ui-icon ui-icon ui-icon-alert"></span><span
					class="ui-button-text">Crear incidencia</span>
			</button>
			<script id="j_idt46:j_idt101_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt46_j_idt101', {
					id : 'j_idt46:j_idt101'
				});
			</script>

			<div style="clear: both;"></div>
		</div>
	</div>
	<script id="j_idt46:j_idt47_s" type="text/javascript">
		PrimeFaces.cw('Panel', 'widget_j_idt46_j_idt47', {
			id : 'j_idt46:j_idt47'
		});
	</script>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="2919166860795357653:-8396544327595030293" autocomplete="off" />
</form>
<script id="dialog_s" type="text/javascript">
	$(function() {
		PrimeFaces.cw('Dialog', 'dlg', {
			id : 'dialog',
			resizable : false,
			modal : true
		});
	});
</script>
<div id="dialog"
	class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-helper-hidden ui-hidden-container">
	<div class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">
		<span class="ui-dialog-title">Crear incidencia</span><a href="#"
			class="ui-dialog-titlebar-icon ui-dialog-titlebar-close ui-corner-all"><span
			class="ui-icon ui-icon-closethick"></span></a>
	</div>
	<div class="ui-dialog-content ui-widget-content">
		<div id="j_idt103" class="ui-messages ui-widget"></div>
		<form id="form_incidencia" name="form_incidencia" method="post"
			action="/comercialwebWeb/peticion_modificacion.jsf"
			enctype="application/x-www-form-urlencoded">
			<input type="hidden" name="form_incidencia" value="form_incidencia" />
			<table cellpadding="5">
				<tfoot>
					<tr>
						<td colspan="1"><button id="form_incidencia:j_idt106"
								name="form_incidencia:j_idt106"
								class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
								type="submit">
								<span class="ui-button-text">Aceptar</span>
							</button>
							<script id="form_incidencia:j_idt106_s" type="text/javascript">
								PrimeFaces.cw('CommandButton',
										'widget_form_incidencia_j_idt106', {
											id : 'form_incidencia:j_idt106'
										});
							</script></td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td><label for="form_incidencia:comentario">
								Comentario</label></td>
					</tr>
					<tr>
						<td><span id="form_incidencia:comentario"
							name="form_incidencia:comentario"><textarea
									id="form_incidencia:comentario_input"
									name="form_incidencia:comentario_input" cols="30" rows="5"
									class="ui-inputfield ui-inputtextarea ui-widget ui-state-default ui-corner-all"></textarea></span>
						<script id="form_incidencia:comentario_s" type="text/javascript">PrimeFaces.cw('InputTextarea','widget_form_incidencia_comentario',{id:'form_incidencia:comentario',autoResize:false,maxHeight:500,effectDuration:200});</script></td>
					</tr>
					<tr>
						<td><span class="aclaracion">La incidencia se crea
								cerrada. Al crearla se descarta la petición. IMPORTANTE: El
								sistema no mandará mail automático al socio. Notificar al socio
								por teléfono o al club.</span></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="javax.faces.ViewState"
				id="javax.faces.ViewState"
				value="2919166860795357653:-8396544327595030293" autocomplete="off" />
		</form>