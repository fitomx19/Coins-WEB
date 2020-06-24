<%-- 
    Document   : RegistroIngresoExtra
    Created on : 23/10/2018, 07:11:43 PM
    Author     : fitomx14
--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
      <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        
        String id,usr;
     
        
       

      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        id=request.getParameter("id");
        usr=request.getParameter("idusuario");
        
     %>
     <%HttpSession Usuario=request.getSession(true);%>
     <%String online1=(String)Usuario.getAttribute("sesionid");%>
     <html>
     <body>
        <%
        stmt.execute("INSERT into proyecciones (id_usr, id_gv) VALUES ('"+usr+"','"+id+"')");
        
        %>
        <form action="PaginaPrincipal.jsp" name="name" method="post">
            <input type="hidden" value="<%=online1%>" name="id_usr">
     
        </form>
         <script>
          window.onload=function(){
              document.forms["name"].submit();
          }
      </script>
      
    </body>
</html>
