package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import java.util.Objects;
@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class Article implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer articleId;
    private Integer uid;
    private String head;
    private String describe;
    private Date releaseDate;
    private Integer fontCount;
    private Integer view;
    private Integer good;
    private Integer articleState;
    private String articleStateStr;
    private Integer report;
    private Integer classId;
    private List<Comment> comments;
    private ArticleContent articleContent;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public ArticleContent getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(ArticleContent articleContent) {
        this.articleContent = articleContent;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getFontCount() {
        return fontCount;
    }

    public void setFontCount(Integer fontCount) {
        this.fontCount = fontCount;
    }

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public Integer getGood() {
        return good;
    }

    public void setGood(Integer good) {
        this.good = good;
    }

    public Integer getArticleState() {
        return articleState;
    }

    public void setArticleState(Integer articleState) {
        this.articleState = articleState;
    }

    public String getArticleStateStr() {
        return articleStateStr;
    }

    public void setArticleStateStr(String articleStateStr) {
        this.articleStateStr = articleStateStr;
    }

    public Integer getReport() {
        return report;
    }

    public void setReport(Integer report) {
        this.report = report;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }


    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", uid=" + uid +
                ", head='" + head + '\'' +
                ", describe='" + describe + '\'' +
                ", releaseDate=" + releaseDate +
                ", fontCount=" + fontCount +
                ", view=" + view +
                ", good=" + good +
                ", articleState=" + articleState +
                ", articleStateStr='" + articleStateStr + '\'' +
                ", report=" + report +
                ", classId=" + classId +
                ", comments=" + comments +
                ", articleContent=" + articleContent +
                '}';
    }
}
