package com.wzd.simplebook.service.impl;

import com.wzd.simplebook.dao.ArticleContentDao;
import com.wzd.simplebook.domain.ArticleContent;
import com.wzd.simplebook.service.ArticleContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleContentServiceImpl implements ArticleContentService {

    @Autowired
    ArticleContentDao articleContentDao;

    @Override
    public ArticleContent findByArticleId(String articleId) throws Exception {
        return articleContentDao.findByArticleId(articleId);
    }

    @Override
    public void addArticleContent(ArticleContent articleContent) throws Exception {
        articleContentDao.addArticleContent(articleContent);
    }
}
