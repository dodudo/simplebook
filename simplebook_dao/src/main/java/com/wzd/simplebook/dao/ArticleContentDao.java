package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.ArticleContent;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleContentDao {
    /**
     * 根据文章id查询该文章内容
     *
     */
    @Select("select * from articlecontent where articleid = #{articleid}")
    @Results({
            @Result(id = true, property = "articleId", column = "articleid"),
            @Result(column = "articlecontentid", property = "articleContentId"),
            @Result(column = "articleimgurl", property = "articleImgUrl"),
            @Result(column = "articlecontent", property = "articleContent")
    })
    public ArticleContent findByArticleId(String articleId) throws Exception;
}
