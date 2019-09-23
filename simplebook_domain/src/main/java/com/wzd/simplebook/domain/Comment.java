package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;
@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class Comment implements Serializable {
    private static final long serialVersionUID = 1L;
    private String commentId;
    private String articleId;
    private String uId;
    private String parentId;
    private Integer floor;
    private Date commentDate;
    private String content;


    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId='" + commentId + '\'' +
                ", articleId='" + articleId + '\'' +
                ", uId='" + uId + '\'' +
                ", parentId='" + parentId + '\'' +
                ", floor=" + floor +
                ", commentDate=" + commentDate +
                ", content='" + content + '\'' +
                '}';
    }

}
