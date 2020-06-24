<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Primer Ahorro</title>
        <link href="../CSS/1calculocss.css" rel="stylesheet" type="text/css">
        <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/alertify.min.js"></script>
              <script src="../JS/jquery.min.js"></script>  
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/css/alertify.min.css"/>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/css/themes/default.min.css"/>
          <script type="text/javascript">
            $(function () {
                //Para escribir solo letras
                $('#miCampo1').validCampoFranz('abcdefghijklmnñopqrstuvwxyzáéiou');

                //Para escribir solo numeros    
                $('#miCampo2').validCampoFranz('0123456789');
                
                 $('#miCampo3').validCampoFranz('0123456789abcdefghijklmnñopqrstuvwxyzáéiou');
            });
        </script>     
        
      <%!
       
        
        String Usuario;
        String tiempo;
        String semana;
        String ahorro;
        String suma;
        String usr;
        String id;
        int porcentaje1;
        int porcentaje2;
        int porcentaje3;
        int porcentaje4;
        int porcentaje5;
        
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();
        suma=request.getParameter("totmonto");
        porcentaje1=10;
        porcentaje2=15;
        porcentaje3=20;
        porcentaje4=25;
        porcentaje5=30;
        usr=request.getParameter("idusr");
        id=request.getParameter("iding");
       
        
        
      %>
      
      <%stmt.execute("update proyecciones set id_ing='"+id+"' where id_usr='"+usr+"'");%>
      
      
      <%HttpSession Usuario=request.getSession(true);%>
      
      <%String online1=(String)Usuario.getAttribute("sesion2"); //idusuario%>
      <%String online5=(String)Usuario.getAttribute("sesion11"); //idtiempo%> 
      <%String online6=(String)Usuario.getAttribute("sesion12"); //ahorro%>
      <%String online7=(String)Usuario.getAttribute("sesion13"); //semana%>
      <%String online8=(String)Usuario.getAttribute("sesion14"); //semana%>
      <%String online9=(String)Usuario.getAttribute("sesionx"); //semana%>
      
      <script>
            $(document).ready(function() {
        $("#fname").click(function() {
            if (this.value == "180") {
                $("#1").css("display", "inline");
            }
            else if(this.value == "280") {
                $("#2").css("display", "inline");
            }
            else if(this.value == "380") {
                $("#3").css("display", "inline");
            }
            else if(this.value == "480") {
                $("#4").css("display", "inline");
            }
            else if(this.value == "481") {
                $("#5").css("display", "inline");
            }
            else if(this.value == "960") {
                $("#6").css("display", "inline");
            }
            else if(this.value == "1560") {
                $("#7").css("display", "inline");
            }
            else if(this.value == "2060") {
                $("#8").css("display", "inline");
            }
            else if(this.value == "2560") {
                $("#9").css("display", "inline");
            }
            else if(this.value == "2561") {
                $("#10").css("display", "inline");
            }
            else if(this.value == "1890") {
                $("#11").css("display", "inline");
            }
            else if(this.value == "2890") {
                $("#12").css("display", "inline");
            }
            else if(this.value == "3890") {
                $("#13").css("display", "inline");
            }
            else if(this.value == "4890") {
                $("#14").css("display", "inline");
                
            }
            else if(this.value == "4891") {
                $("#15").css("display", "inline");
                    
            }
            else {
                $("#1").css("display", "inline");
            }
        });
    });
    </script>
    <script type="text/javascript">
    function buscar(str){
		var xmlhttp; 
		if (str=="")
		 {
		 document.getElementById("txtHint").innerHTML="";
		return;
		 }
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
		 }
		else
		 {// code for IE6, IE5
		 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
		document.getElementById("busqueda1").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","buscar.jsp?c="+str,true);
	xmlhttp.send();
}
    
       
 
      </script>
      <script type="text/javascript">
    function calculos(){    
		var sueldo = <%=online8%>;
                var gastos = <%=online9%>;
                var operacion = sueldo-gastos;
                
    

function alerta(){
    
      alertify.alert("<i>Tienes disponibles</i>  "  +  operacion + "  <i>pesos para ahorrar, selecciona cuanto dinero quieres ahorrar</i>", function () {
           
      });

    }
    return alerta;
}
  
 
      </script>
          
   



    </head>
    <body onload="calculos()()" ondragstart="return false;" ondrop="return false;">
        <ul>
  <li><a class="active" href="../index.html">Coins</a></li>
  <li><a href="#news">Ayuda</a></li>
 
</ul>

        <div align="center">
            <h2><P>Da click en continuar para ver tu calculo despues de introducir tus meta </p></h2>
            <h3>  
                <form action="RegistroPrimerCalculo.jsp" method="post">
          <label>¿Cual es tu meta de ahorro?</label>
          <p><input type="hidden" value="<%=online1%>" name="idusuario" id="miCampo3"></p>
          <p><input type="hidden" value="" name="idahorro"</p>
          <p><input type="text" name="meta" pattern="[A-Za-z ]+" minlength="1" maxlength="20" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 40"></p>
          <label>¿Cuanto dinero necesitas ahorrar?</label>
          <p><input type="number" name="ahorro" id="miCampo2" minlength="5" maxlength="10" required pattern="[0-9]+" title="Solo números. Tamaño mínimo: 5. Tamaño máximo: 10"></p>
          <br> 
          <label>¿Cada cuando ahorraras? </label>
          <select name="epoca">
              <option value="20">Diario</option>
              <option value="4">Semanal</option>
              <option value="2">Quincenal</option>
          </select>
          <br>
          <h3>¿Cuanto dinero ahorraras?</h3>
          <p><input type="number" name="coins" min="1" max="8000" pattern="[0-9]+" title="Introduce números validos" id="miCampo2"></p>
          <input type="submit" name="Continuar">
          </form>
          <br> 
          <%-- <p>Esta es nuestra primer sugerencia de ahorro en funcion de tus ingresos y gastos</p>
    
        <p><input type="submit  " src="../IMGS/button.jpg" width="252px" height="52px" name="fname"  value="<%=online6%>" id="fname"></p> --%>
        <p id="1" style="display:none;" >Podrias empezar a ahorrar con  <%=(porcentaje1 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo diario</p>
        <p id="2" style="display:none;" >Podrias empezar a ahorrar con   <%=(porcentaje2 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo diario</p>
        <p id="3" style="display:none;" >Podrias empezar a ahorrar con  <%=(porcentaje3 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo diario</p>
        <p id="4" style="display:none;" >Podrias empezar a ahorrar con  <%=(porcentaje4 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo diario</p>
        <p id="5" style="display:none;" >Excelente puedes empezar a ahorrar hasta  <%=(porcentaje5 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tus ingresos diarios!</p>
        <p id="6" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje1 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo semanal</p>
        <p id="7" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje2 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ semanal</p>
        <p id="8" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje3 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ semanal</p>
        <p id="9" style="display:none;" >Podriras empezar a ahorrar con <%=(porcentaje4 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo semanal</p>
        <p id="10" style="display:none;" >Excelente puedes empezar a ahorrar con un <%=(porcentaje5 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo semanal</p>
        <p id="11" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje1 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo quincenal</p>
        <p id="12" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje2 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ pesos de tu sueldo quincenal</p>
        <p id="13" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje3 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo quincenal</p>
        <p id="14" style="display:none;" >Podriras empezar a ahorrar con  <%=(porcentaje4 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo quincenal</p>
        <p id="15" style="display:none;" >Excelente puedes empezar a ahorrar con  <%=(porcentaje5 * (Integer.parseInt(online8)-Integer.parseInt(online9)))/100%>$ de tu sueldo quincenal</p>
          </h3>
        
        <br>
      
           <%@include file="buscar.jsp" %>
       
        </body>
</html>
