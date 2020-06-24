<%-- 
    Document   : up52semanas
    Created on : 2/03/2019, 12:01:33 PM
    Author     : Adolfo
--%>

<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*,java.util.Arrays"%>
<%@page errorPage = "Error.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reto 52 Semanas</title>
       
        <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    int id_usuario,faltantes;
    int semanas;
    String proxy,semana,gul;
    
    
     
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    id_usuario = Integer.parseInt(request.getParameter("usr1"));
    proxy = request.getParameter("proxy");
    semana = request.getParameter("f");
    gul = request.getParameter("x");
    
    %>
    </head>
    <body>
        <%
            stmt.execute("UPDATE 52semanas SET id52help = id52help + 1 WHERE id_usr = "+id_usuario+"");
            stmt.execute("UPDATE 52semanas SET Prox_Ahorro = "+proxy+" WHERE id_usr = "+id_usuario+"");
            stmt.execute("UPDATE 52semanas SET FechaProx = ADDDATE(FechaProx, INTERVAL 7 DAY) WHERE id_usr = "+id_usuario+" and id52semanas = "+gul+"");
            response.sendRedirect("../regresar.jsp");
        %>
    </body>
</html>
