package com.wzd.simplebook.service;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;


public interface ArticleService {
    /**
     * 根据用户id查询用户的文章
     * @param uid
     * @return
     */
    PageInfo<Article> findArticlesByUid(String uid,int pageNum,int pageSize);

    /**
     * 根据用户id查询用户收藏文章
     * @param uid
     * @return
     */
    PageInfo<Article> findFavorArticlesByUid(String uid,int pageNum,int pageSize);
}
