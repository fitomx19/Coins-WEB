<%-- 
    Document   : Registro
    Created on : 21/09/2018, 05:49:30 PM
    Author     : Alumno
--%>
<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
          
<%!
    String Nombre;
    String Email;    
    String FechaNacimiento;
    String Sexo;
    String Password;
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    ResultSet rs1;
%>
    
 <% 
    Nombre=request.getParameter("usr");
    Password=request.getParameter("resultado");
    Email=request.getParameter("email");
   
    FechaNacimiento=request.getParameter("FechaNacimiento");
    Sexo=request.getParameter("sexo");
    
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
%>
    <%HttpSession Usuario=request.getSession(true);%>
    <%Usuario.setAttribute("sesion",Nombre);%>
<%
    rs=stmt.executeQuery("select nom from usuario where nom = '"+Nombre+"'");
    if(rs.next()){
        response.sendRedirect("Registrarse1.jsp");
    }else{
        rs1=stmt.executeQuery("select mail from usuario where mail = '"+Email+"'");
        if(rs1.next()){
        response.sendRedirect("Registrarse2.jsp");
        }else{
        stmt.execute("insert into usuario (nom,psw,mail,bd,sex) values ('"+Nombre+"','"+Password+"','"+Email+"','"+FechaNacimiento+"','"+Sexo+"')");
        response.sendRedirect("ContinuarRegistro.jsp");
    }
   
    }
%>



</html>
