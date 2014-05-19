<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>

<br />

<h2><s:text name="error.titulo"></s:text></h2>
<p>
	<s:text name="error.excepcion.generica"></s:text>
	<s:text name="contactar.administrador"></s:text>
</p>

<!-- EN DESARROLLO
<h2>An unexpected error has occurred</h2>
<p>
    Please report this error to your system administrator
    or appropriate technical support personnel.
    Thank you for your cooperation.
</p>
<hr/>
<h3>Error Message</h3>
<s:actionerror/>
<p>
    <s:property value="%{exception.message}"/>
</p>
<hr/>
<h3>Technical Details</h3>
<p>
    <s:property value="%{exceptionStack}"/>
</p>

 -->