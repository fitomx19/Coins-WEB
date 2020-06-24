<%-- 
    Document   : ActualizarMeta
    Created on : 7/11/2018, 01:54:24 PM
    Author     : fitomx14
--%>

<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodo Avanzado de la CIA Para actualizar Meta de Ahorro</title>
          
         <%HttpSession Usuario=request.getSession(true);%>
         <%String online1=(String)Usuario.getAttribute("sesionid");%>
         <%String online2=(String)Usuario.getAttribute("sesion2");%>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String nom;
    String extr;
    String plan;
    String ahorro;
    String p,usr,nombremeta,montometa;
   
    %>
    <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    nom= request.getParameter("nom");
    extr= request.getParameter("i_extra");
    plan = request.getParameter("plan");
    ahorro = request.getParameter("ahorro");
    p = request.getParameter("id_plan");
    usr = request.getParameter("identificador");
    nombremeta = request.getParameter("nombremeta");
    montometa = request.getParameter("montometa");
    
    
    %>
    
    <% 
        stmt.execute("update usuario set meta = '"+nom+"' where id_plan='"+plan+"'" );
        stmt.execute("update usuario set montometa = '"+extr+"' where id_plan='"+plan+"'");
        stmt.execute("update usuario set montometafinal = '"+extr+"' where id_plan='"+plan+"'");
        stmt.execute("update planahorro set ahorro = ahorro-'"+ahorro+"' where id_plan='"+p+"'" );
        stmt.execute("insert into coinsproyect.historial_metas (id_usr,nombre_meta,monto_meta) values('"+usr+"','"+nombremeta+"','"+montometa+"')");
        //INSERT INTO `coinsproyect`.`historial_metas` (`idhistorial_metas`, `id_usr`, `nombre_meta`, `monto_meta`) VALUES ('1', '2', '2', '2');
        //insert into proyecciones (id_usr,id_gf) VALUES ('"+usr+"','"+fijos+"')"))

        
    %>
    
    </head>
    <body>
       <form action="PaginaPrincipal.jsp" name="name" method="POST">
        <input type="hidden" value="<%=online1%>" name="id_usr">
        <input type="submit" style="display:none">
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
