<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="seccion" style="margin-top: 25px;">Pantalla de Bienvenida</div>
<div style="clear: both;"></div>
<table class="ficha" style="float: left;" width="49%">
	<tbody>
		<tr>
			<td><fieldset id="j_idt47"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Peticiones
						pendientes</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr>
									<td>
										<form id="j_idt49" name="j_idt49" method="post"
											action="/comercialwebWeb/inicio.jsf"
											enctype="application/x-www-form-urlencoded">
											<input type="hidden" name="j_idt49" value="j_idt49">
											
											<a id="j_idt49:j_idt50" href="peticiones_alta"
												class="ui-commandlink ficha_etiqueta"
												onclick="PrimeFaces.addSubmitParam('j_idt49',{'j_idt49:j_idt50':'j_idt49:j_idt50'}).submit('j_idt49');">Altas
												(<s:property value="altas"/>)</a><input type="hidden" name="javax.faces.ViewState"
												id="javax.faces.ViewState"
												value="-4533622254533584272:5447495058627022736"
												autocomplete="off">
										</form>
									</td>
									<td>
										<form id="j_idt51" name="j_idt51" method="post"
											action="peticion_alta_siguiente"
											enctype="application/x-www-form-urlencoded">
											<input type="hidden" name="j_idt51" value="j_idt51">
											<button id="j_idt51:j_idt52" name="j_idt51:j_idt52"
												class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
												type="submit">
												<span
													class="ui-button-icon-left ui-icon ui-icon ui-icon-arrowthick-1-e"></span><span
													class="ui-button-text">Ir a siguiente</span>
											</button>
											<div id="j_idt51:j_idt53" class="ui-messages ui-widget"></div>
											<input type="hidden" name="javax.faces.ViewState"
												id="javax.faces.ViewState"
												value="-4533622254533584272:5447495058627022736"
												autocomplete="off">
										</form>
									</td>
								</tr>
								<tr>
									<td>
										<form id="j_idt54" name="j_idt54" method="post"
											action="reexpediciones"
											enctype="application/x-www-form-urlencoded">
											<input type="hidden" name="j_idt54" value="j_idt54">
											<a id="j_idt54:j_idt55" href="javascript:void(0);"
												class="ui-commandlink ficha_etiqueta"
												onclick="PrimeFaces.addSubmitParam('j_idt54',{'j_idt54:j_idt55':'j_idt54:j_idt55'}).submit('j_idt54');">Reexpediciones
												carnet (<s:property value="reexpediciones"/>)</a><input type="hidden" name="javax.faces.ViewState"
												id="javax.faces.ViewState"
												value="-4533622254533584272:5447495058627022736"
												autocomplete="off">
										</form>
									</td>
									<td>
										<form id="j_idt56" name="j_idt56" method="post"
											action="/comercialwebWeb/inicio.jsf"
											enctype="application/x-www-form-urlencoded">
											<input type="hidden" name="j_idt56" value="j_idt56">
											<button id="j_idt56:j_idt57" name="j_idt56:j_idt57"
												class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left"
												type="submit">
												<span
													class="ui-button-icon-left ui-icon ui-icon ui-icon-arrowthick-1-e"></span><span
													class="ui-button-text">Ir a siguiente</span>
											</button>
											<div id="j_idt56:j_idt58" class="ui-messages ui-widget"></div>
											<input type="hidden" name="javax.faces.ViewState"
												id="javax.faces.ViewState"
												value="-4533622254533584272:5447495058627022736"
												autocomplete="off">
										</form>
									</td>
								</tr>
								<tr>
									<td><a href="peticiones_modificacion"><span
											class="ficha_etiqueta">Modificaciones (<s:property value="modificaciones"/>)</span></a></td>
									<td></td>
								</tr>
								<tr>
									<td><a href="peticiones_baja"><span
											class="ficha_etiqueta">Bajas (<s:property value="bajas"/>)</span></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset></td>
		</tr>
	</tbody>
</table>

<table class="ficha" style="float: right;" width="49%">
	<tbody>
		<tr>
			<td><fieldset id="j_idt65"
					class="ui-fieldset ui-widget ui-widget-content ui-corner-all">
					<legend class="ui-fieldset-legend ui-corner-all ui-state-default">Incidencias</legend>
					<div class="ui-fieldset-content">
						<table width="100%">
							<tbody>
								<tr>
									<td>Pendientes (<s:property value="pendientes"/>)</td>
								</tr>
								<tr>
									<td>Cerradas (<s:property value="incidencias"/>)</td>
								</tr>
								<tr>
									<td>
										<form id="j_idt69" name="j_idt69" method="post"
											action="/comercialwebWeb/inicio.jsf"
											enctype="application/x-www-form-urlencoded">
											<input type="hidden" name="j_idt69" value="j_idt69">
											<button id="j_idt69:j_idt70" name="j_idt69:j_idt70"
												class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left ficha_etiqueta"
												type="submit">
												<span
													class="ui-button-icon-left ui-icon ui-icon ui-icon-arrowthick-1-e"></span><span
													class="ui-button-text">Ir a incidencias</span>
											</button>
											<input type="hidden" name="javax.faces.ViewState"
												id="javax.faces.ViewState"
												value="-4533622254533584272:5447495058627022736"
												autocomplete="off">
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset></td>
		</tr>
	</tbody>
</table>