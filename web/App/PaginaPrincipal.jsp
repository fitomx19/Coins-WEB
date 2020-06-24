<%-- 
    Document   : PaginaPrincipal (Que nombre tan génerico)
    Created on : 5/10/2018, 06:26:44 PM 
    version    : 0.5.1 (Version de entrega para pruebas) 
    Refurbished  : 28/10/2018, 00:16:44 AM 
    REDO       : 01/11/2018, 13:02:42 PM   
    REDO 2       : 02/03/2019, 16:53:00 PM   
    Author     : fitomx14 
    coAuthors  : DIegory 
    Locations  : CDMX, Senguio:Michocan
    Horas desperdiciadas 90 horas

    Padre nuestro,
    que estás en el cielo,
    santificado sea tu Nombre;
    venga a nosotros tu reino;
    hágase tu voluntad 
    en la tierra como en el cielo.

    Danos hoy nuestro pan de cada día;
    perdona nuestras ofensas,
    como también nosotros perdonamos 
    a los que nos ofenden;
    no nos dejes caer en la tentación,
    y líbranos del mal. Amén.
usuarios,locales,sensor a la mitad, conexion ala mitad 

validacion funcinalidad 
Appium ////
Selenium

JMETER _request,respnse
Jenkins integridad administrar pruebas de integracion
Testlink administrar y documentar casos de pruebas documentar versiones
Mantis Errores
Postman Probar APIs comandos urls, visualicaion configuracion
Firebug Pruebas de usabilidad
Github
Bugzilla rastreeo de errores seguridad interacion
Razor SQL mysql
PhantomJS automatizar las paginas con fines de prueba NODE
UIAutomator prueba de interfaz de usuario
Notepad ++ pruebas de DEBUG 
FIleZIlla Cargas de servidor
AutoiT automatizar la GUI no sirve ahorita xd

--%>

<%@page import="Conexion.Conexion"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "Error.jsp"%>



<!DOCTYPE html>
<html  ondrop="false" ondrag="return true" onpaste="return false" oncontextmenu="return false">
    <head>
        
        <link href="../CSS/PaginaPrincipal.css" rel="stylesheet" type="text/css">
        <script src="../JS/PaginaPrincipal.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
       
        <link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">
       <%!
        Connection con;
        Conexion miconexion;
        Statement stmt;
        ResultSet rs;
        /*Esta parte es de los ingresos y de los gastos pero solo cuando inicia sesion esta cambia */
        String Usr,gastox,ingresox;
        /*Validar*/
        String tiempo;
        String semana;
        String ahorro;
        String jimbo;

        int suma;
        int vs;
        int po;
        int periodo;
        int negativo;
        int mes;
        int summes;
        int jimmy,activo,active;
        
        String op;
        String period;
        String negative;
        String month,periodo2;
      %>
      <%
        miconexion = new Conexion();
        con=miconexion.getConexion();
        stmt=con.createStatement();

        
        Usr=request.getParameter("id_usr");
              
        
        
      
        
     %>
    <%-- 
    AQUI COMIENZA EL USO DE SESIONES 
    --%>
     <%HttpSession Usuario=request.getSession(true);%>
     <%Usuario.setAttribute("sesionid",Usr);%>
     <%String online2=(String)Usuario.getAttribute("sesionusuario");%>
       <%
       
       if(Usuario==null)
       {
       response.sendRedirect("../index.html");
       }
       %>
    <%-- 
    AQUI TERMINA EL USO DE SESIONES 
    --%>
     <%-- 
    AQUI COMIENZA EL TITULO DEL PROGRAMA
    --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%rs=stmt.executeQuery("select nom from usuario where id_usr='"+Usr+"'");%>
    <%while(rs.next()){%>
    <title>Perfil de <%=rs.getString("nom")%></title>
    <%}%>
    <%-- 
    AQUI TERMINA EL TITULO DEL PROGRAMA
    --%>
   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
             <%
            rs=stmt.executeQuery("call gastosfijos('"+Usr+"')");
            while(rs.next()){
             %>
                
                 
          ['Gasto', 'Pesos Mexicanos'],
          ['Electricidad'     ,<%=rs.getString("Electricidad")%>],
          ['Agua'      ,<%=rs.getString("Agua")%>],
          ['Gas y Combustibles'  ,<%=rs.getString("Gas")%>],
          ['Comida', <%=rs.getString("Comida")%>],
          ['Transporte',    <%=rs.getString("Transporte")%>],
          ['Prestamos',    <%=rs.getString("Prestamo")%>],
          ['Gastos Extra',    <%=rs.getString("Extra")%>]
             <%
               }
           %>        
        ]);
       
        var options = {
          title: 'Mis Gastos Mensuales',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
    <noscript>
	<meta http-equiv="refresh" content="0;../nojs.html">
        </noscript> 
<%-- 
    AQUI COMIENZA EL JS DE LAS GRAFICAS
--%>
      
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">
   google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawCurveTypes);

function drawCurveTypes() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'Gastos');
      data.addColumn('number', 'Ingresos');

      data.addRows([
        [0, 0, 0],
        <%rs=stmt.executeQuery("call Iniciar('"+Usr+"');");%>
        <%while(rs.next()){%>
        [<%=rs.getInt("posicion")%>,<%=rs.getInt("g.Sum")%>,<%=rs.getInt("i.totmonto")%>],
        
        
        <%}%>
            
           
      ]);

      var options = {
      
    <%rs=stmt.executeQuery("SELECT i.tiempo,u.nom from usuario as u  inner join proyecciones as p on u.id_usr=p.id_usr  inner join ingresos as i  on p.id_ing=i.id_ing where u.id_usr ='"+Usr+"' order by i.id_ing DESC limit 1");%>
    <%while(rs.next()){
    period = rs.getString("tiempo"); 
    periodo = Integer.parseInt(period);
    }   
    %>
     <%
    
    if(periodo == 4){%>
         hAxis: { title: 'Semanas'},
    <%}if(periodo == 2){%>
        hAxis: { title: 'Quincenas'},
   <%}if(periodo == 20){%>
        hAxis: { title: 'Diario' },       
    <%}%>
    
   
    
        
        vAxis: {
          title: 'Pesos Mexicanos'
        },
        series: {
          1: {curveType: 'function'}
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
  </script>
          <%--
          GASTOS/INGRESOS EXTRA
          --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Dinero', 'INgresos'],
          <%rs=stmt.executeQuery("SELECT sum(x.monto) as suma FROM ingresos_x AS x JOIN proyecciones AS p ON x.id_ing_x = p.id_ing_x where id_usr ='"+Usr+"'");%>
               <%while(rs.next()){%>
          ['Ingresos Extra', <%=rs.getString("suma")%>],
                  <%}%>
          <%rs=stmt.executeQuery("SELECT sum(g.Gasto) as equinox FROM gastosvariables AS g JOIN proyecciones AS p ON g.id_gv = p.id_gv  where id_usr ='"+Usr+"'");%>
               <%while(rs.next()){%>
          ['Gastos Extra', <%=rs.getString("equinox")%>]
          <%}%>
        
        ]);

        var options = {
          title: 'Gastos/Ingresos Extra',
          pieHole: 0.3,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    
    
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
             
                
                 
          ['Gasto', 'Pesos Mexicanos'],
          <%
            rs=stmt.executeQuery("call ingresosvsgastos('"+Usr+"')");
             while(rs.next()){
          %>
          ['Resultado de Ingresos vs Gastos',<%=rs.getString("grandtotal")%>],
          <%}%>
          <%
            rs=stmt.executeQuery("call gastosfijos('"+Usr+"')");
            while(rs.next()){
          %>
         
          ['Electricidad'     ,<%=rs.getString("Electricidad")%>],
          ['Agua'      ,<%=rs.getString("Agua")%>],
          ['Gas y Combustibles'  ,<%=rs.getString("Gas")%>],
          ['Comida', <%=rs.getString("Comida")%>],
          ['Transporte',    <%=rs.getString("Transporte")%>],
          ['Prestamos',    <%=rs.getString("Prestamo")%>]
             <%
               }
           %>        
        ]);
       
        var options = {
          title: 'Ingresos vs Gastos',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d2'));
        chart.draw(data, options);
      }
    </script>
    <%-- 
    AQUI TERMINA EL JS DE LAS GRAFICAS
    --%>
     <%-- 
    AQUI VA  EL JS DE LA GRAFICA DE GASTOS UWU
    --%>
    
    
    
     <%-- 
    AQUI TERMINA EL JS DE LAS GRAFICAS DE GASTOS UWU
    --%>
      
</head>
<body oncontextmenu="return false"  onmouseup="return false;">  ondrop="return false;">
 
    <div class="header">
        <div class="DDLista">
            <ul class="nav">
                <li><a>Inicio</a>
                    <ul>
			<li><p><a onclick="document.getElementById('id04').style.display='block'">Consejos de Ahorro</a></p></li>
			<li><p><a onclick="document.getElementById('id03').style.display='block'">Ingresos y Gastos Fijos</a></p></li>
			<li><p><a onclick="document.getElementById('id01').style.display='block'">Agregar Ingreso Extra</a></p></li>
			<li><p><a onclick="document.getElementById('id02').style.display='block'">Agregar Gasto Extra</a></p></li>
                        <li><p><a onclick="document.getElementById('id05').style.display='block'">Ingresar Ahorro</a></p></li>
                        <li><p><a onclick="document.getElementById('id06').style.display='block'">Actualizar  Meta</a></p></li>
                        <li><p><a onclick="document.getElementById('52semanas').style.display='block'">*Nuevo*Reto 52 Semanas</a></p></li>
                          <li><p><a onclick="document.getElementById('52semanas').style.display='block'">*Nuevo* Formas para ganar dinero*</a></p></li>
                        
                    </ul>
		</li>
            </ul>
        </div>
        <div class="DDLineal">
            <a href="perfil.jsp"><button class="DBPerfil">Mi Perfil</button></a>    
            <a href="CerrarSesion.jsp"><button class="DBCerrar">Cerrar Sesion</button></a>
        </div>
    </div>
    
  
    <%-- 
    AQUI COMIENZA EL NAV LATERAL 
    --%>
      
    <%-- 
    AQUI TERMINA EL NAV LATERA
    --%>
    <%-- 
   AQUI COMIENZA EL CUERPO PRINCIPAL
    --%>  
    
    <div class="column middle">  
    <%rs=stmt.executeQuery("select nom from usuario where usuario.id_usr='"+Usr+"'");%>
    <%while(rs.next()){%>
   <h1>Bienvenido <%=rs.getString("nom")%></h1>
    <%}%>
    <br> 
    <div id="chart_div"> 
    </div>
    <div><button onclick="document.getElementById('id07').style.display='block'" class="button">¿Que es esto?</button></div>
    
    
    <div>
        <br>
          <%rs=stmt.executeQuery("select * from usuario where id_usr='"+Usr+"'");%>
      <% while(rs.next()){
      op=rs.getString("montometafinal");
      }
         po=Integer.parseInt(op);
         if(po==0){
             %>
              <h2>¡Felicidades cumpliste tu meta! formas parte de ese <a href="http://www.milenio.com/estilo/solo-8-de-la-gente-cumple-sus-propositos-de-ano-nuevo" target="_blank">8%</a>
                de personas que cumple sus metas de ahorro!
            </h2>
             <h1><a onclick="document.getElementById('id06').style.display='block'">Generar nuevo ahorro</a></h1>
             <%
         }if(po < 0 ){
             rs=stmt.executeQuery("select * from usuario where id_usr='"+Usr+"'");
              while(rs.next()){%>
             
              <%negative=rs.getString("montometafinal");
                 negativo = Integer.parseInt(negative);
              %>
              
           
            <h2>Felicidades Ahorraste <%=negativo*-1%>$ más que tu meta inicial
                ya conseguiste <%=rs.getString("meta")%>! </h2>
            
             <%        
               }
            %>
            <h2> Ahora formas parte de ese <a href="http://www.milenio.com/estilo/solo-8-de-la-gente-cumple-sus-propositos-de-ano-nuevo" target="_blank">8%</a>
                de personas que cumple sus metas de ahorro!
            </h2>
             <h1><a onclick="document.getElementById('id06').style.display='block'">Generar nuevo ahorro</a></h1>
             <%
           }  
         else{
             rs=stmt.executeQuery("select * from usuario where id_usr='"+Usr+"'");
             while(rs.next()){%>
               <h2> Tu meta a cumplir es <%=rs.getString("meta")%></h2>
               <h2> Fijaste como monto $<%=rs.getString("montometa")%> pesos</h2>
               <h2> Te falta ahorrar $<%=rs.getString("montometafinal")%> pesos </h2>
               <%rs=stmt.executeQuery("call monto ('"+Usr+"')");%>
               <%while(rs.next()){%>
              
                <div class="w3-light-grey">
                    <div class="w3-container w3-green " style="width:<%=100-rs.getShort("resultado")%>%"><h2>Llevas el <%=100-rs.getShort("resultado")%>% del total de tu meta</h2></div>
                </div> 
               <%}%>
       <%        
         }
      %>
        
      <%%>
      <%%>
     
          
         
          
          
       <%}%>
      
     <br>
    
      
      </div>  
        
         <div>
    
      <div><button onclick="document.getElementById('id99').style.display='block'" class="button">Historial de Ahorros</button></div>
           
               </div>
        <div>
            <%rs=stmt.executeQuery("call ingresosvsgastos('"+Usr+"')");
             while(rs.next()){
                 jimbo = rs.getString("grandtotal");
                 jimmy =  Integer.parseInt(jimbo);
             
             }
             if(jimmy <= 0){
                 %>
                 <h3>Tus gastos sobrepasan tus ingresos, cuanto lo siento :C por esto mismo no podremos mostrarte adecuadamente el sistema</h3>
                 <%
             }else{
                 
             }
             %>
             
        </div>
        <div id="piechart_3d2" style="height:  400px"></div>
       
        <div><button onclick="document.getElementById('id08').style.display='block'" class="button">¿Que es esto ?</button></div>
        <div id="piechart_3d" style="height:  400px"></div>
        <div><button onclick="document.getElementById('id09').style.display='block'" class="button">¿Que es esto ?</button></div>
          
     
        <div id="donutchart" style=" height: 390px;">
        </div>
         <div><button onclick="document.getElementById('id10').style.display='block'" class="button">¿Que es esto ?</button></div>
       
        <div align="center">
          <%rs=stmt.executeQuery("SELECT * FROM gastos where id_usr='"+Usr+"' order by id_gv DESC limit 7");%>
           <h2>Ultimos 7 de tus Gastos Extra que consideramos hormiga</h2>
           
           
           <table id="t01"  align="center">
               
             <tr>
                 
                 <th><h2>Nombre</h2></th>
           <th><h2>Gasto</h2></th> 
            
             </tr>
           <%while(rs.next()){%>
             <tr>
 
                <td><h3><%=rs.getString("NGasto")%></h3></td>
                   
               <td><h3><%=rs.getString("Gasto")%>$</h3></td>
               
               <%}%>
             </tr>
   
           </table>
             <div>
                 <form action="Hormiga.jsp" method="POST">
                     <input type="hidden" name="usr" value="<%=Usr%>">
                     <h2><input type="submit" value="Resolver Estos gastos Hormiga" size="50"></h2>
                 </form>
            
             </div>
        </div>
    </div>
  
  
    <%-- 
    AQUI TERMINA EL CUERPO PRINCIPAL
    --%>
  
   
  
    <div class="footer"></div>
    
 <%-- 
    AQUI COMIENZA EL DIV ESCONDIDO DE AGREGAR INGRESO EXTRA
 --%>
 <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      <form class="w3-container" action="AgregarIngresoExtra.jsp">
        <div class="w3-section">
          <label><b>Ingreso Extra</b></label>
          <input class="w3-input w3-border w3-margin-bottom" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" type="number" placeholder="Agregar Ingreso Extra" name="i_extra" required id="bloquear">
             <%rs=stmt.executeQuery("call idingresos('"+Usr+"')");
             while(rs.next()){
             %>
             <input type="hidden" name="ing" value="<%=rs.getString("id_ing")%>" id="bloquear">
             
             <%}%>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Agregar</button>
        
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>
      <%-- 
    AQUI TERMINA EL DIV ESCONDIDO DE AGREGAR INGRESO EXTRA
    --%>
  </div>
   <%-- 
    AQUI COMIENZA EL DIV ESCONDIDO DE AGREGAR GASTO EXTRA
    --%>
    <div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      <form class="w3-container" action="AgregarGastoExtra.jsp" >
        <div class="w3-section">
          <label><b>Gastos Extra</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" pattern="[A-Za-z ]+" minlength="1" maxlength="20" title="Solo letras porfavor" placeholder="¿En que Gastaste?" name="g_extra" required id="bloquear">
          <input class="w3-input w3-border w3-margin-bottom" type="number"  pattern= "[0-9]" min="1" max="9999" minlength="1" maxlength="10"  title= "Solo Numeros" placeholder="Monto" name="m_extra" required id="bloquear"> 
             <%rs=stmt.executeQuery("call idgf('"+Usr+"')");
             while(rs.next()){
             %>
             <input type="hidden" name="gf" value="<%=rs.getString("id_gf")%>">
             <%}%>
             <br>
             <label>¿Que tipo de gasto es?</label>
             <select name="tipo">
                 <option value="0">
                     Comida rapida y Bebidas en envases desechables (como botellas de agua,papas,pizza)
                 </option>
                 <option value="1">
                     Gastos Escolares           <%//3,6,7,8%>
                 </option>
                 <option value="2">
                     Gastos Medicos y Veterinarios.
                 </option>
                 <option value="3">
                     Gastos espontaneos(salir a comer, ir al cine).
                 </option>
                 <option value="4">
                     Gastos personales (comprar unos zapatos o uno jeans nuevos).
                 </option>
                 <option value="5">
                     Gastos del hogar(Muebles, tecnología).
                 </option>
                 <option value="6">
                     Consumo de Alcohol y Tabaco.
                 </option>
                  <option value="7">
                     Gastos Extra inesperados(Gratificaciones,multas,Prestar Dinero).
                 </option>
              
             </select>
             <br>
             <label>¿Consideras que fue un gasto innecesario u <a href="https://www.condusef.gob.mx/Revista/index.php/presupuesto-familiar/gastos/588-gasto-hormiga" target="_blank">hormiga</a>?</label>
             <select name="hormiga">
                 <option value="0">
                     NO
                 </option>
                 <option value="1">
                     SI
                 </option>
             </select>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Agregar</button>
        
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
    <%-- 
    AQUI TERMINA EL DIV ESCONDIDO DE AGREGAR GASTO EXTRA
    --%>
        
        
        
    </div>
  </div>
    
    <%-- 
    AQUI COMIENZA  EL DIV ESCONDIDO DE AGREGAR INGRESO/GASTO COMUN
    --%>
     <div id="id03" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id03').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

        <form class="w3-container" action="AgregarGastosFIjos.jsp" name="actualizar" method="POST">
        <div class="w3-section">
          <label><b>Ingreso y Gastos Extra</b></label>
          <h4>¿Cual es la frecuencia en que generas ingresos?</h4>
          <select name="frec">
                <option value="20">
                    Diario
                </option>
                <option value="4">
                    Semanal
                </option>
                <option value="2">
                    Quincenal
                </option>
                
          </select>
        <p></p>
        <input class="w3-input w3-border w3-margin-bottom"id="bloquear" type="number" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" placeholder="¿Cuanto dinero ganas en ese periodo?" name="monto" min="20" max="9999" required >
        <p>Recuerda que algunos pagos son mensuales,bimestrales o trimestrales mira el gasto por mes en tu recibo para actualizar estos datos!</p>
        <input class="w3-input w3-border w3-margin-bottom" id="bloquear"  type="number" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" placeholder="¿Cuanto gastaste en Electricidad este mes?"  min="20" max="9999" name="elec" required >
        <input class="w3-input w3-border w3-margin-bottom" id="bloquear" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" type="number" placeholder="¿Cuanto gastaste en Agua este mes?" name="agua"  min="20" max="9999" required >
        <input class="w3-input w3-border w3-margin-bottom" id="bloquear" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" type="number" placeholder="¿Cuanto gastaste en Gas este mes?" name="gas"   min="20" max="9999" required>
        <input class="w3-input w3-border w3-margin-bottom" id="bloquear" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" type="number" placeholder="¿Cuanto gastaste en Comida este mes?" name="food"  min="20" max="9999" required>
        <input class="w3-input w3-border w3-margin-bottom" id="bloquear" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" type="number" placeholder="¿Cuanto gastaste en Transporte este mes?" name="coche"  min="20" max="9999" required>
        <input class="w3-input w3-border w3-margin-bottom" id="bloquear" pattern= "[0-9]" minlengh="1" maxlength="5" title= "Solo numeros y maximo 5 digitos" type="number" placeholder="¿Cuanto dinero tienes que pagar de Deudas" name="deudas"  min="0" max="9999" required >
        
      

        <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Actualizar</button>
        
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
    </div>
     </div>
    <%-- 
    AQUI TERMINA  EL DIV ESCONDIDO DE AGREGAR INGRESO/GASTO COMUN
    --%>
     <%-- 
    AQUI COMIENZA EL DIV ESCONDIDO PARA CONTRIBUIR ALOS CONSEJOS DE AHORRO
    --%>
    
    <div id="id04" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:1200px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id04').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      
        <div class="w3-section" align="center">
         
         <label><b>Consejos de Ahorro</b></label>
          
          <p>El consejo de ahorro de este mes es:</p>
         

<div class="carousel">
    <%rs=stmt.executeQuery("select * from anuncios where idAnuncios = 5");
             while(rs.next()){
                 %>
  <input type="checkbox" class="faux-ui-facia"> 
  <div class="slide" slide="<%=rs.getString("idAnuncios")%>" annot="<%=rs.getString("Contenido")%>">
    <img src="<%=rs.getString("img")%>" alt="Quinto Anuncio">
    <%}%>
  </div>
  
  
  <input type="checkbox" class="faux-ui-facia"> 
  <%rs=stmt.executeQuery("select * from anuncios where idAnuncios = 4");
             while(rs.next()){
                 %>
  <div class="slide" slide="<%=rs.getString("idAnuncios")%>" annot="<%=rs.getString("Contenido")%>">
    <img src="<%=rs.getString("img")%>" alt="Cuarto Anuncio">
       <%}%>
  </div>

  <input type="checkbox" class="faux-ui-facia"> 
    <%rs=stmt.executeQuery("select * from anuncios where idAnuncios = 3");
             while(rs.next()){
                 %>
  <div class="slide" slide="<%=rs.getString("idAnuncios")%>" annot="<%=rs.getString("Contenido")%>">
    <img src="<%=rs.getString("img")%>"  alt="Tercer Anuncio">
        <%}%>
  </div>

  <input type="checkbox" class="faux-ui-facia">
  <%rs=stmt.executeQuery("select * from anuncios where idAnuncios = 2");
             while(rs.next()){
                 %>
  <div class="slide" slide="<%=rs.getString("idAnuncios")%>" annot="<%=rs.getString("Contenido")%>">
    <img src="<%=rs.getString("img")%>"  alt="Segundo Anuncio">
     <%}%>
  </div>

  <input type="checkbox" class="faux-ui-facia">
 <%rs=stmt.executeQuery("select * from anuncios where idAnuncios = 1");
             while(rs.next()){
                 %>
                 
    <div class="slide" slide="<%=rs.getString("idAnuncios")%>" annot="<%=rs.getString("Contenido")%>">
    <img src="<%=rs.getString("img")%>" alt="Primer Anuncio">
    <%}%>
  </div>
   
  <div class="counter" count="5"> / 5</div>
          

      </div>
          <div>
              <br>
              <form action="consejos.jsp" name="consejos" method="POST">
              <input type="hidden" value="<%=Usr%>" name="usr">
              <%rs=stmt.executeQuery("call gastosfijos('"+Usr+"')");
              while(rs.next()){
              %>
              <input type="hidden" value="<%=rs.getString("Electricidad")%>" name="luz"> 
              <input type="hidden" value="<%=rs.getString("Agua")%>" name="agua">
              <input type="hidden" value="<%=rs.getString("Gas")%>" name="gas">
              <input type="hidden" value="<%=rs.getString("Comida")%>" name="comida">
              <input type="hidden" value="<%=rs.getString("Transporte")%>" name="coche">
              <input type="hidden" value="<%=rs.getString("Prestamo")%>" name="prestamo">
              <%}%>
              <%rs=stmt.executeQuery("call ingresostot ('"+Usr+"')");
              while(rs.next()){
              %>
              <input type="hidden" value="<%=rs.getString("totmonto")%>" name="monto">
              <%}%>
               <%rs=stmt.executeQuery("call savings ('"+Usr+"')");
                while(rs.next()){
              %>
              <input type="hidden" value="<%=rs.getString("ahorro")%>" name="ahorro">
              <input type="hidden" value="<%=rs.getString("tiempo")%>" name="tiempo">
              <%}%>
              <input type="submit" value="Consejos Personalizados">
          </form>
              <br>
              </div>
          
        
        
   

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id04').style.display='none'" type="button" class="w3-button w3-red">Cerrar</button>
        
      </div>

    </div>
    </div>
    </div>
              
              
    <div id="id05" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:1200px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id05').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>
         <%--
            Aqui termina el div escondido de ahorro Ahorro
      --%>
      <%--
            Agregar Ahorro
      --%>
      
        <div class="w3-section" align='center'>
            <label><h3><b>Agregar Ahorro</b></h3></label>
          <P></p>
          <label><h4>No en todos los periodos estas obligado a generar un ahorro. Trata de ser lo más frecuente que puedas!</h4></label>
          
         
           <%=periodo%>
          <form action="savings.jsp" name="consejos">
              <%rs=stmt.executeQuery("call savings('"+Usr+"')");
              while(rs.next()){
              %>
              
              <p><h4>Ahorro anterior: <%=rs.getString("ahorro_p")%>$</h4></p>
               <%month = rs.getString("ahorro_p");%>
               <%periodo2 = rs.getString("tiempo");%>
               <%summes = Integer.parseInt(month)*Integer.parseInt(periodo2);%>
                  
          
              <%
              if(rs.getInt("tiempo") == 4){
                  %>
                  <h4>Si continuas ahorrando semanalmente este mes ahorraras <%=summes%>$ </h4>          
              <%
              }if(rs.getInt("tiempo") == 2){
                  %>
                  <h4>Si continuas ahorrando quincenalmente este mes ahorraras <%=summes%>$</h4>
                  
                  <%
              }if(rs.getInt("tiempo") == 20){
                  %>
                  <h4>  Si continuas ahorrando diariamente este mes ahorraras <%=summes%>$</h4>
                  <%
              }else{%>
                  
              <%}
              
              %>
              
              <%
              }
              %>
              <br>
              <label>Periodo</label>
              
              <input type="hidden" value="<%=online2%>" name="usr">
              <select name="periodo">
                  <option value="20">
                      Diario
                  </option>
                  <option value="4">
                      Semanal
                  </option>
                  <option value="2">
                      Quincenal
                  </option>
              </select>
              <br>
              <input type="number" placeholder="Monto a ahorrar" name="monto" min="1" >  
              <hr>
              <%rs=stmt.executeQuery("select p.id_plan from planahorro as p inner join usuario as u on p.id_plan=u.id_plan where u.id_usr='"+Usr+"'");
              while(rs.next()){
              %>
              <input type="text"  name="ahorro" value="<%=rs.getString("id_plan")%>">
              <%}%>
           
           <input type="submit" value="Registrar">  
          </form>
          
          
        
        </div>
   

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id05').style.display='none'" type="button" class="w3-button w3-red">Cerrar</button>
        
      </div>

    </div>
    </div>

     <%-- 
     Aqui termina el div de agregar ahorro
    --%>
        
        
     <div id="id06" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id06').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

        <form class="w3-container" action="ActualizarMeta.jsp" method="POST">
        <div class="w3-section">
            <label><h1><b>Actualizar Meta</b></h1></label>
          <label>Al actualizar la Meta anterior sera dada como finalizada y se creara una desde cero</label>
          <input  class="w3-input w3-border w3-margin-bottom" type="text"  pattern="[A-Za-z ]+" title="Solo letras y espacios porfavor" minlenght="4" maxlenght="20" placeholder="Nombre de la meta de ahorro"  pattern="[A-Za-z]" minlength="5" maxlength="45" name="nom"><br>
          <input class="w3-input w3-border w3-margin-bottom" type="number" pattern= "[0-9]" min="0" max="999999" placeholder="Monto de la meta" name="i_extra" minlength="1" maxlength="10"   title="Maximo un numero de 10 cifras. Solo Numeros" pattern= "[0-9]" required id="bloquear"><br>
             <%rs=stmt.executeQuery("select id_usr,id_plan,meta,montometa from usuario where id_usr='"+Usr+"'");
             while(rs.next()){
             %>
             <input type="hidden" name="plan" value="<%=rs.getString("id_plan")%>" id="bloquear">
              <input type="hidden" name="nombremeta" value="<%=rs.getString("meta")%>" id="bloquear">
               <input type="hidden" name="montometa" value="<%=rs.getString("montometa")%>" id="bloquear">
                <input type="hidden" name="identificador" value="<%=rs.getString("id_usr")%>">
             
             <%}%>
               <%rs=stmt.executeQuery("call savings('"+Usr+"')");
               while(rs.next()){%>
                <input type="text" name="ahorro" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="text" name="id_plan" value="<%=rs.getString("id_plan")%>" id="bloquear">
               
                 <%}%>
                 
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Agregar</button>
        
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id06').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>   
     </div>
          <%--
          DIV ESCONDIDO DE LA PRIMERA GRAFICA
          --%>
          <div id="id07" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id07').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      
        <div class="w3-section" align="center">
            <h2>¿Como leer la proyeccion?</h2>
            <img src="../IMGS/captura1.PNG" width="600" height="200">
            <p>
                Esta es una proyeccion en forma de lineas de tus gastos e ingresos muestra la comparativa general del total de ellos.
                Primero pasa el cursor por número de periodo para veer la proyeccion más a detalle entre más separacion 
                haya entre ingresos y gastos más margen nos da para generar un ahorro por lo tanto no olvides registrar todos tus ingresos y gastos extras.
            </p>
        
        
        </div>
      

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id07').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>   
     </div>
          <%--
          DIV ESCONDIDO DE LA SEGUNDA GRAFICA
          --%>
          
           <div id="id08" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id08').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      
        <div class="w3-section" align="center">
            <h2>¿Como leer la grafica de Ingresos vs Gastos?</h2>
            <img src="../IMGS/captura2.PNG" width="480" height="280">
            <p>
                Pasa tu cursor por la seccion azul, esta muestra el resultado la resta de tus gastos fijos a tus ingresos fijos por otro lado se muestra el porcentaje de gasto de tu salario en cada rubro.
                No olvides visitar consejos de ahorro personalizados para tener una mejor vision de que hacer para reducir estos gastos!
            </p>
        
        
        </div>
      

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id08').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>   
     </div>
            <%--
          DIV ESCONDIDO DE LA tercera GRAFICA
          --%>
            <div id="id09" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id09').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      
        <div class="w3-section" align="center">
            <h2>¿Como leer la grafica de gastos mensuales?</h2>
            <img src="../IMGS/captura3.PNG" width="350" height="300">
            <p>
                En esta grafica se muestran de forma detallada el porcentaje de cada rubo del total de gastos esto es meramente informativo y muy variable dependiendo cada familia.
                
            </p>
        
        
        </div>
      

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id09').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>   
     </div>
          <%--
          DIV ESCONDIDO DE LA tercera GRAFICA
          --%>
             <div id="id10" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id10').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      
        <div class="w3-section" align="center">
            <h2>¿Como leer las graficas de ingresos y gastos extra?</h2>
            <img src="../IMGS/Captura4.PNG" width="400" height="300">
            <p>
                En esta grafica se muestran la comparativa de ingresos extra (Una tanda,Dinero que no esperabas,deudas pagadas del pasado) contra los gastos extra (utiles escolares,una salida al cine o simplemente un prestamo a un amigo)
                esto con fin de crear la necesidad de mantener la balanza más azul que roja!
                
            </p>
        
        
        </div>
      

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id10').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>   
     </div>
   <div id="id99" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id99').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

      
        <div class="w3-section" align="center">
            <h2>Historial de Ahorro</h2>
           <%
           rs=stmt.executeQuery("select * from historial_metas where id_usr='"+Usr+"'");
           while(rs.next()){
           %>
           <h3><%=rs.getString("nombre_meta")%>   </h3><h3>    </h3> <h3>   <%=rs.getString("monto_meta")%></h3>
           <br>
           
           <%   
           }
           %>
           
        
        
        </div>
      

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id99').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div> 
   </div>
           <%--
           RETO 52 SEMANAS
           --%>
    <div id="52semanas" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('52semanas').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <p style="font-size:360%;">Reto 52 Semanas</p>
      </div>

        <div align="center" name="52_Semanas">
            <%
           // esto esta diseñado basicamete con todo lo anterior que me he mostrado 
           
           rs=stmt.executeQuery("SELECT EXISTS(SELECT Activo from 52semanas WHERE id_usr='"+Usr+"') as k , Activo from 52semanas where id_usr='"+Usr+"' order by id52semanas DESC limit 1  ;");
           while(rs.next()){
               activo = rs.getInt("k");
               active = rs.getInt("Activo");
               %>
              
               <%
                   
              if(activo == 1 && active == 1){%>
              <%rs=stmt.executeQuery("select id52help as actual , SUM(Prox_Ahorro + 10) as alpha, id52semanas from 52semanas where id_usr='"+Usr+"' and Activo = 1 order by id52semanas DESC limit 1" ); 
              while(rs.next()){%>
              <h1>Te faltan <%= 52-rs.getInt("actual")%> semanas, animo! </h1>
              <h1>Tu próximo <b>ahorro</b> es de $<%=rs.getString("alpha")%>.00 pesos mexicanos </h1>
             
              <form action="52semanas/52semanas.jsp" method="post">
              <input type="hidden" name="gm" value="<%=rs.getString("actual")%>">
              <input type="hidden" name="sm" value="<%=rs.getString("id52semanas")%>">
              <%}%>
              <img src="../IMGS/money1.png" height="213px" width="320px"><br>
              <input name="usr1" type="hidden" value='<%=Usr%>'>      
              <input value="Más información" type="submit">
              </form>
             <% }  else if ( activo == 1 && active == 0)  {%>
                   <h4>Quizás el reto suene poco atractivo, pero es un plan diferente y benéfico, el cual se puede ejercer de distintas formas. El resultado dependerá plenamente de ti y de tus objetivos, pero ahora te enseñaremos dos maneras.Comienza con la parte “difícil”. Ahorra lo más que puedas al principio (tú fijas el monto), y luego baja poco a poco la suma de dinero.</h4>
                   <form action="52semanas/Pre52.jsp" name="entrar_ala_matrix" method="POST">
               
                <input type="hidden" name="usr" value="<%=Usr%>">
                
                <img src="https://cmujer.com.mx/wp-content/uploads/2017/09/reto-de-ahorro-52-semanas-899x1024.png" width="400px" height="500px">
                <br>
                <%
                rs=stmt.executeQuery("select a.ahorro_p,a.tiempo from planahorro as a inner join usuario as u on a.id_plan=u.id_plan where u.id_usr='"+Usr+"'");
                while(rs.next()){
                    int feria = Integer.parseInt(rs.getString("a.ahorro_p"));
                    int feria1 = Integer.parseInt(rs.getString("a.tiempo"));
                   
                 
                  if(feria >= 300 && feria1 == 2 )
                    {
                     %>
                     <input type="submit" name="" value="Comencemos!!!!">
                      
                    <%   
                 }
                  
                  else if(feria >= 100 && feria1 == 4 ) {
                  %>   
                  <input type="submit" name="" value="Comencemos!!!!">
                   
                  <%    
                  } 
                  else if(feria >= 30 && feria1 == 20 ){
                  %>
                 
                  <input type="submit" name="" value="Comencemos!!!!">
                   
                  <%
                  }else{
                  %>
                  <h4>No te recomendamos empezar con este reto por el momento debido a tu nivel de ahorro.</h4><br>
                  <input type="submit" name="" value="Comencemos!!!!">
                  <%
                  }
                  %>
                  <%
                  }  
                   %>
                  
             <% }
           
           }           
            %>
           
              
            </form>
        
        </div>
      

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('52semanas').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>

    </div>
    </div>
           <%--
           FIN DE EL DIV ESCONDIDO DE 52 SEMANAS
           --%>

    
<div class="footer">
    <script type="text/javascript">
    <script>
            (document).bind("contextmenu",function(e) {
 e.preventDefault();
});
$(document).keydown(function(e){
    if(e.which === 123){
       return false;
    }
});
            </script>
</div>
    
    
    </body>
</html>