<%-- 
    Document   : ContinuarRegistro2
    Created on : 29/09/2018, 07:17:41 PM
    Author     : fitomx14
--%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Continuar Registro</title>
        <LINK REL=StyleSheet HREF="../DContiReg.css" TYPE="text/css" MEDIA=screen> 
         
        
      <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
        String usr;
        String NPersonas;
        String NServicios;
        String NLuz;
        String NGas;
        String NAgua;
        String NComida;
        String Prestamo;
        String NHormiga;
        String NTransporte;
        int suma;
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        
        usr =request.getParameter("usr");
        NPersonas= request.getParameter("Npersonas");
        NServicios= request.getParameter("Nservicios");
        NLuz=request.getParameter("NLuz");
        NGas= request.getParameter("NGas");
        NAgua = request.getParameter("NAgua");
        NComida =request.getParameter("NComida");
        Prestamo = request.getParameter("NPrestamo");
        NTransporte = request.getParameter("NTransporte");
        NHormiga = request.getParameter("NHormiga");        
        suma = Integer.parseInt(NLuz)+Integer.parseInt(NGas)+Integer.parseInt(NAgua)+Integer.parseInt(NComida)+Integer.parseInt(NTransporte)+Integer.parseInt(Prestamo);
        
      %>
      
       <% //Sesiones%>
       <%HttpSession Usuario=request.getSession(true);%>
       <%String online1=(String)Usuario.getAttribute("sesion");%>
       <%Usuario.setAttribute("sesion2",usr);%>
       <%Usuario.setAttribute("sesion3",NPersonas);%>
       <%Usuario.setAttribute("sesion4",NServicios);%>
       <%Usuario.setAttribute("sesion5",NLuz);%>
       <%Usuario.setAttribute("sesion6",NGas);%>
       <%Usuario.setAttribute("sesion7",NAgua);%>
       <%Usuario.setAttribute("sesion8",NComida);%>
       <%Usuario.setAttribute("sesion9",Prestamo);%>
       <%Usuario.setAttribute("sesion10",NTransporte);%>
         <%Usuario.setAttribute("sesion11",NHormiga);%>
       <%Usuario.setAttribute("sesionx",Integer.toString(suma));%>
       
              <script>
          window.onload=function(){
              document.forms["proyeccion"].submit();
          }
      </script>
       <noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
           
    </head>
    <body>
        
  

  <%
    
      if(stmt.execute("insert into gastosfijos (Electricidad , Agua , Gas, Comida, Prestamo,Transporte, Hormiga, Sum) VALUES  ('"+NLuz+"','"+NAgua+"','"+NGas+"','"+NComida+"','"+Prestamo+"','"+NTransporte+"','"+NHormiga+"','"+suma+"')"))
          //UPDATE `Coins`.`C_Usuarios` SET `id_gf`='1', `id_gv`='1' WHERE `id_usr`='6';//
            {
  %>                 
                <h1 align="center">Error en el Registro</h1>
                <h2 align="center">Intentalo más tarde</h2>   
        <%
            }
        else
            {
                
        %>
        
                
              
             
        <form name="proyeccion" action="RegistroProyeccion.jsp"  method="POST">
                  <%rs=stmt.executeQuery("select id_gf from gastosfijos order by id_gf DESC limit 1");%>
                  <%while(rs.next()){%>
                  <input type="hidden" name="gastosfijos" value="<%=rs.getInt("id_gf")%>">
                  <%}%>
                  <input type="hidden" name="user" value="<%=usr%>">
                  <input type="submit" style="display: none;">
              </form>
              
            
              <%
                %>      
        <%
            }    
        %>
         
      

    </body>
</html>
