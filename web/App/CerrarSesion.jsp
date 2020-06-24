<%-- 
    Amigo programador cuando termine este codigo solo Dios y yo sabiamos como funcionaba
    Ahora solo parece que Dios sabe...
    No batalles entendiendo lo inentendible suma abajo las horas que llevas trabajando sobre este sistema
    Horas en este infierno 18 y contando
    Saludos: Tec. Michael Adolfo Huerta Ramirez ;) cel de toda la vida (Mexico) 5548701797
    Manda WA con el numero de horas en el que perfeccionaste esta wea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>

<% HttpSession Usuario=request.getSession(true); %>
<%
    session.invalidate();
    request.getSession().removeAttribute("sesionid");
    request.getSession().removeAttribute("Usuario");
   
    response.sendRedirect("../index.html");
%>
<html>
    <noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
    <body>
        
    </body>
    
</html>
