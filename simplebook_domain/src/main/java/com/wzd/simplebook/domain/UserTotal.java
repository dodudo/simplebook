package com.wzd.simplebook.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
@JsonIgnoreProperties(value = "handler",ignoreUnknown = true)
public class UserTotal implements Serializable {
    private static final long serialVersionUID = 1L;
    private int favorTotal;
    private int articalTotal;
    private int fontCount;
    private int totalGood;


    public int getFavorTotal() {
        return favorTotal;
    }

    public void setFavorTotal(int favorTotal) {
        this.favorTotal = favorTotal;
    }

    public int getArticalTotal() {
        return articalTotal;
    }

    public void setArticalTotal(int articalTotal) {
        this.articalTotal = articalTotal;
    }

    public int getFontCount() {
        return fontCount;
    }

    public void setFontCount(int fontCount) {
        this.fontCount = fontCount;
    }

    public int getTotalGood() {
        return totalGood;
    }

    public void setTotalGood(int totalGood) {
        this.totalGood = totalGood;
    }

    @Override
    public String toString() {
        return "UserTotal{" +
                "favorTotal=" + favorTotal +
                ", articalTotal=" + articalTotal +
                ", fontCount=" + fontCount +
                ", totalGood=" + totalGood +
                '}';
    }
}
