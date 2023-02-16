<%-- 
    Document   : postForm
    Created on : Apr 6, 2019, 12:26:00 PM
    Author     : Hp
--%>
<%@page import="FbController.postMasterController" %>
<%@page import="FbModel.postMasterModel" %>
<%@page import="FbModel.registrationModel" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>post</title>
    </head>
    <body>
        <div class="master_box">
            <% // show post_master data
                registrationModel regModel = new registrationModel();
                postMasterModel postModel = new postMasterModel();
                postMasterController postController = new postMasterController();
                ResultSet rs = postController.show_PostMasterData(postModel, regModel);
                while (rs.next()) {
            %>

            <div class="post_box">
                <div class="post_img">
                    <img src="img/<%=rs.getString("profile_img")%>"/>
                </div>
                <div class="post_name">
                    <%=rs.getString("firstName") + " " + rs.getString("surName")%>
                    <p><%=rs.getString("post_date")%></p>
                </div>
                <div class="postImg">
                    <p><%=rs.getString("post_message")%></p>
                    <img src="<%=rs.getString("post_img")%>"/>
                </div>
                <div class="l_c_show">
                    <label><i class="fa fa-thumbs-up"></i></label>
                    <label></label>
                </div>
                <div class="l_c_box">
                    <div class="l1_btn">
                        <i class="fa fa-thumbs-up"></i><input type="submit" id="like_Btn" name="like_Btn" value="Like"/>
                    </div>
                    <div class="c_btn">
                        <i class="fa fa-comment-o"></i><input type="submit" id="comment_Btn" name="comment_Btn" value="Comment"/>
                    </div>
                    <div class="s_btn">
                        <a><i class="fa fa-share">Share</i></a>
                    </div>
                </div>
                <div class="cm_text">
                    <i class="post_show"><%
                        if (session.getAttribute("profile") != null) {%>
                        <img src="img/<%=session.getAttribute("profile").toString()%>"/>
                        <%}%> </i>
                        <input type="text" id="c_txt" name="c_txt" placeholder="Write a comment..."/>
                        <p>Press Enter to post.</p>
                </div>
            </div>
            <%}%>
        </div>
    </body>
</html>
