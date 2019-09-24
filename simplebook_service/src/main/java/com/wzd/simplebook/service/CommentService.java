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
    Comment addComment(Comment comment);

    /**
     * 根据用户id查询该用户所有评论
     * @param uid
     * @return
     */
    PageInfo<Comment> findCommentsByUid(String uid,int pageNum) throws Exception;
}
