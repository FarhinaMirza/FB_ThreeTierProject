<%-- 
    Document   : LoginForm
    Created on : Jan 2, 2019, 12:59:05 PM
    Author     : Hp
--%>
<%@page import="java.util.regex.*;"%>
<%@page import="FbModel.registrationModel" %>
<%@page import="FbController.registrationController" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link href="FbStyleSheet.css" rel="stylesheet" type="text/css"/>
        <link href="Responsive.css" rel="stylesheet" type="text/css"/>
        <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <% // registration Insert data
        registrationController regController;
        registrationModel regModel;
        ResultSet rs;
        if (request.getParameter("SignUpbtn") != null) {
            // GET DATA FROM FBMODEL PACKAGE
            regModel = new registrationModel();
            regModel.set_firstName(request.getParameter("txtFirstName"));
            session.setAttribute("userName", request.getParameter("txtFirstName"));
            regModel.set_surName(request.getParameter("txtSurname"));
            if (Pattern.matches("\\d{10}", request.getParameter("txtMobile")) == true) {
                regModel.set_mobileNo(request.getParameter("txtMobile"));
            } else {
                regModel.set_email_id(request.getParameter("txtMobile"));
            }
            regModel.set_password(request.getParameter("txtPassword"));
            regModel.set_dob(request.getParameter("dropDate") + "/" + request.getParameter("dropMonth") + "/" + request.getParameter("dropYear"));
            regModel.set_gender(request.getParameter("rdo"));
            String gender = request.getParameter("rdo");
            if (gender.equals("Male")) {
                regModel.set_profile_img("male1.png");
            } else {
                regModel.set_profile_img("female.png");
            }
            // INESRT DATA FROM CONTROLLER PACKAGE
            regController = new registrationController();
            boolean val = regController.registrationInsertData(regModel);
            if (val == true) {
                response.sendRedirect("FbMasterPage.jsp?page=HomePage.jsp");
                //out.print("<script>alert('Successfully Store your Data...')</script>");
            } else {
                out.print("<script>alert('Something Wrong in insert code..')</script>");
            }
        }
    %>

    <% // Login btn
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
        <div class="display">
            <div class="main">
                <!--HEADER START-->
                <div class="header">
                    <div class="row">
                        <div class="col-6">
                            <h1>facebook</h1>
                        </div>
                        <div class="col-6">
                            <form method="post">
                                <div class="col-4 login_menubar">
                                    <p>Email or Phone</p>
                                    <input type="text" id="email_txt" name="email_txt"/>
                                </div>
                                <div class="col-4 login_menubar">
                                    <p>Password</p>
                                    <input type="password" id="password_txt" name="password_txt"/>
                                    <a>Forgotten account?</a>
                                </div>
                                <div class="col-4 l_btn">
                                    <input type="submit" id="login_btn" name="login_btn" value="Log In"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--HEADER CLOSE-->
                <!--CONTAIN START-->
                <div class="contain_body">
                    <div class="contain center">
                        <div class="row">
                            <div class="col-3">
<!--                                <p>Facebook helps you connect and share with the people in your life.</p>
                                <img src="img/users.png" alt=""/>-->
                            </div>
                            <!--create account start-->
                            <div class="col-6">
                                <form method="post">
                                    <div class="nameInfo">
                                        <p>Create an account</p>
                                        <span>It's free and always will be.</span>
                                        <input type="text" id="txtFirstName" name="txtFirstName" placeholder="First Name" required/>
                                        <input type="text" id="txtSurname" name="txtSurname" placeholder="Surname" required/>
                                        <div class="nameInfo1">
                                            <input type="text" id="txtMobile" name="txtMobile" placeholder="Mobile Number or email address" required/>
                                            <input type="password" id="txtPassword" name="txtPassword" placeholder="New Password" required/>
                                        </div>
                                    </div>
                                    <div class="birthInfo">
                                        <span>Birthday</span>
                                        <select name="dropDate">
                                            <%    for (int i = 1;
                                                        i <= 31; i++) {
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <select name="dropMonth">
                                            <option value="Jan">Jan</option>
                                            <option value="Feb">Feb</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="Sep">Sep</option>
                                            <option value="Oct">Oct</option>
                                            <option value="Nov">Nov</option>
                                            <option value="Dec">Dec</option>
                                        </select>
                                        <select name="dropYear">
                                            <%
                                                for (int i = 1905;
                                                        i <= 2018; i++) {
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <a>Why do I need to provide my date of birth?</a>
                                    </div>
                                    <div class="genderInfo">
                                        <label>
                                            <input type="radio" id="rdo1" name="rdo" value="Male" checked="checked" />Male
                                        </label>
                                        <label>
                                            <input type="radio" id="rdo2" name="rdo" value="Female"/>Female
                                        </label>
                                        <span>By clicking Sign Up, you agree to our <a>Terms</a>, <a>Data Policy</a> and <a>Cookie Policy</a>. You may receive SMS notifications from us and can opt out at any time.</span>
                                    </div>
                                    <div class="SignUpBtn">
                                        <input type="submit" id="SignUpbtn" name="SignUpbtn" value="Sign Up"/>
                                    </div>
                                </form>
                            </div>
                            <!--create account close-->
                            <div class="col-3"></div>
                        </div>
                    </div>
                </div>
                <!--CONTAIN CLOSE-->
                <!--FOOTER START-->
                <div class="footer center">
                    <p>
                        <a>English (UK)</a>
                        <a>ગુજરાતી</a>
                        <a>हिन्दी</a>
                        <a>मराठी</a>
                        <a>اردو</a>
                    </p>
                    <div>
                        <a href="SignUpForm.jsp">Sign Up</a>
                        <a href="LoginForm.jsp">Log In</a>
                        <a>Messenger</a>
                        <a>Facebook Lite</a>
                        <a>Mobile</a>
                        <a>Find Friends</a>
                        <a>People</a>
                        <a>Profiles</a>
                        <a>Pages</a>
                        <a>Page categories</a>
                        <a>Places</a>
                        <a>Games</a>
                        <a>Locations</a>
                        <a>Marketplace</a>
                        <a>Groups</a>
                        <a>Instagram</a>
                        <a>Local</a>
                        <a>About</a>
                        <a>Create ad</a>
                        <a>Create Page</a>
                        <a>Developers</a>
                        <a>Careers</a>
                        <a>Privacy</a>
                        <a>Cookies</a>
                        <a>AdChoices</a>
                        <a>Terms</a>
                        <a>Account security</a>
                        <a>Login help</a>
                        <a>Help</a>
                    </div>
                    <div style="color:#737373; font-size: small;">Facebook &copy; 2019 Made by Farheena Mirza</div>
                </div>
                <!--FOOTER CLOSE-->
            </div>
        </div>

    </body>
</html>
