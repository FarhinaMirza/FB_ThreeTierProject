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
public class postMasterModel {
    private int post_Id,user_Id;
    private String post_message,post_img,post_date;
    
    // GET DATA for post_Id
    public int get_post_Id(){
        return post_Id;
    }
    
    // SET DATA for post_Id
    public void set_post_Id(int post_Id){
        this.post_Id = post_Id;
    }
    
    // GET DATA FOR user_Id
    public int get_user_Id(){
        return user_Id;
    }
    
    // SET DATA for user_Id
    public void set_user_Id(int user_Id){
        this.user_Id = user_Id;
    }
    
    // GET DATA for post_message
    public String get_post_message(){
        return post_message;
    }
    
    // SET DATA for post_message
    public void set_post_message(String post_message){
        this.post_message = post_message;
    }
    
    // GET DATA for post_img
    public String get_post_img(){
        return post_img;
    }
    
    //SET DATA for post_img
    public void set_post_img(String post_img){
        this.post_img = post_img;
    }
    
    // GET DATA for post_date
    public String get_post_date(){
        return post_date;
    }
    
    // SET DATA for post_date
    public void set_post_date(String post_date){
        this.post_date = post_date;
    }
}
