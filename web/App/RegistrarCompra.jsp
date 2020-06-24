<%-- 
    Document   : RegistrarCompra
    Created on : 18/11/2018, 01:58:53 PM
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
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/alertify.min.js"></script>
       
        <title>Validando...</title>
    </head>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String monto;
    String tiempo;
    String nombre;
    String plan,ahorro,p;
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    
    monto=request.getParameter("monto");
    tiempo=request.getParameter("tiempo");
    nombre=request.getParameter("nombre");
    plan=request.getParameter("id_plan");
    ahorro = request.getParameter("ahorro2");
    p = request.getParameter("id_plan2");
    
  %>
         <%HttpSession Usuario=request.getSession(true);%>
         <%String online1=(String)Usuario.getAttribute("sesionid");%>
         <%String online2=(String)Usuario.getAttribute("sesion2");%>
    <body>
        <%
        stmt.execute("update usuario set meta = '"+nombre+"' where id_plan='"+plan+"'" );
        stmt.execute("update usuario set montometa = '"+monto+"' where id_plan='"+plan+"'");
        stmt.execute("update usuario set montometafinal = '"+monto+"' where id_plan='"+plan+"'");
        stmt.execute("update planahorro set ahorro = ahorro-'"+ahorro+"' where id_plan='"+p+"'" );
        
        
        %>
        
        <form action="consejos.jsp" name="name" method="post" >
              <input type="hidden" value="<%=online1%>" name="usr">
              <%rs=stmt.executeQuery("call gastosfijos('"+online1+"')");
              while(rs.next()){
              %>
              <input type="hidden" value="<%=rs.getString("Electricidad")%>" name="luz"> 
              <input type="hidden" value="<%=rs.getString("Agua")%>" name="agua">
              <input type="hidden" value="<%=rs.getString("Gas")%>" name="gas">
              <input type="hidden" value="<%=rs.getString("Comida")%>" name="comida">
              <input type="hidden" value="<%=rs.getString("Transporte")%>" name="coche">
              <input type="hidden" value="<%=rs.getString("Prestamo")%>" name="prestamo">
              <%}%>
              <%rs=stmt.executeQuery("call ingresostot ('"+online1+"')");
              while(rs.next()){
              %>
              <input type="hidden" value="<%=rs.getString("totmonto")%>" name="monto">
              <%}%>
               <%rs=stmt.executeQuery("call savings ('"+online1+"')");
                while(rs.next()){
              %>
              <input type="hidden" value="<%=rs.getString("ahorro")%>" name="ahorro">
              <input type="hidden" value="<%=rs.getString("tiempo")%>" name="tiempo">
              <%}%>
              <input type="submit" value="Consejos Personalizados" style="display:none">
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
