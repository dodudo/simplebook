package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class Favor implements Serializable {
    private static final long serialVersionUID = 1L;
    private String favorId; //收藏id
    private String uid;// 用户id
    private String articleId; //文章id


    public String getFavorId() {
        return favorId;
    }

    public void setFavorId(String favorId) {
        this.favorId = favorId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    @Override
    public String toString() {
        return "Favor{" +
                "favorId=" + favorId +
                ", uid=" + uid +
                ", articleId=" + articleId +
                '}';
    }

}
