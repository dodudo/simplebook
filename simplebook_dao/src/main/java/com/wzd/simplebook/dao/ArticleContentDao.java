package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.ArticleContent;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleContentDao {
    /**
     * 根据文章id查询该文章内容
     * @param articleId
     * @return
     */
    @Select("select * from articlecontent where articleid = #{articleId}")
    ArticleContent findByArticleId(@Param("articleId") Integer articleId);
}
