$(document).ready(function() {		
    $("body").bind("ajaxSend", function(e, xhr, settings){
        //Sent
     }).bind("ajaxComplete", function(e, xhr, settings){
    	// Cuando se han completado todos los ajax        	 
    	 
    	 //Para las ayudas
//    	 $(".filtering").attr("data-step","1");
//    	 $(".filtering").attr("data-intro","Ventana de b&uacute;squedas. <br />Escriba el texto a buscar y pulse <i>Filtrar</i>.");
//    	 $(".jtable-column-header.jtable-column-header-sortable:first").attr("data-step","2");
//    	 $(".jtable-column-header.jtable-column-header-sortable:first").attr("data-intro","Pulse en el t&iacute;tulo de las columnas para ordenar Ascendente o Descendente.");
//    	 $(".jtable-command-column-header.jtable-column-header-selecting").attr("data-step","3");
//    	 $(".jtable-command-column-header.jtable-column-header-selecting").attr("data-intro","Para eliminar varios registros selecci&oacute;nelos y pulse <i>Eliminar seleccionados</i>.");
//    	 $(".jtable-command-button.jtable-delete-command-button:first").attr("data-step","4");
//    	 $(".jtable-command-button.jtable-delete-command-button:first").attr("data-position","left");        	 
//    	 $(".jtable-command-button.jtable-delete-command-button:first").attr("data-intro","Para eliminar un registro pulse &eacute;ste icono.");
//    	 $(".jtable-command-button.jtable-edit-command-button:first").attr("data-step","5");
//    	 $(".jtable-command-button.jtable-edit-command-button:first").attr("data-position","left");   
//    	 $(".jtable-command-button.jtable-edit-command-button:first").attr("data-intro","Para editar un registro pulse &eacute;ste icono.<br /> <br /><img src='pages/common/ayudas/tipos-form.jpg' /><br /> Introduzca la descripci&oacute;n del tipo.<br/><br/> Si quiere un tipo nuevo que dependa del que eligi&oacute;, pulse en <i>GUARDAR COMO HIJO</i>. <br/><br/>Si es nuevo o una modificaci&oacute;n, pulse en <i>GUARDAR</i>.");
//    	 $(".jtable-bottom-panel").attr("data-step","6");
//    	 $(".jtable-bottom-panel").attr("data-intro","Navegaci&oacute;n entre las distintas p&aacute;ginas que conforman la consulta y selecci&oacute;n del n&uacute;mero de filas por p&aacute;gina.<br /><br />A la derecha, informaci&oacute;n del n&uacute;mero total de registros de la consulta.");
    	 
    $('.jtable-column-header-text').css("margin-top","-6px");	 
    $('.jtable thead').css("height", "40px");
    
     }).bind("ajaxError", function(e, xhr, settings, thrownError){
         //Error
     });		
	
	
		$("#dlgConfirm").hide();
		
		//setup the jtable that will display the results
		$('#XTableContainer').jtable({
		        title: 'Listado de emisiones',
		        paging: true, //Enable paging
	            pageSize: 10, //Set page size (default: 10)
	            pageList: 'normal', //minimal
	            sorting: false, //Enable sorting
	            selecting: false, //Enable selecting
	            multiselect: false, //Allow multiple selecting
	            selectingCheckboxes: false, //Show checkboxes on first column
//	            toolbar: {
//	                hoverAnimation: true, //Enable/disable small animation on mouse hover to a toolbar item.
//	                hoverAnimationDuration: 60, //Duration of the hover animation.
//	                hoverAnimationEasing: undefined, //Easing of the hover animation. Uses jQuery's default animation ('swing') if set to undefined.
//	                items: [{
//	                	icon: './css/themes/lightcolor/delete.png',
//	                    text: 'Eliminar seleccionados',
//	                    cssClass: '',
//	                    tooltip: 'Seleccione primero los registros a eliminar ...',
//	                    click: function () {
//	    		            var $selectedRows = $('#XTableContainer').jtable('selectedRows');
//			                $( "#dlgConfirm" ).dialog({
//			                    resizable: false,
//			                    height:140,
//			                    modal: true,
//			                    buttons: {
//			                        "!Quiero eliminarlos!": function() {
//			                        	$('#XTableContainer').jtable('deleteRows', $selectedRows);
//			                            $( this ).dialog( "close" );
//			                        },
//			                        Cancel: function() {
//			                            $( this ).dialog( "close" );
//			                        }
//			                    }
//			                });
//	                    }
//	                }]
//	            },	
	            selectOnRowClick: false, //Enable this to only select using checkboxes				            
	            defaultSorting: 'idTratamiento,idDestino,fechaReal,bloque,posicion ', //Set default sorting	        

		        actions: {
		        	listAction: './cargarGridEmisionByFilter'
		        },
		        fields: {
		        	//#detalle#
		        	//#detalle#
		        	id: {key: true, create: false, edit: false, list: false },
		        	
		        	Emisiones: {
	                    title: '',
	                    width: '5%',
	                    sorting: false,
	                    edit: false,
	                    create: false,
	                    display: function (emisionesData) {
	                    	//Create an image that will be used to open child table
	                        var $img = $('<img src="/Content/images/Misc/phone.png" title="Edit phone numbers" />');
	                        //Open child table when user clicks the image
	                        $img.click(function () {
	                            $('#EmisionesTableContainer').jtable('openChildTable',
	                                    $img.closest('tr'),
	                                    {
	                                        title: emisionesData.record.Name + ' - Phone numbers',
	                                        actions: {
	                                            listAction: '/Demo/EmisionesList?StudentId=' + emisionesData.record.Id
	                                        },
	                                        fields: {
	                                            StudentId: {
	                                                type: 'hidden',
	                                                defaultValue: studentData.record.StudentId
	                                            },
	                                            PhoneId: {
	                                                key: true,
	                                                create: false,
	                                                edit: false,
	                                                list: false
	                                            },
	                                            PhoneType: {
	                                                title: 'Phone type',
	                                                width: '30%',
	                                                options: { '1': 'Home phone', '2': 'Office phone', '3': 'Cell phone' }
	                                            },
	                                            Number: {
	                                                title: 'Phone Number',
	                                                width: '30%'
	                                            },
	                                            RecordDate: {
	                                                title: 'Record date',
	                                                width: '20%',
	                                                type: 'date',
	                                                displayFormat: 'yy-mm-dd',
	                                                create: false,
	                                                edit: false
	                                            }
	                                        }
	                                    }, function (data) { //opened handler
	                                        data.childTable.jtable('load');
	                                    });
	                        });
	                        //Return image to show on the person row
	                        return $img;
	                    }
	                },	
	                    
		        	
		        	
		        	
		        	fecha: {title: 'FECHA', width: '15%', inputClass: 'validate[required,custom[eurodate]]', displayFormat: 'dd/mm/yy',type: 'date', list: false },
				    canal: {title: 'CANAL', width: '20%',
						options: './selectdeCanales?t=l',
						inputClass: 'validate[required,custom[nodobles]]', list: false },
					destino: {title: 'DESTINO', width: '20%',
						options: './selectdeDestinos?t=l',
						inputClass: 'validate[required,custom[nodobles]]', list: false },
					tratamiento: {title: 'TRATAMIENTO', width: '20%',
						options: './selectdeTratamientos?t=l',
						inputClass: 'validate[required,custom[nodobles]]' , list: false},				
		        	idDestino: {title: 'ID<br>DESTINO', width: '10%', list: false },
		        	fechaEmision:{title: 'FECHA<br>EMISION', 
        				width: '20%',
        				display: function (data) {
                            return moment(data.record.fechaEmision).format('DD/MM/YYYY');
                        }},
		        	destino : {title: '<br>DESTINO', width: '30%', list: false },
		        	idOrdenEmision:{title: '<br>N.ORDEN', width: '20%' },
		        	bloque:{title: '<br>BLOQUE', width: '20%',
	        			display: function (data) {
                    	return moment(data.record.bloque).format('HH:mm');
                    } },
		        	posicion:{title: '<br>POSICION', width: '10%' },
		        	anunciante:{title: '<br>ANUNCIANTE', width: '20%' },
		        	pelicula:{title: '<br>PELICULA', width: '20%' },
		        	idTipoPublicidad:{title: 'ID<br>TIPO.PUB', width: '20%' },
		        	ordenAgencia:{title: 'OREDEN<br>AGENCIA', width: '20%' },
		        	duracion:{title: '<br>DURACION', width: '20%' },
		        	idPelicula:{title: 'ID<br>PEL', width: '20%' },
		        	idEmisionPelicula:{title: 'ID<br>EM.PEL', width: '20%' },
		        	precio:{title: '<br>PRECIO', width: '20%' },
		        	fechaReal:{title: 'FECHA<br>REAL', width: '20%',
	        			display: function (data) {
	                	return moment(data.record.fechaReal).format('DD/MM/YYYY');
                    }},
		        	idTratamiento:{title: 'ID<br>TRATAM', width: '20%', list: false },
		        	descripcionTratamiento:{title: 'DESC<br>TRATAMIENTO', width: '20%' },
		        	observaciones:{title: '<br>OBSERVACIONES', width: '20%' },
		        	horaReal:{title: 'HORA<br>REAL', width: '20%',
	        			display: function (data) {
	        			if (data.record.horaReal !="null"){
	        				return moment(data.record.horaReal).format('HH:mm:ss');
	        			}else {return ""};}
                    },
		        	tipoInforme:{title: 'TIPO<br>INFORME', width: '20%' },
		        	programa:{title: '<br>PROGRAMA', width: '20%' },
		        	descripcionBloque:{title: 'DESC<br>BLOQUE', width: '20%' }				
		        },
		        

		        recordsLoaded: function(event, data) {
		         	// Capturamos los errores
		           	 var errores = '<%= session.getAttribute("listaErrores") %>';    
		   			 //alert(errores);   	
		           	 if(errores.indexOf("[")>-1){
	 		           	 $.get( "borrarCadenaJsonSesion", function( data ) {   
	 		           		if(errores.length>3){
		 		           		jAlert(errores,"ERRORES DETECTADOS", function(){
		 		           			document.location.href='informeEmision';
		 		           		});
	 		           		}
	 		           	 }); 
		           	 }		            		            		            		        
		        },		        		        	            		       		        
		    });
								
        //Re-load records when user click 'load records' button.
        $('#LoadRecordsButton').click(function (e) {
            e.preventDefault();
            $('#XTableContainer').jtable('load', {
        	canal: $('#xcanal').val(),
        	fecha: $('#xfecha').val(),
        	destino: $('#xdestino').val(),
        	tratamiento: $('#xtratamiento').val()
            });
            
            //Añadido porque en chrome necesita otro refresco de la tabla
// 	            var nav = navigator.userAgent.toString().toLowerCase();
// 	            if(nav.indexOf("chrome")>-1 || nav.indexOf("msie")>-1){
// 	            	$('#XTableContainer').jtable('reload');
// 	            }
            
        });
        //Load all records when page is first shown
        $('#LoadRecordsButton').click();		
        
        
        $('#LimpiarFiltro').click(function () {
        	$('#xcanal').val(); 
			$('#xfecha').val(); 
			$('#xdestino').val();
			$('#xtratamiento').val();
			
    	});	

	    $("#xcomohijo").click(function(){ 
			alert("Aauiiii");
		});
        
        
		    //$('#XTableContainer').jtable('load');		//Si no hay filtro, poner esta linea	
		    
		    
	});