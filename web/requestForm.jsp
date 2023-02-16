<%-- 
    Document   : requestForm
    Created on : Jan 26, 2019, 11:54:55 AM
    Author     : Hp
--%>
<%@page import="FbController.friendMasterController" %>
<%@page import="FbModel.friendMasterModel" %>
<%@page import="FbController.registrationController" %>
<%@page import="FbModel.registrationModel" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Page</title>
    </head>
    <% // Confirm request accepted data
        registrationController regController;
        registrationModel regModel;
        friendMasterController friendController;
        friendMasterModel friendModel;
        ResultSet rs;
        if (request.getParameter("sender") != null) {
            friendModel = new friendMasterModel();
            friendModel.set_sender_Id(Integer.parseInt(request.getParameter("sender")));
            friendModel.set_receiver_Id(Integer.parseInt(session.getAttribute("uId").toString()));
            friendModel.set_status("Accepted");
            friendController = new friendMasterController();
            boolean val = friendController.statusUpdateData(friendModel);
            if (val == true) {
                response.sendRedirect("FbMasterPage.jsp?page=requestForm.jsp");
//                out.print("<script>alert('request accepted...');window.location.href='FbMasterPage.jsp?page=requestForm.jsp';</script>");
            } else {
                out.print("<script>alert('Something Wrong in status update code..')</script>");
            }
        }
    %>
    <body>
        <div class="master_box">
            <div class="search_box">
                <p><i class="fa fa-users"></i>Friend Requests</p>
                <% // Accept request data
                    friendModel = new friendMasterModel();
                    friendController = new friendMasterController();
                    regModel = new registrationModel();
                    regModel.set_user_Id(Integer.parseInt(session.getAttribute("uId").toString()));
                    //regController = new registrationController();
                    rs = friendController.acceptRequestData(regModel);
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
                            <div class="requestBtn">
                                <a id="confirm_btn" href="FbMasterPage.jsp?page=requestForm.jsp&sender=<%=rs.getString("user_Id")%>">Confirm</a>
                                <a id="reject_btn">Reject</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
