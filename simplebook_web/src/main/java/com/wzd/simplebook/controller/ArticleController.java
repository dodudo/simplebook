package com.wzd.simplebook.controller;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
     * 查询所有文章信息--分页
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "5") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Article> articleList = articleService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(articleList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("index");
        return mv;
    }

    /**
     * 查询所有文章--未分页
     */
    @RequestMapping("/findAllList")
    public ModelAndView findAllList() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Article> articleList = articleService.findAllList();
        mv.addObject("articleList", articleList);
        mv.setViewName("index");
        return mv;
    }

    /**
     * 根据文章id进入详情查看
     */
    @RequestMapping("/findArticleByAId")
    public ModelAndView findArticleByAId(@RequestParam(name = "articleId") String articleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Article article = articleService.findArticleByAId(articleId);
        mv.addObject("articleDetail", article);
        mv.setViewName("essay-detail");
        return mv;
    }

    /**
     * 查询所有文章
     *
     * @param modelMap
     * @param pageNum
     * @return
     */
    @RequestMapping("/findAllArticle")
    public @ResponseBody
    Map<String, Object> findAllArticle(ModelMap modelMap, int pageNum) throws Exception {
        Map<String, Object> map = new HashMap<>();
        PageInfo<Article> articlesPageInfo = articleService.findAllArticle(pageNum);
        map.put("articlesPageInfo", articlesPageInfo);
        return map;
    }

    /**
     * 查询用户所有文章
     * @param pageNum
     * @return
     */
    @RequestMapping("/findArticlesByUid")
    public @ResponseBody Map<String ,Object> findArticlesByUid(ModelMap modelMap, int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        User user = (User) modelMap.get("user");
        PageInfo<Article> articlePageInfo = articleService.findArticlesByUid(user.getUid(),pageNum);
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
        PageInfo<Article> favorArticlePageInfo = articleService.findFavorArticlesByUid(user.getUid(),pageNum);
        map.put("favorArticlePageInfo",favorArticlePageInfo);
        return map;
    }

    /**
     * "删除"用户文章
     * @param articleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteArticle")
    public @ResponseBody Map<String,Object> deleteArtile(@RequestParam("articleId") String[] articleId) throws Exception {
        Map<String,Object> map = new HashMap<>();
        String id = null;
        if (articleId.length>0&&articleId != null){
            if (articleId.length == 1){
                id = articleId[0];
                if (articleService.changeArticleState(id,0)){
                    map.put("delArticleMsg",true);
                }else {
                    map.put("delArticleMsg",false);
                }
            }else {
                StringBuffer sb = new StringBuffer();
                for (int i = 0;i<articleId.length;i++) {
                    if (i==0){
                        sb.append(articleId[i]);
                    }else {
                        sb.append(","+articleId[i]);
                    }
                }
                id = sb.toString();
                articleService.changeManyArticleState(id,0);
            }
        }


        return map;
    }

    /**
     * 删除用户收藏文章
     * @param articleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteFavorArticle")
    public @ResponseBody Map<String,Object> deleteFavorArtile(@RequestParam("uid")String uid,@RequestParam("articleId") String articleId) throws Exception {
        Map<String,Object> map = new HashMap<>();
        System.out.println(articleId);
        if (articleService.deleteFavorArticle(uid,articleId)){
            map.put("delFavorArticleMsg",true);
        }else {
            map.put("delFavorArticleMsg",false);
        }
        return map;
    }


    /**
     * 更改文章状态
     * @param state
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeArticleState")
    public @ResponseBody Map<String,Object> changeArticleState(String articleId,int state) throws Exception {
        Map<String,Object> map = new HashMap<>();
        if (articleService.changeArticleState(articleId,state)){
            map.put("changeMsg",true);
        }else {
            map.put("changeMsg",false);
        }
        return map;
    }
    /**
     * 根据关键字查找文章
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findArticleByKey")
    public @ResponseBody Map<String,Object> findArticleByKey(int pageNum,String articleKey) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo articlesPageInfo = articleService.findArticlesByKey(pageNum,articleKey);
        System.out.println(articlesPageInfo);
        map.put("articlesPageInfo",articlesPageInfo);
        return map;
    }
    /**
     * 查找风险文章（字数少于50，被举报量大于50）
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRiskArticles")
    public @ResponseBody Map<String,Object> findRiskArticles(int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo articlesPageInfo = articleService.findRiskArticles(pageNum);
        System.out.println(articlesPageInfo);
        map.put("articlesPageInfo",articlesPageInfo);
        return map;
    }
    /**
     * 根据关键字查找敏感文章（字数少于50，被举报量大于50）
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRiskArticleByKey")
    public @ResponseBody Map<String,Object> findRiskArticleByKey(int pageNum,String articleKey) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo articlesPageInfo = articleService.findRiskArticlesByKey(pageNum,articleKey);
        System.out.println(articlesPageInfo);
        map.put("articlesPageInfo",articlesPageInfo);
        return map;
    }
    /**
     * 查找所有”被删除“文章
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllHadDelArticle")
    public @ResponseBody Map<String,Object> findAllHadDelArticle(int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo articlesPageInfo = articleService.findAllHadDelArticle(pageNum);
        map.put("articlesPageInfo",articlesPageInfo);
        return map;
    }

    /**
     * 批量修改用户文章
     * @param articleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeManyArticlesState")
    public @ResponseBody Map<String,Object> changeManyArticlesState(@RequestParam("articleId") String[] articleId) throws Exception {
        Map<String,Object> map = new HashMap<>();
        String id = null;
        if (articleId.length>0&&articleId != null){
            if (articleId.length == 1){
                id = articleId[0];
                if (articleService.changeArticleState(id,1)){
                    map.put("delArticleMsg",true);
                }else {
                    map.put("delArticleMsg",false);
                }
            }else {
                StringBuffer sb = new StringBuffer();
                for (int i = 0;i<articleId.length;i++) {
                    if (i==0){
                        sb.append(articleId[i]);
                    }else {
                        sb.append(","+articleId[i]);
                    }
                }
                id = sb.toString();
                articleService.changeManyArticleState(id,1);
            }
        }


        return map;
    }
    /**
     * 根据关键字查找敏感文章（字数少于50，被举报量大于50）
     * @param pageNum
     * @return
     * @throws Exception
     */
    @RequestMapping("/findHadDelArticleByKey")
    public @ResponseBody Map<String,Object> findHadDelArticleByKey(int pageNum,String articleKey) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo articlesPageInfo = articleService.findHadDelArticleByKey(pageNum,articleKey);
        System.out.println(articlesPageInfo);
        map.put("articlesPageInfo",articlesPageInfo);
        return map;
    }
}
