<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
      <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
 
     
        
       

      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
      
        
     %>
     <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
     <html>
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