<%-- 
    Document   : RegistroPrimerCalculo
    Created on : 13/10/2018, 09:13:13 PM
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
    </head>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String meta,usuario;
    String ahorro;
    String epoca,coins;
    
    %>
     <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    meta = request.getParameter("meta");
    ahorro = request.getParameter("ahorro");
    usuario = request.getParameter("idusuario");
    epoca = request.getParameter("epoca");
    coins= request.getParameter("coins");
  %>
  
  <%
    stmt.execute("update usuario set meta='"+meta+"' where id_usr='"+usuario+"'");
    stmt.execute("update usuario set montometa='"+ahorro+"' where id_usr='"+usuario+"'");
    stmt.execute("update usuario set montometafinal='"+ahorro+"' where id_usr='"+usuario+"'");
    
    stmt.execute("insert into planahorro (tiempo,ahorro,ahorro_p) values ('"+epoca+"','"+coins+"','"+coins+"')");
    
    
    rs=stmt.executeQuery("select id_plan from planahorro order by id_plan DESC limit 1");
    while(rs.next()){
        %>
        <form action="Registroplanahorro.jsp" name="planahorro" method="post">
            <input type="hidden" value="<%=rs.getString("id_plan")%>" name="plan">
            <input type="hidden" value="<%=usuario%>" name="usuario">
            <input type="submit" style="display:none;">
        </form>
        <%
    }
   
  %>
  <script>
          window.onload=function(){
              document.forms["planahorro"].submit();
          }
      </script>
    
</html>
