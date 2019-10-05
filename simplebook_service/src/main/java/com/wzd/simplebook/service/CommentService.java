package com.wzd.simplebook.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Comment;

import java.util.List;

public interface CommentService {
    /**
     * 添加评论
     * @param comment
     * @return
     */
    void addComment(Comment comment) throws Exception;

    /**
     * 根据用户id查询该用户所有评论
     * @param uid
     * @return
     */
    PageInfo<Comment> findCommentsByUid(String uid,int pageNum) throws Exception;

    /**
     * 根据评论id删除评论
     * @param commentId
     * @return
     */
    boolean deleteCommentById(String commentId) throws Exception;

    /**
     * 根据文章id查找评论
     */
    public Comment findCommentsByArticleId(String articleId) throws Exception;
}
