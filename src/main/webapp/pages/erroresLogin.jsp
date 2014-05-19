<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

	
	
<!-- LISTADO DE ERRORES -->
	<s:if test="listaErrores.size() > 0">
		<div class="errorico" style="width: 464px;" >
			<div class="error_ok_col">
				<ul>
					<s:iterator id="listado" value="listaErrores" status="it">
						<li>
					   		<s:property/><br/>
					   	</li>
			   		</s:iterator>
		   		</ul>
			</div>					
		</div>
	</s:if>

	<s:if test="listaOk.size() > 0">
		<div class="ok">
			<div class="error_ok_col">
				<ul>
					<s:iterator id="listado" value="listaOk" status="it">
						<li>
					   		<s:property/><br/>
					   	</li>
			   		</s:iterator>
		   		</ul>
			</div>					
		</div>
	</s:if>
	
	<s:if test="listaValidaciones.size() > 0">
		<div class="validacion">
			<div class="error_ok_col">
				<ul>
					<s:iterator id="listado" value="listaValidaciones" status="it">
						<li>
					   		<s:property/><br/>
					   	</li>
			   		</s:iterator>
		   		</ul>
			</div>					
		</div>
	</s:if>
	
	<br/>	
	<form name="listadoF" id="listadoF" action="j_spring_security_logout" method="post" >
		<div class="botonera" align="right">
		<button type="submit" class="btn" title="<s:text name='boton.title.ir.login'/>"><s:text name='boton.ir.login'/></button>
	</div>
	</form>
	
    <br/>	