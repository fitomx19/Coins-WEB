<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ahorro</title>
        <noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
           <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
        String Usuario;
        String tiempo;
        String semana;
        String ahorro;
        String gv;
        String usr;
        int hight;
        int suma;
        String x;
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        
        tiempo =request.getParameter("usr");
        ahorro = request.getParameter("NTiempo");
        semana = request.getParameter("Ntime");
        gv = request.getParameter("idgv");
        x = request.getParameter("idingx");
        usr = request.getParameter("usr");
        hight = Integer.parseInt(ahorro)*Integer.parseInt(semana);;
       
        
      // tiempo == usuario
      // ahorro ==  dia,semana,quincena
      // semana ==  ingreso 
        
      %>
      
      <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
      
      <%HttpSession Usuario=request.getSession(true);%>
      <%String online1=(String)Usuario.getAttribute("sesion2");%>
      <%Usuario.setAttribute("sesion11",tiempo);%> 
      <%Usuario.setAttribute("sesion12",ahorro);%>    
      <%Usuario.setAttribute("sesion13",semana);%> 
      <%Usuario.setAttribute("sesion14",Integer.toString(hight));%> 
      
      
  
    </head>
    <body>
       <%
       if(stmt.execute("insert into ingresos (monto, tiempo, totmonto) values ('"+ahorro+"','"+semana+"','"+hight+"')"))
           //INSERT INTO `CoinsProyect`.`Ingresos` (`monto`, `tiempo`, `totmonto`) VALUES ('400', '2', '800');
               { %>
        
                 <h1 align="center">Error en el Registro</h1>
                 <h2 align="center">Intentalo más tarde</h2> 
                 <a href="./index.html">Regresar</a>
        
           
        
       <%   
            }
                   else
            {
       %>
       

       <form action="Primercalculo.jsp" name="name" id="continuarAhorro" method="post">
       
           
           <%
               rs=stmt.executeQuery("select totmonto,id_ing from ingresos order by id_ing DESC limit 1 "); 
               
                while(rs.next()){
        %>            
                      
                    <input type="hidden" style="display: none;" name="iding" value="<%=rs.getString("id_ing")%>">
                    <input type="hidden" style="display: none;" name="totmonto" value="<%=rs.getString("totmonto")%>">
                    <input type="hidden" name="idusr" value="<%=online1%>">
               <%     
               }
               %>
           
               <input type="submit"  style="display: none;" >
         </form>
       
       <%
            }
       %>
 
    </body>
    
</html>