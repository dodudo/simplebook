package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;

@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class Admin implements Serializable {
    private static final long serialVersionUID = 1L;
    private String adminId;
    private String aname;
    private String apassword;
    private String email;
    private String phone;
    private Integer state;
    private String stateStr;
    private Integer role;
    private String roleStr;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getStateStr() {
        if (state == 0){
            stateStr = "已删除";
        }else if (state == 1){
            stateStr = "已启用";
        }else if (state == 2){
            stateStr = "已停用";
        }
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getRoleStr() {
        if (role==0){
            roleStr = "普通管理员";
        }else if (role == 1){
            roleStr = "超级管理员";
        }
        return roleStr;
    }

    public void setRoleStr(String roleStr) {
        this.roleStr = roleStr;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId='" + adminId + '\'' +
                ", aname='" + aname + '\'' +
                ", apassword='" + apassword + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", state=" + state +
                ", stateStr='" + stateStr + '\'' +
                ", role=" + role +
                ", roleStr='" + roleStr + '\'' +
                '}';
    }
}
