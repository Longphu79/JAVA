
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ include file="./Header.jsp" %>
        <h1>Account Verification Successful</h1>
        <p>${message}</p>
        <a href="Loggin.jsp">
            <button>Return to Login Page</button>
        </a>
    </body>
</html>