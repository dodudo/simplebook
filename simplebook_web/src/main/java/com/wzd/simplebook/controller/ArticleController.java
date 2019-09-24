package com.wzd.simplebook.controller;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    ArticleService articleService;

    /**
     * 查询用户所有文章
     * @param uid
     * @param pageNum
     * @return
     */
    @RequestMapping("/findArticlesByUid")
    public @ResponseBody Map<String ,Object> findArticlesByUid(String uid,int pageNum){
        Map<String,Object> map = new HashMap<>();
        PageInfo<Article> articlePageInfo = articleService.findArticlesByUid(uid, pageNum, 3);
        map.put("articles",articlePageInfo);
        return map;
    }

    /**
     * 查询用户收藏文章
     * @param uid
     * @param pageNum
     * @return
     */
    @RequestMapping("/findFavorArticlesByUid")
    public @ResponseBody Map<String ,Object> findFavorArticlesByUid(String uid,int pageNum){
        Map<String,Object> map = new HashMap<>();
        PageInfo<Article> articlePageInfo = articleService.findFavorArticlesByUid(uid, pageNum, 3);
        map.put("articles",articlePageInfo);
        return map;
    }
}
