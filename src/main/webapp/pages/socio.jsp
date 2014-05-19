<%@ taglib prefix="s" uri="/struts-tags"%>
<link type="text/css" rel="stylesheet" href="css/fileupload.css" />
<script type="text/javascript" src="js/fileupload.js" ></script>


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
		<span class="ui-panel-title">Ficha de socio</span>
	</div>
	<div id="j_idt46_content" class="ui-panel-content ui-widget-content">
		<form id="j_idt47" name="j_idt47" method="post"
			action="/comercialwebWeb/ficha_socio.jsf"
			enctype="application/x-www-form-urlencoded">
			<input type="hidden" name="j_idt47" value="j_idt47" />
			<button id="j_idt47:j_idt48" name="j_idt47:j_idt48"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				onclick="history.back();"
				style="float: right;" type="button">
				<span
					class="ui-button-icon-left ui-icon ui-icon ui-icon-circle-triangle-w"></span><span
					class="ui-button-text">Volver</span>
			</button>
			<script id="j_idt47:j_idt48_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt47_j_idt48', {
					id : 'j_idt47:j_idt48'
				});
			</script>
			<div style="clear: both;"></div>
			<div id="j_idt47:j_idt50" class="ui-messages ui-widget">
			<s:if test="listaErrores.size()>0">
				<s:if test="!listaErrores.get(0).equals(\"Error al guardar\")"><div class="ui-messages-info ui-corner-all"><span class="ui-messages-info-icon"></span><ul><li><span class="ui-messages-info-summary">Baja incorrecta</span><span class="ui-messages-info-detail">Los datos del socio no han sido eliminados</span></li></ul></div></s:if>
				<s:else><div class="ui-messages-info ui-corner-all"><span class="ui-messages-info-icon"></span><ul><li><span class="ui-messages-info-summary">Guardado incorrecto</span><span class="ui-messages-info-detail">Los datos del socio no han sido guardados</span></li></ul></div></s:else>
			</s:if>
			</div>
			<table class="ficha" cellpadding="5" cellspacing="10" width="100%">
				<tbody>
					<tr>
						<td><fieldset id="j_idt47:j_idt52"
								class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
								<legend
									class="ui-fieldset-legend ui-corner-all ui-state-default">Datos
									del registro</legend>
								<div class="ui-fieldset-content">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tbody>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">COD ESTADO</td>
												<td class=" ficha_valor"><s:property value="socio.estado" /></td>
												<td class=" ficha_etiqueta">NÚMERO SOCIO</td>
												<td class=" ficha_valor"><s:property value="socio.numeroSocio" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">FECHA ALTA</td>
												<td class=" ficha_valor"><s:date
											name="socio.fechaAlta" format="dd/MM/yyyy" /></td>
												<td class=" ficha_etiqueta">ULT. MODIFICACIÓN</td>
												<td class=" ficha_valor"><s:date
											name="socio.fecha" format="dd/MM/yyyy" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">FECHA CADUCIDAD</td>
												<td class=" ficha_valor"><s:date
											name="socio.fechaCaducidad" format="dd/MM/yyyy" /></td>
												<td class=" ficha_etiqueta">FECHA ÚLTIMO ENVÍO</td>
												<td class=" ficha_valor"><s:date
											name="socio.fechaUltEnvio" format="dd/MM/yyyy" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">LOTE</td>
												<td class=" ficha_valor"><s:date
											name="socio.lote" format="dd/MM/yyyy" /></td>
												<td class=" ficha_etiqueta">NÚMERO SECU LOTE</td>
												<td class=" ficha_valor"><s:property value="socio.numSecLote" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">DEV CORRESPOND</td>
												<td class=" ficha_valor"><s:property value="socio.devCorrespon" /></td>
												<td class=" ficha_etiqueta">FECHA DEV. CORRESPOND.</td>
												<td class=" ficha_valor"><s:date
											name="socio.fechaDevCorrespon" format="dd/MM/yyyy" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<script id="j_idt47:j_idt52_s" type="text/javascript">
								PrimeFaces.cw('Fieldset',
										'widget_j_idt47_j_idt52', {
											id : 'j_idt47:j_idt52'
										});
							</script></td>
						<td><fieldset id="j_idt47:foto"
								class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
								<legend
									class="ui-fieldset-legend ui-corner-all ui-state-default">Foto</legend>
								<div class="ui-fieldset-content">
									<img style="border: none;" height="300px"
										src="foto_socio?k=GLKWUOICN483792fkj7987978dflskdjf&amp;id=<s:property value="socio.numeroSocio" />"></iframe>
									<table cellpadding="5" cellspacing="5" width="100%">
										<tbody>
											<tr>
												<td class="ficha_etiqueta">RUTA FOTO</td>
												<td><s:property value="socio.foto" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<script id="j_idt47:foto_s" type="text/javascript">
								PrimeFaces.cw('Fieldset',
										'widget_j_idt47_foto', {
											id : 'j_idt47:foto'
										});
							</script></td>
					</tr>
					<tr>
						<td><fieldset id="j_idt47:j_idt80"
								class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
								<legend
									class="ui-fieldset-legend ui-corner-all ui-state-default">Datos
									personales</legend>
								<div class="ui-fieldset-content">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tbody>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">NOMBRE</td>
												<td class=" ficha_valor"><s:property value="socio.nombre" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">APELLIDO 1</td>
												<td class=" ficha_valor"><s:property value="socio.apellido1" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">APELLIDO 2</td>
												<td class=" ficha_valor"><s:property value="socio.apellido2" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">FECHA NACIMIENTO</td>
												<td class=" ficha_valor"><s:date
											name="socio.fFechaNacimiento" format="dd/MM/yyyy" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">SEXO</td>
												<td class=" ficha_valor"><s:property value="socio.sexo" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">EMAIL</td>
												<td class=" ficha_valor"><s:property value="socio.email" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">TELEFONO</td>
												<td class=" ficha_valor"><s:property value="socio.telefono" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<script id="j_idt47:j_idt80_s" type="text/javascript">
								PrimeFaces.cw('Fieldset',
										'widget_j_idt47_j_idt80', {
											id : 'j_idt47:j_idt80'
										});
							</script></td>
						<td><fieldset id="j_idt47:j_idt96"
								class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
								<legend
									class="ui-fieldset-legend ui-corner-all ui-state-default">Domicilio</legend>
								<div class="ui-fieldset-content">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tbody>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">SIGLA</td>
												<td class=" ficha_valor"><s:property value="socio.sigla" /></td>
												<td class=" ficha_etiqueta">DOMICILIO</td>
												<td class=" ficha_valor"><s:property value="socio.domicilio" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">NRO</td>
												<td class=" ficha_valor"><s:property value="socio.numero" /></td>
												<td class=" ficha_etiqueta">ESCALERA</td>
												<td class=" ficha_valor"><s:property value="socio.escalera" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">PISO</td>
												<td class=" ficha_valor"><s:property value="socio.piso" /></td>
												<td class=" ficha_etiqueta">PUERTA</td>
												<td class=" ficha_valor"><s:property value="socio.puerta" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">CP</td>
												<td class=" ficha_valor"><s:property value="socio.cp" /></td>
												<td class=" ficha_etiqueta">LOCALIDAD</td>
												<td class=" ficha_valor"><s:property value="socio.localidad" /></td>
											</tr>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">PROVINCIA</td>
												<td class=" ficha_valor"><s:property value="socio.provincia" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<script id="j_idt47:j_idt96_s" type="text/javascript">
								PrimeFaces.cw('Fieldset',
										'widget_j_idt47_j_idt96', {
											id : 'j_idt47:j_idt96'
										});
							</script></td>
					</tr>
					<tr>
						<td><fieldset id="j_idt47:j_idt116"
								class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
								<legend
									class="ui-fieldset-legend ui-corner-all ui-state-default">Datos
									web</legend>
								<div class="ui-fieldset-content">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tbody>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">NOMBRE USUARIO</td>
												<td class=" ficha_valor"><s:property value="socio.nombreUsuario" /></td>
												<td class=" ficha_etiqueta">CLAVE</td>
												<td class=" ficha_valor"><s:property value="socio.claveUsuario" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<script id="j_idt47:j_idt116_s" type="text/javascript">
								PrimeFaces.cw('Fieldset',
										'widget_j_idt47_j_idt116', {
											id : 'j_idt47:j_idt116'
										});
							</script></td>
						<td><fieldset id="j_idt47:j_idt122"
								class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
								<legend
									class="ui-fieldset-legend ui-corner-all ui-state-default">Tutor</legend>
								<div class="ui-fieldset-content">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tbody>
											<tr class="ficha_fila1">
												<td class="ficha_etiqueta">TUTOR</td>
												<td class=" ficha_valor"><s:property value="socio.nombreTutor" /></td>
												<td class=" ficha_etiqueta">DNI TUTOR</td>
												<td class=" ficha_valor"><s:property value="socio.dniTutor" /></td>
											</tr>
											<tr class=" ficha_fila2">
												<td class="ficha_etiqueta">EMAIL TUTOR</td>
												<td class=" ficha_valor"><s:property value="socio.emailTutor" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<script id="j_idt47:j_idt122_s" type="text/javascript">
								PrimeFaces.cw('Fieldset',
										'widget_j_idt47_j_idt122', {
											id : 'j_idt47:j_idt122'
										});
							</script></td>
					</tr>
				</tbody>
			</table>
			<button id="j_idt47:j_idt130" name="j_idt47:j_idt130"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				onclick="location.href='modifica_socio?id=<s:property value="socio.numeroSocio" />';"
				type="button" style="float: left;">
				<span class="ui-button-icon-left ui-icon ui-icon ui-icon-pencil"></span><span
					class="ui-button-text">Modificar</span>
			</button>
			<script id="j_idt47:j_idt130_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt47_j_idt130', {
					id : 'j_idt47:j_idt130'
				});
			</script>
			<button id="j_idt47:j_idt131" name="j_idt47:j_idt131"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
				onclick="if(confirm('Confirma para crear la incidencia')){location.href='incidenciasocio?id=<s:property value="socio.id" />'};"
				style="float: right !important;" type="button">
				<span class="ui-button-icon-left ui-icon ui-icon ui-icon-alert"></span><span
					class="ui-button-text">Crear incidencia por devolución de
					paquete de bienvenida</span>
			</button>
			<script id="j_idt47:j_idt131_s" type="text/javascript">
				PrimeFaces.cw('CommandButton', 'widget_j_idt47_j_idt131', {
					id : 'j_idt47:j_idt131'
				});
			</script>
			<hr id="j_idt47:j_idt132"
				class="ui-separator ui-state-default ui-corner-all" style="clear: both;"/>
			<button id="j_idt47:j_idt135" name="j_idt47:j_idt135"
				class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left boton_baja"
				onclick="if(confirm('Confirma para dar de baja')){location.href='bajasocio?id=<s:property value="socio.numeroSocio" />'};"
				style="float: right;" type="button">
				<span
					class="ui-button-icon-left ui-icon ui-icon ui-icon-circle-close"></span><span
					class="ui-button-text">Dar de baja</span>
			</button>
			<script id="j_idt47:j_idt135_s" type="text/javascript">PrimeFaces.cw('CommandButton','widget_j_idt47_j_idt135',{id:'j_idt47:j_idt135'});</script>


			<div style="clear: both;"></div>
			<input type="hidden" name="javax.faces.ViewState"
				id="javax.faces.ViewState"
				value="1825971468215648789:1506033636274312149" autocomplete="off" />
		</form>
		<form id="j_idt137" name="j_idt137" method="post"
			action="subir_foto" enctype="multipart/form-data">
			<input type="hidden" name="id" value="<s:property value="socio.numeroSocio" />" />
			<input type="hidden" name="j_idt137" value="j_idt137" /> Reemplazar
			foto
			<div id="foto" class="ui-fileupload ui-widget">
				<div class="fileupload-buttonbar ui-widget-header ui-corner-top">
					<label
						class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left fileinput-button"><span
						class="ui-button-icon-left ui-icon ui-icon-plusthick"></span><span
						class="ui-button-text">Choose</span><s:file
						id="foto_input" name="foto" /></label>
				</div>
				<div class="fileupload-content ui-widget-content ui-corner-bottom">
					<table class="files"></table>
				</div>
			</div>
			<script id="foto_s" type="text/javascript">$(function(){PrimeFaces.cw('FileUpload','widget_j_idt137_j_idt139',{id:'foto',mode:'advanced',autoUpload:true,dnd:true,oncomplete:function() {javascript:location='subir_foto';},maxFileSize:100000},'fileupload');});</script>
			<input type="hidden" name="javax.faces.ViewState"
				id="javax.faces.ViewState"
				value="1825971468215648789:1506033636274312149" autocomplete="off" />
		</form>
	</div>
</div>
<script id="j_idt46_s" type="text/javascript">PrimeFaces.cw('Panel','widget_j_idt46',{id:'j_idt46'});</script>