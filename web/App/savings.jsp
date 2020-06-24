<%-- 
    Document   : savings
    Created on : 5/11/2018, 08:25:22 PM
    Author     : fitomx14
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodo Avanzado de la CIA Para actualizar Ahorro</title>
          <%HttpSession Usuario=request.getSession(true);%>
         <%String online1=(String)Usuario.getAttribute("sesionid");%>
       <%String online2=(String)Usuario.getAttribute("sesion2");%>
    <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String usr;
    String monto;
    String periodo;
    String ahorro;
    %>
    <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    usr= request.getParameter("usr");
    ahorro= request.getParameter("ahorro");
    monto = request.getParameter("monto");
    periodo = request.getParameter("periodo");
    %>
    </head>
    <body>
        <%
                //update empleados set salario+100 where idarea=18
                //update Ingresos set totmonto=totmonto+'"+ingreso+"' where id_ing='"+id+"'"
        stmt.execute("update planahorro set ahorro=ahorro+'"+monto+"' where id_plan='"+ahorro+"'");
        stmt.execute("update planahorro set ahorro_p='"+monto+"' where id_plan='"+ahorro+"'");
        stmt.execute("update planahorro set tiempo ='"+periodo+"' where id_plan='"+ahorro+"'");
        stmt.execute("update usuario set montometafinal = montometafinal-'"+monto+"' where nom='"+usr+"'");
       %>
              <form action="PaginaPrincipal.jsp" name="name">
            <input type="text" value="<%=online1%>" name="id_usr">
        <input type="submit" style="display:none">
        </form>
      
        
       
         <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
    </body>
</html>
