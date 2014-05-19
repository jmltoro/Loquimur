<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>
	<s:text name="cabecera.listado.mensajes"/>
</h1>

<c:if test="${not empty mensaje or not empty mensajeTxt}">
	<div class="errorico">
		<div class="error_ok_col">
			<ul>
				<li>
					<c:choose>
						<c:when test="${not empty mensaje}">
							<c:if test="${not empty mensaje.titulo}">
								<div class="titulo">
									${mensaje.titulo}
								</div>
							</c:if>
							<c:if test="${not empty mensaje.resumen}">
								<div class="resumen">
									${mensaje.resumen}
								</div>
							</c:if>
							<c:if test="${not empty mensaje.detalle}">
								<div class="descripcion">
									${mensaje.detalle}
								</div>
							</c:if>
						</c:when>
						
						<c:when test="${not empty mensajeTxt}">
							<div class="resumen">
					   			${mensajeTxt}
					   		</div>
						</c:when>
					</c:choose>
			   	</li>
	   		</ul>
		</div>					
	</div>
	<div class="botonera" align="right">
		<button type="button" class="btn" onclick="history.back();" title="<s:text name='boton.volver'/>" ><s:text name="boton.volver"></s:text></button>
	</div>
</c:if>
