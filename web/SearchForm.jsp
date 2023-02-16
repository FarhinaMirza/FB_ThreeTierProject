<%-- 
    Document   : SearchForm
    Created on : Jan 16, 2019, 11:30:28 AM
    Author     : Hp
--%>
<%@page import="FbController.registrationController" %>
<%@page import="FbModel.registrationModel" %>
<%@page import="FbController.friendMasterController" %>
<%@page import="FbModel.friendMasterModel" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <% // Add friend insert data
        friendMasterController friendController;
        friendMasterModel friendModel;
        if (request.getParameter("receiver") != null) {
            friendModel = new friendMasterModel();
            friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
            friendModel.set_receiver_Id(Integer.parseInt(request.getParameter("receiver")));
            friendModel.set_status("Requested");
            friendController = new friendMasterController();
            boolean val = friendController.friendMasterInsertData(friendModel);
            if (val == true) {
                response.sendRedirect("FbMasterPage.jsp?page=SearchForm.jsp");
//                out.print("<script>alert('request send...');window.location.href='FbMasterPage.jsp?page=SearchForm.jsp';</script>");
            } else {
                out.print("<script>alert('Something Wrong in insert code..')</script>");
            }
        }
    %>

    <body>
        <div class="master_box">
            <div class="search_box">
                <p><i class="fa fa-users"></i>People</p>
                <% // Search data
                    registrationController regController;
                    registrationModel regModel;
                    ResultSet rs;
                    regModel = new registrationModel();
                    regController = new registrationController();
                    rs = regController.registrationSearchData(regModel, request.getParameter("searchName"));
                    while (rs.next()) {
                %>
                <div class="row">
                    <div class="friend_box">
                        <div class="col-4">
                            <div class="img_box">
                                <img src="img/<%=rs.getString("profile_img")%>"/>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="search_box_name">
                                <%=rs.getString("firstName") + " " + rs.getString("surName")%>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="searchBtn">
                                <%  // already requested..
                                    friendModel = new friendMasterModel();
                                    friendModel.set_sender_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                                    friendModel.set_receiver_Id(Integer.parseInt(rs.getString("user_Id")));
                                    friendController = new friendMasterController();
                                    boolean val = friendController.friendAvailibity(friendModel);
                                    if (val == true) {
                                        out.print("Requested");
                                    } else {
                                %>
                                <div class="add_friend_box">
                                    <a href="FbMasterPage.jsp?page=SearchForm.jsp&receiver=<%=rs.getString("user_Id")%>&searchName=<%=request.getParameter("searchName")%>">  <i class="fa fa-user-plus"></i>Add Friend</a>
                                    <a><span class="fa fa-ellipsis-h"></span></a>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
