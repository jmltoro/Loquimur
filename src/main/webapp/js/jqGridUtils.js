var jqGridUtils = {
	formatBooleanCell: function (cellvalue, options, rowObject) {
		return (cellvalue === true ? "Sí" : "No");
	},
	
	formatSubmit: function (cellvalue, options, rowObject) {
        return '' +
	        '<a href="javascript:enviaFormulario(' + cellvalue + ')">' +
	        	'<img src="images/lapiz.gif" border="0px" alt="Editar" title="Editar" />' +
	        '</a>';
	},
	
	formatCheck : function (cellvalue, options, rowObject) {
		
		if (cellvalue == 'Si' || cellvalue == true) {
			return "<img src='images/check_ok.gif' border='0px' title='Sí' alt='Sí'></img>";
		} else if (cellvalue == 'No' || cellvalue == false) {
			return "<img src='images/check-false.png' border='0px' title='No' alt='No'></img>";
		} else {
    		return "";
		}
	},
	
	formatCheckInverse : function (cellvalue, options, rowObject) {
		
		if (cellvalue == 'Si' || cellvalue == true) {
			return "<img src='images/check-false.png' border='0px' alt='No' title='No'></img>";
		} else if (cellvalue == 'No' || cellvalue == false) {
			return "<img src='images/check_ok.gif' border='0px' alt='Si' title='Si'></img>";
		} else {
    		return "";
		}
	}
};