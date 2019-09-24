package com.wzd.simplebook.service;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;

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

}
