<%-- 
    Document   : ContinuarRegistro
    Created on : 21/09/2018, 05:26:25 PM
    Author     : Alumno
--%>
<%@page import="Conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.net.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Continuar Registro</title>
        <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
        <link href="../CSS/DRegistrarseDos.css" rel="stylesheet" type="text/css">
        <LINK REL=StyleSheet HREF="../DContiReg.css" TYPE="text/css" MEDIA=screen> 
        
    </head>
    
  
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
  
    <body>
        <%
            rs=stmt.executeQuery("select (id_usr) from usuario  order by id_usr DESC limit 1");
        %>
        <%HttpSession Usuario=request.getSession(true);%>
        <%String online1=(String)Usuario.getAttribute("sesion");%>
        <div class="DDMenuR">
            <div class="DDLetraRD">SOFTCONOMY COINS</div>
            
        </div>
        <div class="DDImagenU">
            <div class="DDATexto">
                <br><br><br>
                <p class="DPLetraRU">Registrate y inicia una nueva experiencia de ahorro.</p>
            </div>
        </div>
        <div class="DDFormuR">
            <div class="DDFormuRU">
                <p class="DPLetraRT">Espera un Momento <%=online1%>...</p>
                <br>
                <p class="DPLetraRCu">Ahora contesta las siguientes preguntas</p><br>
                <form action="ContinuarRegistro2.jsp" method="post">
                    <% while(rs.next()){%>
                        <input type="hidden" name="usr" value="<%=rs.getString("id_usr")%>">
                    <%}
                    %>
                    <br>
                    <label>¿Cuantas personas dependen economicamente de ti?</label>
                    <select name="Npersonas">
                    <option value="1">Solo Yo</option>
                    <option value="2">2 Personas</option>
                    <option value="3">3 Personas</option>
                    <option value="4">+3 Personas</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al mes en Servicios?</label>
                    <select name="Nservicios">
                    <option value="1500">Menos de 1500</option>
                    <option value="2250">1500-2500</option>
                    <option value="2750">2500-3500</option>
                    <option value="3500">Más de 3500</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al bimestre en electricidad?</label>
                    <select name="NLuz">
                    <option value=250>Menos de 500</option>
                    <option value="325">500-1000</option>
                    <option value="615">1000-1500</option>
                    <option value="1000">+1500</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al mes en gas natural o lp?</label>
                    <select name="NGas">
                    <option value="500">Menos de 500</option>
                    <option value="625">500-750</option>
                    <option value="800">750-1000</option>
                    <option value="1000">+1000</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al trimestre en agua?(Entubada y Para Consumo)</label>
                    <select name="NAgua">
                    <option value="83">Menos de 250</option>
                    <option value="166">250-500</option>
                    <option value="333">500-1000</option>
                    <option value="450">+1000</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al mes en Comida?</label>
                    <select name="NComida">
                    <option value="1000">Menos de 1000</option>
                    <option value="1250">1000-1500</option>
                    <option value="1500">1500-2000</option>
                    <option value="2500">+2000</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al mes en Prestamos?</label>
                    <select name="NPrestamo">
                    <option value="500">Menos de 500</option>
                    <option value="1000">500-1000</option>
                    <option value="1500">1000-1500</option>
                    <option value="2000">+1500</option>
                    </select>
                    <br><br>
                    <label>¿Cuanto dinero gastas al mes en Transporte?</label>
                    <select name="NTransporte">
                    <option value="100">Menos de 100</option>
                    <option value="400">100-500</option>
                    <option value="900">500-1000</option>
                    <option value="1200">+1000</option>
                    </select>
                    <br><br>
                    <label>¿Gastas dinero en botellas de agua,chicles,galletas,etc?</label>
                    <select name="NHormiga">
                    <option value="1">SI</option>
                    <option value="2">NO</option>
                    </select>
                    <br>
                    <p><h2>Perfecto! Continuemos</h2></p>
                    <br>
                    <input type="submit" value="Continuar">
                </form>
            </div>
        </div>
           
    </body>
</html>
