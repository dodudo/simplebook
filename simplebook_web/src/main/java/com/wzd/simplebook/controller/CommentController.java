package com.wzd.simplebook.controller;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.Comment;
import com.wzd.simplebook.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentService commentService;

    /**
     * 查询用户所有评论
     * @param uid
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findCommentsByUid")
    public @ResponseBody Map<String ,Object> findCommentsByUid(int uid,int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo<Comment> articlePageInfo = commentService.findCommentsByUid(uid, pageNum, 3);
        map.put("articles",articlePageInfo);
        return map;
    }
}
