package com.wzd.simplebook.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.ArticleDao;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao articleDao;
    @Override
    public PageInfo<Article> findArticlesByUid(Integer uid,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Article> articles = articleDao.findByUid(uid);
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    @Override
    public PageInfo<Article> findFavorArticlesByUid(Integer uid,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Article> favorArticles = articleDao.findFavorArticlByUid(uid);
        PageInfo pageInfo = new PageInfo(favorArticles);
        return pageInfo;
    }
}
