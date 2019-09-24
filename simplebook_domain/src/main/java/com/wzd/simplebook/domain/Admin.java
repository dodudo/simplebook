package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;

@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class Admin implements Serializable {
    private static final long serialVersionUID = 1L;
    private String adminId;
    private String aname;
    private String apassword;
    private Integer power;
    private String powerStr;


    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public String getPowerStr() {
        return powerStr;
    }

    public void setPowerStr(String powerStr) {
        this.powerStr = powerStr;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", aname='" + aname + '\'' +
                ", apassword='" + apassword + '\'' +
                ", power=" + power +
                ", powerStr='" + powerStr + '\'' +
                '}';
    }

}
