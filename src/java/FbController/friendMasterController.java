/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FbController;

import DBConnection.DatabaseConnection;
import FbModel.friendMasterModel;
import FbModel.registrationModel;
import FbController.registrationController;
import java.sql.*;

/**
 *
 * @author Hp
 */
public class friendMasterController extends DatabaseConnection {

    // insert data for friend_master
    public boolean friendMasterInsertData(friendMasterModel friendModel) throws Exception {
        try {
            PreparedStatement st = mycon().prepareStatement("insert into friend_master VALUES(NULL,?,?,?,curdate())");
            st.setInt(1, friendModel.get_sender_Id());
            st.setInt(2, friendModel.get_receiver_Id());
            st.setString(3, friendModel.get_status());
            st.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    // check already friend requested
    public boolean friendAvailibity(friendMasterModel friendModel) throws Exception {
        try {
            PreparedStatement st = mycon().prepareStatement("SELECT * FROM `friend_master` Where (`sender_Id` = ? and `receiver_Id` = ?) or (`sender_Id` = ? and `receiver_Id` = ?)");
            st.setInt(1, friendModel.get_sender_Id());
            st.setInt(2, friendModel.get_receiver_Id());
            st.setInt(3, friendModel.get_receiver_Id());
            st.setInt(4, friendModel.get_sender_Id());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            return false;
        }
    }
    
    // show friend list
    public ResultSet showFriendListData(friendMasterModel friendModel, registrationModel rgModel) throws Exception {
        PreparedStatement st = mycon().prepareStatement("Select * from registration Where user_Id IN (Select (case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friend_Id from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?))");
        st.setInt(1, friendModel.get_sender_Id());
        st.setInt(2, friendModel.get_receiver_Id());
        st.setInt(3, friendModel.get_sender_Id());
        st.setInt(4, friendModel.get_receiver_Id());
        return st.executeQuery();
    }

    // Accept request data
    public ResultSet acceptRequestData(registrationModel regModel) throws Exception {
        PreparedStatement st = mycon().prepareStatement("SELECT * FROM friend_master as fm inner join registration as reg on fm.sender_Id = reg.user_Id WHERE receiver_Id = ? and status='Requested'");
        st.setInt(1, regModel.get_user_Id());
        return st.executeQuery();
    }

    // Status update data
    public boolean statusUpdateData(friendMasterModel friendModel) throws Exception {
        try {
            PreparedStatement st = mycon().prepareStatement("Update friend_master as fm set status = ? where sender_Id = ? and receiver_Id = ?");

            st.setString(1, friendModel.get_status());
            st.setInt(2, friendModel.get_sender_Id());
            st.setInt(3, friendModel.get_receiver_Id());

            st.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    // get mutual Friends ID details data
    public ResultSet mutual_frined_IDdata(int mf_id) throws Exception {
        PreparedStatement st = mycon().prepareStatement("Select * from registration where user_Id=?");
        st.setInt(1, mf_id);
         return st.executeQuery();
    }

    // get Mutual Friends data
    public ResultSet mutual_friendData(friendMasterModel friendModel, registrationModel regModel) throws Exception {
        PreparedStatement st = mycon().prepareStatement("Select * from registration Where user_Id IN (Select distinct ftbl.friendid From (Select (case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?)) as ftbl Inner Join (Select (case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?)) as mtbl on ftbl.friendid = mtbl.friendid)");

        st.setInt(1, friendModel.get_sender_Id());
        st.setInt(2, friendModel.get_sender_Id());
        st.setInt(3, friendModel.get_sender_Id());
        st.setInt(4, friendModel.get_sender_Id());
        st.setInt(5, friendModel.get_receiver_Id());
        st.setInt(6, friendModel.get_receiver_Id());
        st.setInt(7, friendModel.get_receiver_Id());
        st.setInt(8, friendModel.get_receiver_Id());
        return st.executeQuery();
    }

    // get Suggestion Friends data
    public ResultSet suggestion_friendData(registrationModel regModel) throws Exception {
        PreparedStatement st = mycon().prepareStatement("Select * from registration Where user_Id IN (Select friendid From(Select distinct(case when sender_Id IN (Select(case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?) )then receiver_Id when receiver_Id IN (Select(case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?) )then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id IN (Select (case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted'  and (sender_id=? or receiver_Id=?) ) or receiver_Id IN (Select(case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?) )) ) as friendFridnTbl Where friendid <> ? and friendid NOT IN (Select friendid from(Select (case when sender_Id =? then receiver_Id when receiver_Id =? then sender_Id End) as friendid from friend_master Where status='Accepted' and (sender_id=? or receiver_Id=?) ) as myfriendtbl))");
        st.setInt(1, regModel.get_user_Id());
        st.setInt(2, regModel.get_user_Id());
        st.setInt(3, regModel.get_user_Id());
        st.setInt(4, regModel.get_user_Id());
        st.setInt(5, regModel.get_user_Id());
        st.setInt(6, regModel.get_user_Id());
        st.setInt(7, regModel.get_user_Id());
        st.setInt(8, regModel.get_user_Id());
        st.setInt(9, regModel.get_user_Id());
        st.setInt(10, regModel.get_user_Id());
        st.setInt(11, regModel.get_user_Id());
        st.setInt(12, regModel.get_user_Id());
        st.setInt(13, regModel.get_user_Id());
        st.setInt(14, regModel.get_user_Id());
        st.setInt(15, regModel.get_user_Id());
        st.setInt(16, regModel.get_user_Id());
        st.setInt(17, regModel.get_user_Id());
        st.setInt(18, regModel.get_user_Id());
        st.setInt(19, regModel.get_user_Id());
        st.setInt(20, regModel.get_user_Id());
        st.setInt(21, regModel.get_user_Id());
        return st.executeQuery();
    }
}
