package com.wzd.simplebook.domain;

public class Follow {

    private String followId;
    private String articleId;
    private String uid;

    public String getFollowId() {
        return followId;
    }

    public void setFollowId(String followId) {
        this.followId = followId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "Follow{" +
                "followId=" + followId +
                ", uid=" + uid +
                ", articleId=" + articleId +
                '}';
    }
}
