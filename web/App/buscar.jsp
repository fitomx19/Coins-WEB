<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodo de busqueda avanzado de la CIA</title>
    </head>
    <body>
         <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
         %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();

  %>
  

  
  
  
    </body>
</html>
