package com.wzd.simplebook.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.ArticleDao;
import com.wzd.simplebook.dao.FavorDao;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.Favor;
import com.wzd.simplebook.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao articleDao;

    @Autowired
    FavorDao favorDao;

    @Override
    @Cacheable(value = "articleCache")
    public PageInfo<Article> findArticlesByUid(String uid,int pageNum) throws Exception {
        PageHelper.startPage(pageNum,3);
        List<Article> articles = articleDao.findByUid(uid);
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    @Override
    @Cacheable(value = "favorArticleCache")
    public PageInfo<Article> findFavorArticlesByUid(String uid,int pageNum) throws Exception {
        PageHelper.startPage(pageNum,3);
        List<Article> favorArticles = articleDao.findFavorArticlByUid(uid);
        PageInfo pageInfo = new PageInfo(favorArticles);
        return pageInfo;
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

    /**
     * 修改文章状态为不可显示
     * @param articleId
     * @return
     * @throws Exception
     */
    @Override
    @CachePut(value = "favorArticleCache")
    public boolean changeArticleState(String articleId) throws Exception {
        if (articleDao.changeArticleState(articleId)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    @CacheEvict(value = "favorArticleCache",allEntries = true)
    public boolean deleteFavorArticle(String uid, String articleId) throws Exception {
        if (favorDao.deleteFavorArticle(uid,articleId)>0){
            return true;
        }else {
            return false;
        }
    }
}
