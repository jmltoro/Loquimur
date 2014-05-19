<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="seccion" style="margin-top: 25px;">
	<s:if test="repetidos">
		<span style="color: red;">[Posible duplicado] <s:property
				value="peticion.nombre" /> <s:property value="peticion.apellido1" />
			<s:property value="peticion.apellido2" /> (<s:property
				value="peticion.nombreUsuario" />)
		</span>
	</s:if>
	<s:else>
		<span><s:property value="peticion.nombre" /> <s:property
				value="peticion.apellido1" /> <s:property
				value="peticion.apellido2" /> (<s:property
				value="peticion.nombreUsuario" />)</span>
	</s:else>
</div>
<div style="clear: both;"></div>
<form id="j_idt46" name="j_idt46" method="post"
	action="peticion_alta"
	enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="j_idt46" value="j_idt46">
	<input type="hidden" name="id" value="<s:property value="peticion.id" />">
	<div id="j_idt46:j_idt47"
		class="ui-panel ui-widget ui-widget-content ui-corner-all">
		<div id="j_idt46:j_idt47_header"
			class="ui-panel-titlebar ui-widget-header ui-corner-all">
			<span class="ui-panel-title">Petición de Alta</span>
		</div>
		<div id="j_idt46:j_idt47_content"
			class="ui-panel-content ui-widget-content">
			<div id="j_idt46:j_idt48" class="ui-messages ui-widget"></div>
			<span style="float: left; width: 49%"><fieldset
					id="j_idt46:j_idt50"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Datos
						personales</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">NOMBRE</td>
									<td class=" ficha_valor"><s:property
											value="peticion.nombre" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">APELLIDO 1</td>
									<td class=" ficha_valor"><s:property
											value="peticion.apellido1" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">APELLIDO 2</td>
									<td class=" ficha_valor"><s:property
											value="peticion.apellido2" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">FECHA NACIMIENTO</td>
									<td class=" ficha_valor"><s:date
											name="peticion.fFechaNacimiento" format="dd/MM/yyyy" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">SEXO</td>
									<td class=" ficha_valor"><s:property value="peticion.sexo" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<fieldset id="j_idt46:j_idt62"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Domicilio</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">SIGLA</td>
									<td class=" ficha_valor"><s:property
											value="peticion.sigla" /></td>
									<td class=" ficha_etiqueta">DOMICILIO</td>
									<td class=" ficha_valor"><s:property
											value="peticion.domicilio" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">NRO</td>
									<td class=" ficha_valor"><s:property
											value="peticion.numero" /></td>
									<td class=" ficha_etiqueta">ESCALERA</td>
									<td class=" ficha_valor"><s:property
											value="peticion.escalera" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">PISO</td>
									<td class=" ficha_valor"><s:property value="peticion.piso" /></td>
									<td class=" ficha_etiqueta">PUERTA</td>
									<td class=" ficha_valor"><s:property
											value="peticion.puerta" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">CP</td>
									<td class=" ficha_valor"><s:property value="peticion.cp" /></td>
									<td class=" ficha_etiqueta">LOCALIDAD</td>
									<td class=" ficha_valor"><s:property
											value="peticion.localidad" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">PROVINCIA</td>
									<td class=" ficha_valor"><s:property
											value="peticion.provincia" /></td>
									<td class=" ficha_etiqueta">TELEFONO</td>
									<td class=" ficha_valor"><s:property
											value="peticion.telefono" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<fieldset id="j_idt46:j_idt84"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Tutor</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">TUTOR</td>
									<td class=" ficha_valor"><s:property
											value="peticion.nombreTutor" /></td>
									<td class=" ficha_etiqueta">DNI TUTOR</td>
									<td class=" ficha_valor"><s:property
											value="peticion.dniTutor" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">EMAIL TUTOR</td>
									<td class=" ficha_valor"><s:property
											value="peticion.emailTutor" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				<fieldset id="j_idt46:j_idt92"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Datos
						web</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">NOMBRE USUARIO</td>
									<td class=" ficha_valor"><s:property
											value="peticion.nombreUsuario" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset></span><span style="float: right; width: 49%"><fieldset
					id="j_idt46:j_idt99"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all"
					style="text-align: center;">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Foto</legend>
					<div class="ui-fieldset-content">
						<img id="j_idt46:j_idt100"
							src="foto_peticion?id=<s:property value="peticion.id"/>"
							alt="adriana" height="200px;" title="adriana">
					</div>
				</fieldset>

				<div style="clear: both;"></div>
				<fieldset id="j_idt46:j_idt102"
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
									<td class=" ficha_valor"><s:property
											value="peticion.codEstado" /></td>
								</tr>
								<tr class=" ficha_fila2">
									<td class="ficha_etiqueta">ULT. MODIFICACIÓN</td>
									<td class=" ficha_valor"><s:date
											name="peticion.fUltimaModificacion" format="dd/MM/yyyy" /></td>
									<td class=" ficha_etiqueta">FECHA ENTRADA</td>
									<td class=" ficha_valor"><s:date name="peticion.fEntrada"
											format="dd/MM/yyyy" /></td>
								</tr>
								<tr class="ficha_fila1">
									<td class="ficha_etiqueta">SOLICITA CARNET</td>
									<td class=" ficha_valor"><s:property
											value="peticion.solicitaCarnet" /></td>
									<td class=" ficha_etiqueta">NRO SOCIO</td>
									<td class=" ficha_valor"><s:property
											value="peticion.numeroSocio" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset></span>







			<div style="clear: both;"></div>
			<sec:authorize access="hasRole('gestor')">	
				<s:set name="estado" value="peticion.codEstado"/>
				<s:set name="p" value="\"P\""/>
				<s:set name="solicita" value="peticion.solicitaCarnet"/>
				<s:set name="n" value="\"N\""/>
				
				<s:if test="%{#estado == #p}">
					<s:if test="%{#solicita == #n}">
						<button id="j_idt46:j_idt125" name="accion"
						class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
						onclick="return confirm('Confirma para validar');" type="submit" value="validar">
						<span class="ui-button-icon-left ui-icon ui-icon ui-icon-check"></span><span
							class="ui-button-text">Validar</span>
						</button>
						<button id="j_idt46:j_idt126" name="accion"
							class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
							onclick="return confirm('Confirma para validar');" type="submit" value="validarsiguiente">
							<span class="ui-button-icon-left ui-icon ui-icon ui-icon-check"></span><span
								class="ui-button-text">Validar y siguiente</span>
						</button>
					</s:if>
					<button id="j_idt46:j_idt127" name="accion"
						class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
						onclick="return confirm('Confirma para descartar');"
						style="float: right;" type="submit" value="descartar">
						<span
							class="ui-button-icon-left ui-icon ui-icon ui-icon-circle-close"></span><span
							class="ui-button-text">Descartar</span>
					</button>
				</s:if>
				<button id="j_idt46:j_idt128" name="j_idt46:j_idt128"
					class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
					onclick="dlg.show();" style="float: right;" type="button">
					<span class="ui-button-icon-left ui-icon ui-icon ui-icon-alert"></span><span
						class="ui-button-text">Crear incidencia</span>
				</button>
			</sec:authorize>
			




			<div style="clear: both;"></div>
		</div>
	</div>
	<input type="hidden" name="javax.faces.ViewState"
		id="javax.faces.ViewState"
		value="1385340864587204698:5294507815597685884" autocomplete="off">
</form>

<div id="dialog"
	class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-helper-hidden ui-hidden-container ui-draggable"
	style="width: auto; height: auto;">
	<div class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix"
		style="">
		<span class="ui-dialog-title">Crear incidencia</span><a href="#"
			class="ui-dialog-titlebar-icon ui-dialog-titlebar-close ui-corner-all"><span
			class="ui-icon ui-icon-closethick"></span></a>
	</div>
	<div class="ui-dialog-content ui-widget-content" style="height: auto;">
		<div id="j_idt130" class="ui-messages ui-widget"></div>
		<form id="form_incidencia" name="form_incidencia" method="post"
			action="incidencia_peticion_alta"
			enctype="application/x-www-form-urlencoded">
			<input type="hidden" name="form_incidencia" value="form_incidencia">
			<input type="hidden" name="id" value="<s:property value="peticion.id" />">
			<table cellpadding="5">
				<tfoot>
					<tr>
						<td colspan="1"><button id="form_incidencia:j_idt136"
								name="form_incidencia:j_idt136"
								class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
								type="submit">
								<span class="ui-button-text">Aceptar</span>
							</button></td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td><label for="form_incidencia:comentario">
								Comentario</label></td>
					</tr>
					<tr>
						<td>
							<!-- <p:inputText value=""
						requiredMessage="Introduzca un comentario" required="true"></p:inputText> -->
						</td>
					</tr>
					<tr>
						<td><span id="form_incidencia:comentario"
							name="form_incidencia:comentario"><textarea
									id="form_incidencia:comentario_input"
									name="comentario_socio" cols="30" rows="5"
									class="ui-inputfield ui-inputtextarea ui-widget ui-state-default ui-corner-all"></textarea></span></td>
					</tr>
					<tr>
						<td><label for="form_incidencia:comentario"> Mail
								alternativo (opcional)</label></td>
					</tr>
					<tr>
						<td><input id="form_incidencia:j_idt135"
							name="mailAlternativo" type="text"
							class="ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all"></td>
					</tr>
					<tr>
						<td><span class="aclaracion">La incidencia se crea
								cerrada. Al crearla se manda automáticamente el mail de
								incidencia de alta al usuario y se descarta la petición.</span></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="javax.faces.ViewState"
				id="javax.faces.ViewState"
				value="5010706183158551329:-7045910594880790543" autocomplete="off">
		</form>
	</div>
</div>

<script id="dialog_s" type="text/javascript">$(function() {PrimeFaces.cw('Dialog','dlg',{id:'dialog',resizable:false,modal:true});});</script>