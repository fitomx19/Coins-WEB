<%-- 
    Document   : news
    Created on : 9/03/2019, 09:46:28 AM
    Author     : Adolfo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Noticias</title>
       
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
    </head>
 
    <body>
       <div class="w3-container w3-black">
        <ul>
         <a class="active" href="loginadmin.jsp">Regresar a Administrador</a> <a href="../App/CerrarSesion.jsp">Cerrar Sesion</a> 
        </ul>
       </div>
        <h2>El tamaño recomendado es de 480px * 280px</h2>
<div class="w3-sidebar w3-bar-block w3-green w3-card" style="width:130px">
  
  
  <button class="w3-bar-item w3-button tablink" onclick="openCity(event, '1')">Primer Noticia</button>
  <button class="w3-bar-item w3-button tablink" onclick="openCity(event, '2')">Segunda Noticia</button>
  <button class="w3-bar-item w3-button tablink" onclick="openCity(event, '3')">Tercer Noticia</button>
  <button class="w3-bar-item w3-button tablink" onclick="openCity(event, '4')">Cuarta Noticia</button>
  <button class="w3-bar-item w3-button tablink" onclick="openCity(event, '5')">Quinta noticia</button>
</div>

<div style="margin-left:130px">
  <div class="w3-padding"><h2>Aqui apareceran todas las noticias del mes de <%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat ("MMMM  ");
         out.print(ft.format(dNow));
         %></h2></div>

  <div id="1" class="w3-container city" style="display:none">
    <h2>Primer Noticia </h2>
    <%
    rs=stmt.executeQuery("select * from anuncios where idAnuncios= 1");
    while(rs.next()){
    %>
    <p>Contenido:<%=rs.getString("Contenido")%></p>
    <p>Ruta de la imagen:<%=rs.getString("img")%></p>
    <img src="<%=rs.getString("img")%>" width="200px" height="100px">
    <br>
    
    <%
    }
    %>
    <br>
    <form action="actualizar1.jsp" method="POST">
        <input type="hidden" value="1" name="idnoticia">
        <textarea rows="4" cols="50" placeholder="Nuevo Contenido" name="contenido">
            
        </textarea>
        <br>
        <input type="text"  placeholder="Ruta de la imagen" name="img">
        <input type="submit" value="Actualizar Noticia">
    </form>
  </div>

  <div id="2" class="w3-container city" style="display:none">
    <h2>Segunda Noticia </h2>
    <%
    rs=stmt.executeQuery("select * from anuncios where idAnuncios= 2");
    while(rs.next()){
    %>
    <p>Contenido:<%=rs.getString("Contenido")%></p>
    <p>Ruta imagen:<%=rs.getString("img")%></p>
    <img src="<%=rs.getString("img")%>" width="200px" height="100px">
    <br>
    
    <%
    }
    %>
    <br>
    <form action="actualizar1.jsp" method="POST">
        <input type="hidden" value="2" name="idnoticia">
        <textarea rows="4" cols="50" placeholder="Nuevo Contenido" name="contenido">
            
        </textarea>
        <br>
        <input type="text"  placeholder="Ruta de la imagen" name="img">
        <input type="submit" value="Actualizar Noticia">
    </form>
  </div>

  <div id="3" class="w3-container city" style="display:none">
      <h2>Tercer Noticia </h2>
    <%
    rs=stmt.executeQuery("select * from anuncios where idAnuncios= 3");
    while(rs.next()){
    %>
    <p>Contenido:<%=rs.getString("Contenido")%></p>
    <p>Ruta imagen:<%=rs.getString("img")%></p>
    <img src="<%=rs.getString("img")%>" width="200px" height="100px">
    <br>
    
    <%
    }
    %>
    <br>
    <form action="actualizar1.jsp" method="POST">
        <input type="hidden" value="3" name="idnoticia">
        <textarea rows="4" cols="50" placeholder="Nuevo Contenido" name="contenido">
            
        </textarea>
        <br>
        <input type="text"  placeholder="Ruta de la imagen" name="img">
        <input type="submit" value="Actualizar Noticia">
    </form>
  </div>
  <div id="4" class="w3-container city" style="display:none">
      <h2>Cuarta Noticia </h2>
    <%
    rs=stmt.executeQuery("select * from anuncios where idAnuncios= 4");
    while(rs.next()){
    %>
    <p>Contenido:<%=rs.getString("Contenido")%></p>
    <p>Ruta imagen:<%=rs.getString("img")%></p>
    <img src="<%=rs.getString("img")%>" width="200px" height="100px">
    <br>
    
    <%
    }
    %>
    <br>
    <form action="actualizar1.jsp" method="POST">
        <input type="hidden" value="4" name="idnoticia">
        <textarea rows="4" cols="50" placeholder="Nuevo Contenido" name="contenido">
            
        </textarea>
        <br>
        <input type="text"  placeholder="Ruta de la imagen" name="img">
        <input type="submit" value="Actualizar Noticia">
    </form>
  </div>
  <div id="5" class="w3-container city" style="display:none">
      <h2>Quinta Noticia </h2>
    <%
    rs=stmt.executeQuery("select * from anuncios where idAnuncios= 5");
    while(rs.next()){
    %>
    <p>Contenido:<%=rs.getString("Contenido")%></p>
    <p>Ruta imagen:<%=rs.getString("img")%></p>
    <img src="<%=rs.getString("img")%>" width="200px" height="100px">
    <br>
    
    <%
    }
    %>
    <br>
    <form action="actualizar1.jsp" method="POST">
        <input type="hidden" value="5" name="idnoticia">
        <textarea rows="4" cols="50" placeholder="Nuevo Contenido" name="contenido">
            
        </textarea>
        <br>
        <input type="text"  placeholder="Ruta de la imagen" name="img">
        <input type="submit" value="Actualizar Noticia">
    </form>
  </div>

</div>

<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-black", ""); 
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-black";
}
</script>

        
</html>
