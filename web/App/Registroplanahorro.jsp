<%-- 
    Document   : Registroplanahorro
    Created on : 20/10/2018, 05:11:39 PM
    Author     : fitomx14
--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodo de incersion de datos  avanzado de la CIA</title>
        
        <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String usuario,ahorro;
    
    %>
     <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    ahorro = request.getParameter("plan");
    usuario = request.getParameter("usuario");

  %>
    </head>
    <body>
         
        <%
        stmt.execute("update usuario set id_plan ='"+ahorro+"' where id_usr='"+usuario+"'");
        stmt.execute("INSERT INTO `coinsproyect`.`52semanas` (`id_usr`, `Activo`) VALUES ('"+usuario+"', '0');");
        response.sendRedirect("CerrarSesion.jsp");
        
        %>
    </body>
</html>
