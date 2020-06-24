<%-- 
    Document   : Validate
    Created on : 16/11/2018, 06:46:03 PM
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
    String Usuario1;
    String Contrasena;
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    Usuario1=request.getParameter("INomUsuario");
    
    
    
  %>
  <%HttpSession Usuario=request.getSession(true);%>
   <%String online2=(String)Usuario.getAttribute("sesionusuario");%>
    <body>
       
        <%
         rs=stmt.executeQuery("call idplan('"+Usuario1+"')");
      while(rs.next()){
      
      
        if(rs.getString("identificador").equals("nada")){
            response.sendRedirect("incompleto.jsp");
            //esto es una genialidad
        
        }else if(!"identificador".equals(rs.getString("identificador"))){%>
        
        <form action="PaginaPrincipal.jsp" name="meow" method="POST">
             <%
           rs=stmt.executeQuery("call idvalidar('"+Usuario1+"')");
           while(rs.next()){
           %>
           <input type="hidden" name="id_usr" value="<%=rs.getInt("id_usr")%>">  
           <input type="submit" style="display:none">
             
             </form>   
                 
                 <%
                }
            }
        }
      %>
      <script>
          window.onload=function(){
              document.forms["meow"].submit();
          }
      </script>
    </body>
    
</html>
