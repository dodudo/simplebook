package com.wzd.simplebook.service;

import com.wzd.simplebook.domain.ArticleContent;

public interface ArticleContentService {

    public ArticleContent findByArticleId(String articleId) throws Exception;

    /**
     * 添加文章内容
     *
     * @param articleContent
     */
    void addArticleContent(ArticleContent articleContent) throws Exception;
}
