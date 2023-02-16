<%-- 
    Document   : demo
    Created on : Apr 26, 2019, 12:38:28 PM
    Author     : Hp
--%>
<%@page import="FbController.friendMasterController"%>
<%@page import="FbModel.friendMasterModel"%>
<%@page import="FbModel.registrationModel" %>
<%@page import="FbController.registrationController" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery.min.js" type="text/javascript"></script>
        <style>
            .box{
                width: 500px;
                height: 500px;
                background-color: black;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <br/> <br/>
        <button title="Title" data-titleModal="init" data-placement="bottom">Example</button>
        <br/> <br/>
        <a onclick="popBoxClick()">Click Here</a>

        <script type="text/javascript">
            function popBoxClick() {

            }
        </script>
    </body>
</html>
