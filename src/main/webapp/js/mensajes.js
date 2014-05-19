// ***** PARAMETRIZACIÓN DE MENSAJES ***** //

// MENSAJES DE LOS FORMULARIOS
function getMensajeCampoObligatorio (campo) {
	return "El campo " + campo + " es obligatorio.";
}
function getMensajeCampoLargo (campo) {
	return "El campo " + campo + " es demasiado largo.";
}
function getMensajeCampoIncorrecto (campo) {
	return "El campo " + campo + " es incorrecto.";
}
function getMensajeIncorrecto (campo) {
	return campo + " es incorrecto.";
}
function getMensajeUsuarioIncorrecto (campo) {
	return "El campo " + campo + " sólo puede contener letras, números y los caracteres . y _.";
}
function getMensajeCampoNumerico (campo) {
	return "El campo " + campo + " debe ser num&eacute;rico. Ej. 10.150,12.";
}
function getMensajeRangoGrande() {
	return "El rango definido es demasiado grande.";
}
function getMensajeRangoFechas(campo1, campo2) {
	return "El campo " + campo1 + " no puede ser anterior al campo " + campo2 + ".";
}
function getMensajeRangoValores(campo1, campo2) {
	return "El campo " + campo1 + " no puede ser mayor que el campo " + campo2 + ".";
}
function getMensajeRangoAgno(campo, valor1, valor2) {
	return getMensajeCampoIncorrecto(campo) + " Debe ser un n&uacute;mero comprendido entre " + valor1 + " y " + valor2 + "." ;
}
function getMensajePerfilEntidad() {
	return "Para usuarios/as con perfil Promotor/a debe seleccionar una entidad.";
}
function getMensajePerfil() {
	return "Debe seleccionar al menos un perfil para el usuario/a.";
}
function getMensajePresupuestoAsignado() {
	return "Se ha asignado todo el presupuesto destinado para esta convocatoria.";
}
function getMensajePresupuestoSobrepasado() {
	return "El presupuesto para la convocatoria se ha sobrepasado.";
}
function getMensajeRangosCalcular(campo1, campo2) {
	return "Los campos " + campo1 + " y " + campo2 + " son obligatorios para poder realizar el c&aacute;lculo.";
}
function getMensajeCalcularValoresCriterio() {
	return "Debe calcular primero el n&uacute;mero de valores para el Criterio.";
}
function getMensajeValoresCriterioObligatorio() {
	return "Los valores para los criterios deben ser completados.";
}
function getMensajeValoresCriterioLargo() {
	return "Los valores para los criterios no pueden ser mayores de 250 caracteres.";
}
function getMensajePesos100(total) {
	return "Los pesos de todos los criterios han de sumar 100.<br />Valor Actual: " + total + " %";
}
function getMensajeCriterioRequerido() {
	return "Ha de introducir al menos un criterio para el protocolo.";
}
function getMensajePreguntaRequerido(criterio) {
	return "Ha de introducir al menos una pregunta para el criterio " + criterio + ".";
}

// MENSAJES DE ERROR
function getMensajeXMLHTTP() {
	return "Su navegador no acepta XMLHTTP.";
}
function getMensajeXML() {
	return "Problemas al obtener los datos XML.";
}

// MENSAJES DE AVISO

function getAvisoSeleccionarAlguno(accion) {
	return "Debe seleccionar alg&uacute;n un registro para " + accion + ".";
}
function getAvisoNoRegistrosExport() {
	return "No existen registros para exportar.";
}
function getAvisoNoGuardar() {
	return "Si acepta no se va a grabar la información no guardada.";
}
function getAvisoConsolidarPrograma() {
	return "La información del programa no podr&aacute; ser modificada tras la consolidación.";
}
function getAvisoDesconsolidarPrograma() {
	return "La información del programa podr&aacute; ser modificada tras la desconsolidación.";
}
function getAvisoConsolidarProtocolo() {
	return "La información del protocolo no podr&aacute; ser modificada tras la consolidación.";
}
function getAvisoDesconsolidarProtocolo() {
	return "La información del protocolo podr&aacute; ser modificada tras la desconsolidación.";
}
function getAvisoCerrarPrograma() {
	return "Al cerrar el programa, &eacute;ste pasar&aacute; a estar en histórico.";
}
function getAvisoSeleccionarConvocatoria() {
	return "Debe seleccionar alguna convocatoria.";
}
function getAvisoProgramaNuevo() {
	return "La informaci&oacute;n que se introduzca debe corresponderse con la presentada en la solicitud de subvención de esta convocatoria.";
}
function getAvisoEnHistorico() {
	alerta("La evaluación seleccionada está en histórico y no puede ser modificada.");
}

// MENSAJES DE CONFIRMACIÓN
function getTituloVentanaConfirm() {
	return "Confirmación";
}
function getAceptarVentanaConfirm() {
	return "Aceptar";
}
function getCancelarVentanaConfirm() {
	return "Cancelar";
}
function getConfirmEliminarRegistros() {
	return "¿Realmente desea eliminar los registros seleccionados?";
}
function getConfirmImportarRegistros() {
	return "¿Realmente desea importar los programas seleccionados?";
}
function getConfirmValidarRegistros() {
	return "¿Realmente desea validar los avisos seleccionados?";
}
function getConfirmDescartarRegistros() {
	return "¿Realmente desea descartar los avisos seleccionados?";
}
function getConfirmValidarRegistro() {
	return "¿Realmente desea validar el aviso seleccionado?";
}
function getConfirmDescartarRegistro() {
	return "¿Realmente desea descartar el aviso seleccionado?";
}
function getConfirmEliminarCriterio() {
	return "¿Desea eliminar el criterio de evaluación seleccionado?";
}
function getConfirmHistoricoEvaluacion() {
	return "¿Realmente desea pasar a histórico las evaluaciones seleccionadas? Si acepta ya no podr&aacute; modificar las evaluaciones seleccionadas.";
}
function getConfirmSalirSinGuardar() {
	return getAvisoNoGuardar() + " " + getConfirmDeseaContinuar();
}
function getConfirmDeseaContinuar() {
	return "¿Desea continuar?";
}

function getConfirmAccionObjetivo(accion) {
	return "¿Desea " + accion + " el objetivo seleccionado?";
}
function getConfirmAccionResultado(accion) {
	return "¿Desea " + accion + " el resultado seleccionado?";
}
function getConfirmAccionActividad(accion) {
	return "¿Desea " + accion + " la actividad seleccionada?";
}
function getConfirmAccionIndicador(accion) {
	return "¿Desea " + accion + " el indicador seleccionado?";
}


// ETIQUETAS
function getTituloSeleccion(campo) {
	return "Selección de " + campo;
}