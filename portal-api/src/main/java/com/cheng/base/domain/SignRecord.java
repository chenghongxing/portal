package com.cheng.base.domain;

import java.io.Serializable;

public class SignRecord implements Serializable{
    private Integer sreId;

    private String sreUser;

    private String signTime;

    private String sgoutTime;

    private String nowDate;

    private String pcIp;

    public Integer getSreId() {
        return sreId;
    }

    public void setSreId(Integer sreId) {
        this.sreId = sreId;
    }

    public String getSreUser() {
        return sreUser;
    }

    public void setSreUser(String sreUser) {
        this.sreUser = sreUser == null ? null : sreUser.trim();
    }

    public String getSignTime() {
        return signTime;
    }

    public void setSignTime(String signTime) {
        this.signTime = signTime == null ? null : signTime.trim();
    }

    public String getSgoutTime() {
        return sgoutTime;
    }

    public void setSgoutTime(String sgoutTime) {
        this.sgoutTime = sgoutTime == null ? null : sgoutTime.trim();
    }

    public String getNowDate() {
        return nowDate;
    }

    public void setNowDate(String nowDate) {
        this.nowDate = nowDate == null ? null : nowDate.trim();
    }

    public String getPcIp() {
        return pcIp;
    }

    public void setPcIp(String pcIp) {
        this.pcIp = pcIp == null ? null : pcIp.trim();
    }
}