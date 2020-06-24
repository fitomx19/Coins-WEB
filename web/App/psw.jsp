<%-- 
    Document   : name
    Created on : 9/11/2018, 05:15:35 PM
    Author     : Alumno
--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%HttpSession Usuario=request.getSession(true);%>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String nom;
    String id;
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    nom=request.getParameter("resultado");
    id=request.getParameter("id");
    
    
  %>
    <body>
        <%
           stmt.execute("update usuario set psw = '"+nom+"' where id_usr ='"+id+"'");
           response.sendRedirect("perfil.jsp");
        %>
        
    </body>
</html>
