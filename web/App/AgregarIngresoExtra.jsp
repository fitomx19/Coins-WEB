<%-- 
    Document   : AgregarIngresoExtra
    Created on : 23/10/2018, 10:12:55 AM
    Author     : fitomx14
--%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
 <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
        String ingreso;
        String id;
       
        int suma;
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        ingreso=request.getParameter("i_extra");
         id=request.getParameter("ing");
        %>
     <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodos Avanzados de la CIA para registrar un Ingreso EXtra</title>
    </head>
    <body>
       <%stmt.execute("	INSERT INTO ingresos_x (`monto`) VALUES ('"+ingreso+"')");%>
       <%stmt.execute("update ingresos set totmonto=totmonto+'"+ingreso+"' where id_ing='"+id+"'");%>
      
       <%rs=stmt.executeQuery("SELECT id_ing_x as id FROM ingresos_x order by id_ing_x DESC limit 1");%>
       <form action="RegistroIngresoExtra.jsp" name="name" method="post">
           <%while(rs.next()){%>
           <input type="hidden" name="id" value="<%=rs.getString("id")%>">
           <%}%>
            <input type="hidden" name="idusuario" value="<%=online1%>">
            <input type="submit" style="display:none" >
       </form>
            <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
      <noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
           
    </body>
</html>
