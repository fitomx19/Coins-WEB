<%-- 
        Document   : loginadmin
    Created on : 9/11/2018, 09:11:11 AM
    Author     : fitomx14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                 <link rel="stylesheet" href="../CSS/adminusuarios.css">
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
        <title>Administrador <%=linea%></title>
       
    </head>
    <body>
        <DIV>
    <ul>
        <li><a class="active" href="../index.html">Coins</a></li>
        <li><a  href="close.jsp">Cerrar Sesion</a></li>
    </ul>
        </DIV>
        <div align="center">
            
        <h1>Bienvenido <%=linea%></h1>
        <a href="AdministrarUsuarios.jsp">Administrar Usuarios</a>
        <a href="https://drive.google.com/drive/folders/10QvzYkED46_887hvi27hjaVGg2WRviuT">Drive</a>
        <a href="news.jsp">Administrar Noticias</a>
    
        </div>
    </body>
</html>
