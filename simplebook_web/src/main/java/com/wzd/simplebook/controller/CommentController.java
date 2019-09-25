package com.wzd.simplebook.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.Comment;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
        PageInfo<Comment> commentPageInfo = commentService.findCommentsByUid(user.getUid(),pageNum);
        map.put("commentPageInfo",commentPageInfo);
        return map;
    }

    /**
     * 删除用户评论
     * @param commentId
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteComment")
    public @ResponseBody Map<String,Object> deleteComment(@RequestParam("commentId") String commentId) throws Exception {
        Map<String,Object> map = new HashMap<>();
        System.out.println("commentId::::::::::::"+commentId);
        if (commentService.deleteCommentById(commentId)){
            map.put("delCommentMsg",true);
        }else {
            map.put("delCommentMsg",false);
        }
        return map;
    }

}
