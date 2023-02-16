<%-- 
    Document   : WelcomePage
    Created on : Jan 5, 2019, 12:42:05 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <form action="WelcomePage.jsp" method="post">
            <h3>Welcome <label>
                    <% // session for get name
                        if (session.getAttribute("userName") != null) {
                            out.print(session.getAttribute("userName").toString());
                        }
                    %>
                </label></h3>
        </form>
    </body>
</html>
