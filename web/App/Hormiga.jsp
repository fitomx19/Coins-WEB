<%-- 
    Document   : Hormiga
    Created on : 13/11/2018, 04:20:23 PM
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
        <title>Gesion de gastos innecesarios</title>

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="../CSS/hormiga.css">
        <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
         <%!
    Connection con;
    Conexion miconexion;
    Statement stmt;
    ResultSet rs;
    String Usr;
    String comida;
    
        %>
        <%
    miconexion = new Conexion();
    con=miconexion.getConexion();
    stmt=con.createStatement();
    Usr=request.getParameter("usr");
    comida="0";
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
    
    <script>
        function noback(){
   window.location.hash="no-back-button";
   window.location.hash="Again-No-back-button"
   window.onhashchange=function(){window.location.hash="no-back-button";}
}
        </script>
        <noscript>
	<meta http-equiv="refresh" content="0;nojs.html">
        </noscript> 
    </head>
    
    <body>
        <div>
          <ul>
        <li><a class="active" href="javascript:window.history.go(-1);">Regresar</a></li>
        <li><a href="CerrarSesion.jsp">Cerrar Sesion</a></li>
       
         </ul>
         </div>
        
        <div align="center">
            
            <h1>¿Como solucionar mis gastos hormigas?</h1>
            <%//0,3,6,7,8%>
            <%rs=stmt.executeQuery("SELECT * FROM coinsproyect.gastos2 where id_usr='"+Usr+"'");%>
          
                <%while(rs.next()){%>
                
                
                
                <%
          
                //miNombre.equals(intento))
                   if(rs.getString("tipo").equals("0") ){%>
                   <div class="w3-container w3-green">
                        <h2>Tienes un par de gastos hormiga en alimentos</h2>
                        <h2>Algunos consejos para poder resolver esta problematica son...</h2>
                        <div class="a">
                            <h4>
                            Comer fuera Preparar tu propia comida supone un ahorro de más del 50% que pagarla en un restaurante. Trata de dedicar un tiempo de tu día o 
                            semana a preparar alimentos, y así evitarás pagar de más en este rubro necesario.
                            </h4>
                        </div>
                    <img src="https://sss.lainolvidable.com.pe/imagen/apaisado/razones-no-consumir-comida-chatarra-dba90.jpg" width="600" height="300">
                   </div>
                <%}if(rs.getString("tipo").equals("3") ){%>
                     <div class="w3-container">
                        <h2>Tienes un par de gastos hormiga en los llamados gastos espontaneos</h2>
                        <h2>Algunos consejos para poder resolver esta problematica son...</h2>
                        <div class="a">
                            La casa es un buen lugar para ahorrar Muchas veces el hogar es el mejor lugar para ahorrar en las salidas. 
                            Y es que la diversión no sólo está en la calle, de tal modo que a veces se pueden hacer grandes fiestas o reuniones 
                            íntimas en casa con amigos (consiguiendo con ello que no se sobrecargue el presupuesto mensual).
                            Pagar en efectivo y tener un presupuesto casi imposible que una persona tenga detallada la cantidad de dinero que se 
                            va a gastar en una salida, a menos que la persona sea muy estricta. Lo que sí es posible es hacerse una idea de lo que 
                            se va a gastar durante toda la noche y, en base a esto, llevar una cantidad de dinero predeterminada. 
                            Con esto se logra ahorrar en las salidas de manera efectiva.
                        </div>
                        <img  alt="espontaneos" src="https://2.bp.blogspot.com/-UO4WvWWA3N0/WMdMuObPfNI/AAAAAAAABkU/fz8yLz_juTg9XvdCYteRsMwFZMnLc6KvwCLcB/s1600/como-ahorrar-en-las-salidas.jpg" width="600" height="300">
                   </div>
                <%}if(rs.getString("tipo").equals("6")){%>
                     <div class="w3-container w3-green">
                         <h2>Tienes un par de gastos hormiga en bebidas alcoholicas y productos del tabaco</h2>
          
                        <h3>Algunos consejos para poder resolver esta problematica son...</h3>
                         <div class="a">
                        
                        <h4>1. Deja la tarjeta en casa, nos ha pasado a todos que con un par de copas de más se nos hace una grandiosa
                               idea invitarle a tus amigos una copa de 180 pesos, claro con cargo a nuestra tarjeta de credito.
                               Una buena practica es dejar en casita esas tarjetas de credito en casa
                        </h4>
                        <h4>
                            2.- Si vas a salir a lo grande es mejor que cenes algo. Salir sin comer nada es una malísima idea pues el 
                                alcohol te sentará muchísimo peor y, además, te entrará hambre a mitad de la noche, y acabarás picando en 
                                los típicos puestos para borrachos que venden basura a precio de oro.
                        </h4>
                        <h4>
                            3. Paga tus consumos en el acto Invitar a los amigos está muy bien, pero a nadie le hace mucha ilusión 
                            invitar a los desconocidos. Cuando sales de fiesta es habitual que te juntes con muchas personas y, si las 
                            consumiciones no se abonan en el acto, la cuenta empieza a abultarse. Y adivina quién va a pagarla: el último que quede en el local.
                        </h4>
                        
                         </div>
                         <img alt="Servicios" src="https://www.ecestaticos.com/imagestatic/clipping/b40/dec/b40dec31bfeb5828bd58af59c183c9fd/como-ahorrar-cuando-sales-de-copas-los-consejos-ineludibles.jpg?mtime=1431082883" width="600" height="300">
                         </div>
                <%}if(rs.getString("tipo").equals("7")){%>
                     <div class="w3-container">
                        <h2>Tienes un par de gastos hormiga en Extra en Servicios</h2>
                        <h2>Algunos consejos para poder resolver esta problematica son...</h2>
                        <div class="a">
                            <h4>
                                1.-Ahorrar hasta un 80% en Multas El 9 de febrero de 2016 el secretario de seguridad pública de la CDMX, Hiram Almeida, señaló a los medios que las multas pueden tener un 50-80% si se paga dentro de los 10 primeros días después de cometida la infracción. </h4>
                            <h4>2.-¿Cómo ahorrar con las propinas? Seguro que sueles dejar las moneditas que te dan de vuelta cada vez que vas a tomar un café, o te vas de cañas. Estas monedas son poco dinero si lo mides una sola vez, pero si lo acumulas al final del mes ya verás como 
                            la cosa cambia, como la cantidad te parece más interesante. Así, búscate una hucha, o un lugar al que no puedas acceder de manera habitual, y guarda allí todas las vueltas que te den en el alterne, no las dejes de propina. Al final de mes, cuenta todo lo 
                            que has acumulado, y ya verás como merece la pena. Hazlo un mes para comprobar su eficiencia. Sin embargo, no te equivoques, esto no es una campaña en contra de las propinas, sólo en contra de las propinas que dejamos por rutina, por costumbre. Si alguien 
                            te ofrece un servicio especial, diferente y merece una propina deberías dársela, porque se la ha ganado, pero no dejes propina porque sí, por el mero hecho de no coger el dinero del platito.
                            </h4>
                            <h4>3.-Cuando un familiar o amigo te pide un prestamo piensa siempre en:</h4>
                            <h4>Discutir otras opciones ¿Existen otras formas en que puedas ayudarlo? El dinero no siempre es la única solución.</h4>
                            <h4>Presta sólo la cantidad que puedas perder Es probable que no vuelvas a ver tu dinero, por lo que es esencial que nunca pongas en riesgo tu bienestar financiero.</h4>
                            <h4>Ponlo por escrito Aunque si es un préstamo a un familiar o amigo cercano seguramente prefieras no contratar a un abogado, es importante que exista algún tipo de compromiso legal o por lo menos avalado de alguna manera.</h4>
                        </div>
                        <img src="https://www.lainformacion.com/files/article_main/uploads/2017/09/15/59bbfe9ce7e9a.jpeg" alt="imagen secreta" width="600" height="300">
                   </div>
                <%}if(rs.getString("tipo").equals("8") ){%>
                      <div class="w3-container w3-green">
                        Si llegas a este punto del programa significa que vulneraste mi seguridad felicidades! <3 
                        
                       
                   </div>
                <%}else{%>
                   
                <%}%>
                
                
                
               
                
                
                
                
                
                <%}%>
                
          
        </div>
          
    </body>
</html>
