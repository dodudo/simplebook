package com.wzd.simplebook.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.Comment;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
@SessionAttributes({"user"})
public class CommentController {
    @Autowired
    CommentService commentService;

    /**
     * 查询用户所有评论
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findCommentsByUid")
    public @ResponseBody Map<String ,Object> findCommentsByUid(ModelMap modelMap, int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        User user = (User) modelMap.get("user");
        PageHelper.startPage(pageNum,1);
        List<Comment> comments = commentService.findCommentsByUid(user.getUid());
        PageInfo commentPageInfo = new PageInfo(comments);
        map.put("articlePageInfo",commentPageInfo);
        return map;
    }
}
