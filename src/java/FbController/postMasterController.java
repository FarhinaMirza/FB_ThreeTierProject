/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FbController;

import DBConnection.DatabaseConnection;
import FbModel.postMasterModel;
import FbController.postMasterController;
import FbModel.registrationModel;
import java.sql.*;

/**
 *
 * @author Hp
 */
public class postMasterController extends DatabaseConnection {

    // Insert data for post_master
    public boolean postMasterInsertData(postMasterModel postModel) throws Exception {
        try {
            PreparedStatement st = mycon().prepareStatement("Insert into post_master VALUES(NULL,?,?,?,curdate())");
            st.setInt(1, postModel.get_user_Id());
            st.setString(2, postModel.get_post_message());
            st.setString(3, postModel.get_post_img());
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
//            out.print(e);
        }
    }
    
    // show data for post_master
    public ResultSet show_PostMasterData(postMasterModel postModel,registrationModel regModel) throws Exception{
        PreparedStatement st = mycon().prepareStatement("Select * from post_master as pm inner join registration as rg on pm.user_Id=rg.user_Id");
        return st.executeQuery();
    }
}
