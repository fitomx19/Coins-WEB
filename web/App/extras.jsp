<%-- 
    Document   : extras
    Created on : 1/11/2018, 02:02:58 PM
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
        <title>Metodos avanzados de Actualizacion</title>
    </head>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String gf,ing,gastox,ingresox,usr;
    
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    gf=request.getParameter("gf");
    ing=request.getParameter("ing");
    ingresox=request.getParameter("ingresox");
    gastox=request.getParameter("gastox");
    usr=request.getParameter("usr");
    
    
    
  %>
    <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
    <body>
       
       
       <%--stmt.execute("update GastosVariables as g inner join Proyecciones as p on g.id_gv=p.id_gv set g.status='2' where id_usr='"+usr+"'");--%>
       
       <form action="PaginaPrincipal.jsp" name="name">
            <input type="hidden" value="<%=online1%>" name="id_usr">
            <%rs=stmt.executeQuery("SELECT sum(x.monto) as suma FROM Ingresos_X AS x JOIN Proyecciones AS p ON x.id_ing_x = p.id_ing_x  where id_usr ='"+usr+"' and x.fecha between '2018-03-11 00:00:00' and '2019-05-11 23:59:00'");%>
        <%while(rs.next()){%>
        
        <input type="hidden" value="<%=rs.getString("suma")%>" name="ingresox">
        <%}%>
  
        <%rs=stmt.executeQuery("SELECT sum(g.Gasto) as suma FROM GastosVariables AS g JOIN Proyecciones AS p ON g.id_gv = p.id_gv  where id_usr ='"+usr+"' and g.fecha between '2018-03-11 00:00:00' and '2019-05-11 23:59:00' and g.status='1'");%>
        <%while(rs.next()){%>
       <input type="hidden" value="<%=rs.getString("suma")%>" name="gastox">
        <%}%>
            <input type="submit" style="display:none">
        </form>
         <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
    </body>
</html>
