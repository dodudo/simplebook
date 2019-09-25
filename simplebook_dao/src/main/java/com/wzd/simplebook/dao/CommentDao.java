package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Comment;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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
    List<Comment> findCommentsByArticleId(@Param("articleId") String articleId) throws Exception;

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
            "value(#{commentid},#{articleid},#{uid},#{parentid},#{floor},#{commentdate},#{content})")
    Comment addComment(Comment comment) throws Exception;

    /**
     * 根据评论id删除评论
     * @param commentId
     * @return
     */
    @Delete("delete from comment where commentid = #{commentId}")
    int deleteCommentById(@Param("commentId") String commentId) throws Exception;
}
