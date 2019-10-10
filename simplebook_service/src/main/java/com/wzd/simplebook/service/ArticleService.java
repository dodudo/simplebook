package com.wzd.simplebook.service;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.ArticleContent;

import java.util.List;


public interface ArticleService {
    /**
     * 根据用户id查询用户的文章
     * @param uid
     * @return
     */
    PageInfo<Article> findArticlesByUid(String uid,int pageNum) throws Exception;

    /**
     * 根据用户id查询用户收藏文章
     * @param uid
     * @return
     */
    PageInfo<Article> findFavorArticlesByUid(String uid,int pageNum) throws Exception;

    /**
     * 查询用户所写文章总字数
     * @param uid
     * @return
     */
    int findUserArticleFont(String uid) throws Exception;

    /**
     * 查询用户收到的赞
     * @param uid
     * @return
     */
    int findUserArticleFavor(String uid) throws Exception;

    /**
     * “删除”用户文章
     * @param articleId
     * @return
     * @throws Exception
     */
    boolean changeArticleState(String articleId,int state) throws Exception;

    /**
     * 删除用户收藏文章
     * @param uid
     * @param articleId
     * @return
     */
    boolean deleteFavorArticle(String uid, String articleId) throws Exception;

    /**
     * 查找所有文章
     * @param pageNum
     * @return
     */
    PageInfo<Article> findAllArticle(int pageNum) throws Exception;

    /**
     * 批量修改文章状态
     * @param id
     * @param i
     * @return
     */
    boolean changeManyArticleState(String[] id, int i);

    /**
     * 根据文章关键字查找文章
     * @param pageNum
     * @param articleKey
     * @return
     */
    PageInfo findArticlesByKey(int pageNum, String articleKey) throws Exception;

    /**
     * 查询所有敏感风险文章
     * @param pageNum
     * @return
     */
    PageInfo findRiskArticles(int pageNum);

    /**
     * 根据关键字查询所有敏感风险文章
     * @param pageNum
     * @return
     */
    PageInfo findRiskArticlesByKey(int pageNum, String articleKey);

    /**
     * 查找所有被”删除“文章
     * @param pageNum
     * @return
     */
    PageInfo findAllHadDelArticle(int pageNum);

    /**
     * 根据关键字查找被删除文章
     * @param pageNum
     * @param articleKey
     * @return
     */
    PageInfo findHadDelArticleByKey(int pageNum, String articleKey);

    /**
     * 查找所有文章--分页
     */
    public List<Article> findAll(int page, int size) throws Exception;

    /**
     * 查找所有文章--未分页
     */
    public List<Article> findAllList() throws Exception;

    /**
     * 根据文章id进入文章详情页面
     */
    public Article findArticleByAId(String articleId) throws Exception;

    /**
     * 添加文章
     *
     * @param article
     */
    void addArticle(Article article) throws Exception;

    /**
     * 点赞文章
     */
    void updateGoodforArticle(Article article) throws Exception;

}
