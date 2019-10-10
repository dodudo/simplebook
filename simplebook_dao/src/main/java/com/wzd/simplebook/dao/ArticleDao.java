package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.ArticleContent;
import com.wzd.simplebook.domain.User;
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
    @Select("select * from article where articlestate != 0 ")
    List<Article> findAll() throws Exception;

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
    @Update("update article set articlestate = #{articlestate} where articleid = #{articleId}")
    int changeArticleState(@Param("articleId") String articleId,@Param("articlestate") int state) throws Exception;

    /**
     * 更改多个文章状态
     * @param id
     * @return
     * @throws Exception
     */
    @Update({
            "<script>"
                    + "update article set articlestate = #{articlestate} where articleid in "
                    + "<foreach item='item' index = 'index' collection = 'articleid' open ='(' separator = ',' close=')'>"
                    + "#{item}"
                    + "</foreach>"
                    + "</script>"
    })
    int changeManyArticleState(@Param("articleid") String[] id, @Param("articlestate") int state);

    /**
     * 根据文章关键字查找文章
     * @param articleKey
     * @return
     */
    @Select("select * from article where articlestate != 0 and head like #{articleKey}")
    List<Article> findArticlesByKey(@Param("articleKey") String articleKey);

    /**
     * 查询所有敏感风险文章
     *
     * @return
     */
    @Select("select * from article where articlestate != 0 and fontcount<50 and report>50")
    List<Article> findRiskArticles();

    /**
     * 根据文章关键字查找文章
     * @param articleKey
     * @return
     */
    @Select("select * from article where articlestate != 0 and fontcount<50 and report>50 and head like #{articleKey}")
    List<Article> findRiskArticlesByKey(String articleKey);

    /**
     * 查询所有被"删除"文章
     *
     * @return
     */
    @Select("select * from article where articlestate = 0")
    List<Article> findAllHadDelArticle();

    /**
     * 根据文章关键字查找被删除文章
     * @param articleKey
     * @return
     */
    @Select("select * from article where articlestate = 0 and head like #{articleKey}")
    List<Article> findHadDelArticleByKey(String articleKey);

    /**
     * 查询文章详情
     * 涉及多表操作
     */
    @Select("select * from article where articleid=#{articleid}")
    @Results({
            @Result(id = true, property = "articleId", column = "articleid"),
            @Result(column = "uid", property = "uid"),
            @Result(column = "head", property = "head"),
            @Result(column = "headurl", property = "headurl"),
            @Result(column = "describe", property = "describe"),
            @Result(column = "releasedate", property = "releaseDate"),
            @Result(column = "fontcount", property = "fontCount"),
            @Result(column = "view", property = "view"),
            @Result(column = "good", property = "good"),
            @Result(column = "articlestate", property = "articleState"),
            @Result(column = "report", property = "report"),
            @Result(column = "articlecontentid", property = "articleContentId"),
            @Result(column = "classid", property = "classId"),
            @Result(column = "uid", property = "user", javaType = User.class, one = @One(select = "com.wzd.simplebook.dao.UserDao.findUserByUid")),
            @Result(column = "articleid", property = "articleContent", javaType = ArticleContent.class, one = @One(select = "com.wzd.simplebook.dao.ArticleContentDao.findByArticleId")),
            @Result(column = "articleid", property = "comments", javaType = java.util.List.class, many = @Many(select = "com.wzd.simplebook.dao.CommentDao.findCommentsByArticleId"))
    })
    public Article findArticleByAId(String articleId) throws Exception;

    /**
     * 添加文章
     *
     * @param article
     * @throws Exception
     */
    @Insert("insert into article(uid,headurl,head,articleid,`describe`,articleState)value(#{uid},#{headurl},#{head},#{articleId},#{describe},#{articleState})")
    void addArticle(Article article) throws Exception;

    /**
     * 点赞文章
     */
    @Update("update article set good = #{good} where articleid = #{articleId}")
    void updateGoodforArticle(Article article) throws Exception;
}
