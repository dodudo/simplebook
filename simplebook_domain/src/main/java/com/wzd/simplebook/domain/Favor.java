package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class Favor implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer favorId; //收藏id
    private Integer uid;// 用户id
    private Integer articleId; //文章id


    public Integer getFavorId() {
        return favorId;
    }

    public void setFavorId(Integer favorId) {
        this.favorId = favorId;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
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
