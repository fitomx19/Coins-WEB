<%-- 
    Document   : b_52semanas
    Created on : 27/02/2019, 09:56:15 AM
    Author     : Adolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodos Supremacistas para dar de baja 52 semanas</title>
  <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    int id_usuario;
     
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    id_usuario = Integer.parseInt(request.getParameter("usr1"));
    int arreglado[][] = {{1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10}};
    %>
    </head>
    <body>
        <%
        stmt.execute("delete from 52semanas where id_usr='"+id_usuario+"' and Activo = 1"); //UPDATE `coinsproyect`.`52semanas` SET `Activo`='0' WHERE `id52semanas`='6';
        
        response.sendRedirect("../regresar.jsp");
        %>
        
    </body>
</html>
