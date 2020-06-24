<%-- 
    Document   : AgregarIngresoExtra
    Created on : 23/10/2018, 10:12:55 AM
    Author     : fitomx14

    MMTA PARA VARIAR OTRO PROCESO HECHO POR MUA
--%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
 <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
        String ingreso,frecuencia,monto,elec,agua,gas,deudas,food,transporte;
        
       
        int suma,sumaingresos;
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        frecuencia=request.getParameter("frec");
        monto=request.getParameter("monto");
        elec=request.getParameter("elec");
        agua=request.getParameter("agua");
        gas=request.getParameter("gas");
        food=request.getParameter("food");
        deudas=request.getParameter("deudas");
        transporte=request.getParameter("coche");
        
        ingreso=request.getParameter("i_extra");
        
        suma=Integer.parseInt(elec)+Integer.parseInt(agua)+Integer.parseInt(gas)+Integer.parseInt(food)+Integer.parseInt(deudas)+Integer.parseInt(transporte);
        sumaingresos=Integer.parseInt(monto)*Integer.parseInt(frecuencia);
        %>
     <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodos Avanzados de la NSA para actualizar tus ingresos y gastos</title>
    </head>
    <body>
       <%stmt.execute("INSERT INTO gastosfijos (Electricidad,Agua,Gas,Comida,Prestamo,Transporte,Sum) values ('"+elec+"','"+agua+"','"+gas+"','"+food+"','"+deudas+"','"+transporte+"','"+suma+"')");%>
       <%=stmt.execute("insert into ingresos (monto,tiempo,totmonto) values ('"+monto+"','"+frecuencia+"','"+sumaingresos+"')")%>
       <%rs=stmt.executeQuery("SELECT id_gf as id FROM gastosfijos order by id_gf DESC limit 1");%>
       <form action="concluirregistro.jsp" name="name" method="post">
           <%while(rs.next()){%>
           <input type="hidden" name="idgf" value="<%=rs.getString("id")%>">
           <%}%>
        <%rs=stmt.executeQuery("SELECT id_ing as iding FROM ingresos order by id_ing DESC limit 1");%>
        <%while(rs.next()){%>
        <input type="hidden" name="iding" value="<%=rs.getString("iding")%>">
        <%}%>
            <input type="hidden" name="idusuario" value="<%=online1%>">
            <input type="submit" style="display:none" >
       </form>
            <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
           
    </body>
</html>
