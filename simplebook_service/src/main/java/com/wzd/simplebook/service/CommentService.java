package com.wzd.simplebook.service;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Comment;

public interface CommentService {
    /**
     * 添加评论
     * @param comment
     * @return
     */
    Comment addComment(Comment comment);

    /**
     * 根据用户id查询该用户所有评论
     * @param uid
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<Comment> findCommentsByUid(int uid,int pageNum,int pageSize) throws Exception;
}
