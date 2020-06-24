<%-- 
    Document   : RegistroProyeccion
    Created on : 19/10/2018, 10:26:10 AM
    Author     : fitomx14
--%>

<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro primera proyeccion</title>
  <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String Usuario;
    int usr;
    String fijos;
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    Usuario =request.getParameter("user");
    usr = Integer.parseInt(Usuario);
    fijos = request.getParameter("gastosfijos");
     
  %>
       <%HttpSession Usuario=request.getSession(true);%>
       <%String online1=(String)Usuario.getAttribute("sesion");%>
    </head>
    <body>
        <%if(stmt.execute("insert into proyecciones (id_usr,id_gf) VALUES ('"+usr+"','"+fijos+"')"))
        {%>
                <h1 align="center">Error en el Registro</h1>
                <h2 align="center">Intentalo más tarde</h2>   
        <%
            }
        else
            {
        %>
        
        <form name="name" action="../App/Ahorro.jsp" method="post">
                  <%rs=stmt.executeQuery("select idProyecciones from proyecciones order by idProyecciones DESC limit 1");%>
                  <%while(rs.next()){%>
                  <input type="hidden" name="idproyecciones" value="<%=rs.getInt("idProyecciones")%>">
                  <%}%>
                
                  <input type="submit" style="display: none;">
              </form>
        <%
        }
        %>
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
