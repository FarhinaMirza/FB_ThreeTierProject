<%-- 
    Document   : LoginForm
    Created on : Jan 9, 2019, 11:38:12 AM
    Author     : Hp
--%>
<%@page import="FbModel.registrationModel" %>
<%@page import="FbController.registrationController" %>
<%@page import="java.sql.*;" %>
<%@page import="java.util.regex.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="FbStyleSheet.css" rel="stylesheet" type="text/css"/>
        <link href="Responsive.css" rel="stylesheet" type="text/css"/>
    </head>
    <% // SignUp btn    
        if (request.getParameter("SignUpbtn")!=null) {
                response.sendRedirect("registrationForm.jsp");
            }
    %>
    
    <% // Login btn
        registrationModel regModel;
        registrationController regController;
        ResultSet rs;
        if (request.getParameter("login_btn") != null) {
            regModel = new registrationModel();
            if (request.getParameter("email_txt") == "" || request.getParameter("password_txt") == "") {
                response.sendRedirect("LoginForm.jsp");
            } else {
                if (Pattern.matches("\\d{10}", request.getParameter("email_txt")) == true) {
                    regModel.set_mobileNo(request.getParameter("email_txt"));
                } else {
                    regModel.set_email_id(request.getParameter("email_txt"));
                }
                regModel.set_password(request.getParameter("password_txt"));
                // get data
                regController = new registrationController();
                rs = regController.registrationData(regModel);
                if (rs.next()) {
                    session.setAttribute("uId", rs.getString("user_Id"));
                    //session.setAttribute("email", rs.getString("email_id")+rs.getString("mobileNo"));
                    session.setAttribute("name", rs.getString("firstName"));
                    session.setAttribute("surname", rs.getString("surName"));
                    session.setAttribute("profile", rs.getString("profile_img"));
                    response.sendRedirect("FbMasterPage.jsp");
//                out.print("<script>window.location.href='FbMasterPage.jsp?page=HomePage.jsp';</script>");
                } else {
                    out.print("<script>alert('Invalid Username or Password.');window.location.href='LoginForm.jsp';</script>");
//                    response.sendRedirect("LoginForm.jsp");
                }
            }
        }
    %>
    <body>
        <form action="LoginForm.jsp" method="post">
            <!--HEADER START-->
            <div class="header">
                <div class="row">
                    <div class="col-6">
                        <h1>facebook</h1>
                        <div class="SignUp">
                            <input type="submit" id="SignUpbtn" name="SignUpbtn" value="Sign Up"/>
                        </div>
                    </div>
                </div>
            </div>
            <!--HEADER CLOSE-->
            <!--CONTAIN START-->
            <div class="SignUp_contain">
                <div class="login_contain center">
                    <p>Log in to Facebook</p>
                    <input type="text" id="email_txt" name="email_txt" placeholder="Email address or phone number"/>
                    <input type="password" id="password_txt" name="password_txt" placeholder="Password"/>
                    <div class="login_btn">
                        <input type="submit" id="login_btn" name="login_btn" value="Log In"/>
                        <a href="forgotPassForm.jsp">Forgotten account?</a><a href="registrationForm.jsp">Sign up for Facebook</a>
                    </div>
                </div>
            </div>
            <!--CONTAIN CLOSE-->
        </form>
    </body>
</html>
