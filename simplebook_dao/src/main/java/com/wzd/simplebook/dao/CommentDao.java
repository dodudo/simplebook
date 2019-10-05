package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Comment;
import com.wzd.simplebook.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.awt.*;
import java.util.List;

@Repository
public interface CommentDao {
    /**
     * 查询所有评论
     * @return
     */
    @Select("select * from comment")
    List<Comment> findAllComments() throws Exception;

    /**
     * 根据文章id查询该文章下所有评论
     * @return
     */
    @Select("select * from comment where articleid = #{articleId}")
    @Results({
            @Result(id = true, property = "articleId", column = "articleid"),
            @Result(column = "commentid", property = "commentId"),
            @Result(column = "uid", property = "uId"),
            @Result(column = "parentid", property = "parentId"),
            @Result(column = "floor", property = "floor"),
            @Result(column = "commentdate", property = "commentDate"),
            @Result(column = "content", property = "content"),
            @Result(column = "uid", property = "user", javaType = User.class, one = @One(select = "com.wzd.simplebook.dao.UserDao.findUserByUid"))
    })
    public Comment findCommentsByArticleId(String articleId) throws Exception;

    /**
     * 根据用户id查询该用户的所有评论
     * @return
     */
    @Select("select * from comment where uid = #{uid}")
    List<Comment> findCommentsByUid(@Param("uid") String uid) throws Exception;

    /**
     * 添加评论
     * @param comment
     * @return
     */
    @Insert("insert into comment(commentid,articleid,uid,parentid,floor,commentdate,content) " +
            "value(#{commentId},#{articleId},#{uId},#{parentId},#{floor},#{commentDate},#{content})")
    void addComment(Comment comment) throws Exception;

    /**
     * 根据评论id删除评论
     * @param commentId
     * @return
     */
    @Delete("delete from comment where commentid = #{commentId}")
    int deleteCommentById(@Param("commentId") String commentId) throws Exception;
}
