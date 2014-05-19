
	function validaUsuario() {
		var validator = $("#usuarioForm").bind("invalid-form.validate", function() {
			
		}).validate({
			event: "blur",
			 rules: {
	        'usuario.usuario': {required:true, maxlength:30},
	        'usuario.password': {maxlength:100, clave:true},
	        'usuario.perfil': {required:true, maxlength:200}
	        
	      },
	      messages: {  
	    	  'usuario.usuario' : {required: getMensajeCampoObligatorio("nombre"), maxlength: getMensajeCampoLargo("nombre")},
	    	  'usuario.password' : {maxlength: getMensajeCampoLargo("contraseña del usuario/a"), password: getMensajeUsuarioIncorrecto("contraseña del usuario/a")},
	    	  'usuario.perfil' : {required: getMensajeCampoObligatorio("Perfil del usuario/a") , nif: getMensajeCampoIncorrecto("Perfil del usuario/a")}
	      },
	      debug: true,
	      errorElement: "label",
	      submitHandler: function(form){
	    	  
	    		  form.submit();
	      } 
		});
	
	}
	
		
	
  /* Valido el formato del un campo de  tipo fecha (Date). */
  validaFechaHoraF = function(value, element)  {
   if(isEmpty(value))  {
     return true;
   }
   else   {
    return value.match(/^\d{1,2}\/\d{1,2}\/\d{4} [0-2][0-9]:[0-5][0-9]$/); 
   	//return value.match(/^\d{1,2}\/\d{1,2}\/\d{4}$/);
   }
  };
  jQuery.validator.addMethod("validaFechaHora", validaFechaHoraF, "El formato de fecha correcta es: DD/MM/AAAA HH:MM");
	
  
	// Valido que Fecha Inicio sea menor que F. Fin ofertas
  validaMenorFinOfertasF = function(value,element) {
  	var correcto = true;
	var fhInicio = $('#fechInicioOfertas').val();
	var fhFin = $('#fechFinOfertas').val();
  	
	if (!validaRangoFechas(fhInicio, fhFin)) {
		correcto = false;
	}
	return correcto;	
  };
	jQuery.validator.addMethod("validaMenorFinOfertas", validaMenorFinOfertasF, "La FECHA INICIO OFERTAS debe ser menor que la FECHA FIN OFERTAS");  
  

	// Valido que Fecha Fin Ofertas sea menor que F. Apertura ofertas
  validaMenorAperturaF = function(value,element) {
  	var correcto = true;
	var fhInicio = $('#fechFinOfertas').val();
	var fhFin = $('#fechAperturaOfertas').val();
  	
	if (!validaRangoFechas(fhInicio, fhFin)) {
		correcto = false;
	}
	return correcto;	
  };
	jQuery.validator.addMethod("validaMenorApertura", validaMenorAperturaF, "La FECHA FIN OFERTAS debe ser menor que la FECHA APERTURA OFERTAS");  
	
	
  
  
  
	function validaPassword() {
		var validator = $("#usuarioPassForm").bind("invalid-form.validate", function() {
		}).validate({
			event: "blur",
			 rules: { 
				 'usuario.password': {required:true, maxlength:250, password:true},
			     'passwordConf': {required:true, maxlength:250, password:true}			
			},
		      messages: {
		    	  'usuario.password' : {required: getMensajeCampoObligatorio("contraseña"), maxlength: getMensajeCampoLargo("contraseña del usuario/a"), password: getMensajeUsuarioIncorrecto("contraseña del usuario/a")},
		    	  'passwordConf' : {required: getMensajeCampoObligatorio("confirmar contraseña"), maxlength: getMensajeCampoLargo("contraseña del usuario/a"), password: getMensajeUsuarioIncorrecto("contraseña del usuario/a")}
			 },
		      debug: true,
		      errorElement: "label",
		      submitHandler: function(form){
		          form.submit();
		      } 
		});
	}

		
	function validaEmail(texto) {
		return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(texto);
	}
	
	function validaConvocatoria() {
		var validator = $("#convocatoriaForm").bind("invalid-form.validate", function() {
			
		}).validate({
			event: "blur",
			 rules: {
	        'convocatoria.agnoStr': {required:true, number:true, min: 1900, max: 3000},
	        'convocatoria.tipoSolicitud.id': {required:true}
	      },
	      messages: {  
	    	  'convocatoria.agnoStr' : {required: getMensajeCampoObligatorio("año de la convocatoria"), number: getMensajeRangoAgno("año de la convocatoria", 1900, 3000), min: getMensajeRangoAgno("año de la convocatoria", 1900, 3000), max: getMensajeRangoAgno("año de la convocatoria", 1900, 3000)},
	    	  'convocatoria.tipoSolicitud.id' : {required: getMensajeCampoObligatorio("línea de subvención de la convocatoria")}
	      },
	      debug: true,
	      errorElement: "label",
	      submitHandler: function(form){
	          form.submit();
	      } 
		});

	}

		
	function validaPorcentaje() {
		var correcto = false;
		var porcentaje = $('#porcentajeConcedido').val();
		
		var labelCantidad = document.getElementById('labelCantidadConcedida');
		var labelPorcentaje = document.getElementById('labelPorcentaje');
		
		// Comprueba que sea un número válido
		if (/^-?(?:\d+|\d{1,3}(?:.\d{3})+)(?:\,\d+)?$/.test(porcentaje)) {			
			var porcFloat = parseFloat(porcentaje.replace(",","."));
			
			if (porcFloat >= 0 && porcFloat <= 100) {
				correcto = true;
				labelPorcentaje.style.visibility = 'hidden';
				labelCantidad.style.visibility = 'hidden';
			} else {
				$("#labelPorcentaje").html(getMensajeCampoIncorrecto("porcentaje"));
				labelPorcentaje.style.visibility = 'visible';
			}
		} else {	
			$("#labelPorcentaje").html(getMensajeCampoIncorrecto("porcentaje"));
			labelPorcentaje.style.visibility = 'visible';
		}
		
		return correcto;
	}
	
	function validaCantidadConcedida() {
		var correcto = false;
		var cantidad = $('#cantidadConcedida').val();
		var presupuestoTotal = $('#presupuestoVista').val();
		
		var labelCantidad = document.getElementById('labelCantidadConcedida');
		var labelPorcentaje = document.getElementById('labelPorcentaje');
		
		// Comprueba que sea un número válido
		if (validaPresupuesto(cantidad)) {			
			
			var porcFloat = parseFloat(cantidad.replace(".","").replace(",","."));
			if (porcFloat <= presupuestoTotal) {
				correcto = true;
				labelPorcentaje.style.visibility = 'hidden';
				labelCantidad.style.visibility = 'hidden';
			} else {
				$("#labelCantidadConcedida").html(getMensajeCampoIncorrecto("cantidad concedida"));
				labelCantidad.style.visibility = 'visible';
			}
		} else {		
			$("#labelCantidadConcedida").html(getMensajeCampoIncorrecto("cantidad concedida"));
			labelCantidad.style.visibility = 'visible';
		}
		
		return correcto;
	}
	
	function validaPresupuesto(valor) {
		var correcto = false;
		
		if (/^-?(?:\d+|\d{1,3}(?:.\d{3})+)(?:\,\d+)?$/.test(valor)) {
			correcto = true;
		}
		
		return correcto;
	}
	
	/**
	 * Valida la información introducida para generar el informe de consulta.
	 * @return true si la información es correcta.
	 */
	function validaInformeConsulta() {
		var correcto = true;
		
		// Comprueba el rango de subvención concedida
		correcto = compruebaRango('presupuesto concedido', 'labelConcedidoIni', 'labelConcedidoFin', 'subvencionConcedidaIni', 'subvencionConcedidaFin');
		
		// Comprueba el rango de justificación de gasto
		correcto = correcto 
			& compruebaRango('% de justificación de gasto', 'labelJustificacionIni', 'labelJustificacionFin', 'justificacionGastoIni', 'justificacionGastoFin');
		
		// Comprueba el rango de cumplimentación de indicadores
		correcto = correcto 
			& compruebaRango('% de cumplimentación de indicadores', 'labelCumplimentacionIni', 'labelCumplimentacionFin', 'cumplimentacionIndicadoresIni', 'cumplimentacionIndicadoresFin');
		
		return correcto;
	}
	
	/**
	 * Comprueba el rango de valores de los campos y muestra o no la etiqueta del error.
	 * @return true si todo está correcto.
	 */
	function compruebaRango(campo, etiquetaIni, etiquetaFin, campoIni, campoFin) {
		var correcto = true;
		
		var labelIni = $("#"+etiquetaIni);
		var labelFin = $("#"+etiquetaFin);
		
		labelIni.attr("style","visibility:hidden;");
		labelFin.attr("style","visibility:hidden;");
		
		var valorIni = $('#' + campoIni).val();
		var valorFin = $('#' + campoFin).val();
		
		if (valorIni != '' && !validaPresupuesto(valorIni)) {
			labelIni.html(getMensajeCampoIncorrecto(campo));
			labelIni.attr("style","visibility:visible;");
			
			correcto = false;
		} 
		if (valorIni != '' && valorFin != '' && !validaPresupuesto(valorFin)) {
			labelFin.html(getMensajeCampoIncorrecto(campo));
			labelFin.attr("style","visibility:visible;");
			correcto = false;
		} else if (valorIni != '' && valorFin != '' && parseFloat(valorIni) > parseFloat(valorFin)) {
			
			labelIni.html(getMensajeRangoValores("Desde", "Hasta"));
			labelIni.attr("style","visibility:visible;");
			correcto = false;			
		}
		
		return correcto;
	}

	function validaCalcularCriterioValoracion() {

		var rangoMinimo = $("#rangoInicio").val();
		var rangoMaximo = $("#rangoFin").val();
		var intCont;
		
		if (rangoMinimo=="" || rangoMaximo==""){
			alerta(getMensajeRangosCalcular("rango de inicio", "rango de fin"));
			
		} else if (parseInt(rangoMinimo) > parseInt(rangoMaximo)) {
			
			alerta(getMensajeRangoValores("rango m&iacute;nimo", "rango m&aacute;ximo"));
				
		} else if ((parseInt(rangoMaximo) - parseInt(rangoMinimo)) > 1000) {
			
			alerta(getMensajeRangoGrande());
				
		} else {
			var intervalo = (parseInt(rangoMaximo) - parseInt(rangoMinimo));
			
			if (1 > parseInt(intervalo)) {
				
				alerta(getMensajeIncorrecto("El rango seleccionado"));
			} else {	
				var html = "<div id='marco' style='font-size:12px' class='zona_formulario'>";
				
				html = html + "<table class='tabla_datos'><tbody>";
				
				for (var i=parseInt(rangoMinimo); i <= parseInt(rangoMaximo); i=parseInt(i)+1) {
					//alert(i);
					html = html + "<tr>";
					html = html + "<th class='w120'>"+i+".<input type='hidden' name='tipoValoracion.puntuacion["+i+"].puntuacion' value='"+i+"'/></th>";
					
					html = html + "<td><textarea name='tipoValoracion.puntuacion["+i+"].descripcion' id='valorPuntuacion["+i+"]' class='formulario wf43 h60'></textarea></td>";
					
					html = html + "</tr>";
				}
				html = html +"</tbody></table>";
				//alert(html);
				$("#calculado").val(1);		
				$('#valoresPuntuacion').slideUp('slow');
				$('#valoresPuntuacion').html(html).slideDown('slow'); 
			
			}
		}
	}

	function validaTipoValoracion() {

		var validator = $("#tipoValoracionForm").bind("invalid-form.validate", function() {
		
	}).validate({
		event: "blur",
		 rules: {
        'tipoValoracion.rangoInicio': {required:true, number:true},
        'tipoValoracion.rangoFin': {required:true, number:true},
        'tipoValoracion.puntuacion':  {maxlength:250}
      },
      messages: {
    	'tipoValoracion.rangoInicio': {required: getMensajeCampoObligatorio("rango de inicio"), maxlength : getMensajeCampoLargo("rango de inicio")},
        'tipoValoracion.rangoFin': {required: getMensajeCampoObligatorio("rango de fin"), maxlength : getMensajeCampoLargo("rango de fin")},
        'tipoValoracion.puntuacion': getMensajeCampoLargo("puntuaci&oacute;n") 
      },
      debug: true,
      errorElement: "label",
      submitHandler: function(form){
    	  
    	  var rangoMinimo = $("#rangoInicio").val();
    	  var rangoMaximo = $("#rangoFin").val();
    	  var validado = true;
    	  var validadotamano = true;
    	  
    	  var calculado = $("#calculado").val();
    	  
    	  if (calculado!=1) {
    		  alerta(getMensajeCalcularValoresCriterio());
    	  }
    	  else  {
    	  for (var i=parseInt(rangoMinimo); i <= parseInt(rangoMaximo); i=parseInt(i)+1) {
    		
    		  var nombre = "valorPuntuacion["+i+"]";
    		  
    		  var d = document.getElementById(nombre);
    		  
    		  //alert(d.value);
    		  if (d.value =="")
    			  validado = false;
    		  
    		  var a = d.value;
    		  
    		  if (parseInt(a.length) > parseInt(250)){
    			  validadotamano = false;
    		  }
    	  }
    	  
    	  if  (validado == false) {
    		  alerta(getMensajeValoresCriterioObligatorio());
    	  } else if (validadotamano == false) {
    		  alerta(getMensajeValoresCriterioLargo());
    	  } else {
    		  form.submit();
    	  }
    	}
      } 
	});
}

	
/**************************************************************************************************/
/**                          VALIDACIONES EN LA SECCIÓN DE PROGRAMAS                             **/
/**************************************************************************************************/

/**
 * Valida un rango de fechas.
 * @return true en caso de que la fecha de inicio sea anterior o igual a la de fin, false en caso contrario.
 */
function validaRangoFechas (strInicio, strFin) {
	
	var correcto = true;
	
	var fhInicio = $.datepicker.parseDate("dd/mm/yy", strInicio);
	var fhFin = $.datepicker.parseDate("dd/mm/yy", strFin);
	
	if (fhFin < fhInicio) {
		correcto = false;
	}
	
	return correcto;
}

/**
 * Valida el formulario del programa.
 */
function validaPrograma() {
	
	var correcto = true;
	
	var nombrePrograma = $('#nombrePrograma').val();
	var numRegistro = $('#numRegistro').val();
	var cantConcedida = $('#cantConcedida').val();
	var cantCofinanciada = $('#cantCofinanciada').val();
	var fhResolucion = $('#fhResolucion').val();
	var fhFin = $('#fhFin').val();
	var nombreColectivo = $('#nombreColectivo').val();
	
	/*if (nombrePrograma == null || nombrePrograma == '') {
		correcto = false;
		$("#labelNombre").html(getMensajeCampoObligatorio("nombre del programa"));
		$("#labelNombre").attr("style","visibility:visible;");
	}
	else {
		$("#labelNombre").attr("style","display:none;");
	}*/
	
	/*if (numRegistro == null || numRegistro == '') {
		correcto = false;
		$("#labelNumRegistro").html(getMensajeCampoObligatorio("n&uacute;mero de registro de centro"));
		$("#labelNumRegistro").attr("style","visibility:visible;");
	}
	else {
		$("#labelNumRegistro").attr("style","display:none;");
	}*/
	
	/*if (cantConcedida == null || cantConcedida == '') {
		correcto = false;
		$("#labelCantConcedida").html(getMensajeCampoObligatorio("cantidad concedida"));
		$("#labelCantConcedida").attr("style","visibility:visible;");
	}
	else if (cantConcedida!='' && !validaPresupuesto (cantConcedida)) {
		correcto = false;
		$("#labelCantConcedidaInc").html(getMensajeCampoIncorrecto("cantidad concedida"));
		$("#labelCantConcedidaInc").attr("style","visibility:visible;");
	}	
	else{
		$("#labelCantConcedidaInc").attr("style","display:none;");
		$("#labelCantConcedida").attr("style","display:none;");
	}
	*/
	
	if (cantCofinanciada!='' && !validaPresupuesto (cantCofinanciada)) {
		correcto = false;
		$("#labelCantCofinanciadaInc").html(getMensajeCampoIncorrecto("cantidad cofinanciada"));
		$("#labelCantCofinanciadaInc").attr("style","visibility:visible;");
	}
	else{
		$("#labelCantCofinanciadaInc").attr("style","display:none;");
	}
	
	/*if (fhResolucion == null || fhResolucion == '') {
		correcto = false;
		$("#labelFhResolucion").html(getMensajeCampoObligatorio("fecha de resoluci&oacute;n"));
		$("#labelFhResolucion").attr("style","visibility:visible;");
	}
	else {
		$("#labelFhResolucion").attr("style","display:none;");
	}*/
	
	if (nombreColectivo == 0) {
		correcto = false;
		$("#labelNombreColectivo").html(getMensajeCampoObligatorio("colectivo"));
		$("#labelNombreColectivo").attr("style","visibility:visible;");
	}
	else {
		$("#labelNombreColectivo").attr("style","display:none;");
	}
	if (!($("#otroColectivo").is(":hidden"))) {
		if ($("#otroCol").val() == null || $("#otroCol").val() == '') {
			correcto = false;
			$("#labelOtroColectivo").html(getMensajeCampoObligatorio("otro colectivo"));
			$("#labelOtroColectivo").attr("style","visibility:visible;");
		}
		else {
			$("#labelOtroColectivo").attr("style","display:none;");
		}
	}
	
	if (fhFin != null && fhFin != '' && !validaRangoFechas($("#fhResolucion").val(), $("#fhFin").val())) {
		correcto = false;
		$("#labelFhFinInicio").html(getMensajeRangoFechas("fecha de finalizaci&oacute;n", "fecha de resoluci&oacute;n"));
		$("#labelFhFinInicio").attr("style","visibility:visible;");
	}
	else {
		$("#labelFhFinInicio").attr("style","visibility:hidden;");
	}
	
	return correcto;
}

/**
 * Valida el formulario modal de un objetivo (o resultado) de un programa.
 */
function validaObjetivo() {
	
	var correcto = true;
	
	// Comprueba se haya informado la descripcion
	var descripcion = $('#objDescripcion').val();
	if (descripcion == null || descripcion == '') {
		correcto = false;
		$("#labelDescripcion").html(getMensajeCampoObligatorio("descripci&oacute;n"));
		$("#labelDescripcion").attr("style","visibility:visible;");
	}
	else if (descripcion.length > 2000) {
		correcto = false;
		$("#labelDescripcionLength").html(getMensajeCampoLargo("descripci&oacute;n"));
		$("#labelDescripcion").attr("style","display:none;");
		$("#labelDescripcionLength").attr("style","visibility:visible;");
	}
	else {
		$("#labelDescripcion").attr("style","display:none;");
		$("#labelDescripcionLength").attr("style","display:none;");
	}
	return correcto;
}

/**
 * Valida el formulario modal de una actividad de un resultado de un programa.
 */
function validaActividad () {

	var correcto = true;
	
	var descripcion = $('#descripcionAct').val();
	var fhInicio = $('#fhInicioAct').val();
	var fhFin = $('#fhFinAct').val();
	var fhFin = $('#fhFinAct').val();
	var presupuesto = $('#presupuestoAct').val();
	
	// Comprueba se hayan informado los campos obligatorios
	if (descripcion == null || descripcion == '') {
		correcto = false;
		$("#labelDescripcionAct").html(getMensajeCampoObligatorio("descripci&oacute;n"));
		$("#labelDescripcionAct").attr("style","visibility:visible;");
	}
	else if (descripcion.length > 2000) {
		correcto = false;
		$("#labelDescripcionActLength").html(getMensajeCampoLargo("descripci&oacute;n"));
		$("#labelDescripcionAct").attr("style","display:none;");
		$("#labelDescripcionActLength").attr("style","visibility:visible;");
	}
	else {
		$("#labelDescripcionAct").attr("style","visibility:hidden;");
		$("#labelDescripcionActLength").attr("style","visibility:hidden;");
	}
	
	if (fhInicio == null || fhInicio == '') {
		correcto = false;
		$("#labelfhInicioAct").html(getMensajeCampoObligatorio("fecha de inicio"));
		$("#labelfhInicioAct").attr("style","visibility:visible;");
	}
	else {
		$("#labelfhInicioAct").attr("style","visibility:hidden;");
	}
	
	if (fhFin == null || fhFin == '') {
		correcto = false;
		$("#labelfhFinAct").html(getMensajeCampoObligatorio("fecha de fin"));
		$("#labelfhFinAct").attr("style","visibility:visible;");
	}
	else {
		$("#labelfhFinAct").attr("style","visibility:hidden;");
	}
	if (presupuesto != null && presupuesto.length > 18) {
		correcto = false;
		$("#labelPresupuestoLength").html(getMensajeCampoLargo("presupuesto"));
		$("#labelPresupuestoLength").attr("style","visibility:visible;");
	}
	else if (presupuesto!='' && !validaPresupuesto (presupuesto)) {
		correcto = false;
		$("#labelPresupuestoInc").html(getMensajeCampoIncorrecto("presupuesto"));
		$("#labelPresupuestoInc").attr("style","visibility:visible;");
	}
	else {
		$("#labelPresupuestoInc").attr("style","visibility:hidden;");
		$("#labelPresupuestoLength").attr("style","visibility:hidden;");
	}
	if (!validaRangoFechas(fhInicio, fhFin)) {
		correcto = false;
		$("#labelfhFinInicioAct").html(getMensajeRangoFechas("fecha de fin", "fecha de inicio"));
		$("#labelfhFinAct").attr("style","display:none;");
		$("#labelfhFinInicioAct").attr("style","visibility:visible;");
	}
	else {
		$("#labelfhFinInicioAct").attr("style","visibility:hidden;");
	}
	
	return correcto;
}

/**
 * Valida el formulario modal de un indicador de un programa.
 */
function validaIndicador () {
	
	var correcto = true;
	
	var descripcion = $('#descripcionInd').val();
	var puntEsperada = $('#puntEsperada').val();
	var punt = $('#punt').val();
	var puntEsperadaGen = $('#puntEsperadaGen').val();
	var puntGen = $('#puntGen').val();

	var resultadoEsperadoInd = $('#resultadoEsperadoInd').val();
	var resultadoInd = $('#resultadoInd').val();
	
	
	if ($('#descripcionInd').css('visibility') == 'visible') {
		if (descripcion == null || descripcion == '') {
			correcto = false;
			$("#labelDescripcionInd").html(getMensajeCampoObligatorio("descripci&oacute;n"));
			$("#labelDescripcionInd").attr("style","visibility:visible;");
		}
		else if (descripcion.length > 500) {
			correcto = false;
			$("#labelDescripcionIndLength").html(getMensajeCampoLargo("descripci&oacute;n"));
			$("#labelDescripcionInd").attr("style","display:none;");
			$("#labelDescripcionIndLength").attr("style","visibility:visible;");
		} else {
			$("#labelDescripcionInd").attr("style","display:none;");
			$("#labelDescripcionIndLength").attr("style","display:none;");
		}
	}
	
	// Si es un indicador cuantitativo, se comprueban las puntuaciones numéricas,
	// sino, se mirarán las descripciones
	if ($('#cuantitativo').is(':checked')) {
	
		if (puntEsperada == null || puntEsperada == '') {
			correcto = false;
			$("#labelPuntEsp").html(getMensajeCampoObligatorio("puntuaci&oacute;n esperada"));
			$("#labelPuntEsp").attr("style","visibility:visible;");
		}
		else if (puntEsperada != null && puntEsperada.length > 8) {
			correcto = false;
			$("#labelPuntEspLength").html(getMensajeCampoLargo("puntuaci&oacute;n esperada"));
			$("#labelPuntEsp").attr("style","display:none;");
			$("#labelPuntEspLength").attr("style","visibility:visible;");
		}
		else {
			$("#labelPuntEsp").attr("style","display:none;");
			$("#labelPuntEspLength").attr("style","display:none;");
		}
		if (punt != null && punt.length > 8) {
			correcto = false;
			$("#labelPuntLength").html(getMensajeCampoLargo("puntuaci&oacute;n obtenida"));
			$("#labelPuntLength").attr("style","visibility:visible;");
		}
		else {
			$("#labelPuntLength").attr("style","display:none;");
		}
		if ($('#genero').is(':checked')) {
			if (puntEsperadaGen == null || puntEsperadaGen == '') {
				correcto = false;
				$("#labelPuntEspGen").html(getMensajeCampoObligatorio("puntuaci&oacute;n esperada"));
				$("#labelPuntEspGen").attr("style","visibility:visible;");
			}
			else if (puntEsperadaGen != null && puntEsperadaGen.length > 8) {
				correcto = false;
				$("#labelPuntEspGen").attr("style","display:none;");
				$("#labelPuntEspGenLength").attr("style","visibility:visible;");
			}
			else {
				$("#labelPuntEspGenLength").html(getMensajeCampoLargo("puntuaci&oacute;n esperada"));
				$("#labelPuntEspGen").attr("style","display:none;");
				$("#labelPuntEspGenLength").attr("style","display:none;");
			}
			if (puntGen != null && puntGen.length > 8) {
				correcto = false;
				$("#labelPuntGenLength").html(getMensajeCampoLargo("puntuaci&oacute;n esperada"));
				$("#labelPuntGenLength").attr("style","visibility:visible;");
			}
			else {
				$("#labelPuntGenLength").attr("style","display:none;");
			}
		}
		
	} else {
		
		if (resultadoEsperadoInd == null || resultadoEsperadoInd == '') {
			correcto = false;
			$("#labelPuntEspTx").html(getMensajeCampoObligatorio("resultado esperado"));
			$("#labelPuntEspTx").attr("style","visibility:visible;");
		}
		else if (resultadoEsperadoInd.length > 225) {
			correcto = false;
			$("#labelPuntEspTxLength").html(getMensajeCampoLargo("resultado esperado"));
			$("#labelPuntEspTx").attr("style","visibility:hidden;");
			$("#labelPuntEspTxLength").attr("style","visibility:visible;");
		} else {
			$("#labelPuntEspTxLength").attr("style","visibility:hidden;");
			$("#labelPuntEspTx").attr("style","visibility:hidden;");
		}
		
	}
	return correcto;
}



