<%-- 
    Document   : consejos
    Created on : 2/11/2018, 12:48:13 PM
    Author     : fitomx14
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
     <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="../CSS/consejos.css">
        <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
  <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String monto,elec,agua,gas,comida,deudas,transporte,usr;
    String ahorro,tiempo;
    String mafer;
    
    double luz;
    long water;
    double gaz;
    double food;
    double lodge;
    double car;
    double mount;
    double min = luz;
    double max = luz;
    double numeromayor;
    double time;
    double saving;
    double comprar;
    double buy;
    
    
    String array[][]={{"electricidad",elec},{"agua",agua},{"gas",gas},{"comida",comida},{"deudas",deudas}};
  %>
  <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    usr=request.getParameter("usr");
    elec=request.getParameter("luz");
    agua=request.getParameter("agua");
    gas=request.getParameter("gas");
    comida=request.getParameter("comida");
    deudas=request.getParameter("prestamo");
    transporte=request.getParameter("coche");
    monto=request.getParameter("monto");
    ahorro=request.getParameter("ahorro");
    tiempo=request.getParameter("tiempo");
    
    time=Double.parseDouble(tiempo);
    saving=Double.parseDouble(ahorro);
    
    comprar=time*saving;
    
    
    if(tiempo.equals("20")){
        mafer="dias";
    }if(tiempo.equals("4")){
        mafer="semanas";
    }if(tiempo.equals("2")){
     mafer="quincenas";       
        }
   
    
    
    
    
    
    luz=Double.parseDouble(elec)/Double.parseDouble(monto);
    water=Short.parseShort(agua)/Short.parseShort(monto);
    gaz=Double.parseDouble(gas)/Double.parseDouble(monto);
    food=Double.parseDouble(comida)/Double.parseDouble(monto);
    lodge=Double.parseDouble(deudas)/Double.parseDouble(monto);
    car=Double.parseDouble(transporte)/Double.parseDouble(monto);
    DecimalFormat df = new DecimalFormat("#.00");
    
    
  %>
    <%HttpSession Usuario=request.getSession(true);%>
    <%String online1=(String)Usuario.getAttribute("sesionid");%>
    <%String online2=(String)Usuario.getAttribute("sesionusuario");%>
    <%

          if(online1==null)
          {
          response.sendRedirect("../index.html");
          }
          %>
    </head>
    <title>Consejos de <%=online2%></title>
    <body>
         <script>
        function noback(){
   window.location.hash="no-back-button";
   window.location.hash="Again-No-back-button"
   window.onhashchange=function(){window.location.hash="no-back-button";}
}
        </script>
       

      

        
        <%
            
        

        if (water < min) {
          min = water;
        } else if (water > max) {
          max = water;
        }

        if (gaz < min) {
          min = gaz;
        } else if (gaz > max) {
            max = gaz;
        }

        if (food < min) { 
          min = food;
        } else if (food > max) {
          max = food;
        }
        if (lodge < min) {
          min = lodge;
        } else if (lodge > max) {
          max = lodge;
        }
        %>
        
             
        <%
            
        %>
         <script>
             $(function() {
             $('#customers td:last-child:contains(<%=max*100%>%)').closest('tr').css('background-color', 'rgb(94, 198, 0)');
            
            // Así sucesivamente hasta llegar al 10
                          });
         </script>
         <div>
          <ul>
        <li><a class="active" href="regresar.jsp">Regresar</a></li>
        <li><a href="CerrarSesion.jsp">Cerrar Sesion</a></li>
       
         </ul>
         </div>
         <div align="center">
            
             <div class="container-fluid">
  <h2>Consejos por cada rubro de Gasto</h2>
  <p>Nuestros consejos y estimaciones fueron basados en la regla de <a href="http://www.expansion.com/ahorro/2016/08/20/57b5814e46163ffd6a8b4605.html">50/30/20</a> para poder darte una informacion precisa</p>
  <div class="row">
    <div class="col-4 ">
    <h2>Energia Electrica</h2>
    <img src="https://blogs.imf-formacion.com/blog/prevencion-riesgos-laborales/wp-content/uploads/2015/01/riesgo-electrico.png" width="100" height="100" >
    <h4>Hola <%=online2%> estas consumiendo actualmente el <%=(df.format(luz*100))%>% de tu salario en 
        consumo de energia electrica.
        <%if(luz*100 <= 13.5){%>
        Estas dentro de el rango de gasto de energia electrica pero sin embargo checa nuestros consejos de ahorro electrico, nunca estan de más.
        <%
        }else{
        %>
        Estas sobrepasando el gasto recomendado para este rubro de gastos, ten cuidado en la CDMX el gasto excesivo de energia electrica disminuye en gran medida el subsidio de la misma, porque no usas enegias renovables como un <b><a onclick="document.getElementById('id07').style.display='block'">sistema de celdas solares </b></s>
        con tu ahorro podras comprarlo entre <%=40000/saving%> y <%=30000/saving%> <%=mafer%> de ahorro constante dependiendo el precio, animate a la larga sera un gran ahorro!
        <%
             }
        %>
    <h4><u><a onclick="document.getElementById('id01').style.display='block'">Consejos para ahorrar  Electricidad</a></u></h4>
    </h4>
    
    </div>
    <div class="col-4 ">
        <h2>Agua Potable</h2>
    <img src="https://vignette.wikia.nocookie.net/slimerancher/images/4/45/Agua.png/revision/latest?cb=20170807154853&path-prefix=es" width="100" height="100" >
    <h4>Estas consumiendo actualmente el <%=(df.format(water*100))%>% de tu salario en consumo de agua potable.
    <%if(water*100 <= 13.5){%>
    Estas dentro de el rango de gasto de agua potable pero sin embargo checa nuestros consejos de ahorro de agua, recuerda que cuidar el agua es lo más importante para poder conservar nuestro planeta azul ♥
    <%
    }else{
    %>
    <h4>
        Estas sobrepasando el gasto recomendado para este rubro de gastos, este en particular es muy importante </h4>
    <h4>Para ahorrar agua como tal existen  <u><a onclick="document.getElementById('id08').style.display='block'">una amplia gama de productos</a></u> son muy baratos si ahorras constantemente lo conseguiras entre <%=1000/saving%> y <%=500/saving%> <%=mafer%> animate! Cuida el agua por lo que más quieras!.
    </h4>
    <%
        }
     %>
    </h4>
    <h4><u><a onclick="document.getElementById('id02').style.display='block'">Consejos para ahorrar Agua Potable</a></u></h4>
    </div>
    <div class="col-4 ">
    <h2>Gas y Combustibles</h2>
    <img src="http://www.sicom.mx/img/img-estacion/iconos%20web-01.png" width="100" height="100" >
    <h4>Estas consumiendo actualmente el <%=(df.format(gaz*100))%>% de tu salario en consumo de Gas Natural,LP Y Combustibles.
    <%if(gaz*100 <= 13.5){%>
    Estas dentro de el rango de gasto de de Gas Natural,LP Y Combustibles de cualquier forma revisa nuestros consejos de ahorro , recuerda siempre reportar fugas!
    <%
    }else{
    %>
    Estas sobrepasando el gasto recomendado para este rubro de gastos revisa  tus tomas de gas una grandiosa opcion para ahorrar es un <u><a onclick="document.getElementById('id09').style.display='block'">calentador solar</a></u>
    <%
        }
     %>
    </h4>
    <h4><u><a onclick="document.getElementById('id03').style.display='block'">Consejos para ahorrar Gas y Combustibles</a></u></h4>
    </div>
  </div>
</div>
    <div class="row">
        <div class="col-4">
      <h2>Alimentos y Bebidas</h2>
    <img src="https://unablogueraenlacocina.es/wp-content/uploads/2017/02/comida.png" width="100" height="100" >
    <h4>Estas consumiendo actualmente el <%=(df.format(food*100))%>% de tu salario en consumo de Alimentos y bebidas
    <%if(food*100 <= 20){%>
    Estas dentro de el rango de gasto de de consumo de alimentos y bebidas sanos para tu economia de cualquier forma revisa nuestros consejos de ahorro 
    <%
    }else{
    %>
    Estas sobrepasando el gasto recomendado para este rubro de gastos revisa nuestros tips no siempre la comida más cara es la mejor ;)!
    No esta demás recomendarte <u><a onclick="document.getElementById('id11').style.display='block'">Un filtro de agua o una botella rellenable </a></u>
    <%
        }
     %>
    </h4>
    <h4><u><a onclick="document.getElementById('id04').style.display='block'">Consejos para ahorrar En Alimentos</a></u></h4> 
        </div>
    <div class="col-4"><h2>Transporte</h2>
     <img src="https://www.eurotransportcar.com/bundles/front/images/car-icon.png" width="100" height="100" >
    <h4>Estas consumiendo actualmente el <%=(df.format(car*100))%>% de tu salario en Transporte
    <%if(car*100 <= 13.66){%>
    Estas dentro de el rango de gastos en transporte eso quiere decir que estas optimizando de una forma correcta los metodos de transporte que tienes, Felicidades! de cualquier forma revisa nuestros consejos de ahorro.
    <%
    }else{
    %>
    Estas sobrepasando el gasto recomendado para este rubro prueba conseguir una <u><a onclick="document.getElementById('id10').style.display='block'">bicleta o bicleta electrica</a></u>
    te pueden ayudar mucho!
    <%
        }
     %>
    </h4>
    <h4><u><a onclick="document.getElementById('id05').style.display='block'">Consejos para ahorrar En Transporte</a></u></h4> 
    </div>
    <div class="col-4"><h2>Deudas</h2>
     <img src="https://png.icons8.com/color/1600/money-bag.png" width="100" height="100" >
    <h4>Estas consumiendo actualmente el <%=(df.format(lodge*100))%>% de tu salario en Deudas.
    <%if(lodge*100 <= 30){%>
    Estas dentro de el rango de gastos en deudas Felicidades! segun datos de El <a target="_blank" href="https://idconline.mx/juridico/2017/01/19/mexicanos-se-endeudan-ms-de-lo-que-ganan">Juridico</a> más del 60% de las personas deben más del una tercera parte de sus ingresos mensualesde  cualquier forma revisa nuestros consejos de ahorro para ser uno de los mejores!
    <%
    }else{
    %>
    Estas sobrepasando el gasto recomendado para este rubro de gastos revisa nuestros consejos urgentemente! :c
    <%
        }
     %>
    </h4>
    <h4><u><a onclick="document.getElementById('id06').style.display='block'">Consejos para ahorrar En Deudas </a></u>/</h4> 
    </div>
    </div>
    
    
    
      
             <table id="customers">
                 
                 <p>El dato coloreado en verde es el que más gastos genera, ojo esto no para alarmarte!</p>
  <thead>
    <tr>
      <th>Gasto Fijos</th>
      <th>Gasto Mensual</th>
      <th>Porcentaje del gasto total por periodo</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Electricidad</td>
       <td>$<%=elec%>.00</td>
      <td><%=luz*100%>%</td>
     
    </tr>
    <tr>
      <td>Agua</td>
       <td>$<%=agua%>.00</td>
      <td><%=water*100%>%</td>
     
    </tr>
    <tr>
      <td>Gas</td>
      <td>$<%=gas%>.00</td>
      <td><%=gaz*100%>%</td>
      
    </tr>
    <tr>
      <td>Comida</td>
      <td>$<%=comida%>.00</td>
      <td><%=food*100%>%</td>
        
    </tr>
    <tr>
      <td>Transporte</td>
      <td>$<%=transporte%>.00</td>
      <td><%=car*100%>%</td>
      
    </tr>
    <tr>
      <td>Deudas</td>
      <td>$<%=deudas%>.00</td>
      <td><%=lodge*100%>%</td>
      
    </tr>
    
    
  </tbody>
</table>
 
    
         </div>
    
     <%--% DIV ESCONDIDO DE ELECTRICIDAD --%>
        
         <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
        <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>9 Consejos de ahorro de electricidad</h1></p>
        </div>
        <p>1.-Apagar las luces al dejar una habitación. Es una verdad de perogrullo, pero haciendo esto se puede ahorrar entre el 8 y el 20 por ciento de la energía destinada a la iluminación.</p>
        <p>2.-Mantener limpias las lámparas supone un ahorro del 20 por ciento. Un foco sucio pierde 50 por ciento de su luminosidad.</p>
        <p>3.-Sustituir focos incandescentes por bajo consumo ó LED: utilizan un 80 por ciento menos energía y duran mucho más.</p>
        
        </div>
                <div class="w3-container w3-green">
          <p>4.-Utilizar sensores de iluminación para que las luces sólo se prendan cuando sea necesario.</p>
          <p>5.-Con los aires acondicionados, utilizarlos con una temperatura de 21º. En los dormitorios se pueden rebajar entre 3° y 5º.</p>
          <p>6.-Al finalizar la carga de la batería de un celular, notebook o tablet, desconectar el cargador, porque sigue consumiendo.</p>
        </div>
        <div class="w3-container w3">
          <p>7.-Colocar la heladera a 15 centímetros de la pared para una mejor circulación del aire del motor. Evitar abrir y cerrar la puerta reiteradamente.</p>
          <p>8.-Usar el lavarropas a plena carga y en programas cortos. Evitar la función secado, ya que es la de mayor consumo.</p>
          <p>9.-Los electrodomésticos en modo stand by consumen un 10 por ciento de energía. Se recomienda apagarlos por completo.</p>
          <P><a target="_blank" href='https://youtu.be/9qFz_2FmNkI'>Video Relacionado</a></p>
        </div>
     
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
         
      <%--% DIV ESCONDIDO DE ELECTRICIDAD --%>
        
      
      <%--% DIV ESCONDIDO DE AGUA --%>
      
        <div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
        <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>9 Consejos de ahorro de agua</h1></p>
        </div>
        <p>1.-Repare cualquier grifo que gotee y asegúrese de cerrar bien las llaves.</p>
        <p>2.-Informe sobre tuberías rotas al propietario del bien o al proveedor de agua.</p>
        <p>3.-Riegue con agua lluvia su jardín. Hágalo una vez por semana.</p>
        
        </div>
                <div class="w3-container w3-green">
          <p>4.-Bañe a sus mascotas en un terreno que necesite riego.</p>
          <p>5.-En lugar de una manguera, utilice una escoba para limpiar la acera.</p>
          <p>6.-Opte por el lavado ecológico para su vehículo, que se puede realizar con productos que ofrece el mercado para limpiar y brillar el carro, sin usar una gota de agua. También puede prescindir de la manguera y usar un balde con agua.</p>
        </div>
        <div class="w3-container w3">
          <p>7.-Evite juguetes que requieren un flujo constante del líquido, como las pistolas de agua.</p>
          <p>8.-Al lavar ropa revise que el nivel del agua corresponda al tamaño de las prendas.</p>
          <p>9.- Cierre la llave del lavamanos mientras se cepilla los dientes o se baña su rostro.</p>
          <P><a  target="_blank" href='https://www.youtube.com/watch?v=8z2T4UPD-QA'>Video Relacionado</a></p>
        </div>
        
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      <%--% DIV ESCONDIDO DE AGUA --%>
      
      
      <%--% DIV ESCONDIDO DE GAS --%>
        <div id="id03" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
            <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>6 Consejos de ahorro de Gas y Combustible</h1></p>
        </div>
        <p>1.-Usar una tapa mientras cocinas, eso permite que el calor no se escape y de igual forma el tiempo en calentarse será menor.</p>
        <p>2.-Revisar el color de la flama, una llama amarilla es resultado de que se está llevando a cabo un proceso de quemado incompleto, es decir, que el gas no se está aprovechando por completo. En tal caso es conveniente que un profesional la revise.</p>
        <p>3.-No sobrepasar el punto de ebullición Cabe mencionar que una vez que hierve el alimento se llega a la temperatura más alta (100°C) y no se va a calentar más, sino empezará a evaporarse. A partir de ese punto solo estarás desperdiciando la flama y por lo tanto el gas. Si buscas mantener el hervor para sazonar, lo puedes hacer con una flama baja.</p>
        
        </div>
                <div class="w3-container w3-green">
          <p>4.-Cocina en grandes cantidades Preparar para toda la semana ciertas comidas que puedes ir variando con aderezos o salsas te puede ahorrar gas y bastante tiempo.</p>
          <p>5.-Apaga el motor si te detienes durante más de un minuto, el consumo de gasolina durante el ralentí es considerablemente elevado, 0.5 y 0.7 litros por hora. </p>
          <p>6.-Evita frenar en seco, mantener la velocidad uniforme te mantendrá en estabilidad además de ahorrar gasolina, frenos y otras cosas más.</p>
        </div>
        <div class="w3-container w3">
        
          <P><a target="_blank" href='https://www.youtube.com/watch?v=cWxvF5g-L7o'>Video Relacionado</a></p>
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id03').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      
      <%--% DIV ESCONDIDO DE GAS --%>
      
      
      <%--% DIV ESCONDIDO DE COMIDA --%>
        <div id="id04" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
        <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>6 Consejos de ahorro de Comida sin perder el sazón <3</h1></p>
        </div>
        <p>1.-Compra especias en pequeñas cantidades, los recipientes grandes pueden parecer una mejor compra. Pero si no usas mucho condimento, terminarás tirándolo, al igual que tu dinero.</p>
        <p>2.-Evita el impulso de comprar en exceso No llenes el carrito del supermercado ni el congelador con comida que podrías olvidar y después tener que descartar cuando se dañe. Compra solo lo que necesitas en el momento para que los alimentos estén más frescos.</p>
        <p>3.-Alarga la vida de las hierbas frescas Envuelve las hierbas en una toalla de papel húmeda y séllalas en una bolsa de plástico. Esto prolongará la vida útil de tres a cinco días.</p>
        
        </div>
                <div class="w3-container w3-green">
          <p>4.-Revive los vegetales de hoja verde Para rehidratar la col rizada, la lechuga, la acelga y otras verduras, remójalas en agua tibia durante media hora, luego enjuágalas con agua fría.</p>
          <p>5.-Congela el sabor El ajo, el jengibre y los limones se pueden comprar en temporada a buen precio y luego congelarlos. Corta el ajo, mézclalo con un poco de aceite de oliva y congélalo en una bandeja de cubitos de hielo. Mezcla el jengibre picado con agua antes de congelarlo. Congela los limones enteros y ralla la cáscara congelada para agregarle sabor a los platos. </p>
          <p>6.- Sé tu propio carnicero Las pechugas de pollo deshuesadas cuestan más por libra que un pollo entero porque el carnicero las tiene que cortar para ti. Ahorra dinero al aprender a cortar la carne tú mismo.</p>
        </div>
        <div class="w3-container w3">
        
          <P><a  target="_blank" href='https://www.youtube.com/watch?v=38a1TjeJIYE'>Video Relacionado</a></p>
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id04').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id04').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      
      <%--% DIV ESCONDIDO DE COMIDA --%>
      
      
      <%--% DIV ESCONDIDO DE TRANSPORTE --%>
        <div id="id05" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
            <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>6 Consejos de ahorro de Transporte</h1></p>
        </div>
        <p>1.-Trata de echar combustible al coche los martes y miércoles. Vale mucho más barato que los fines de semana o cerca del fin de semana.</p>
        <p>2.-Trata de no echar combustible al mediodía. En las horas de máximo calor, el combustible no es totalmente líquido y tendrás menos combustible en el depósito del que crees.</p>
        <p>3.-Echa combustible en litros, no en pesos. Así puedes tener un control mayor de la cantidad que echas. Pones el cuentakilómetros a 0 y verás cuantos kms. te dura esa cantidad de litros. O sea, si echas 20 l de combustible, lo normal es que en ciudad te dure unos 220 km y en carretera unos 280 km. Si te dura menos, es que algo, no estás haciendo bien.</p>
        
        </div>
                <div class="w3-container w3-green">
          <p>4.-Cambiar el aceite del coche es importante. Podemos cambiar a un aceite sintético, este tipo de aceites necesitan ser cambiados con menos frecuencia con lo que reduciremos las visitas al taller y por consiguiente ahorraremos dinero.</p>
          <p>5.-Calcula: lo primero que debes hacer es calcular cuánto dinero gastas al mes en gasolina y luego cuánto gastarías si fueses al trabajo en transporte público, para ello hay que ver cuánto cuesta el abono de 10 viajes y el mensual (u otros, dependiendo de cómo funcione el transporte público en tu ciudad). Después, tienes que saber cuántos viajes harás al mes y calcular cuánto cuesta. Es posible que el resultado sea que ir en transporte público te sale más rentable que en coche. </p>
          <p>6.-Descuentos: existen descuentos en los distintos abonos para jóvenes, mayores, familias numerosas, personas con alguna discapacidad… por lo que si formas parte de alguno de estos colectivos, podrás obtener hasta un 50% de descuento en algunos casos. Merece la pena comprobarlo. </p>
        </div>
        <div class="w3-container w3">
        
          <P><a  target="_blank" href='https://www.youtube.com/watch?v=kN9VsJ1dgB8'>Video Relacionado</a></p>
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id05').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id05').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      
      <%--% DIV ESCONDIDO DE TRANSPORTE --%>
      
      
      <%--% DIV ESCONDIDO DE DEUDAS --%>
        <div id="id06" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
       <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>6 Consejos de ahorro en deudas</h1></p>
        </div>
        <p>1.-Deja de adquirir nuevas deudas. Lo más importante es comenzar ahora mismo. No comiences mañana ni la próxima semana. Comienza a disminuir tus deudas ahora. Reconoce el problema.</p>
        <p>2.-Deja de gastar. Si tienes deudas, lo primero que debes hacer es destruir tus tarjetas de crédito. Sólo aumentan el problema.</p>
        <p>3.-Gasta tu dinero en cosas necesarias como alimento, servicios básicos, etc... (la televisión por cable no es uno de ellos). Haz ajustes. </p>
        
        </div>
                <div class="w3-container w3-green">
          <p>4.-Establece un fondo de emergencia. Es importante tener un poco de dinero ahorrado antes de pagar tus deudas. Abre una cuenta de ahorros para un fondo de emergencia y solicita una transferencia automática desde tu cuenta corriente a tu cuenta de ahorro. ¿Cuánto debes ahorrar? Idealmente, unos $1,000 para empezar.</p>
          <p>5.-Implementa un plan de pago de deudas. Ahora que tus finanzas están bajo control, puedes comenzar a pagar tus deudas. </p>
          <p>6.-Haz el pago mínimo en todas las deudas, excepto en aquellas que sean bajas. </p>
        </div>
        <div class="w3-container w3">
        
            <P><a  target="_blank"href='https://www.youtube.com/watch?v=EwcNyGXFLX8'>Video Relacionado</a></p>
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id06').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id06').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      
      <%--% DIV ESCONDIDO DE DEUDAS --%>
      <%--div del dispositivo de luz--%>
       <div id="id07" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
       <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>Celdas Solares!</h1></p>
        </div>
           <h3>Prueba comprar un sistema de celdas solares eso te vendra muy bien en tu ahorro a largo plazo de energía electrica</h3>
           <h3><a  target="_blank"href="https://articulo.mercadolibre.com.mx/MLM-613083112-kit-energia-solar-de-interconexion-1500w-completo-wifi-_JM?quantity=1#reco_item_pos=7&reco_backend=machinalis-seller-items&reco_backend_type=low_level&reco_client=vip-seller_items-above&reco_id=53fb5616-d76c-4066-a95b-e70bba4b1a61">Conocelo...</a></h3>
           <img src="../IMGS/celdas.jpg" width="600" height="400">
           <h3>¿Quieres agregarlo a tu meta de ahorro?</h3>
           <h6>Esto eliminara tu antigua meta de ahorro</h6>
           
           <form action="RegistrarCompra.jsp" name="Compra" method="POST">
               <%rs=stmt.executeQuery("call idahorro('"+online2+"')");%>
               <%while(rs.next()){
                   %>
                   <input type="hidden"  value="<%=rs.getString("id_plan")%>" name="id_plan">
                   <%
               }%>
               <input type="hidden" value="40000" name="monto">
               <input type="hidden" value="<%=tiempo%>" name="tiempo">
               <input type="hidden" value="Comprar calentador solar" name="nombre">
               <%rs=stmt.executeQuery("call savings('"+online1+"')");
               while(rs.next()){%>
                <input type="hidden" name="ahorro2" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="hidden" name="id_plan2" value="<%=rs.getString("id_plan")%>" id="bloquear">
                 <%}%>
               <h3><input type="submit" value="Aceptar"></h3>
           </form>
         
        </div>
        <div class="w3-container w3">
        
         
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id07').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id07').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      
       <%--div del dispositivo de AGUA--%>
      <div id="id08" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
       <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>Perlizadores!</h1></p>
        </div>
           <h3>Prueba comprar <a target="_blank" href="http://www.latiendadelahorrodeagua.com/perlizadores">perlizadores</a> a tus grifos de agua, son en realidad muy baratos este dispositivo rompe el flujo de agua con aire para que sienta una mayor presion de agua y ala hora de lavar trastes o lavarse las manos se ahorra significativamene el gasto de agua</h3>
           <h3>Conocelo!</h3>
           <img src="../IMGS/perlizador.jpg" alt="perillas" width="500" height="300">
           <h3>Tambien prueba las llaves <a  target="_blank"href="https://www.elpalaciodehierro.com/15322141-bano-regaderakruger-parapresion.html?utm_source=AG-Google&utm_medium=B-PLA-DR&utm_campaign=181105-ElBuenFin&utm_content=900-PLA&gclid=CjwKCAiAuMTfBRAcEiwAV4SDkbwcQRzdqVETAGNjs0F-catiqTtUWnJQvdO0CaeIMG8G1hsNYxOrMhoC63kQAvD_BwE&gclsrc=aw.ds">ahorradoras de agua</a> para la ducha!</h3>
           <img src="../IMGS/regadora.jpeg" alt="perillas" width="500" height="300">
              <h3>¿Quieres agregarlo a tu meta de ahorro?</h3>
           <h6>Esto eliminara tu antigua meta de ahorro</h6>
           
           <form action="RegistrarCompra.jsp" name="Compra" method="POST">
               <%rs=stmt.executeQuery("call idahorro('"+online2+"')");%>
               <%while(rs.next()){
                   %>
                   <input type="hidden"  value="<%=rs.getString("id_plan")%>" name="id_plan">
                   <%
               }%>
               <input type="hidden" value="1000" name="monto">
               <input type="hidden" value="<%=tiempo%>" name="tiempo">
               <input type="hidden" value="Ahorradores de agua" name="nombre">
               <%rs=stmt.executeQuery("call savings('"+online1+"')");
               while(rs.next()){%>
                <input type="hidden" name="ahorro2" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="hidden" name="id_plan2" value="<%=rs.getString("id_plan")%>" id="bloquear">
                 <%}%>
               <h3><input type="submit" value="Aceptar"></h3>
           </form>
         
        </div>
        <div class="w3-container w3">
        
         
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id08').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id08').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
     <%--div del dispositivo de Gas y combustibles--%>
                <div id="id09" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
       <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>Calentador Solar!</h1></p>
        </div>
           <h3>Prueba comprar un calentador solar yo personalmente tengo uno y el ahorro de combustible es abismal</h3>
           <h3><a href="http://www.homedepot.com.mx/plomeria/calentadores-de-agua/solares/calentador-solar-tubos-120lt-inox-graved-111848?gclid=Cj0KCQiA28nfBRCDARIsANc5BFBNt9QhKal8W3oa9WyNSFb6SyYUQQWuAphwhrsQUZxbaJFXeRh996YaAhjyEALw_wcB" target="_blank" >Conocelo...</a></h3>
           <img src="../IMGS/heat.jpeg" alt="calentador_solar" width="500" height="300">
               <h3>¿Quieres agregarlo a tu meta de ahorro?</h3>
           <h6>Esto eliminara tu antigua meta de ahorro</h6>
           
           <form action="RegistrarCompra.jsp" name="Compra" method="POST">
               <%rs=stmt.executeQuery("call idahorro('"+online2+"')");%>
               <%while(rs.next()){
                   %>
                   <input type="hidden"  value="<%=rs.getString("id_plan")%>" name="id_plan">
                   <%
               }%>
               <input type="hidden" value="6000" name="monto">
               <input type="hidden" value="<%=tiempo%>" name="tiempo">
               <input type="hidden" value="Calentador Solar" name="nombre">
               <%rs=stmt.executeQuery("call savings('"+online1+"')");
               while(rs.next()){%>
                <input type="hidden" name="ahorro2" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="hidden" name="id_plan2" value="<%=rs.getString("id_plan")%>" id="bloquear">
                 <%}%>
               <h3><input type="submit" value="Aceptar"></h3>
           </form>
         
        </div>
        <div class="w3-container w3">
        
         
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id09').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id09').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
                     <%--div del dispositivo de transporte--%>
                <div id="id10" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
       <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>Bicicleta Electrica o Convencional</h1></p>
        </div>
           <h3>Prueba comprar una bicicleta o una bicleta electrica son bastantes cool y se pueden usar practicamente en cualquier lugar</h3>
           <h3><a href="https://www.electrobicis.com/marcas/xiaomi/himo-v1/" target="_blank">Conocelo...</a></h3>
           <img src="../IMGS/bicicleta.jpg" alt="imagen_de_bicicleta_electrica" width="500" height="300" >
           <h3>¿Quieres agregarlo a tu meta de ahorro?</h3>
           <h6>Esto eliminara tu antigua meta de ahorro</h6>
           <form action="RegistrarCompra.jsp" name="Compra" method="POST">
               <%rs=stmt.executeQuery("call idahorro('"+online2+"')");%>
               <%while(rs.next()){
                   %>
                   <input type="hidden"  value="<%=rs.getString("id_plan")%>" name="id_plan">
                   <%
               }%>
               <input type="hidden" value="14000" name="monto">
               <input type="hidden" value="<%=tiempo%>" name="tiempo">
               <input type="hidden" value="Bicicleta Electrica" name="nombre">
               <%rs=stmt.executeQuery("call savings('"+online1+"')");
               while(rs.next()){%>
                <input type="hidden" name="ahorro2" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="hidden" name="id_plan2" value="<%=rs.getString("id_plan")%>" id="bloquear">
                 <%}%>
               <h3><input type="submit" value="Añadir Bicicleta Electrica"></h3>
           </form>
               <h3> O talves una bicleta estandar </h3>
              <h3><a href="https://www.walmart.com.mx/Deportes/Ciclismo/Bicicletas-de-Montana/Bicicleta-montana-turbotx-24_00750636390175?gclid=Cj0KCQiA28nfBRCDARIsANc5BFBLs6Guzk-941j1c8wp_6b_jxQQtXv_HEfqMAETZ9Ob98zGf1eAx94aAvqWEALw_wcB" target="_blank">Conocelo...</a></h3>
                <img src="../IMGS/baica.jpeg" alt="imagen_de_bicicleta_electrica" width="500" height="300" >
           <h3>¿Quieres agregarlo a tu meta de ahorro?</h3>
           <h6>Esto eliminara tu antigua meta de ahorro</h6>
                <form action="RegistrarCompra.jsp" name="Compra_2" method="POST">
               <%rs=stmt.executeQuery("call idahorro('"+online2+"')");%>
               <%while(rs.next()){
                   %>
                   <input type="hidden"  value="<%=rs.getString("id_plan")%>" name="id_plan">
                   <%
               }%>
               <input type="hidden" value="4000" name="monto">
               <input type="hidden" value="<%=tiempo%>" name="tiempo">
               <input type="hidden" value="Bicicleta" name="nombre">
               <%rs=stmt.executeQuery("call savings('"+online1+"')");
               while(rs.next()){%>
                <input type="hidden" name="ahorro2" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="hidden" name="id_plan2" value="<%=rs.getString("id_plan")%>" id="bloquear">
                 <%}%>
               <h3><input type="submit" value="Añadir Bicicleta Normal"></h3>
           </form>
         
        </div>
        <div class="w3-container w3">
        
         
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id10').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id10').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
      <div id="id11" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px">
       <div align='center'>
        <div class="w3-container w3-green">
            <p><h1>Articulos de Ahorro</h1></p>
        </div>
           <h3>Prueba comprar una botella de agua o un termo para tu café ,son cosas muy sencillas pero representan un gran ahorro a la larga </h3>
          
           <img src="../IMGS/agua.jpg" alt="agua" width="400" height="400">
               <h3>Es un gasto muy chico y puedes comprarlo en practicamente cualquier lugar! </h3>
               <h3>Intenta comprar un <a  target="_blank" href="https://www.amazon.com.mx/3M-Aqua-Pure-Filtration-System-3-filtraci%C3%B3n/dp/B002DRLS04/ref=asc_df_B002DRLS04/?tag=gledskshopmx-20&linkCode=df0&hvadid=295470364059&hvpos=1o1&hvnetw=g&hvrand=8626199508541441718&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1010043&hvtargid=pla-523194587480&psc=1">filtro de agua</a> es una de las mejores decisiones porque asi evitaras comprar garrafones de agua cada semana </h3>
                <img src="../IMGS/filter.jpg" alt="agua" width="400" height="400">
               <h3>¿Quieres agregarlo a tu meta de ahorro?</h3>
           <h6>Esto eliminara tu antigua meta de ahorro</h6>
                <form action="RegistrarCompra.jsp" name="Compra_2" method="POST">
               <%rs=stmt.executeQuery("call idahorro('"+online2+"')");%>
               <%while(rs.next()){
                   %>
                   <input type="hidden"  value="<%=rs.getString("id_plan")%>" name="id_plan">
                   <%
               }%>
               <input type="hidden" value="3500" name="monto">
               <input type="hidden" value="<%=tiempo%>" name="tiempo">
               <input type="hidden" value="Filtro de Agua" name="nombre">
               <%rs=stmt.executeQuery("call savings('"+online1+"')");
               while(rs.next()){%>
                <input type="hidden" name="ahorro2" value="<%=rs.getString("ahorro")%>" id="bloquear">
                <input type="hidden" name="id_plan2" value="<%=rs.getString("id_plan")%>" id="bloquear">
                 <%}%>
               <h3><input type="submit" value="Añadir Filtro de Agua"></h3>
           </form>
          
           
           
         
        </div>
        <div class="w3-container w3">
        
         
        </div>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id11').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id11').style.display='none'" type="button" class="w3-button w3-red">Cancelar</button>
        
      </div>
         </div>
                    
              </body>
</html>
