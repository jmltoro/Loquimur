if (!window.widgets) {
	window.widgets = {};
}

widgets.criterios = {
	init: function(id, modelo) {
		$("#widgetCriterios").tmpl(modelo).appendTo($("#" + id));
		
		/*
		// cuando enviemos el formulario reescribimos los name's de los campos
		$("#criterios").closest("form").submit(function(e) {
			$(this).find(".criterio").each(function(i) {
				$(this).find("input[name$=descripcion],input[name$=peso]").each(function(j) {
					this.name = this.name.replace("{indice}", i);
				});
				$(this).find(".pregunta").each(function(j) {
					$(this).find("textarea,input").each(function (k) {
						this.name = this.name.replace("{indice}", i);
						this.name = this.name.replace("{indicePregunta}", j);
					});
				});
			});
		});
		*/
		
		$(".borrarCriterio").live("click", function(e) {
			marcaModificado();
			e.stopImmediatePropagation();
			var _this = this;
			confirma(getConfirmEliminarCriterio(), function() {
				$(_this).closest(".criterio").remove();
			});
		});
		$(".borrarPregunta").live("click", function(e) {
			marcaModificado();
			e.stopImmediatePropagation();
			var _this = this;
			confirma("¿Desea eliminar la pregunta seleccionada?", function() {
				$(_this).closest(".pregunta").remove();
			});
		});
		
		$(".acordeon_cab").live("click", function(e) {			
			var preguntas = $(this).closest(".criterio").find(".bloquePreguntas");
			preguntas.is(":visible") ? 
					preguntas.slideUp("slow") 
					: preguntas.slideDown("slow");
		});
		$(".acordeon_cab input,.acordeon_cab img").live("click", function(e) {
			e.stopPropagation();
		});
		
		$(".criterio [name*='peso']").live("keypress", function(e) {
			return soloPorcentaje(e);
		});
				
		$("#botonAddCriterio").click(function(e) {
			marcaModificado();
			widgets.criterios.addCriterio(modelo);
		});
	},
	
	addCriterio: function(modelo) {
		var nodoCriterio = $("#widgetCriterios-criterio").tmpl(modelo);
		$(".objetivas .addPregunta", nodoCriterio).click(function() {
			marcaModificado();
			widgets.criterios.addPregunta(nodoCriterio, 4, modelo);
		});
		$(".subjetivas .addPregunta", nodoCriterio).click(function() {
			marcaModificado();
			widgets.criterios.addPregunta(nodoCriterio, 5, modelo);
		});
		
		$(nodoCriterio).find("[name*='[indice].descripcion']").attr("maxlength", 500);		
		$(nodoCriterio).find("[name*='peso']").attr("maxlength", 6);
		
		nodoCriterio.hide();
		nodoCriterio.appendTo($("#criterios"));
		nodoCriterio.slideDown("slow");
		
		return nodoCriterio;
	},
	
	/**
	 * Si tipo = 4 -> objetiva; tipo = 5 -> subjetiva
	 */
	addPregunta: function(nodoCriterio, tipo, modelo) {
		var modeloF = {
			idTipoPregunta: tipo
		};
		$.extend(modeloF, modelo);
		var nodoPregunta = $("#widgetCriterios-pregunta").tmpl(modeloF);
		nodoPregunta.hide();
		if (tipo == 4) {
			//nodoPregunta.appendTo($(nodoCriterio).find(".objetivas"));
			nodoPregunta.insertBefore($(nodoCriterio).find(".objetivas .botones"));
		} else if (tipo == 5) {
			//nodoPregunta.appendTo($(nodoCriterio).find(".subjetivas"));
			nodoPregunta.insertBefore($(nodoCriterio).find(".subjetivas .botones"));
		}
		//$(nodoPregunta).find("[name*='[indicePregunta].descripcion']").attr("maxlength", 500);
		
		nodoPregunta.slideDown("slow");
		
		return nodoPregunta;
	},
	
	onSubmit: function(id) {
		$("#" + id).find(".criterio").each(function(i) {
			$(this).find("input[name$=descripcion],input[name$=peso]").each(function(j) {
				this.name = this.name.replace("indice", i);
			});
			$(this).find(".pregunta").each(function(j) {
				$(this).find("textarea,input").each(function (k) {
					this.name = this.name.replace("indice", i);
					this.name = this.name.replace("indicePregunta", j);
				});
			});
		});
	}
};