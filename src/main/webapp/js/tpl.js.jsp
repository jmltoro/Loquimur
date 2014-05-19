<%@ page isELIgnored="true" pageEncoding="UTF-8" %>

<!-- Plantilla para el formulario de criterios -->
<script id="widgetCriterios" type="text/x-jquery-tmpl">
<style type="text/css">
.widget-criterios * {
	vertical-align: middle;
}
.widget-criterios .boton {
	cursor: pointer;
}
.widget-criterios .botones {
	text-align: right;
}
/*
.widget-criterios input {
	width: 80%;
}
.widget-criterios .criterio {
	margin: 30px 0;
	border-top: 4px solid black;
	padding-top: 10px;
}
.widget-criterios .pregunta {
	border: 1px dashed #000;
	margin: 10px 0;
}
.widget-criterios .objetivas,
.widget-criterios .subjetivas {
	margin: 20px 0;
}
.widget-criterios .objetivas {
	border: 1px solid red;
}
.widget-criterios .subjetivas {
	border: 1px solid blue;
}
*/

</style>
<div class="widget-criterios">
	<h2 style="margin-top: 0;">
		Criterios de evaluación
	</h2>
	
	<div id="criterios">
	</div>
	
	<div style="text-align: right;">
		<span id="botonAddCriterio" title="Añadir criterio" class="boton">
			Añadir criterio
			<img src="${rutaBase}/images/btn_anadir.png" alt="Añadir" title="Añadir" />
		</span>
	</div>
</div>
</script>

<!-- Plantilla para los criterios de valoracion -->
<script id="widgetCriterios-criterio" type="text/x-jquery-tmpl">
<div class="criterio" style="margin: 25px 0 0;">
	<div class="acordeon_cab">
		<div class="acordeon_cab_tit" style="width: 100%;">
			<div style="float: left;">
				<span class="obligatorio txtdestacado">Criterio:</span>
				<input type="text" name="protocolo.criterio[indice].descripcion" style="width: 400px;" />
			</div>
			<div style="float: right;">
				<img class="boton borrarCriterio" src="${rutaBase}/images/btn_eliminar.png" alt="Eliminar" title="Eliminar" />
			</div> 
			<div style="float: right; margin: 0 20px;">
				<span class="obligatorio peso">Peso</span>
				<input type="text" name="protocolo.criterio[indice].peso" style="width: 45px;" />
				%
			</div>
			<div class="cierre"></div>
		</div>
		<div class="cierre"></div>
	</div>
	
	<div class="acordeon_cuerpo bloquePreguntas" style="display: block;">
		<div class="acordeon_cuerpo_hijos">
			<div class="acordeon_cuerpo_cab">
				Evaluación objetiva
			</div>
			<div style="clear: both;" class="acordeon_conjunto_preguntas preguntas objetivas">
				<div class="botones">
					<span class="boton addPregunta" title="Añadir pregunta">
						Añadir pregunta
						<img src="${rutaBase}/images/btn_anadir.png" alt="Añadir" title="Añadir" />
					</span>
				</div>
			</div>
	
			<div class="acordeon_cuerpo_cab">
				Evaluación subjetiva
			</div>
			<div style="clear: both;" class="acordeon_conjunto_preguntas preguntas subjetivas">
				<div class="botones">
					<span class="boton addPregunta" title="Añadir pregunta">
						Añadir pregunta
						<img src="${rutaBase}/images/btn_anadir.png" alt="Añadir" title="Añadir" />
					</span>
				</div>
			</div>
			<div class="cierre"></div>
		</div>
		<div class="cierre"></div>
	</div>
</div>
</script>

<!-- Plantilla para las preguntas de los criterios -->
<script id="widgetCriterios-pregunta" type="text/x-jquery-tmpl">
<div class="pregunta acordeon_pregunta" style="min-height: 0; height: auto !important; padding: 5px 0;">
	<div class="acordeon_pregunta_texto" style="width: 100%;">
		&nbsp;<!--
			--><textarea name="protocolo.criterio[indice].pregunta[indicePregunta].descripcion" style="width: 600px; height: 50px; margin: 0;"></textarea><!--
			--><img class="boton borrarPregunta" src="${rutaBase}/images/btn_eliminar.png" alt="Eliminar" title="Eliminar" style="margin-left: 22px;" /><!--
			--><input type="hidden" value="${idTipoPregunta}" name="protocolo.criterio[indice].pregunta[indicePregunta].tipoPregunta.id" /><!--
		-->
		<div class="cierre"></div>
	</div>
	<div class="cierre"></div>
</div>
</script>