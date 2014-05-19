<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="org.springframework.security.core.AuthenticationException"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es" charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title><s:text name="general.titulo.aplicacion"></s:text></title>

<link rel="SHORTCUT ICON" href="favicon.ico">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/themes/ui-lightness/jquery-ui-1.8.2.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/themes/ui.jqgrid.css" /> 
	
<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/estilos.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/password.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/primefaces.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/theme.css"/>
	<sj:head locale="es" compressed="false" 
	         jqueryui="true" scriptPath="/comercialweb/struts/"
	         customBasepath="/comercialweb/themes"
	         defaultIndicator="myDefaultIndicator"
	          />

</head>
  
<body class="body_login">

	<div id="login_titulo">Gestión de Socios del Club La Banda</div>

<div class="login">
		
	<!-- <br><a href="sensorListado">Ir a listado de <b>Sensores</b></a> -->
		
	<form action="j_spring_security_check" name="loginForm" id="loginForm" method="post">
		<!-- BLOQUE CONTENIDO -->
		<div class="ui-panel ui-widget ui-widget-content ui-corner-all panelLogin">
		<div id="j_idt10:j_idt11_header" class="ui-panel-titlebar ui-widget-header ui-corner-all"><span class="ui-panel-title">Inicio de Sesión</span></div>
			<div class="ui-panel-content ui-widget-content">
			<div class="form_fila_login">
					<s:if test="#session.SPRING_SECURITY_LAST_EXCEPTION.class.simpleName eq 'BadCredentialsException'"> <!-- Contraseña inventada -->
						<label style="color: red;"><s:text name="error.usuario.password.incorrectos"></s:text></label><br/>
					</s:if>
					<s:if test="#session.SPRING_SECURITY_LAST_EXCEPTION.class.simpleName eq 'AuthenticationServiceException'"> <!-- Usuario no existe -->
						<label style="color: red;"><s:text name="error.usuario.desactivado"></s:text></label><br/>
					</s:if>
				</div>	 
				<table>
					<tbody>
						<tr>
							<td><s:text name="etiqueta.login.usuario"/></td>
							<td><input 	type="text" tabindex="1" 
					   		id="usuario.nombreUsuario" 
							name="j_username"/></td>
						</tr>
						<tr>
							<td><s:text name="etiqueta.login.password"/></td>
							<td><input 	type="password" tabindex="2"
							id="usuario.password" 
				    		name="j_password"/> </td>
						</tr>
						<tr>
							<td><input type="submit"  value="<s:text name="boton.login.entrar"/>"  title="<s:text name="boton.title.login.entrar"/>" alt="<s:text name="boton.title.login.entrar"/>" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"/></td>
						</tr>
					</tbody>
				</table>
				
				
				
			</div>
			<div class="imagen_login">
			</div>
		</div>
		

	</form>

	
</div>
			<div id="desarrollo" ><s:text name="general.texto.pie.pagina"/> - <s:text name="general.nombre.aplicacion"/> <s:text name="general.version.aplicacion"/></div>

<script type="text/javascript">
	/**
	 * Muestra la ventana de recordar contraseña
	 */
	function recordarPassword() {
		$('#labelObligatorio').attr("style", "display:none;");
		$('#labelObligatoria').attr("style", "display:none;");
		$('#labelNoCorrecta').attr("style", "display:none;");
		
		$("#contenedor").empty().html('');
		$('#email').val('');
		
		$('#dialogoRecordarPassword').dialog('open');
	}

	/**
	* Comprueba el email introducido y envía la contraseña al usuario.
	*/
	function enviarPassword() {
		var email = $('#email').val();
		var nombreUsuario = $('#nombreUsuario').val();

		$('#labelObligatorio').attr("style", "display:none;");
		$('#labelObligatoria').attr("style", "display:none;");
		$('#labelNoCorrecta').attr("style", "display:none;");
		
		// Comprueba que se haya introducido el email y que éste sea válido
		if (email != '') {
			if (nombreUsuario != '') {
				// Si es correcto, se envía el email con la contraseña
				if (validaEmail(email)) {
					$("#contenedor").empty().html('<img src="images/ajax-loader.gif" title="Cargando..."/>');
	
					$.post("enviaNuevaPass", {email: email, nombreUsuario: nombreUsuario},
						function(data) {
							$("#contenedor").empty().html('<label class="error">'+data+'</label>');
						}
					);
					
				} else {
					$("#labelNoCorrecta").html(getMensajeCampoIncorrecto("direcci&oacute;n de correo electr&oacute;nico"));
					$('#labelNoCorrecta').attr("style", "display:block;");
				}	
			} else {
				$("#labelObligatorio").html(getMensajeCampoObligatorio("nombre de usuario/a"));
				$('#labelObligatorio').attr("style", "display:block;");
			}
		} else {
			if (nombreUsuario == '') {
				$("#labelObligatorio").html(getMensajeCampoObligatorio("nombre de usuario/a"));
				$('#labelObligatorio').attr("style", "display:block;");
			}
			$("#labelObligatoria").html(getMensajeCampoObligatorio("direcci&oacute;n de correo electr&oacute;nico"));
			$('#labelObligatoria').attr("style", "display:block;");
		}
	}

	function compruebaRespuestaPassword() {
		$("#contenedor").empty().html('');
	}
</script>

</body>

</html>