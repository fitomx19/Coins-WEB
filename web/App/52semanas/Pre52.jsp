<%-- 
    Document   : Pre52
    Created on : 19/02/2019, 04:30:40 PM
    Author     : SPARTAN_GEEK
--%>

<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodo Cuantico para ingresar alas 52 semanas</title>
 <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String id_usuario;
    int id_usr;
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    id_usuario=request.getParameter("usr");
    id_usr=Integer.parseInt(id_usuario);
    
    stmt.execute("INSERT INTO `coinsproyect`.`52semanas` (id_usr,FechaInicio,FechaFin,id52help,Activo,FechaProx) VALUES ('"+id_usr+"',CURDATE(),DATE_ADD(CURDATE(), INTERVAL 1 YEAR),1,1,DATE_ADD(CURDATE(), INTERVAL 7 DAY));"); //INSERT INTO `coinsproyect`.`52semanas` (id_usr,FechaInicio,FechaFin,Semanas_Faltantes,Activo) VALUES ('12',CURDATE(),DATE_ADD(CURDATE(), INTERVAL 1 YEAR),52,1);
   
    
  %>
    </head>
    <body>
        <% rs=stmt.executeQuery("select id52semanas,Prox_Ahorro from 52semanas where id_usr="+id_usuario+" order by id52semanas DESC limit 1");
            while(rs.next()){%>
        <form action="52semanas.jsp"  name="name" method="POST">
            <input type="text" name="usr1" value="<%=id_usr%>">
            <input type="text" name="sm" value="<%=rs.getString("id52semanas")%>">
            <input type="submit">
     <%}%>      
        </form>
         <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
           </script>
        
    </body>
</html>
