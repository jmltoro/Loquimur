///////////////////////////////////////////////////////////
// Funciones de utilidad y de uso genérico en el Sistema //
///////////////////////////////////////////////////////////

var xmlhttp;
var receiveFunctionName;

//Las dos siguiente funciones son para conseguir hacer llamadas ajax y que se refresque únicamente una parte de la página
function loadXMLDoc(url, functionName){
	xmlhttp = null;
	// code for Mozilla, etc.
	if (window.XMLHttpRequest){
	  xmlhttp = new XMLHttpRequest();
	}  
	else if (window.ActiveXObject){
	  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
	 }
	 if(xmlhttp != null) {
		  receiveFunctionName = functionName;
		  xmlhttp.onreadystatechange = state_Change;
		  xmlhttp.open("POST",url,true);
		  xmlhttp.send(null);
	 } 
	 else{
	  alerta(getMensajeXMLHTTP());
	}
}


function isNotEmpty(value)
{
	var em = false;
	if(value && (value != null) && (value != undefined))
	{
	em = true;
	}
	else
	{
	if($.trim(value) != "")
	{
	em = true;
	}
	}
	return em;
}


function isEmpty(value)
{
	return !isNotEmpty(value);
}

function state_Change(){        // if xmlhttp shows "loaded"
	 if (xmlhttp.readyState==4){        // if "OK"
		   if (xmlhttp.status==200){
			    var responseText = xmlhttp.responseText;
			    eval(receiveFunctionName);
		   } 
		   else {
			     alerta(getMensajeXML());
		   }
	 }
}


// Funciones genéricas para el envío de formularios
function enviaFormulario(valor) {
	document.listadoF.idSeleccionado.value = valor;
	document.listadoF.submit();
}

//Funciones de utilidad y de uso genérico en el Sistema

function enviaFormularioUrl(valor, url) {
	document.getElementById("idSeleccionado").value = valor;
	document.listadoF.action = url;
	document.listadoF.submit();
}

function enviaFormularioUrlName(valor, url, vform) {
	document.getElementById("idSeleccionado").value = valor;
	
	var formulario = document.getElementsByName(vform)[0];	
	formulario.action = url;
	formulario.submit();
}

function enviaFormularioValorName(valor, vform) {
	document.getElementById("idSeleccionado").value = valor;
	var formulario = document.getElementsByName(vform)[0];	
	formulario.submit();
}

function enviaFormName(url, vform) {
	$("#"+vform).attr("action", url);
	$("#"+vform).submit();
}

function removeSelectedId(url, form) {
	var s; 
	s = $("#listado").jqGrid('getGridParam','selarrrow');
	
	if (s!="") {
		document.getElementById("idsSeleccionados").value = s;
		
		alerta_confirmacion(url, getConfirmEliminarRegistros(), 4, form);
	} else {
		alerta(getAvisoSeleccionarAlguno("eliminar"));
	}
}

function aHistoricoSelectedId(url, form) {
	var s; 
	s = $("#listado").jqGrid('getGridParam','selarrrow');
	
	if (s!="") {
		document.getElementById("idsSeleccionados").value = s;
    	
		alerta_confirmacionHeight(url, getConfirmHistoricoEvaluacion(), 4, form, 180);
	} else {
		alerta(getAvisoSeleccionarAlguno("enviarlo a histórico"));
	}
}

//Funciones de utilidad y de uso genérico en el Sistema

function enviaFormularioHist(idEntidad, idConvocatoria, convocatoriaActiva, url) {
	document.getElementById("idEntidad").value = idEntidad;
	document.getElementById("idConvocatoria").value = idConvocatoria;
	document.getElementById("lgConvocatoriaActiva").value = convocatoriaActiva;
	document.listadoF.action = url;
	document.listadoF.submit();
}


//Funcion para cuando se desea volver de un formulario generico a su listado correspondiente
//Se le mete una confirmación para que el usuario este seguro de que va a guardar la info
//Se agrega la variable tienePermisos, si es nula, se actúa como si valiese 0
//si no es nula, se ve si la persona tiene permisos de modificacion
//si no los tiene, no saldrá el mensaje
function volver(url){
	var modificado = $("#modificado").val();
	
	if (modificado==1) {
		document.getElementById('urlVolver').value = url;
		
		$('#confirmarDialogVolver').dialog('open');
	} else {
		location.href=url;
	}
}

function volverSubmit(url, form){
	var modificado = $("#modificado").val();
	
	if (modificado==1) {	
		alerta_confirmacionHeight(url, getConfirmSalirSinGuardar(), 4, form, 160);
	} else {
		enviaFormName(url, form);
	}
}

function volverSubmitModificado(url, form, modificado){
	var modificado = $("#" + modificado).val();

	if (modificado==1) {	
		alerta_confirmacion(url, getConfirmSalirSinGuardar(), 4, form);
	} else {
		enviaFormName(url, form);
	}
}

/**
 * Función para cuando se desea cerrar un formulario que se encuentra en una ventana modal.
 *  Se añade una confirmación de que va a salir del formulario sin guardar los cambios.
 * @param dialogoModal Diálogo del formulario.
 * @param dialogoCerrar Diálogo de la confirmación de cerrar.
 */
function cerrarModal(dialogoModal, dialogoCerrar) {
	
	var modificado = $("#modificado").val();
	if (modificado == 1) {
		$('#' + dialogoCerrar).dialog('moveToTop');
		
		$('#' + dialogoCerrar).dialog('open');
		$('#' + dialogoCerrar).dialog('close');
		
		$('#' + dialogoCerrar).dialog('open');
	} else {
		cerrarDialog(dialogoModal);
	}
}


function alerta_confirmacion(url, msj, tipo, form){
	
	document.getElementById('label_confirmacion').innerHTML = msj;
	document.getElementById('urlConfirmar').value = url;

	document.getElementById('tipoAccion').value = tipo;
	document.getElementById('formularioConfirm').value = form;

	$('#confirmarDialogAccion').dialog('open');

	
}

function alerta_confirmacionHeight(url, msj, tipo, form, height){
	$( "#confirmarDialogAccion" ).dialog( "option", "height", height);
	alerta_confirmacion(url, msj, tipo, form);
}

function alerta(msj){
	document.getElementById('label_msj').innerHTML = msj;
	$('#dialogAlerta').dialog('open');
}

function alertaDialogo (msj, dialogo) {
	document.getElementById('label_msj_alert').innerHTML = msj;
	$('#' + dialogo).dialog('open');
}

function confirmarDialogVolver() {
	cerrarDialog('confirmarDialogVolver');
	location.href=document.getElementById('urlVolver').value;
}

/**
 * Desde un formulario de una ventana modal en la que el usuario ha modificado algún campo y ha accedido a la opción de cerrar,
 *  el sistema le muestra una ventana de confirmación indicando que si acepta los datos no serán grabados.
 *  Si el usuario acepta, deberá cerrarse tanto la ventana de confirmación como la del formulario.
 * @param dialogVolver Ventana modal de la confirmación de volver.
 * @param dialogForm Ventana modal del formulario.
 */
function confirmarDialogCerrarModal(dialogVolver, dialogForm) {
	cerrarDialog(dialogVolver);
	cerrarDialog(dialogForm);
}

/**
 * Cierra el dialog nombreDialog
 */
function cerrarDialog(nombreDialog) {
	$('#' + nombreDialog).dialog('close');	
}

function confirmarDialogConfirmacion() {
	cerrarDialog('confirmarDialogAccion');
	var accion = document.getElementById('tipoAccion').value;
	
	if (accion==1){
		var url = document.getElementById('urlConfirmar').value;
		setTimeout("loadXMLDoc('"+url+"','recargaListado()')", 0);
		marcaModificado();
	} else if (accion==2) {
		location.href=document.getElementById('urlConfirmar').value;
	} else if (accion==3) {
		var url = document.getElementById('urlConfirmar').value;
		var formulario = "#" + url;

		$(formulario).submit();
	} else if (accion==4) {
		
		var url = document.getElementById('urlConfirmar').value;
		var form = document.getElementById('formularioConfirm').value;
		
		var formulario = "#" + form;
		$(formulario).attr("action", url);
		$(formulario).submit();
	} else if (accion==5) {
		
		var url = document.getElementById('urlConfirmar').value;
		var id = document.getElementById('id');
		
		location.href= url+'?id='+id.value;
	} else if (accion==6) {
		
		var url = document.getElementById('urlConfirmar').value;
		var form = document.getElementById('formularioConfirm').value;
		
		$(url).val(form);
	} else if(accion == 7) {
		history.back();
	} else if (accion == 8) {		
		var url = document.getElementById('urlConfirmar').value;		
		eval(url);
	}
}


function cancelaValidacion(vForm) {
	$("#"+vForm).validate().cancelSubmit = true;
	
}
// http://www.cambiaresearch.com/c4/702b8cd1-e5b0-42e6-83ac-25f0306e3e25/Javascript-Char-Codes-Key-Codes.aspx
var teclas = {
	TAB: 9,
	RETROCESO: 8,
	ENTER: 13,
	ESPACIO: 32,
	DELETE: 46,
	CERO: 48,
	CERO_NUMPAD: 96,
	NUEVE: 57,
	NUEVE_NUMPAD: 105,
	PUNTO: 190,
	PUNTO_NUMPAD: 110,
	COMA: 188,
	MAS: 107,
	MENOS: 109,
	a: 65,
	z: 90,
	TILDE: 222,
	ENYE: 192
};


$(function(e) {
	$(".js-soloNumerosDecimales").keydown(function(e) {
		return soloNumerosDecimales(e);
	});
	$(".js-soloRangoMoneda").keydown(function(e) {
		return soloRangoMoneda(e);
	});
	$(".js-soloPorcentaje").keydown(function(e) {
		return soloPorcentaje(e);
	});
	$(".js-soloNumeros").keydown(function(e) {
		return soloNumeros(e);
	});
	$(".js-soloTelefonos").keydown(function(e) {
		return soloTelefonos(e);
	});
});

function soloNumeros(evt){
	if (!evt) {
		evt = window.event;
	}
	
	var key = !!evt.which ? evt.which : evt.keyCode;
	
	return (key <= teclas.ENTER 
				|| (key >= teclas.CERO && key <= teclas.NUEVE) 
				|| (key >= teclas.CERO_NUMPAD && key <= teclas.NUEVE_NUMPAD)
				|| key == teclas.DELETE);
}

function soloNumerosEnteros(evt){
	if (!evt) {
		evt = window.event;
	}
	
	var key = !!evt.which ? evt.which : evt.keyCode;
	
	return (key <= teclas.ENTER 
				|| (key >= teclas.CERO && key <= teclas.NUEVE)
				|| (key >= teclas.CERO_NUMPAD && key <= teclas.NUEVE_NUMPAD)
				|| key == teclas.DELETE);
}

function soloNumerosDecimales(evt){
	if (!evt) {
		evt = window.event;
	}
	var key = !!evt.which ? evt.which : evt.keyCode;
	
	return (key <= teclas.ENTER 
				|| (key >= teclas.CERO && key <= teclas.NUEVE) 
				|| (key >= teclas.CERO_NUMPAD && key <= teclas.NUEVE_NUMPAD)
				|| key == teclas.DELETE
				|| key == teclas.COMA
				|| key == teclas.PUNTO
				|| key == teclas.PUNTO_NUMPAD);
}

function soloRangoMoneda(evt){
	if (!evt) {
		evt = window.event;
	}
	
	var key = !!evt.which ? evt.which : evt.keyCode;
	
	return (key <= teclas.ENTER 
			|| (key >= teclas.CERO && key <= teclas.NUEVE) 
			|| (key >= teclas.CERO_NUMPAD && key <= teclas.NUEVE_NUMPAD)
			|| key == teclas.DELETE
			|| key == teclas.COMA
			|| key == teclas.PUNTO
			|| key == teclas.PUNTO_NUMPAD
			|| key == teclas.MENOS);
}

function soloPorcentaje(evt) {
	if (!evt) {
		evt = window.event;
	}
	var key = !!evt.which ? evt.which : evt.keyCode;
	
	return (key <= teclas.ENTER 
			|| (key >= teclas.CERO && key <= teclas.NUEVE)
			|| (key >= teclas.CERO_NUMPAD && key <= teclas.NUEVE_NUMPAD)
			|| key == teclas.DELETE
			|| key == teclas.COMA);
}

function soloTelefonos(evt){
	if (!evt) {
		evt = window.event;
	}
	
	var key = !!evt.which ? evt.which : evt.keyCode;
	
	return (key <= teclas.ENTER 
				|| (key >= teclas.CERO && key <= teclas.NUEVE) 
				|| (key >= teclas.CERO_NUMPAD && key <= teclas.NUEVE_NUMPAD)
				|| key == teclas.DELETE
				|| key == teclas.ESPACIO
				|| key == teclas.MAS
				|| key == teclas.MENOS);
}

function replaceAll(text, busca, reemplaza ){
	while (text.toString().indexOf(busca) != -1)
		text = text.toString().replace(busca,reemplaza);
	return text;
}

function marcaModificado(){
	$("#modificado").attr("value",1);
}

function marcaModificadoValor(valor){
	$("#" + valor).attr("value",1);
}

function confirma(texto, accionSi, accionNo) {
	var capa = $("#utilsConfirma"); 
	if (!capa.size()) {
		capa = $('<div id="utilsConfirma" style="display: none;"></div>').appendTo($("body"));
	}
	capa.html(texto);
	capa.dialog({
		modal: true,
		title: getTituloVentanaConfirm(),
		dialogClass: "utilsConfirma",
		buttons: [
			{
				text: getCancelarVentanaConfirm(),
				click: function() {
					try {
						accionNo();
					} catch (e) {
						try {
							eval(accionNo);
						} catch (e) {
						}
					}
					$(this).dialog("close");
				}
			},
			{
				text: getAceptarVentanaConfirm(),
				click: function() {
					try {
						accionSi();
					} catch (e) {
						try {
							eval(accionSi);
						} catch (e) {
						}
					}
					$(this).dialog("close");
				}
			}
		]
	});
}

/**
 * Muestra la ventana de selección de convocatorias
 */
function selectConvocatoria() {
	
	var options_editDialog = {};
	options_editDialog.height = 500;
	options_editDialog.width = 600;
	options_editDialog.title = getTituloSeleccion("convocatoria");
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogoSeleccion";
	
	options_editDialog.href = "seleccionConvocatoriaJson";
	
	$.struts2_jquery.bind($('#dialogoSeleccion'),options_editDialog);
	
	$('#dialogoSeleccion').empty().html('');
	$('#dialogoSeleccion').dialog('open');
}

/**
 * Muestra la ventana de selección de un protocolo de evaluación
 */
function selectProtocolo() {
	
	var options_editDialog = {};
	options_editDialog.height = 500;
	options_editDialog.width = 600;
	options_editDialog.title = getTituloSeleccion("protocolo de evaluación");
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogoSeleccion";
	
	options_editDialog.href = "seleccionProtocoloJson";
	
	$.struts2_jquery.bind($('#dialogoSeleccion'),options_editDialog);
	
	$('#dialogoSeleccion').empty().html('');
	$('#dialogoSeleccion').dialog('open');
}

/**
 * Muestra la ventana de selección de usuario responsable
 */
function selectResponsable() {
	
	var options_editDialog = {};
	options_editDialog.height = 500;
	options_editDialog.width = 600;
	options_editDialog.title = getTituloSeleccion("responsable");
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogoSeleccion";
	
	options_editDialog.href = "seleccionResponsableJson";
	
	$.struts2_jquery.bind($('#dialogoSeleccion'),options_editDialog);
	
	$('#dialogoSeleccion').empty().html('');
	$('#dialogoSeleccion').dialog('open');
}

/**
 * Muestra la ventana de selección de entidades
 */
function selectEntidad() {
	
	var options_editDialog = {};
	options_editDialog.height = 500;
	options_editDialog.width = 600;
	options_editDialog.title = getTituloSeleccion("entidad");
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogoSeleccion";

	options_editDialog.href = "seleccionEntidadJson";

	$.struts2_jquery.bind($('#dialogoSeleccion'),options_editDialog);

	$('#dialogoSeleccion').empty().html('');
	$('#dialogoSeleccion').dialog('open');
}

/**
 * Muestra la ventana de selección de programas
 */
function selectPrograma() {
	
	var options_editDialog = {};
	options_editDialog.height = 500;
	options_editDialog.width = 600;
	options_editDialog.title = getTituloSeleccion("programa");
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogoSeleccion";
	
	// Indica si se debe filtrar los programas en estado consolidado: 
	// true indica que sólo se mostrarán los programas consolidados o superior
	var consolidados = $('#consolidados').val();
	
	var idEntidad = $('#idEntidad').val();	
	options_editDialog.href = "seleccionProgramaJson?programaVista.idEntidad=" + idEntidad + "&consolidados=" + consolidados;
	
	$.struts2_jquery.bind($('#dialogoSeleccion'),options_editDialog);
	
	$('#dialogoSeleccion').empty().html('');
	$('#dialogoSeleccion').dialog('open');
}

/**
 * Pliega y despliega un acordeón.
 * @param acordeon: id del div que se va a plegar/desplegar
 */
function clickAcordeon(acordeon){
	
	 var numAcordeon = $('#numAcordeon').val();
	 for(i = 0; i < numAcordeon; i++){
		if(i == acordeon) {
			
		} else {
			$('#acordeon'+i).slideUp("slow");
		}
	 }
	 if($('#acordeon'+acordeon).is(":hidden")){
		$('#acordeon'+acordeon).slideDown("slow");
		$('.slider').slideUp('fast'); 
	 	$('.slider').slideDown('slow'); 


	 	$('#botonAyuda').focus();
	 } else{
		 $('#acordeon'+acordeon).slideUp("slow");
	 }
}

function clickAcordeonId(id) {
	if($('#' + id).is(":hidden")){
		$('#' + id).slideDown("slow");
	 } else{
		$('#' + id).slideUp("slow");
	 }
}

/**
 * Despliega todos los acordeones de la página que compartan un estilo.
 * @param styleDiv Estilo de los acordeones.
 */
function desplegarAcordeones (styleDiv) {
	$('.' + styleDiv).slideDown('slow');
}

/**
 * Pliega todos los acordeones de la página que compartan un estilo.
 * @param styleDiv Estilo de los acordeones.
 */
function plegarAcordeones (styleDiv) {
	$('.' + styleDiv).slideUp('slow');
}

/**
 * Funcion para exportar listados a excel.
 * @param url URL donde se envían los resultados.
 */
function Exportar(url) {
	
	var id = jQuery("#listado").jqGrid('getDataIDs');
	if (id==""){
		alerta(getAvisoNoRegistrosExport());
	} else {						
		

		var values = {};
		$('.filterform :input').each(function(i, item) {	
			if (item.type != "button" && $(this).val() != "") {
				values[this.name] = $(this).val();
			}
		});	
		$('#exportForm').attr('action', url + '?' + $.param(values));
		$('#exportForm').submit();
	}
}


/**
* Comprueba si se debe enviar el formulario para cargar el listado.
*/
function compruebaConvocatoriaLinea() {    		
	var convocatoria = $("#idConvocatoria").val();
	var linea = $("#lineaSubvencion").val();
	
	if (convocatoria != null && convocatoria > 0
		&& linea != null && linea > 0) {
		
		enviaFormName('listadoProgramasSISS', 'importarSISSForm');
	}
}

/**
 * Acota el tamaño de los campos en los textareas.
 * @param texto Texto.
 * @param maxlong Longitud máxima deseada. 
 * @return True o False, según hay que acotar o no.
 */
/*function maxlengthTextarea(texto,maxlong) {
	var tecla, int_value, out_value;
	
	if (texto.value.length > maxlong) {
		in_value = texto.value;
		out_value = in_value.substring(0,maxlong);
		texto.value = out_value;
		return false;
	}
	return true;
}*/


//Para poner el timepicker en español
//jQuery(function($){
//		    $.timepicker.regional['es'] = {
//		        timeOnlyTitle: 'Seleccione Horario',
//		        timeText: 'Hora / Min.',
//		        hourText: 'Hora',
//		        minuteText: 'Minuto',
//		        secondText: 'Segundo',
//		        millisecText: 'Milisegundo',
//		        currentText: 'Ahora',
//		        closeText: 'Listo',
//		        ampm: false
//		    };
//		    $.timepicker.setDefaults($.timepicker.regional['es']);		
//});		    