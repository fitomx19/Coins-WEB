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
    Usuario1=request.getParameter("nom");
    Contrasena=request.getParameter("psw");
    
    
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
         <div>
              <ul>
        <li><a class="active" href="loginadmin.jsp">Coins</a></li>
             </ul>
        </div>
            
        <h2 align="center">Ten mucho cuidado al actualizar o eliminar usuarios porque que tal que se enojan :c </h2>
        
            <%rs=stmt.executeQuery("SELECT * FROM usuario");%>
            <%
            while(rs.next()){
            %>
            
              
              
           
        
                        <div class="container">
                <div class="left">
                  <form action="actualizar.jsp">
                      <label>Actualizar nombre de usuario</label> <input type="text" name="act" value="<%=rs.getString("nom")%>"   minlength="5" maxlength="40" required pattern="[A-Za-z0-9]+" placeholder="<%=rs.getString("nom")%>"><br>
                      <input type="hidden" name="hidden" value="<%=rs.getString("nom")%>">
                    <input type="submit" value="Actualizar">
                </form>
                    <form action="eliminar.jsp">
                         <label>Eliminar definitivamente  usuario</label><input type="hidden" name="hidden" value="<%=rs.getString("nom")%>">
                        <input type="submit" value="Eliminar">
                    </form>
                    <br>
                    </div>
                    
                    
                <div class="center">
                
                    <form action="eliminar.jsp">
                        <input type="hidden" value="<%=rs.getString("nom")%>">
                    </form>
                    </div>
                </div>
            <%    
            }
            %>
                
    </body>
</html>
