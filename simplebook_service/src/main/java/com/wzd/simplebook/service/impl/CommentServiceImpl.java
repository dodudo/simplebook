package com.wzd.simplebook.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.CommentDao;
import com.wzd.simplebook.domain.Comment;
import com.wzd.simplebook.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;
    @Override
    @CacheEvict(value = "commentsCache",allEntries = true)
    public void addComment(Comment comment) throws Exception {
        commentDao.addComment(comment);
    }

    @Override
    @Cacheable(value = "commentsCache")
    public PageInfo<Comment> findCommentsByUid(String uid,int pageNum) throws Exception {
        PageHelper.startPage(pageNum,6);
        List<Comment> comments = commentDao.findCommentsByUid(uid);
        PageInfo pageInfo = new PageInfo(comments);
        return pageInfo;
    }

    @Override
    @CacheEvict(value = "commentsCache",allEntries = true)
    public boolean deleteCommentById(String commentId) throws Exception {
        if (commentDao.deleteCommentById(commentId)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Comment findCommentsByArticleId(String articleId) throws Exception {
        return commentDao.findCommentsByArticleId(articleId);
    }
}
