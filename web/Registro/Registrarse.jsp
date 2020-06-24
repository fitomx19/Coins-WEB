<%-- 
    Document   : Registrarse
    Created on : 3/10/2018, 09:47:10 AM
    Author     : Diego 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        

<!-- HTTPS required. HTTP will give a 403 forbidden response -->
        <script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../IMGS/favicon.ico" rel='shortcut icon' type='image/x-icon'>
        <link href="../CSS/coolHeader.css" rel="stylesheet" type="text/css">
        <link href="../CSS/DRegistrarse.css" rel="stylesheet" type="text/css">
        <script src="../JS/jquery.min.js"></script>     
        <script src="../JS/Validacion.js"></script>
        
        <script type="text/javascript">
            $(function () {
                //Para escribir solo letras
                $('#miCampo1').validCampoFranz('abcdefghijklmnñopqrstuvwxyzáéiou');

                //Para escribir solo numeros    
                $('#miCampo2').validCampoFranz('0123456789');
                
                 $('#miCampo3').validCampoFranz('0123456789abcdefghijklmnñopqrstuvwxyzáéiou');
            });
        </script>     
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
        <noscript>
	<meta http-equiv="refresh" content="0;../nojs.html">
        </noscript> 

        <title> Registro</title> 
    </head>
    <body ondragstart="return false;" ondrop="return false;">
       
           
            <div class="DDFormuRU" id="registro">
                <br>
                <p class="DPLetraRT">Crear Cuenta</p>
                <br>
                <p class="DPLetraRCu">Ingresa los datos que se te piden para iniciar con el registro</p><br><br>
                <form action="Registro.jsp" method="Post" name="authForm" >
                    <label>Nombre</label><br>
                    <input type="text" name="usr" placeholder="" required id="miCampo3" minlength="5" maxlength="20" required pattern="[A-Za-z0-9 ]+" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 20 No aceptamos la letra ñ ni los dieresis lo siento">
                    <br><br>
                    <label>Contrase&ntilde;a</label><br>
                    <input type="password" name="account"  id="cadena" minlength="5" maxlength="20" required pattern="[A-Za-z0-9]+" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 40"> 
                    <input type="hidden" name="resultado" id="resultado" size="100">
                    <br><br>
                    <label> Confirma contrase&ntilde;a</label><br>
                    <input type="password" name="pass1" placeholder="" id="confirm_password" required minlength="5" maxlength="20" required pattern="[A-Za-z0-9]+" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 40">
                    <br><br>
                    <label>Correo electrónico</label><br>
                    <input type="text" name="email" placeholder=""   title="Ingrese correo valido" id="email" required>
                    <br><br>
                    <label>Fecha de nacimiento</label>
                    <br>
                    <input type="date" name="FechaNacimiento" min="1910-01-01" max="2008-01-01" id="miCampo2" required>
                    <br><br>
                    <label>Sexo</label>
                    <br>
                    <select name="sexo" value="Sexo">
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                        <option value="O">Prefiero no decirlo</option>
                    </select>
                    <br><br><br>
                    <input type="submit" onclick="getHash(authForm)" value='Comenzar'>
                    <br>
                    <br>
                    </form>
                    <p><h4>Al dar en click en el boton de "Comenzar" usted acepta nuestros <a href="javascript:window.open('CoinsPolitics.pdf','','toolbar=yes');void 0">Terminos y Condiciones</a></h4></p>
               
                <br>
                <form action="../index.html">
                <input type="submit" value="Regresar" >
                </form>
            </div>
        </div>
        <script>
            var password = document.getElementById("cadena")
                    , confirm_password = document.getElementById("confirm_password");

            function validatePassword() {
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Las contraseñas no coinciden");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;
        </script>
        <script type="text/javascript">
        $(document).ready(function () {
            //Disable cut copy paste
            $('body').bind('cut copy paste', function (e) {
                e.preventDefault();
            });

            //Disable mouse right click
            $("body").on("contextmenu",function(e){
                return false;
            });
});
</script>

    </body>
</html>