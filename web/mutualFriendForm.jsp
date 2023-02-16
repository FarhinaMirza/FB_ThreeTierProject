<%-- 
    Document   : mutualFriendForm
    Created on : Apr 4, 2019, 12:11:13 PM
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
        <title>Mutual Friends</title>
        <link href="FbStyleSheet.css" rel="stylesheet" type="text/css"/>
        <link href="Responsive.css" rel="stylesheet" type="text/css"/>
        <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--HEADER START-->
        <div class="master_header">
            <div class="row">
                <div class="col-6">
                    <!--<i class="fa fa-facebook-square"></i>-->
                    <img src="img/fb_logo.jpg" alt=""/>
                    <input type="text" id="search_txt" name="search_txt" placeholder="Search"/>
                    <span><i class="fa fa-search"></i><input type="submit" id="search_btn" name="search_btn" value=""/></span>
                </div>
                <div class="col-6">
                    <a><i class="img_show"><%
                        if (session.getAttribute("profile") != null) {%>
                            <img src="img/<%=session.getAttribute("profile").toString()%>"/>
                            <%}%></i><label>
                            <%  if (session.getAttribute("name") != null) {
                                    out.print(session.getAttribute("name").toString());
                                }
                            %>
                        </label></a>
                    <a>Home</a>
                    <a>Find Friends</a>
                    <a href="FbMasterPage.jsp?page=requestForm.jsp"><i class="fa fa-user"></i></a>
                    <a><i class="fa fa-comment"></i></a>
                    <a><i class="fa fa-bell"></i></a>
                    <a><i class="fa fa-question-circle"></i></a>
                    <a><i class="fa fa-caret-down"></i></a>
                    <a href="LoginForm.jsp">Logout</a>
                </div>
            </div>
        </div>
        <!--HEADER CLOSE-->
        <!--CONTAIN START-->
        <div class="contain_main">
            <div class="col-10">
                <div class="mutual_header">
                    <div class="mutual_background">
                        <img src="img/butterflies1.jpg" alt=""/>
                        <div class="mutual_imgBox">
                            <%if (session.getAttribute("profile") != null) {%>
                            <img src="img/<%=session.getAttribute("profile").toString()%>"/>
                            <%}%>
                            <label><%if (session.getAttribute("name") != null && session.getAttribute("surname") != null) {
                                    out.print(session.getAttribute("name").toString() + " " + session.getAttribute("surname").toString());
                                }
                                %></label>
                        </div>
                    </div>
                    <div class="mutual_menu clear">
                        <ul>
                            <li>
                                <a>Timeline</a>
                            </li>
                            <li>
                                <a>About</a>
                            </li>
                            <li>
                                <a>Friends</a>
                            </li>
                            <li>
                                <a>Photos</a>
                            </li>
                            <li>
                                <a>More</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--suggestion friends form start-->
                <div class="row">
                    <div class="suggest_box">
                        <p>suggestion friends</p>
                        <%  // show suggestion friends data
                            ResultSet rs;
                            registrationModel regModel = new registrationModel();
                            friendMasterModel friendModel = new friendMasterModel();
                            regModel.set_user_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                            friendMasterController friendController = new friendMasterController();
                            rs = friendController.suggestion_friendData(regModel);
                            while (rs.next()) {
                        %>
                        <div class="suggest_friend">
                            <div class="close">+</div>
                            <div class="suggest_img">
                                <img src="img/<%=rs.getString("profile_img")%>" />
                            </div>
                            <div class="suggest_name">
                                <label><%=rs.getString("firstName") + " " + rs.getString("surName")%></label>
                            </div>
                            <div class="suggest_btn">
                                <a><i class="fa fa-user-plus"></i>add friend</a>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </div>
                </div>
                <!--suggestion friends form close-->
                <div class="row">
                    <div class="col-4">
                        <div class="mutual_friend_box">
                            <div class="f_h">
                                <img src="img/friend.png" class="m_img" alt=""/>
                                <a>Friends</a>
                                <span>.</span>

                                <% // Show Friends
                                    friendController = new friendMasterController();
                                    friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                                    friendModel.set_receiver_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                                    friendController = new friendMasterController();
                                    rs = friendController.showFriendListData(friendModel, regModel);
                                    rs.last();
                                    String count = String.valueOf(rs.getRow());
                                    rs.beforeFirst();

                                %>
                                <label><%=count%></label>
                            </div>
                            <%
                                while (rs.next()) {
                            %>

                            <div class="m_f_show">
                                <a style="font-size: 14px;" href="mutualFriendDetails.jsp?id=<%=rs.getString("user_Id")%>"><%=rs.getString("firstName") + " " + rs.getString("surName")%></a>
                                <img src="img/<%=rs.getString("profile_img")%>" class="m_d_img"/>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-8"></div>
                </div>
            </div>
            <div class="col-2">
                <div class="s_b">
                    <% // show friend list
                        regModel = new registrationModel();
                        friendModel = new friendMasterModel();
                        friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                        friendModel.set_receiver_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                        friendController = new friendMasterController();
                        rs = friendController.showFriendListData(friendModel, regModel);
                        while (rs.next()) {
                    %>
                    <div class="group_menu">
                        <div class="friend_img">
                            <img src="img/<%=rs.getString("profile_img")%>"/>
                        </div>
                        <div class="friend_name">
                            <%=rs.getString("firstName") + " " + rs.getString("surName")%>
                        </div>
                    </div>
                    <%}%>
                    <div class="group_menu">
                        <p>Group Conversations</p>
                        <a><i class="fa fa-users"></i>Create new group</a>
                    </div>
                </div>
            </div>
        </div>
        <!--CONTAIN CLOSE-->  
    </body>
</html>
