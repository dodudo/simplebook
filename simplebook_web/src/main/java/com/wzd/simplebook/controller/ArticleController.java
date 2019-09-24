package com.wzd.simplebook.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.jws.WebParam;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/article")
@SessionAttributes({"user"})
public class ArticleController {
    @Autowired
    ArticleService articleService;

    /**
     * 查询用户所有文章
     * @param pageNum
     * @return
     */
    @RequestMapping("/findArticlesByUid")
    public @ResponseBody Map<String ,Object> findArticlesByUid(ModelMap modelMap, int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        User user = (User) modelMap.get("user");
        PageHelper.startPage(pageNum,3);
        List<Article> articles = articleService.findArticlesByUid(user.getUid());
        PageInfo articlePageInfo = new PageInfo(articles);
        map.put("articlePageInfo",articlePageInfo);
        return map;
    }

    /**
     * 查询用户收藏文章
     * @param pageNum
     * @return
     */
    @RequestMapping("/findFavorArticlesByUid")
    public @ResponseBody Map<String ,Object> findFavorArticlesByUid(ModelMap modelMap, int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        User user = (User) modelMap.get("user");
        System.out.println(user);
        System.out.println(pageNum);
        PageHelper.startPage(pageNum,3);
        List<Article> favorArticles = articleService.findFavorArticlesByUid(user.getUid());
        PageInfo favorArticlePageInfo = new PageInfo(favorArticles);
        map.put("favorArticlePageInfo",favorArticlePageInfo);
        return map;
    }
}
