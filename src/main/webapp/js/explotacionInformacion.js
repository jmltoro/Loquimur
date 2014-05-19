/**************************************************************************************************/
/**                          FUNCIONES PARA LA GENERACIÓN DE INFORMES                            **/
/**************************************************************************************************/

/**
 * Modifica el parametro donde se cargarán los datos de las convocatorias seleccionadas.
 */
function selectConvocatoriaInformes(nombreConvocatoria, idConvocatoria, urlConvocatoria) {
	$('#idCampoNombre').val(nombreConvocatoria);	
	$('#idCampoId').val(idConvocatoria);
	$('#urlInforme').val(urlConvocatoria);

	if (nombreConvocatoria == 'nombreConvocatoriaTecnico') {
		// Informa la accion que se ejecutará una vez se haya seleccionado la entidad y la convocatoria
		$("#accion").val("obtieneProgramasEntidad()");
	} else {
		$("#accion").val("");
	}
	
	// Abre la ventana de selección de convocatorias
	selectConvocatoriasInforme();
}


/**
 * Muestra la ventana de selección de entidades.
 */
function selectEntidadInforme() {
	$("#accion").val("obtieneProgramasEntidad()");
	selectEntidad();
}

/**
 * Elimna una convocatoria de la lista de convocatorias y recarga el listado.
 */
function eliminaConvocatoria(nombreConvocatoria, idConvocatoria, urlConvocatoria) {
	$('#idCampoNombre').val(nombreConvocatoria);	
	$('#idCampoId').val(idConvocatoria);
	$('#urlInforme').val(urlConvocatoria);
	
	var valor = $('#'+nombreConvocatoria).val();
	
	
	// Si se ha seleccionado algún valor se elimina del listado de ids y se refresca la lista
	if (valor != null && valor != '') {
		var arrayIds = $('#'+idConvocatoria).val().split(",");
		$('#'+idConvocatoria).val("");
		var finalIds = ",";
		for (i in arrayIds) {
			if (arrayIds[i] != valor) {
				finalIds += arrayIds[i] + ",";
			}
		}
		$('#'+idConvocatoria).val(finalIds);
				
		obtieneConvocatorias();	
	}
	
}

/**
 * Muestra la ventana de selección de convocatorias
 */
function selectConvocatoriasInforme() {
	
	var options_editDialog = {};
	options_editDialog.height = 550;
	options_editDialog.width = 600;
	options_editDialog.title = getTituloSeleccion("convocatoria");
	options_editDialog.position = "center";
	options_editDialog.draggable = true;
	options_editDialog.resizable = false;
	options_editDialog.autoopen = false;
	options_editDialog.modal = true;
	options_editDialog.jqueryaction = "dialog";
	options_editDialog.id = "dialogoSeleccion";
	
	options_editDialog.href = "seleccionConvocatoriasInformesJson";
	
	$.struts2_jquery.bind($('#dialogoSeleccion'),options_editDialog);
	
	$('#dialogoSeleccion').empty().html('');
	$('#dialogoSeleccion').dialog('open');
}

/**
 * Obtiene los programas de asociados a una entidad y los carga en el combo mediante ajax.
 */
function obtieneProgramasEntidad() {
	var convocatorias = $('#idsConvocatoriasTecnico').val();
	var entidad = $('#entidad').val();
	//var tipoSolicitud = $('#nombreTipoProcedimientoTecnico').val();
	var modalidad = $('#nombreModalidadTecnico').val();
	
	$("#labelConvocatoria").attr("style","visibility:hidden;");
	$("#labelEntidad").attr("style","visibility:hidden;");
	
	// Si se ha informado la convocatoria y la entidad, se obtienen los programas de dicha entidad
	// Además, se debe filtrar por el tipo de procedimiento y modalidad
	if (convocatorias != null && entidad != null 
		&& convocatorias != '' && entidad != '') {
		var campoId = $('#idCampoId').val();
		
		var url = "obtieneProgramasEntidad?idsConvocatorias="+convocatorias+"&informeTecnico.entidad.id="+entidad
			+"&informeTecnico.idModalidad="+modalidad;

		$("#contenedor").empty().html('<img src="images/ajax-loader.gif" title="Cargando..."/>');
		
		$.getJSON(url, function(result) {
		    var options = $("#programa");

			options.empty().html('');

			options.append($("<option />").val(0).text(""));
		    $.each(result, function(i, item) {		    	
		    	if (item.nombre != null) {		    		
		    		options.append($("<option />").val(item.id).text(item.nombre).attr("title", item.nombre));
		    	}
		    });		    
		    $('#programa').removeAttr('disabled');
		    $('#programa').removeClass('disable');
		    $("#contenedor").empty().html('');
				    
		});
		
	} 

	
	// Comprueba se haya informado la convocatoria
	if (convocatorias == null || convocatorias == '') {
		$("#labelConvocatoria").html(getMensajeCampoObligatorio("convocatoria"));
		$("#labelConvocatoria").attr("style","visibility:visible;");
	}

	if (entidad == null || entidad == '') {
		$("#labelEntidad").html(getMensajeCampoObligatorio("entidad"));
		$("#labelEntidad").attr("style","visibility:visible;");
	}
}

/**
 * Obtiene los programas de asociados a una entidad y los carga en el combo mediante ajax.
 */
function obtieneConvocatorias() {

	var campoNombre = $('#idCampoNombre').val();
	var campoId = $('#idCampoId').val();
	var urlInforme = $('#urlInforme').val();
	
	var ids = $('#'+campoId).val();
	
	var url = urlInforme+"?"+campoId+"="+ids;
		
	$("#contenedorConvocatoria_"+campoNombre).empty().html('<img src="images/ajax-loader.gif" title="Cargando..."/>');
		
	$.getJSON(url, function(result) {

		var campoNombre = $('#idCampoNombre').val();
	    var options = $("#"+campoNombre);

		options.empty().html('');
		$("#contenedorConvocatoria_"+campoNombre).empty().html('');
		if (result != null && result != '') {
			$.each(result, function(i, item) {
				options.append($("<option />").val(item.id).text(item.nombreConvocatoria).attr("title", item.nombreConvocatoria));
			});
		}
	    
	});

	// Obtiene los programas para las convocatorias y la entidad seleccionada sólo para informes técnicos
	if (campoId == 'idsConvocatoriasTecnico') {
		obtieneProgramasEntidad();
	}
}

/**
 * Valida que los campos obligatorios se hayan informado.
 */
function validaInformeTecnico(url) {
	var convocatorias = $('#idsConvocatoriasTecnico').val();
	var entidad = $('#entidad').val();

	var correcto = true;
	$("#labelConvocatoria").attr("style","visibility:hidden;");
	$("#labelEntidad").attr("style","visibility:hidden;");
	$("#labelPrograma").attr("style","visibility:hidden;");

	// Comprueba se haya informado la convocatoria
	if (convocatorias == null || replaceAll(convocatorias,",","") == '') {
		correcto = false;
		$("#labelConvocatoria").html(getMensajeCampoObligatorio("convocatoria"));
		$("#labelConvocatoria").attr("style","visibility:visible;");
	}

	if (entidad == null || entidad == '') {
		correcto = false;
		$("#labelEntidad").html(getMensajeCampoObligatorio("entidad"));
		$("#labelEntidad").attr("style","visibility:visible;");
	}
	
	var campoProg = $("#programa");	
	if (campoProg.val() == null || campoProg.val() == 0) {
		$("#labelPrograma").html(getMensajeCampoObligatorio("programa"));
		$("#labelPrograma").attr("style","visibility:visible;");
		//alerta(getAvisoNoRegistrosExport());
		correcto = false;
	} else
	// Envia el formulario para generar el informe
	if (correcto) {
		enviaFormName(url, 'informeTecnicoForm');
	}
}

/**
 * Recarga el combo de modalidades en función de la línea de subvención seleccionado.
 */
function obtieneModalidades(url, idParam, idComboTipoProc, idComboModalidad) {
	var tipoProc = $('#'+idComboTipoProc).val();

	if (tipoProc != null && tipoProc != '') {
		$("#contenedorModalidad").empty().html('<img src="images/ajax-loader.gif" title="Cargando..."/>');

		url += "?"+idParam+"="+tipoProc;
		$.getJSON(url, function(result) {
		    var options = $("#"+idComboModalidad);
	
			options.empty().html('');
	
			options.append($("<option />").val("").text(""));
		    $.each(result, function(i, item) {
		        options.append($("<option />").val(item.id).text(item.descripcion).attr("title", item.descripcion));
		    });
	
		    $('#'+idComboModalidad).removeAttr('disabled');
		    $('#'+idComboModalidad).removeClass('disable');
		    $("#contenedorModalidad").empty().html('');
		});
		
	} else {
		var options = $("#"+idComboModalidad);
		options.empty().html('');
		options.attr("disabled","disabled");
		options.addClass('disable');
	}
}

/**
 * Obtiene el resultado del informe global y lo muestra en la pantalla.
 */
function generarInformeGlobal() {
	$('#dialogoInformeGlobal').empty().html('');
	$('#dialogoInformeGlobal').dialog('open');	
}

/**
 * Genera el informe de consulta.
 */
function generarInformeConsulta() {
	
	var datos = $('#informeConsultaForm').serialize();
	
	// Si las cantidades son correctas se envía el formulario
	if (validaInformeConsulta()) {
		
		$.ajax({
			  type: 'POST',
			  url: 'generarInformeConsultaJson',
			  data: datos,
			  datatype : "json",
			  success: function(result) {				  
				  if (result != null && result != '') {
				  	  $('#informeConsultaForm').submit();
			  	  } else {
			  		  alerta(getAvisoNoRegistrosExport());
			  	  }
			  }
			});
	}
	
}

/**
 * Comprueba el valor del rango inicio para habilitar o no el rango final.
 * @return
 */
function habilitaRangoFin(rangoIni, nombreRangoFin) {
	var rangoFin = $('#'+nombreRangoFin);
	if (rangoIni.value == '') {
		rangoFin.addClass('disable');
		options.attr("disabled","disabled");
		
	} else {
		rangoFin.removeAttr('readonly');
		rangoFin.removeClass('disable');
	}
}


/**
 * Recarga el combo de localidades en función de la provincia seleccionado.
 */
function obtieneLocalidades(url, idParam, idComboTipoProc, idComboLocalidad) {
	var tipoProc = $('#'+idComboTipoProc).val();

	if (tipoProc != null && tipoProc != '') {
		$("#contenedorLocalidad").empty().html('<img src="images/ajax-loader.gif" title="Cargando..."/>');

		url += "?"+idParam+"="+tipoProc;
		$.getJSON(url, function(result) {
		    var options = $("#"+idComboLocalidad);
	
			options.empty().html('');
	
			options.append($("<option />").val("").text(""));
		    $.each(result, function(i, item) {
		        options.append($("<option />").val(item.id).text(item.nombre).attr("title", item.nombre));
		    });
		    $('#'+idComboLocalidad).removeAttr('disabled');
		    $('#'+idComboLocalidad).removeClass('disable');
		    $("#contenedorLocalidad").empty().html('');
		});
		
	} else {
		var options = $("#"+idComboLocalidad);
		options.empty().html('');
		options.attr("disabled","disabled");
		options.addClass('disable');
	}
}

/**
 * Habilita/Deshabilita el combo de organismo según el informe global seleccionado. 
 */
function habilitaComboOrganismo() {
	var tipoInforme = $("#nombreTipoInformeGlobal");
	var organismo = $("#nombreOrganismo");

	if (tipoInforme.val() == 38) {
		organismo.attr("disabled","disabled");
		organismo.addClass('disable');
	} else {
		organismo.removeAttr('disabled');
		organismo.removeClass('disable');
	}
	
}