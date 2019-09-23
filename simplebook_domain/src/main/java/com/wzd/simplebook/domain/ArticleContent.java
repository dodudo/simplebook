package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.Objects;
@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class ArticleContent implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer articleContentId;
    private Integer articleId;
    private String articleImgUrl;
    private String articleContent;



    public Integer getArticleContentId() {
        return articleContentId;
    }

    public void setArticleContentId(Integer articleContentId) {
        this.articleContentId = articleContentId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticleImgUrl() {
        return articleImgUrl;
    }

    public void setArticleImgUrl(String articleImgUrl) {
        this.articleImgUrl = articleImgUrl;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    @Override
    public String toString() {
        return "ArticleContent{" +
                "articleContentId=" + articleContentId +
                ", articleId=" + articleId +
                ", articleImgUrl='" + articleImgUrl + '\'' +
                ", articleContent='" + articleContent + '\'' +
                '}';
    }

}
