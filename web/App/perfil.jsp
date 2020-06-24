<%-- 
    Document   : perfil
    Created on : 9/11/2018, 04:47:43 PM
    Author     : Alumno
--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
 <%HttpSession Usuario=request.getSession(true);%>
       <%String online1=(String)Usuario.getAttribute("sesionid");%>
       <%String online2=(String)Usuario.getAttribute("sesionusuario");%>
       <%
       
       if(online2==null)
       {
       response.sendRedirect("../index.html");
       }
       %>
<html>
<head>
    <title>Perfil de <%=online2%></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="../JS/sha.js"></script>
  <script type="text/javascript">
  function getHash(form){
		var hashInput = document.getElementById("cadena");
		var hash = new jsSHA(hashInput.value, "TEXT");
		var hashOutput = document.getElementById("resultado");
		hashOutput.value = hash.getHash("SHA-512","HEX");
		console.log(hashInput.value);
		//form.submit();
	}
        </script>
  <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
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
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}
input[type=password], select, textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}
input[type=submit], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
    
}
/* Style the header with a grey background and some padding */
.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

/* Style the header links */
.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

/* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

/* Change the background color on mouse-over */
.header a:hover {
  background-color: #ddd;
  color: black;
}

/* Style the active/current link*/
.header a.active {
  background-color: dodgerblue;
  color: white;
}

/* Float the link section to the right */
.header-right {
  float: right;
}

/* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */ 
@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  .header-right {
    float: none;
  }
}
</style>
</head>
<body>
<div class="header">
  <a href="#default" class="logo">Coins</a>
  <div class="header-right">
    <a class="active" href="regresar.jsp">Regresar</a>
    <a href="CerrarSesion.jsp">Cerrar Sesion</a>
   
  </div>
</div>
<h2 style="text-align:center">Perfil de Usuario</h2>

<div class="card">
   <%rs=stmt.executeQuery("select sex from usuario where id_usr='"+online2+"'and sex='M'");%>
   <%if(rs.next()){%>
  <img src="/w3images/team2.jpg" alt="<%=online2%>" style="width:100%">
  
  <%}else{%>
  
  <%}%>
  <br>

  <h1> <%=online2%></h1>
  <p class="title">Usuario</p>
  
  <div style="margin: 24px 0;">
      <form action="name.jsp">
          <input type="hidden" name="id" value="<%=online1%>">
          <input type="text" name="name" placeholder="Nuevo Nombre Usuario">
          <input type="submit" value="Cambiar Nombre">
      </form>
          <form  action="psw.jsp" name="authForm" method="post">
          <input type="hidden" name="id" value="<%=online1%>">
          <input type="password" placeholder="Nueva contraseña" name="account"  id="cadena"> 
          <input type="hidden" name="resultado" id="resultado" size="100">
          <input type="submit" onclick="getHash(authForm)" value='Cambiar Contraseña'>
       
      </form>
 </div>

</div>

</body>
</html>
