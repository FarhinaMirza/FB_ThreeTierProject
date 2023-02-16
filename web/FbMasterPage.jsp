<%-- 
    Document   : FbMasterPage
    Created on : Jan 2, 2019, 12:39:05 PM
    Author     : Farheena Mirza
--%>
<%@page import="FbController.friendMasterController"%>
<%@page import="FbModel.friendMasterModel"%>
<%@page import="FbModel.registrationModel" %>
<%@page import="FbController.registrationController" %>
<%@page import="FbController.postMasterController" %>
<%@page import="FbModel.postMasterModel" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Master Page</title>
        <link href="FbStyleSheet.css" rel="stylesheet" type="text/css"/>
        <link href="Responsive.css" rel="stylesheet" type="text/css"/>
        <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="jquery.min.js" type="text/javascript"></script>
        <script src="getFilePreview.js" type="text/javascript"></script>
    </head>
    <% // Search btn
        registrationController regController;
        registrationModel regModel;
        ResultSet rs;
        if (request.getParameter("search_btn") != null) {
            response.sendRedirect("FbMasterPage.jsp?page=SearchForm.jsp&searchName=" + request.getParameter("search_txt"));
        }
    %>

    <% // Insert Post_Master data   
        postMasterController postController;
        postMasterModel postModel;
        if (request.getParameter("post_Btn") != null) {
            postModel = new postMasterModel();
            postModel.set_user_Id(Integer.parseInt(session.getAttribute("uId").toString()));
            postModel.set_post_message(request.getParameter("create_post_txt"));
            postModel.set_post_img(request.getParameter("hid2"));
//            out.print("<script>alert('"+request.getParameter("hid2")+"')</script>");
            session.setAttribute("postImg", request.getParameter("hid2"));
            // get Query
            postController = new postMasterController();
            boolean val = postController.postMasterInsertData(postModel);
            if (val == true) {
                response.sendRedirect("FbMasterPage.jsp?page=postForm.jsp");
            } else {
                out.print("<script>alert('Something Wrong in insert code..')</script>");
//                out.print("<script>alert('" + request.getParameter("hid2") + "')</script>");
            }
        }
    %>
    <body>
        <form method="post">
            <div class="display">
                <div class="main">
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
                                <a href="mutualFriendForm.jsp"><i class="img_show"><%
                                    if (session.getAttribute("profile") != null) {%>
                                        <img src="img/<%=session.getAttribute("profile").toString()%>"/>
                                        <%}%> 
                                    </i><label>
                                        <%  if (session.getAttribute("name") != null) {
                                                out.print(session.getAttribute("name").toString());
                                            }
                                        %>
                                    </label></a>
                                <a>Home</a>
                                <a>Find Friends</a>
                                <a href="FbMasterPage.jsp?page=requestForm.jsp" title="Friend request" data-titleModal="init" data-placement="bottom"><i class="fa fa-user"></i></a>
                                <a title="Messages" data-titleModal="init" data-placement="bottom"><i class="fa fa-comment"></i></a>
                                <a title="Notifications" data-titleModal="init" data-placement="bottom"><i class="fa fa-bell"></i></a>
                                <a title="Quick Help" data-titleModal="init" data-placement="bottom"><i class="fa fa-question-circle"></i></a>
                                <a><i class="fa fa-caret-down"></i></a>
                                <a href="LoginForm.jsp">Logout</a>
                            </div>
                        </div>
                    </div>
                    <!--HEADER CLOSE-->
                    <!--CONTAIN START-->
                    <div class="contain_main">
                        <div class="master_contain">
                            <div class="row">
                                <div class="col-2">
                                    <div>
                                        <a><i class="img_show"><%
                                            if (session.getAttribute("profile") != null) {%>
                                                <img src="img/<%=session.getAttribute("profile").toString()%>"/>
                                                <%}%> 
                                            </i><label class="label_name"><%
                                                if (session.getAttribute("name") != null && session.getAttribute("surname") != null) {
                                                    out.print(session.getAttribute("name").toString() + " " + session.getAttribute("surname").toString());
                                                }
                                                %></label></a>
                                        <a><i class="fa fa-newspaper-o"></i>News Feed</a>
                                        <a><i class="fa fa-comment"></i>Messenger</a>
                                        <a><i class="fa fa-television"></i>Watch</a>
                                        <a><i class="fa fa-home"></i>Marketplace</a>
                                    </div>
                                    <div class="details_menu">
                                        <label>Shortcuts</label>
                                        <a><i class="fa fa-connectdevelop"></i>Connect the Dots !</a>
                                    </div>
                                    <div class="details_menu">
                                        <label>Explore</label>
                                        <a><i class="fa fa-flag"></i>Pages</a>
                                        <a><i class="fa fa-users"></i>Groups</a>
                                        <a><i class="fa fa-calendar"></i>Events</a>
                                        <a><i class="fa fa-caret-down"></i>See more</a>
                                    </div>
                                    <div class="details_menu1">
                                        <label>Create</label>
                                        <a>Ad</a>
                                        <a>Page</a>
                                        <a>Group</a>
                                        <a>Event</a>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="create_post">
                                        <p>Create Post</p>
                                        <i class="img_show1"><%
                                            if (session.getAttribute("profile") != null) {%>
                                            <img src="img/<%=session.getAttribute("profile").toString()%>"/>
                                            <%}%> 
                                        </i><input type="text" id="create_post_txt" name="create_post_txt" placeholder="Write Something here..."/>
                                        <input type="file" onchange="FillImage('file1', 'filePrieview', 'hid2')" id="file1" name="file1" class="txt">
                                        <input type="hidden" id="hid2" name="hid2" />
                                        <!--<div id="filePrieview"></div>-->
                                        <!--<a href="FbMasterPage.jsp?page=postForm.jsp"><i class="fa fa-photo"></i>Photo/Video</a>-->
                                        <a><i class="fa fa-tag"></i>Tag Friends</a>
                                        <a><i class="fa fa-smile-o"></i>Feeling/Activity</a>
                                        <a><i class="fa fa-ellipsis-h"></i></a>
                                        <div class="postBtn"><input type="submit" id="post_Btn" name="post_Btn" value="Post"/></div>
                                    </div>
                                    <!--Master page contain start-->
                                    <div class="master_box">
                                        <%
                                            if (request.getParameter("page") != null) {
                                        %>
                                        <jsp:include page="<%=request.getParameter("page")%>"></jsp:include>
                                        <%
                                        } else {
                                        %>
                                        <jsp:include page="HomePage.jsp"></jsp:include>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <!--Master page contain close-->
                                </div>
                                <div class="col-3">
                                    <div class="stories_box">
                                        <div class="stories_box1">
                                            <p>Stories</p>
                                            <a>Archive</a>
                                            <a>Settings</a>
                                        </div>
                                        <div class="stories_box2">
                                            <i class="fa fa-plus"></i>
                                            <a>Add to your story</a>
                                            <p>Share a photo or video or write something</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="s_b">
                                        <% // show friend list
                                            regModel = new registrationModel();
                                            friendMasterModel friendModel = new friendMasterModel();
                                            friendMasterController frieController = new friendMasterController();
                                            friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                                            friendModel.set_receiver_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                                            frieController = new friendMasterController();
                                            rs = frieController.showFriendListData(friendModel, regModel);
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
                        </div>
                        <!--CONTAIN CLOSE-->
                    </div>
                </div>
        </form>
    </body>
</html>
