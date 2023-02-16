/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FbModel;

/**
 *
 * @author Hp
 */
public class registrationModel {
    private int user_Id;
    private String firstName, surName, email_id, mobileNo, password, dob, gender,profile_img,regDate;
    
    // GET DATA FOR user_Id
    public int get_user_Id(){
        return user_Id;
    }
    
    // SET DATA FOR user_Id
    public void set_user_Id(int user_Id){
        this.user_Id = user_Id;
    }
    
    // GET DATA FOR firstName
    public String get_firstName(){
        return firstName;
    }
    
    // SET DATA FOR firstName
    public void set_firstName(String firstName){
        this.firstName = firstName;
    }
    
    // GET DATA FOR surName
    public String get_surName(){
        return surName;
    }
    
    // SET DATA FOR surName
    public void set_surName(String surName){
        this.surName = surName;
    }
    
    // GET DATA FOR email_id
    public String get_email_id(){
        return email_id;
    }
    
    // SET DATA FOR email_id
    public void set_email_id(String email_id){
        this.email_id = email_id;
    }
    
    // GET DATA FOR mobileNo
    public String get_mobileNo(){
        return mobileNo;
    }
    
    // SET DATA FOR mobileNo
    public void set_mobileNo(String mobileNo){
        this.mobileNo = mobileNo;
    }
    
    // GET DATA FOR password
    public String get_password(){
        return password;
    }
    
    // SET DATA FOR password
    public void set_password(String password){
        this.password = password;
    }
    
    // GET DATA FOR dob
    public String get_dob(){
        return dob;
    }
    
    // SET DATA FOR dob
    public void set_dob(String dob){
        this.dob = dob;
    }
    
    // GET DATA FOR gender
    public String get_gender(){
        return gender;
    }
    
    // SET DATA FOR gender
    public void set_gender(String gender){
        this.gender = gender;
    }
    
    // GET DATA FOR profile_img
    public String get_profile_img(){
        return profile_img;
    }
    
    // SET DATA FOR profile_img
    public void set_profile_img(String profile_img){
        this.profile_img = profile_img;
    }
    // GET DATA FOR regDate
    public String get_regDate(){
        return regDate;
    }
    
    // SET DATA FOR regDate
    public void set_regDate(String regDate){
        this.regDate = regDate;
    }
}
