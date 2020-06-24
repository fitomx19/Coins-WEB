<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<% HttpSession Admin = request.getSession();Admin.invalidate();%>
<%@page errorPage = "Error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar sesión</title>
    </head>
    <body>
        <jsp:forward page="login.html"/>
    </body>
</html>
