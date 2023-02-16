/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FbController;

import DBConnection.DatabaseConnection;
import FbModel.registrationModel;
import java.sql.*;

/**
 *
 * @author Hp
 */
public class registrationController extends DatabaseConnection {

    // Insert Data for RegistrationForm
    public boolean registrationInsertData(registrationModel regModel) throws Exception {
        try {
//            PreparedStatement st = mycon().prepareStatement("insert into registration VALUES(NULL,?,?,?,?,?,?,?,?,curdate())");
//            st.setString(1, regModel.get_firstName());
//            st.setString(2, regModel.get_surName());
//            st.setString(3, regModel.get_email_id());
//            st.setString(4, regModel.get_mobileNo());
//            st.setString(5, regModel.get_password());
//            st.setString(6, regModel.get_dob());
//            st.setString(7, regModel.get_gender());
//            st.setString(8, regModel.get_profile_img());
//            st.executeUpdate();

            // stored procedures
            CallableStatement cs = mycon().prepareCall("call registrationInsertData(?,?,?,?,?,?,?,?,curdate())");
            cs.setString(1, regModel.get_firstName());
            cs.setString(2, regModel.get_surName());
            cs.setString(3, regModel.get_email_id());
            cs.setString(4, regModel.get_mobileNo());
            cs.setString(5, regModel.get_password());
            cs.setString(6, regModel.get_dob());
            cs.setString(7, regModel.get_gender());
            cs.setString(8, regModel.get_profile_img());
            cs.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    // Show data for registrion Form
    public ResultSet registrationData(registrationModel regModel) throws Exception {
        if (regModel.get_mobileNo() != null) {
            PreparedStatement st = mycon().prepareStatement("Select * from registration where mobileNo=? and password=?");
            st.setString(1, regModel.get_mobileNo());
            st.setString(2, regModel.get_password());
            return st.executeQuery();
        } else {
            PreparedStatement st = mycon().prepareStatement("Select * from registration where email_id=? and password=?");
            st.setString(1, regModel.get_email_id());
            st.setString(2, regModel.get_password());
            return st.executeQuery();
        }
    }

    // Search Data for request
    public ResultSet registrationSearchData(registrationModel regModel, String searchName) throws Exception {
        PreparedStatement st = mycon().prepareStatement("Select * from registration where firstName LIKE ? or surName LIKE ?");
        st.setString(1, "%" + searchName + "%");
        st.setString(2, "%" + searchName + "%");
        return st.executeQuery();
    }
}
