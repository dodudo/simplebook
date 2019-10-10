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
    public List<Article> findAll(int page, int size) throws Exception {

        PageHelper.startPage(page, size);
        return articleDao.findAll();
    }

    @Override
    public List<Article> findAllList() throws Exception {
        return articleDao.findAll();
    }

    @Override
    public Article findArticleByAId(String articleId) throws Exception {
        return articleDao.findArticleByAId(articleId);
    }

    @Override
    public void addArticle(Article article) throws Exception {
        articleDao.addArticle(article);
    }

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
    @CacheEvict(value = {"allArticleCache","articleCache","riskArticlesCache",
            "searcherArticleKeyCache","searRiskcherArticleKeyCache","searchHadDelArticleKeyCache",
            "hadDelArticleCache"},allEntries = true)
    public boolean changeArticleState(String articleId,int state) throws Exception {
        if (articleDao.changeArticleState(articleId,state)>0){
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

    @Override
    @Cacheable(value = "allArticleCache")
    public PageInfo<Article> findAllArticle(int pageNum) throws Exception {
        PageHelper.startPage(pageNum,10);
        List<Article> articles = articleDao.findAll();
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    /**
     * 修改多个文章状态
     * @param id
     * @param state
     * @return
     */
    @Override
    @CacheEvict(value = {"allArticleCache","articleCache","riskArticlesCache",
            "searcherArticleKeyCache","searRiskcherArticleKeyCache",
            "hadDelArticleCache","searchHadDelArticleKeyCache"},allEntries = true)
    public boolean changeManyArticleState(String[] id, int state) {
        if (articleDao.changeManyArticleState(id,state)>0){
          return true;
        }else {
            return false;
        }
    }

    /**
     * 根据文章关键字查找文章
     *
     * @param pageNum
     * @param articleKey
     * @return
     */
    @Override
    @Cacheable(value = "searcherArticleKeyCache")
    public PageInfo findArticlesByKey(int pageNum, String articleKey) throws Exception {
        PageHelper.startPage(pageNum,10);
        articleKey = "%"+articleKey+"%";
        List<Article> articles = articleDao.findArticlesByKey(articleKey);
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    /**
     * 查询所有敏感风险文章
     *
     * @param pageNum
     * @return
     */
    @Override
    @Cacheable(value = "riskArticlesCache")
    public PageInfo findRiskArticles(int pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Article> articles = articleDao.findRiskArticles();
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    /**
     * 根据关键字查询所有敏感风险文章
     *
     * @param pageNum
     * @param articleKey
     * @return
     */
    @Override
    @Cacheable(value = "searRiskcherArticleKeyCache")
    public PageInfo findRiskArticlesByKey(int pageNum, String articleKey) {
        PageHelper.startPage(pageNum,10);
        articleKey = "%"+articleKey+"%";
        List<Article> articles = articleDao.findRiskArticlesByKey(articleKey);
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    /**
     * 查找所有被”删除“文章
     *
     * @param pageNum
     * @return
     */
    @Override
    @Cacheable("hadDelArticleCache")
    public PageInfo findAllHadDelArticle(int pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Article> articles = articleDao.findAllHadDelArticle();
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }

    /**
     * 根据关键字查找被删除文章
     *
     * @param pageNum
     * @param articleKey
     * @return
     */
    @Override
    @Cacheable(value = "searchHadDelArticleKeyCache")
    public PageInfo findHadDelArticleByKey(int pageNum, String articleKey) {
        PageHelper.startPage(pageNum,10);
        articleKey = "%"+articleKey+"%";
        List<Article> articles = articleDao.findHadDelArticleByKey(articleKey);
        PageInfo pageInfo = new PageInfo(articles);
        return pageInfo;
    }
}
