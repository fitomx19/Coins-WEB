<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
       
        <title>Validando...</title>
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
    Usuario1=request.getParameter("nombre");
    Contrasena=request.getParameter("resultado1");
    
    
  %>
      
    <body>
     <%
     rs=stmt.executeQuery("call validarAES('"+Usuario1+"','"+Contrasena+"')");
     %>
     <%
     if(rs.next()){
         %>
         si jalo
         <%
     }else{
         response.sendRedirect("www.google.com");
     }
     %>
     <%
     
     %>
    </body>
    


    </html>