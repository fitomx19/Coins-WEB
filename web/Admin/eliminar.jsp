<%-- 
    Document   : AdministrarUsuarios
    Created on : 15/11/2018, 05:29:04 PM
    Author     : fitomx14
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Metodos Avanzados de Control Mental</title>
         <link rel="stylesheet" href="../CSS/adminusuarios.css">
          <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
          
          
          
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
    Contrasena = request.getParameter("hidden");
  
    
    
  %>
          
         <%
           String usuario = "";
         
           HttpSession Admin=request.getSession();%>
         <%
          if(Admin.getAttribute("admin") == null)
            {
            %>
            <jsp:forward page="https://www.youtube.com/watch?v=mJZZNHekEQw&feature=yout.be&t=84">
            <jsp:param name="error" value="Es
            obligatorio identificarse"/>
            </jsp:forward>
            <%
            } else {
            usuario = (String)Admin.getAttribute("admin");
            }
            %>
            <%
                String linea=(String)Admin.getAttribute("admin");
            %>
    </head>
    <body>
                <%
                
                stmt.execute("delete from usuario where nom='"+Contrasena+"'");
                response.sendRedirect("AdministrarUsuarios.jsp");
                
                %>
    </body>
</html>
