package com.wzd.simplebook.service;

import com.wzd.simplebook.domain.ArticleContent;

public interface ArticleContentService {

    public ArticleContent findByArticleId(String articleId) throws Exception;
}
