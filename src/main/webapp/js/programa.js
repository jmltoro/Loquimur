/**************************************************************************************************/
/**                          FUNCIONES EN LA SECCIÓN DE PROGRAMAS                                **/
/**************************************************************************************************/

/**
 * Función que se accede desde el listado de programas para mostrar su ficha.
 * @param valor Identificador del programa.
 */
function verFichaPrograma(valor) {
	document.listadoF.idPrograma.value = valor;
	document.listadoF.submit();
}

/**
 * Función que se accede desde el listado de programas para mostrar su ficha.
 * @param valor Identificador del programa.
 * @param url URL donde enviar el formulario.
 */
function verFichaProgramaURL(valor, url) {
	document.listadoF.action = url;
	document.listadoF.idPrograma.value = valor;
	document.listadoF.submit();
}

/**
 * Guarda la información de un programa.
 *  Previamente valida que los datos sean correctos.
 * @param url Url donde va a dirigirse.
 * @param vform Formulario que se envía.
 */
function grabarPrograma (url, vform) {
	
	if (validaPrograma()) {
		enviaFormName('guardarPrograma', 'listadoF');
	}
}

/**
 * Al consolidar un programa, primero debe comprobarse que la fecha de fin existe.
 * @param action Acción que se lleva a cabo (consolidar)
 * @param formname Nombre del formulario que se envía.
 * @return
 */
function consolidarPrograma(action,formname) {
	
	var fhFin = $('#fhFin').val();
	if (fhFin == null || fhFin == '') {
		$("#labelFhFin").html(getMensajeCampoObligatorio('fecha de finalización'));
		$("#labelFhFin").attr("style","visibility:visible;");
	}
	else {
		$("#labelFhFin").attr("style","visibility:hidden;");
		cambiarEstadoPrograma (action, formname);
	}
}

/**
 * Función para cambiar el estado de un programa.
 * @param action Acción que se lleva a cabo (consolidar, desconsolidar, cerrar)
 * @param formname Nombre del formulario que se envía.
 */
function cambiarEstadoPrograma (action, formname) {
	
	var mensaje = obtieneMensajeCambioEstado (action);
	
	confirma(mensaje, function() {
		enviaFormName (action, formname);
	});
}

/**
 * Obtiene el mensaje de confirmación según el cambio de estado que se esté realizando en el programa.
 * @param action Acción que se lleva a cabo (consolidar, desconsolidar, cerrar)
 * @return mensaje Mensaje de confirmación.
 */
function obtieneMensajeCambioEstado (action) {
	
	var mensaje = "";
	
	var modificado = $("#modificadoPrograma").val();
	if (modificado == 1) {
		mensaje = getAvisoNoGuardar();
	}
	
	if (action == 'consolidarPrograma') {
		mensaje += getAvisoConsolidarPrograma();
	}
	else if (action == 'desconsolidarPrograma') {
		mensaje = getAvisoDesconsolidarPrograma();
	}
	else if (action == 'cerrarPrograma') {
		mensaje = getAvisoCerrarPrograma();
	}
	
	mensaje += " " + getConfirmDeseaContinuar();
	
	return mensaje;
}

/**
 * Guarda un objetivo (o resultado) de un programa, 
 *  cierra el formulario modal, 
 *  y recarga la pestaña correspondiente.
 * 	Previamente valida que los datos son correctos.
 * @param idPestana Id de la pestaña, según sean los objetivos o resultados.
 */
function guardarObjetivo (idPestana) {
	
	var url = $('#ObjModalForm').attr('action');  
	var datos = $('#ObjModalForm').serialize();
	
	$('#acordeonSeleccionado').val($('#idSeleccionado').val());
	
	if (validaObjetivo()) {
		
		$.ajax({
			  type: 'POST',
			  url: url,
			  data: datos,
			  success: function(result) {
			
					if (idPestana == 'div_obj_generales') {
						$('#remotetabs').tabs("url" , 0, "progPestanaObjetivosGeneralesJson?mensaje=" + result + "&idPrograma=" + $('#idPrograma').val());
						
						$('#remotetabs').tabs('load' , 0);
						$('#remotetabs').tabs("url" , 0, "progPestanaObjetivosGeneralesJson" + "?idPrograma=" + $('#idPrograma').val());
					}
					
					else if (idPestana == 'div_obj_especificos') {
						$('#remotetabs').tabs("url" , 1, "progPestanaObjetivosEspecificosJson?mensaje=" + result + "&idPrograma=" + $('#idPrograma').val());
						
						$('#remotetabs').tabs('load' , 1);
						$('#remotetabs').tabs("url" , 1, "progPestanaObjetivosEspecificosJson" + "?idPrograma=" + $('#idPrograma').val());
					}
					
					cerrarDialog('dialogo');
			 }
			});
	}
}

/**
 * Guarda una actividad de un resultado de un programa, 
 *  cierra el formulario modal, 
 *  y recarga la pestaña correspondiente.
 * 	Previamente valida que los datos son correctos.
 */
function guardarActividad () {
	var url = $('#ActModalForm').attr('action');  
	var datos = $('#ActModalForm').serialize();
	
	$('#acordeonSeleccionado').val($('#idObjetivo').val());

	if (validaActividad()) {
		$.ajax({
		  type: 'POST',
		  url: url,
		  data: datos,
		  success: function(result) {
				$('#remotetabs').tabs("url" , 2, "progPestanaActividadesJson?mensaje=" + result + "&idPrograma=" + $('#idPrograma').val() + "&mostrarAvisosAct=true");
				
				$('#remotetabs').tabs('load' , 2);
				cerrarDialog('dialogo');
				$('#remotetabs').tabs("url" , 2, "progPestanaActividadesJson" + "?idPrograma=" + $('#idPrograma').val() + "&mostrarAvisosAct=true");
			}
		});
	}
}

/**
 * Guarda un indicador de un programa, 
 *  cierra el formulario modal, 
 *  y recarga la pestaña correspondiente.
 * 	Previamente valida que los datos son correctos.
 */
function guardarIndicador() {
	
	$('#idProgramaInd').val($('#idPrograma').val());
	
	var url = $('#IndModalForm').attr('action');  
	var datos = $('#IndModalForm').serialize();
	
	$('#acordeonSeleccionado').val($('#idActividad').val());

	if (validaIndicador()) {
		$.ajax({
		  type: 'POST',
		  url: url,
		  data: datos,
		  success: function(result) {
				$('#remotetabs').tabs("url" , 3, "progPestanaIndicadoresJson?mensaje=" + result + "&idPrograma=" + $('#idPrograma').val() + "&idActividad=" + $('#idActividad').val());
				
				$('#remotetabs').tabs('load' , 3);
				cerrarDialog('dialogo');
				$('#remotetabs').tabs("url" , 3, "progPestanaIndicadoresJson" + "?idPrograma=" + $('#idPrograma').val() + "&idActividad=" + $('#idActividad').val());
			}
		});
	}
}

/**
 * Pliega y despliega un acordeón.
 * @param acordeon: id del div que se va a plegar/desplegar
 */
function clickAcordeonPrograma (acordeon, idCampo){
	
	 if($('#' + idCampo + acordeon).is(":hidden")){
		$('#' + idCampo + acordeon).slideDown("slow");
		$('.slider').slideUp('fast'); 
	 	$('.slider').slideDown('slow'); 
	 } 
	 else {
		 $('#' + idCampo + acordeon).slideUp("slow");
	 }
}

/**
 * Carga un resultado desde la pestaña de objetivos. Despliega el objetivo en cuestión.
 * @param id Identificador del resultado que debe cargarse.
 */
function cargaObjEsp (id) {
	$('#acordeonSeleccionado').val(id);
	$('#div_obj_especificos_body').html('');
	$('#remotetabs').tabs('select' , 1);
}

/**
 * Carga un resultado en la pestaña de actividades desde la pestaña de resultados. Despliega el objetivo en cuestión.
 * @param id Identificador del resultado que debe cargarse.
 */
function cargaAct (id) {
	$('#acordeonSeleccionado').val(id);
	$('#div_actividades_body').html('');
	$('#remotetabs').tabs('select' , 2);
}

/**
 * Carga una actividad en la pestaña de indicadores desde la pestaña de actividades. Despliega la actividad en cuestión.
 * @param id Identificador de la actividad que debe cargarse.
 */
function cargaIndicadores (id) {
	$('#acordeonSeleccionado').val(id);
	$('#div_indicadores_body').html('');
	$('#remotetabs').tabs('select' , 3);
}

/**
 * Cambia el estado de una una actividad. 
 *  Previamente comprueba si se ha modificado algún registro, 
 *  para advertir al usuario de que los campos modificados posteriormente no serán guardados.
 * @param estado Estado al que se desea cambiar la actividad.
 */
function cambiarEstadoActividad (estado) {
	
	var modificado = $("#modificado").val();
	if (modificado == 1) {
		$('#confirmarCambiarEstadoModal').dialog('moveToTop');
		
		$('#confirmarCambiarEstadoModal').dialog('open');
		$('#confirmarCambiarEstadoModal').dialog('close');
		
		$('#estadoActividad').val(estado);
		$('#confirmarCambiarEstadoModal').dialog('open');
		
	} 
	else {
		var url = getUrlFromEstado (estado);
		var datos = $('#ActModalForm').serialize();

		$('#acordeonSeleccionado').val($('#idObjetivo').val());
		
		$.ajax({
		  type: 'POST',
		  url: url,
		  data: datos,
		  success: function(result) {
				$('#remotetabs').tabs("url" , 2, "progPestanaActividadesJson?mensaje=" + result+ "&idPrograma=" + $('#idPrograma').val() + "&mostrarAvisosAct=true");
				$('#remotetabs').tabs('load' , 2);
				cerrarDialog('dialogo');
				$('#remotetabs').tabs("url" , 2, "progPestanaActividadesJson" + "?idPrograma=" + $('#idPrograma').val() + "&mostrarAvisosAct=true");
			}
		});
	}
}

/**
 * Confirma el diálogo de confirmación de cambiar el estado a una actividad.
 *  Deberán cerrarse los dos diálogos (el modal de la actividad y el modal de la confirmación) y cambiar el estado de la actividad.
 */
function confirmarCambiarEstadoModal () {
	
	var url = getUrlFromEstado ($('#estadoActividad').val());  
	var datos = $('#ActModalForm').serialize();
	
	$('#acordeonSeleccionado').val($('#idObjetivo').val());

	$.ajax({
	  type: 'POST',
	  url: url,
	  data: datos,
	  success: function(result) {
			
			$('#remotetabs').tabs("url" , 2, "progPestanaActividadesJson?mensaje=" + result+ "&idPrograma=" + $('#idPrograma').val() + "&mostrarAvisosAct=true");
			$('#remotetabs').tabs('load' , 2);
			cerrarDialog('confirmarCambiarEstadoModal');
			cerrarDialog('dialogo');
			$('#remotetabs').tabs("url" , 2, "progPestanaActividadesJson" + "?idPrograma=" + $('#idPrograma').val() + "&mostrarAvisosAct=true");
		}
	});
}

/**
 * Obtiene la url a la que tiene que ir según la acción que se haya realizado para cambiar de estado.
 * @param estado Estado al que se va a pasar.
 * @return url La url del método que se va a ejecutar en cada caso.
 */
function getUrlFromEstado (estado) {
	var url = "";
	
	if (estado == "CONSOLIDAR") {
		url = "consolidarActividadJson";
	}	
	else if (estado == "DESCONSOLIDAR") {
		url = "desconsolidarActividadJson";
	}
	else if (estado == "TERMINAR") {
		url = "terminarActividadJson";
	}
	else if (estado == "VALIDAR") {
		url = "validarActividadJson";
	}
	return url;
}

/**
 * Selecciona el indicador del listado y lo envía a la siguiente página.
 */	
 function seleccionaIndicador(idIndicador) {
	 
	cerrarDialog('dialogo');

	var options_editDialog = {};
	options_editDialog.height = 630;
	options_editDialog.width = 494;
	options_editDialog.title = "Indicador";
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogo";
	
	options_editDialog.href = "progIndicadorModalJson?idActividad=" + $('#idActividad').val() + "&idPrograma=" + 
		$('#idPrograma').val() + "&idIndicador=" + idIndicador + "&volver=" + "true";
	
	$.struts2_jquery.bind($('#dialogo'),options_editDialog);

	$('#dialogo').empty().html('');
	$('#dialogo').dialog('open');
 }
 
 /**
  * Función para cuando se desea cerrar un formulario que se encuentra en una ventana modal.
  *  Se añade una confirmación de que va a salir del formulario sin guardar los cambios.
  * @param dialogoModal Diálogo del formulario.
  * @param dialogoCerrar Diálogo de la confirmación de cerrar.
  */
 function volverModal(dialogoVolver) {
 	
 	var modificado = $("#modificado").val();
 	if (modificado == 1) {
 		$('#' + dialogoVolver).dialog('moveToTop');
 		
 		$('#' + dialogoVolver).dialog('open');
 		$('#' + dialogoVolver).dialog('close');
 		
 		$('#' + dialogoVolver).dialog('open');
 	} else {
 		cerrarDialog('dialogo');
 		openDialogListIndicadores();
 	}
 }

 /**
  * Al confirmar el diálogo modal de la confirmación de volver desde el formulario de un indicador,
  *  el sistema vuelve al modal del listado de indicadores.
  * @param dialogVolver Diálogo volver.
  */
 function confirmarDialogVolverModal(dialogVolver) {
	 
	cerrarDialog(dialogVolver);
 
	cerrarDialog('dialogo');
	
	openDialogListIndicadores();
 }
 
 /**
  * Abre el diálogo modal del listado de indicadores.
  */
 function openDialogListIndicadores() {
	 
	var options_editDialog = {};
	options_editDialog.height = 630;
	options_editDialog.width = 494;
	options_editDialog.title = "Indicador";
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogo";
	
	options_editDialog.href = "progIndicadorListModalJson?idActividad=" + $('#idActividad').val() + "&idPrograma=" + $('#idPrograma').val();
	
	$.struts2_jquery.bind($('#dialogo'),options_editDialog);
	
	$('#dialogo').empty().html('');
	$('#dialogo').dialog('open');
 }
 
 /**
  * Selecciona el colectivo del programa. 
  *  Si se accede a la opción de otros colectivos, hay que habilitar el campo correspondiente.
  */
 function seleccionarColectivo() {
	 marcaModificadoValor('modificadoPrograma');
	 
	 if ($("#nombreColectivo").val() == -1) {
		 $("#otroColectivo").attr("style", "display:block");
	 }
	 else {
		 $("#otroColectivo").attr("style", "display:none");
	 }
 }
 
/**
 * Envía los avisos a los responsables de los programas que pertenecen a las entidades seleccionadas.
 * @param action Action al que se redirige.
 * @param form Formulario.
 */
function enviaAviso(action, form) {

	var s; 
	s = $("#listado").jqGrid('getGridParam','selarrrow');
	
	if (s!="") {
		document.getElementById("idsSeleccionados").value = s;
		
		enviaFormName(action, form);
	} else {
		alerta("Debe seleccionar alguna entidad.");
	}
	
}


/**
 * Obtiene el listado de localidades para la provincia seleccionada.
 */
function obtieneComboLocalidades() {

	$("#modificado").attr("value",1);

	var idProvincia = $('#provinciaAct').val();
	
	// Si se ha seleccionado la provincia, se obtienen las localidades, sino se deshabilitan
	if (idProvincia != null && idProvincia != '') {
		
		var url = "obtieneComboLocalidades?idProvincia="+idProvincia;

		$("#contenedor").empty().html('<img src="images/ajax-loader.gif" title="Cargando..."/>');
		
		$.getJSON(url, function(result) {
		    var options = $("#localidadAct");
			options.empty().html('');

			options.append($("<option />").val(0).text(""));
		    $.each(result, function(i, item) {
		        options.append($("<option />").val(item.id).text(item.nombre).attr("title", item.nombre));
		    });

		    $('#localidadAct').removeAttr('disabled');
		    $('#localidadAct').removeClass('disable');
		    
		    $("#contenedor").empty().html('');
				    
		});
		
	} else {
		$("#localidadAct").empty().html('');
		$('#localidadAct').attr('disabled', 'disabled');
		$('#localidadAct').addClass('disable');
	}
}
