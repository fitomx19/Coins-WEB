<%-- 
    Document   : 52semanas
    Created on : 16/02/2019, 09:54:00 AM
    Author     : Adolfo
--%>

<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*,java.util.Arrays"%>
<%@page errorPage = "Error.jsp"%>
<link href="../../CSS/52semanas.css" rel="stylesheet" type="text/css">
<jsp:include page="merge.html" flush="true" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reto 52 Semanas</title>
       
        <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    int id_usuario,faltantes;
    int semanas;
    String week,proxy,raza,gul;
    int arreglado[][]= new int [10][10];
     
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    id_usuario = Integer.parseInt(request.getParameter("usr1"));
    faltantes = Integer.parseInt(request.getParameter("sm"));
    int arreglado[][] = {{1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10}};
    %>
    </head>
 
    <body>
         <div>
          <ul>
        <li><a class="active" href="../regresar.jsp">Regresar</a></li>
        <li><a href="../CerrarSesion.jsp">Cerrar Sesion</a></li>
       
         </ul>
         </div>
        <div align='center'>
            <form action="up52semanas.jsp" method="POST">
                <%
            rs=stmt.executeQuery("SELECT a.a1 , b.FechaProx as f , b.id52semanas as x from 52help as a inner join 52semanas as b on a.id52help=b.id52help  where b.id_usr =  "+id_usuario+" order by b.id52semanas desc limit 1 ");
            
            while(rs.next()){
            proxy = rs.getString("a1"); 
            raza = rs.getString("f"); 
            gul = rs.getString("x"); 
            }
            
            %>
            <h2>
                <input type="hidden" name = "usr1" value="<%=id_usuario%>">
                <label>Monto semanal actual $<%=proxy%>.00 mnx</label>
                <input type="hidden"  name="proxy" value="<%=proxy%>"><br>
                <input type="hidden"  name="f" value="<%=raza%>"><br>
                <input type="hidden"  name="x" value="<%=gul%>"><br>
                <button type="submit">Realizar Abono</button>
            </h2> 
            </form>
            
            
            <%
            rs=stmt.executeQuery("call  prox_Sem_52 ('"+id_usuario+"')");
            
            while(rs.next()){
            week = rs.getString("Proximo_ahorro"); 
            
            %>
            
            <%
            }
            %>
            
            
   <%
   // Aqui va la tabla para poder meterle el CSS pertinente.
   %>
            <table class="w3-table w3-striped w3-bordered" >
  <tr>
    <th><h1>Número de semana</h1></th>
    <th><h1>Monto a Ahorrar</h1></th>
   <th><h1>Ahorro Acumulado</h1></th>
  </tr>
 
            
           
            <%
            rs=stmt.executeQuery("select id52help from 52semanas where id_usr='"+id_usuario+"' order by id52semanas DESC limit 1 ");
            
            while(rs.next()){
            semanas = rs.getInt("id52help"); 
            }
            %>
           
            <%
            rs=stmt.executeQuery("select * from 52help where semana between "+semanas+" and 53");
            %>
            <h1>Perfecto vas en la semana número <%=semanas%> , tu próximo ahorro parcial es el <%=week%> </h1>
            <%    
            while(rs.next()){%>
               
               <tr  class="w3-hover-green">
                <td><h2> Semana: <%=rs.getInt("id52help")%></h2></td>
                <td><h2> Ahorro: $<%=rs.getInt("a1")%>.00</h2></td>
                <td><h2>$<%=rs.getInt("sum")%>.00</h2></td>
                <%
            
                %>
              </tr>
              
             
              
             
             
            
           
                
                
                
                     
          
               
            <%
            }
           %>
            </table>  
        </div>
        
        <div align="center">
            <h1></h1>
        </div>
    <div align="center">
        <h2>¿Deseas terminar con el reto?</h2>
        <form action="b_52semanas.jsp">    
            <input type="hidden" name="usr1" value="<%=id_usuario%>">
            <input type="submit" value="Terminar Reto" size="30">      
        </form>
    </div>
    </body>
</html>
