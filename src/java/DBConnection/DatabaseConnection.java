/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.sql.*;

/**
 *
 * @author Hp
 */
public class DatabaseConnection {
    public Connection mycon()throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost/fb_three_tier_db","root","");
    }
}
