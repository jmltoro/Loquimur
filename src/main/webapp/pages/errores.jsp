<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Establece los estilos de los mensajes de error, según donde deban mostrarse. -->
<s:if test="#css eq 'pestana'">
	<s:set var="style_ok">ok msg_pestana</s:set>
	<s:set var="style_error">errorico msg_pestana</s:set>
	<s:set var="style_val">validacion msg_pestana</s:set>
</s:if>
<s:elseif test="#css eq 'modal'">
	<s:set var="style_ok">ok msg_modal</s:set>
	<s:set var="style_error">errorico msg_modal</s:set>
	<s:set var="style_val">validacion msg_modal</s:set>
</s:elseif>
<s:else>
	<s:set var="style_ok">ok</s:set>
	<s:set var="style_error">errorico</s:set>
	<s:set var="style_val">validacion</s:set>
</s:else>
	
	
	
	
	
	
	
<!-- LISTADO DE ERRORES -->
	<s:if test="listaErrores.size() > 0">
		<div class="<s:property value='style_error' />">
			<div class="error_ok_col">
				<ul>
					<s:iterator id="listado" value="listaErrores" status="it">
						<li>
					   		<s:property escape="false"/><br/>
					   	</li>
			   		</s:iterator>
		   		</ul>
			</div>					
		</div>
	</s:if>

	<s:if test="listaOk.size() > 0">
		<div class="<s:property value='style_ok' />">
			<div class="error_ok_col">
				<ul>
					<s:iterator id="listado" value="listaOk" status="it">
						<li>
					   		<s:property escape="false"/><br/>
					   	</li>
			   		</s:iterator>
		   		</ul>
			</div>					
		</div>
	</s:if>
	
	<s:if test="listaValidaciones.size() > 0">
		<div class="<s:property value='style_val' />">
			<div class="error_ok_col">
				<ul>
					<s:iterator id="listado" value="listaValidaciones" status="it">
						<li>
					   		<s:property escape="false"/><br/>
					   	</li>
			   		</s:iterator>
		   		</ul>
			</div>					
		</div>
	</s:if>
	