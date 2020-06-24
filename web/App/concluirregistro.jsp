<%-- 
    Document   : concluirregistro
    Created on : 1/11/2018, 12:54:59 PM
    Author     : fitomx14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
 <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
        String gf,ing,usu;
        
       
        int suma,sumaingresos;
 %>
 <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        gf=request.getParameter("idgf");
        ing=request.getParameter("iding");
        usu=request.getParameter("idusuario");
      
 %>
     <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodos Avanzados para el conteo de puntos</title>
    </head>
    <body>
       <%
        stmt.execute("INSERT into proyecciones (id_usr,id_gf,id_ing) VALUES ('"+usu+"','"+gf+"','"+ing+"')");
        
       %>
       <form action="PaginaPrincipal.jsp" name="name" method="POST">
            <input type="hidden" value="<%=online1%>" name="id_usr">
          
            <input type="submit" style="display:none">
        </form>
         <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
    </body>
</html>
