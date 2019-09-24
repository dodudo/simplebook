package com.wzd.simplebook.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.ArticleDao;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao articleDao;

    @Override
    @Cacheable(value = "articleCache",key = "#uid")
    public List<Article> findArticlesByUid(String uid) throws Exception {
        return articleDao.findByUid(uid);
    }

    @Override
    @Cacheable(value = "favorArticleCache",key = "#uid")
    public List<Article> findFavorArticlesByUid(String uid) throws Exception {
       return articleDao.findFavorArticlByUid(uid);
    }
    /**
     * 查询用户所写文章总字数
     * @param uid
     * @return
     */
    public int findUserArticleFont(String uid) throws Exception {
        return articleDao.findUserArticleFont(uid);
    }

    /**
     * 查询用户收到的赞
     * @param uid
     * @return
     */
    public int findUserArticleFavor(String uid) throws Exception {
        return articleDao.findUserArticleFavor(uid);
    }
}
