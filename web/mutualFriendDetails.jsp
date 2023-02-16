<%-- 
    Document   : mutualFriendDetails
    Created on : Apr 30, 2019, 1:17:07 PM
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
        <title>JSP Page</title>
        <link href="FbStyleSheet.css" rel="stylesheet" type="text/css"/>
        <link href="Responsive.css" rel="stylesheet" type="text/css"/>
        <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
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
                        if (session.getAttribute("m_profile") != null) {%>
                            <img src="img/<%=session.getAttribute("m_profile").toString()%>"/>
                            <%}%></i><label>
                            <%  if (session.getAttribute("m_name") != null) {
                                    out.print(session.getAttribute("m_name").toString());
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
        <% // mutual friends data
            ResultSet rs;
            registrationModel regModel = new registrationModel();
            friendMasterModel friendModel = new friendMasterModel();
            friendMasterController friendController = new friendMasterController();
            friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
            friendModel.set_receiver_Id(Integer.parseInt(request.getParameter("id").toString()));
            friendController = new friendMasterController();
            rs = friendController.mutual_friendData(friendModel, regModel);
            rs.last();
            String count = String.valueOf(rs.getRow());
            rs.beforeFirst();

        %>

        <div class="contain_main">
            <div class="col-1"></div>
            <div class="col-10">
                <% // get Mutual friends detail for ID   
                    if (request.getParameter("id") != null) {
                        session.setAttribute("mfId", request.getParameter("id"));
                        friendController = new friendMasterController();
                        rs = friendController.mutual_frined_IDdata(Integer.parseInt(session.getAttribute("mfId").toString()));
                        while (rs.next()) {
                            session.setAttribute("m_name", rs.getString("firstName"));
                            session.setAttribute("m_profile", rs.getString("profile_img"));
                %>
                <div class="mutual_header">
                    <div class="mutual_background">
                        <img src="img/butterflies1.jpg" alt=""/>
                        <div class="mutual_imgBox">

                            <img src="img/<%=rs.getString("profile_img")%>"/>

                            <label><%=rs.getString("firstName") + " " + rs.getString("surName")%>
                            </label>
                        </div>
                    </div>
                    <%
                        }
                    %>
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
                <div class="row">
                    <div class="col-4">
                        <div class="mutual_friend_box">
                            <div class="f_h">
                                <img src="img/friend.png" class="m_img" alt=""/>
                                <a>Friends</a>
                                <span>.</span>

                                <% // Show Friends
                                    //ResultSet rs;
                                    if (session.getAttribute("mfId") != null) {
                                        regModel = new registrationModel();
                                        friendModel = new friendMasterModel();
                                        friendController = new friendMasterController();
                                        friendModel.set_sender_Id(Integer.parseInt(request.getParameter("id").toString()));
                                        friendModel.set_receiver_Id(Integer.parseInt(session.getAttribute("mfId").toString()));
                                        friendController = new friendMasterController();
                                        rs = friendController.showFriendListData(friendModel, regModel);
                                        rs.last();
                                        String count1 = String.valueOf(rs.getRow());
                                        rs.beforeFirst();

                                %>
                                <label><%=count1%></label>
                                <a id="pop_link" class="count_f" href="#">(<%=count%> Mutual)</a>
                            </div>
                            <% // while loop for show data
                                while (rs.next()) {
                            %>

                            <div class="m_f_show">
                                <a style="font-size: 14px;" href="mutualFriendDetails.jsp?id=<%=rs.getString("user_Id")%>"><%=rs.getString("firstName") + " " + rs.getString("surName")%></a>
                                <img src="img/<%=rs.getString("profile_img")%>" class="m_d_img"/>
                            </div>
                            <%
                                        }
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-8">

                    </div>
                </div>

                <% // mutual friends data popbox show
                    regModel = new registrationModel();
                    friendModel = new friendMasterModel();
                    friendController = new friendMasterController();
                    friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                    friendModel.set_receiver_Id(Integer.parseInt(session.getAttribute("mfId").toString()));
                    friendController = new friendMasterController();
                    rs = friendController.mutual_friendData(friendModel, regModel);

                %>

                <!--popup model section start-->
                <div class="popUp_Box">
                    <div class="popup-inner">
                    <%                       
                        while (rs.next()) {
                    %>
                    <div class="model_content">
                        <img style="width: 100px; height: 100px;" src="img/<%=rs.getString("profile_img")%>"/>

                        <a style="font-size:14px; "><%=rs.getString("firstName") + " " + rs.getString("surName")%></a>
                    </div>
                    <!--popup model section close-->
                    <%
                        }
                    %>
                    <div class="close">+</div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <script type="text/javascript">
            document.getElementById('pop_link').addEventListener('click',function (event){
                event.preventDefault();
               $(".popUp_Box").fadeIn(500);
               return false;
            });
            
            $(".close").click(function (){
                
               $(".popUp_Box").fadeOut(500); 
            });
        </script>
    </body>
</html>
