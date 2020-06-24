<%-- 
    Document   : incompleto
    Created on : 14/11/2018, 03:57:34 PM
    Author     : fitomx14
--%>
<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/consejos.css">
        <title>Error :S</title>
    </head>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String Usuario1;
    String Contrasena;
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    
    
    
  %>
    <%HttpSession Usuario=request.getSession(true);%>
     <%String online2=(String)Usuario.getAttribute("sesionusuario");%>
    <%
    stmt.execute("delete  from usuario where nom = '"+online2+"' ");
    %>
     <body>
          <div>
          <ul>
        <li><a class="active" href="../index.html">Regresar</a></li>
        <li><a href="https://www.google.com.mx/search?q=you+shall+not+pass&tbm=isch&source=iu&ictx=1&fir=vpZ8jdBLmmeJNM%253A%252C5oW9MfyYiOYuyM%252C_&usg=AI4_-kRd7GDWr9_217caHRM23YpgysMbWQ&sa=X&ved=2ahUKEwjPwYC63NbeAhVK5awKHWdlDMkQ9QEwAHoECAQQBA#imgrc=vpZ8jdBLmmeJNM:">____</a></li>
       
         </ul>
         </div>
         <div>
             <br>
         </div>
         <div align="center">
             <img src="../IMGS/error.jpeg" alt="error">
        
        <h1>No terminaste tu registro porfavor empiezalo de nuevo, te hemos reiniciado todos los datos que ingresaste antes de que todo esto fallara</h1>
      
        <h2><a href="../Registro/Registrarse.jsp">Continuemos</a></h2>
         </div>
    </body>
</html>
