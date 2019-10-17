package entity;

import java.sql.Date;

public class ReaderReserve {

    private String user_account;
    private String copy_id;
    private Date reserve_time;

    public ReaderReserve() {

    }

    public ReaderReserve(String user_account, String copy_id) {
        this.user_account = user_account;
        this.copy_id = copy_id;
        //预约时间设置为当前系统时间
        this.reserve_time = new Date(System.currentTimeMillis());
    }

    public ReaderReserve(String user_account, String copy_id, Date reserve_time){
        this.user_account=user_account;
        this.copy_id=copy_id;
        this.reserve_time=reserve_time;
    }

    public String getUser_account() {
        return user_account;
    }

    public void setUser_account(String user_account) {
        this.user_account = user_account;
    }

    public String getCopy_id() {
        return copy_id;
    }

    public void setCopy_id(String copy_id) {
        this.copy_id = copy_id;
    }

    public Date getReserve_time() {
        return reserve_time;
    }

    public void setReserve_time(Date reserve_time) {
        this.reserve_time = reserve_time;
    }
}
