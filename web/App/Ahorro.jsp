<%-- 
    Document   : Ahorro
    Created on : 26/09/2018, 06:38:35 PM
    Author     : fitomx14
--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../CSS/ahorrocss.css" rel="stylesheet" type="text/css">
         <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Ahorro</title>
        <%HttpSession Usuario=request.getSession(true);%>
         <%String online1=(String)Usuario.getAttribute("sesion");%>
       <%String online2=(String)Usuario.getAttribute("sesion2");%>
       <%
       
       if(online2==null)
       {
       response.sendRedirect("../index.html");
       }
       %>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
<script>
var options = {
		20 : ["88","176","264","352","440","528","529"],
                4 : ["671","1230","1848","2464","3080","3696","3697"],
		2 : ["1343","2640","3960","5280","6600","7920","7921"]
}


$(function(){
	var fillSecondary = function(){
		var selected = $('#primary').val();
                
		$('#secondary').empty();
		options[selected].forEach(function(element,index){
			$('#secondary').append('<option value="'+element+'">'+element+'</option>');
		});
	}
	$('#primary').change(fillSecondary);
	fillSecondary();
        
});
</script>
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
        
         <ul>
           <li><a class="active" href="../index.html">Coins</a></li>
           
           <li><a href="#about">Ayuda</a></li>
         </ul>
        
        
        
        <div align="center" class="w3-container w3-white">
            
        <h1>Ya falta poco <%=online1%></h1>
        
    
        <form action="ContinuarAhorro.jsp" name="Ahorro" method="post">
            <h2>
        <label>¿Cada cuando tienes ingresos?</label>
        
        <select id="primary" name="Ntime">
        <option value="20">Diario</option>
        <option value="4">Semanal</option>
        <option value="2">Quincenal</option>
        </select> 
        <br>
        
        <label id="tercer">¿Cual es tu ingreso aproximado? Hasta/Más de</label><select id="secondary" name="NTiempo">
        </select><label>mnx</label>
        <br>
            </h2>   
        <input type="hidden" name="usr" value="<%=online2%>">
        
        <input type="submit" value="Continuar">
            
        </form>
        <h6>*Basados en Salarios minimos netos <a href="https://salariominimo2018mexico.com/" target="_blank">Noviembre 2018</a></h6>
        <br>
        
        </div>
        <div class="w3-container w3-green" align="center">
            <h1>¿Sabias que?</h1>
        </div>
        <div class="w3-container w3-white" align="center">
            <h4>
            Los gastos hormiga son pequeñas sumas de dinero que gastamos en placeres cotidianos o en cosas que no utilizamos. 
            Por tratarse de bajas sumas de dinero, generalmente no les prestamos ninguna atención y pasan prácticamente desapercibidos para nosotros. 
            No obstante, los gastos hormiga pueden tener un efecto muy perjudicial en nuestro presupuesto, 
            destruyen nuestra capacidad de ahorro e incluso pueden llevarnos al endeudamiento innecesario.
            </h4>


              <div class="w3-content w3-section" style="max-width:500px">
              <img class="mySlides" src="http://michoacantrespuntocero.com/wp-content/uploads/2016/01/Gastos-Hormiga.jpg" style="height: 600px; width: 600px;">
              <img class="mySlides" src="https://www.mientrastantoenmexico.mx/wp-content/uploads/2016/11/15235625_10155047388709587_3149625678669838177_o.jpg" style="height: 600px; width: 600px;">
              <img class="mySlides" src="https://blog.paybook.com/wp-content/uploads/2018/01/Infografia_Gasto_Hormiga_finanzas_personales-1.png" style="height: 600px; width: 600px;">
            </div>
        </div>
      
        
        <div>
        
</div>
        <script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000); // Change image every 2 seconds
}
</script>
<noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
    </body>

</html>
