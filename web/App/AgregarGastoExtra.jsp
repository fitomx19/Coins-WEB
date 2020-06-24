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
        
        String gasto,monto,gf,hormiga,tipo;
       
       
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        gasto=request.getParameter("g_extra");
        monto=request.getParameter("m_extra");
        hormiga=request.getParameter("hormiga");
        tipo=request.getParameter("tipo");
        gf=request.getParameter("gf");
        
        %>
     <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodos Avanzados de la CIA para registrar un Gasto EXtra</title>
    </head>
    <body>
       <%stmt.execute("	INSERT INTO gastosvariables (`NGasto`,`Gasto`,`status`,`tipo`) VALUES ('"+gasto+"','"+monto+"','"+hormiga+"','"+tipo+"')");%>
       <%stmt.execute("update gastosfijos set Sum=Sum+'"+monto+"' where id_gf='"+gf+"'");%>
       <%stmt.execute("update gastosfijos set Extra=Extra+'"+monto+"' where id_gf='"+gf+"'");%>
       <%rs=stmt.executeQuery("SELECT id_gv as id FROM gastosvariables order by id_gv DESC limit 1");%>
       <form action="RegistroGastosExtra.jsp" name="name">
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
