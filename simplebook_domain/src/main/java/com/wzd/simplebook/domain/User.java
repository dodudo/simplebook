package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private String uid; //用户id
    private String uname;   //用户昵称
    private String phone;   //手机号
    private String email;   //电子邮箱
    private String sex;     //性别
    private String about;   //自我简介
    private String headImgs;    //头像
    private Integer userState;  //用户状态  0代表不可用 1代表正常 2代表冻结
    private String userStateStr;//用户状态对应文字
    private String upassword; //用户密码
    private List<Article> articles;  //存储用户下面有多少文章
    private List<Article> favorArticles; //存储用户收藏文章
    private List<Comment> comments;  //存储用户评论



    public List<Article> getFavorArticles() {
        return favorArticles;
    }

    public void setFavorArticles(List<Article> favorArticles) {
        this.favorArticles = favorArticles;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getHeadImgs() {
        return headImgs;
    }

    public void setHeadImgs(String headImgs) {
        this.headImgs = headImgs;
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

    public String getUserStateStr() {
        if (userState == 0){
            userStateStr = "已删除";
        }else if (userState == 1){
            userStateStr = "已启用";
        }else if (userState == 2){
            userStateStr = "不可用";
        }
        return userStateStr;
    }

    public void setUserStateStr(String userStateStr) {
        this.userStateStr = userStateStr;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", about='" + about + '\'' +
                ", headImgs='" + headImgs + '\'' +
                ", userState=" + userState +
                ", userStateStr='" + userStateStr + '\'' +
                ", upassword='" + upassword + '\'' +
                ", articles=" + articles +
                ", favorArticles=" + favorArticles +
                ", comments=" + comments +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(uid, user.uid) &&
                Objects.equals(uname, user.uname) &&
                Objects.equals(phone, user.phone) &&
                Objects.equals(email, user.email) &&
                Objects.equals(sex, user.sex) &&
                Objects.equals(about, user.about) &&
                Objects.equals(headImgs, user.headImgs) &&
                Objects.equals(userState, user.userState) &&
                Objects.equals(userStateStr, user.userStateStr) &&
                Objects.equals(upassword, user.upassword) &&
                Objects.equals(articles, user.articles) &&
                Objects.equals(favorArticles, user.favorArticles) &&
                Objects.equals(comments, user.comments);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, uname, phone, email, sex, about, headImgs, userState, userStateStr, upassword, articles, favorArticles, comments);
    }
}
