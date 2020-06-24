<%-- 
    Document   : Validar
    Created on : 26/09/2018, 06:38:50 PM
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
    Contrasena=request.getParameter("resultado");
    
    
  %>
      <%HttpSession Usuario=request.getSession(true);%>
      <%Usuario.setAttribute("sesionusuario",Usuario1);%>

    <body>
        <%
     
          rs=stmt.executeQuery("call validar('"+Usuario1+"','"+Contrasena+"')");
          if(rs.next()){
           %>
           <form action="Validate.jsp" name="meow" method="POST">
               <input type="hidden" value='<%=Usuario1%>' name="INomUsuario"> 
           <input type="submit" style="display:none">
           </form>
           
               
           
                 
           
             
           <%}else{%>
       <%
           response.sendRedirect("../index.html");
       %>
            <%}
        
      %>   
        
       
       <%
         rs.close();
         stmt.close();
       %>
    </body>
    <script>
          window.onload=function(){
              document.forms["meow"].submit();
          }
      </script>


    </html>