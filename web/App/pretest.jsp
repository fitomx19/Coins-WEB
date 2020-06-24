<%-- 
    Document   : pretest
    Created on : 10/11/2018, 06:37:19 PM
    Author     : fitomx14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <script type="text/javascript">
  function getHash1(form){
		var hashInput = document.getElementById("cadena1");
		var hash = new jsSHA(hashInput.value, "TEXT");
		var hashOutput = document.getElementById("resultado1");
		hashOutput.value = hash.getHash("SHA-512","HEX");
		console.log(hashInput.value);
		//form.submit();
	}
        </script>

    </head>
    <body>
        <h1>Hello World!</h1>
        <p>registro</p>
        <form name="authForm" action="test.jsp">	
            <input type="text" name="nombre">
            <input type="password" name="account"  id="cadena" placeholder="nom"> 
            <input type="hidden" name="resultado" id="resultado" size="100">
            
            <input type="submit" onclick="getHash(authForm)">
</form>
        <br>
      <p>iniciar sesion</p>
            <form name="authForm1" action="test1.jsp">	
            <input type="text" name="nombre">
            <input type="password" name="account"  id="cadena1" placeholder="nom"> 
            <input type="hidden" name="resultado1" id="resultado1" size="100">
            
            <input type="submit" onclick="getHash1(authForm1)">

             </form>
            
           
    </body>
</html>
