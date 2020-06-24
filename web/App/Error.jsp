<%-- 
    Document   : Error
    Created on : 28/10/2018, 09:12:36 AM
    Author     : fitomx14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage ="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 666</title>
        <noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
    </head>
    <body>
        <div align="center">
        <h1>Ocurrio un error en el servidor</h1>
        <h2>Eso o alguien trato de tirarnos...en fin!</h2>
             Exception is: <%= exception %>  
        <h2>Comunicate con el administrador del sistema!</h2>
        <h2>Contacto</h2>
        <h4> Email:coinsproyect@gmail.com</h4>
        <h4> Telefono:5548701797 </h4>
       
        
        
       
        <p><h3><a href="../index.html">Regresa a un sitio seguro!</a></h3>
          <image src="../IMGS/at.jpeg" alt="error" width="600" height="400">
        </div>
    
        </body>
</html>
