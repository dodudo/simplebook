package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Article;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import javax.annotation.security.PermitAll;
import java.util.List;

@Repository
public interface ArticleDao {
    /**
     * 根据用户id查询该用户下的所有文章
     * @param uid
     * @return
     */
    @Select("select * from article where uid = #{uid} and articlestate = 1")
    List<Article> findByUid(@Param("uid") String uid) throws Exception;

    /**
     * 根据文章id查询文章所有内容
     * @param articleId
     * @return
     */
    @Select("select * from article where articleid = #{articleid} and articlestate = 1")
    @Results(id = "articleMap",
            value = {
                    @Result(id = true,column = "articleid",property = "articleId"),
                    @Result(column = "uid",property = "uid"),
                    @Result(column = "head",property = "head"),
                    @Result(column = "headurl",property = "headurl"),
                    @Result(column = "describe",property = "describe"),
                    @Result(column = "releasedate",property = "releaseDate"),
                    @Result(column = "fontcount",property = "fontCount"),
                    @Result(column = "view",property = "view"),
                    @Result(column = "good",property = "good"),
                    @Result(column = "articlestate",property = "articleState"),
                    @Result(column = "report",property = "report"),
                    @Result(column = "articlecontentid",property = "articleContentId"),
                    @Result(column = "classid",property = "classId"),
                    @Result(column = "articleid",property = "articleContent",
                            one = @One(
                                    select = "com.wzd.simplebook.dao.ArticleContentDao.findByArticleId"
//                                    fetchType = FetchType.LAZY //开启懒加载
                            ))
            })
    List<Article> findByArticleId(@Param("articleid") String articleId) throws Exception;

    /**
     * 查询所有文章信息
     * @return
     */
    List<Article> findAll();

    /**
     * 统计用户文章数
     */
    @Select("select count(*) from article where uid = #{uid} and articlestate = 1")
    int findTotalByUid(@Param("uid") String uid) throws Exception;

    /**
     * 根据用户id在favor表中查询出用户收藏文章id再查询出用户收藏文章
     * @param uid
     * @return
     */
    @Select("select * from article where articleid in (select articleid from favor where uid = #{uid} ) and articlestate = 1")
    List<Article> findFavorArticlByUid(String uid) throws Exception;

    /**
     * 统计用户所有文章字数
     * @param uid
     * @return
     */
    @Select("select sum(fontcount) as userfontcount from article where uid = #{uid} and articlestate = 1")
    int findUserArticleFont(@Param("uid") String uid) throws Exception;

    /**
     * 统计用户收到的赞
     * @param uid
     * @return
     */
    @Select("select sum(good) as usergood from article where uid = #{uid} and articlestate = 1")
    int findUserArticleFavor(@Param("uid") String uid) throws Exception;

    /**
     * 更改文章状态
     * @param articleId
     * @return
     * @throws Exception
     */
    @Update("update article set articlestate = 2 where articleid = #{articleId}")
    int changeArticleState(@Param("articleId") String articleId) throws Exception;


}
