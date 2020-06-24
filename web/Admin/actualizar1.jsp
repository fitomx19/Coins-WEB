<%-- 
    Document   : actualizar1
    Created on : 9/03/2019, 12:46:40 PM
    Author     : Adolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodo Actualizacion kinetico</title>
  <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String imagen,ruta;
    int id;
         
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    
    imagen = request.getParameter("contenido");
    ruta = request.getParameter("img");
    id = Integer.parseInt(request.getParameter("idnoticia"));
  %>
    </head>
    <body>
        <%
        
        stmt.execute("update anuncios set Contenido = '"+imagen+"' where idAnuncios = "+id+" ");
        stmt.execute("update anuncios set img = '"+ruta+"' where idAnuncios = "+id+" ");
        
        response.sendRedirect("news.jsp");
        
        %>
    </body>
</html>
