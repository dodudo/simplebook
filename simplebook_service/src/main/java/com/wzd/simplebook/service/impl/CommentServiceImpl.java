package com.wzd.simplebook.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.CommentDao;
import com.wzd.simplebook.domain.Comment;
import com.wzd.simplebook.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;
    @Override
    public Comment addComment(Comment comment) {
        return null;
    }

    @Override
    public PageInfo<Comment> findCommentsByUid(int uid, int pageNum, int pageSize) throws Exception {
        PageHelper.startPage(pageNum,pageSize);
        List<Comment> comments = commentDao.findCommentsByUid(uid);
        PageInfo pageInfo = new PageInfo(comments);
        return pageInfo;
    }
}
