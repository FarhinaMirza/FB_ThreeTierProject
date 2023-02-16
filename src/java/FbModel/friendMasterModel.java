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
public class friendMasterModel {
    private int friend_master_Id,sender_Id,receiver_Id;
    private String status,request_date;
    
    // GET DATA FOR friend_master_Id
    public int get_friend_master_Id(){
        return friend_master_Id;
    }
    
    // SET DATA FOR friend_master_Id
    public void set_friend_master_Id(int friend_master_Id){
        this.friend_master_Id = friend_master_Id;
    }
    
    // GET DATA FOR sender_Id
    public int get_sender_Id(){
        return sender_Id;
    }
    
    // SET DATA FOR sender_Id
    public void set_sender_Id(int sender_Id){
        this.sender_Id = sender_Id;
    }
    
    // GET DATA FOR receiver_Id
    public int get_receiver_Id(){
        return receiver_Id;
    }
    
    // SET DATA FOR receiver_Id
    public void set_receiver_Id(int receiver_Id){
        this.receiver_Id = receiver_Id;
    }
    
    // GET DATA FOR status
    public String get_status(){
        return status;
    }
    
    // SET DATA FOR status
    public void set_status(String status){
        this.status = status;
    }
    
    // GET DATA FOR request_date
    public String get_request_date(){
        return request_date;
    }
    
    // SET DATA FOR request_date
    public void set_request_date(String request_date){
        this.request_date = request_date;
    }
}
