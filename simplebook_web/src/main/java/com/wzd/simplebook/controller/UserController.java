package com.wzd.simplebook.controller;


import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.sun.xml.internal.rngom.parse.host.Base;
import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.domain.UserTotal;
import com.wzd.simplebook.service.ArticleService;
import com.wzd.simplebook.service.UserService;
import com.wzd.simplebook.utils.EmailUtil;
import com.wzd.simplebook.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
@SessionAttributes({"user"})
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;

    @Autowired
    private EmailUtil emailUtil;
    @Autowired
    private FileUtil fileUtil;
    /**
     * 根据状态，关键字条件查询所有用户
     * @return
     */
    @RequestMapping("/findUsers")
    public @ResponseBody Map<String,Object> findUsers(int pageNum,int state,String key) throws Exception {
        Map<String,Object> map = new HashMap<>();
//        System.out.println(key);
        if ("".equals(key)||key == null){
            key = "";
        }
        PageInfo<User> usersPageInfo = userService.findUsers(pageNum,state,key);
        map.put("usersPageInfo", usersPageInfo);
        return map;
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
   public String addUser(User user,String checkCode) throws Exception {
        String uid = UUID.randomUUID().toString().replace("-","");
        user.setUid(uid);
       if (userService.addUser(user)){
           System.out.println("添加成功");
       }
       //跳转登录中间页
       return "target";
   }

    /**
     * 验证用户名是否存在
     * @param uname
     * @return
     * @throws Exception
     */
    @RequestMapping("/checkUser")
    public @ResponseBody Map<String,Object> checkUser(String uname) throws Exception {
        Map<String,Object> map = new HashMap<>();
        if (userService.findUserByName(uname)){
            map.put("noUser",true);
        }else {
            map.put("noUser",false);
        }
        return map;
    }

    /**
     * 验证此邮箱是否已经注册
     * @param email
     * @return
     * @throws Exception
     */
    @RequestMapping("/checkEmail")
    public @ResponseBody Map<String,Object> checkEmail(String email) throws Exception {
        Map<String,Object> map = new HashMap<>();
        if (userService.findUserByEmail(email)){
            map.put("noEmail",true);
        }else {
            map.put("noEmail",false);
        }
        return map;
    }

    /**
     * 根据用户名，密码判断是否由此用户，并且根据状态决定可否登录
     * @param map
     * @param uname
     * @param upassword
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public ModelAndView login(ModelMap map, String uname, String upassword) throws Exception {
        ModelAndView mv = new ModelAndView();
        //System.out.println(uname+"::::::::::"+upassword);
        User user = userService.findUserByNamePwd(uname,upassword);
        //System.out.println(user);
        if (user!=null){
            user.setUpassword("");
            int userState = user.getUserState();
            if (userState==1){
                mv.setViewName("redirect:/article/findAll?page=1&size=5");
                //将user存入session
                map.addAttribute("user",user);
                return mv;
            }else if (userState==0){
                mv.setViewName("signin");
                mv.addObject("login-msg","此用户已被冻结！");
                return mv;
            }else if (userState==2){
                mv.setViewName("signin");
                mv.addObject("login-msg","此用户不可用！");
                return mv;
            }else {
                mv.setViewName("signin");
                mv.addObject("login-msg","登录错误！");
                return mv;
            }
        }else {
            mv.setViewName("signin");
            mv.addObject("login-msg","用户名密码错误！");
            return mv;
        }
    }

    /**
     * 查询用户详细信息
     * @param map
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUserTotal")
    public @ResponseBody Map<String,Object> findUserInfo(ModelMap map) throws Exception {
        Map<String ,Object> userMap = new HashMap<>();
        //记录总字数
        int fontCount = 0;
        //记录总点赞数
        int totalGood = 0;
        //在session域中获得当前登录用户
        User user = (User) map.get("user");
        //获取用户详细信息
        UserTotal userTotal = new UserTotal();
        userTotal.setFontCount(articleService.findUserArticleFont(user.getUid()));
        userTotal.setFavorTotal(articleService.findUserArticleFavor(user.getUid()));
        //将usermap，userTotal等对象存入map集合中
        userMap.put("userTotal",userTotal);
        return userMap;
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/changeUserInfo")
    public String changeUserInfo(ModelMap modelMap,User user) throws Exception {
        Object sessionUser = modelMap.get("user");
        System.out.println(user);
        //判断用户信息是否被修改
        if (userService.changeUserInfo(user)){
            System.out.println("修改成功！");
        }else {
            System.out.println("修改失败");
        }
        return "redirect:/user";
    }

    /**
     * 修改用户头像
     * @param modelMap
     * @param file
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeUserImg")
    public @ResponseBody Map<String,Object> changeUserImg(ModelMap modelMap,@RequestParam("file") String file, HttpServletRequest request)throws Exception{
        Map<String,Object> map = new HashMap<>();
        String path = request.getSession().getServletContext().getRealPath("");
        //System.out.println("path::::::::::::::"+path);
        String contextPath = request.getContextPath();
        //System.out.println("contextPath::::::::"+contextPath);
        path = path  + "userImg";
        //将文件写入指定路径
        String fileName = fileUtil.writeFile(file,path);
        //定义图片在服务器中的虚拟路径
        String virtualPath =  "/userHeadImg/"+fileName;
        //获取当前登录用户
        User user = (User) modelMap.get("user");
        user.setHeadImgs(virtualPath);
        modelMap.addAttribute("user",user);
       //更改数据库中用户头像路径
        if ( userService.changeUserHeadImg(user.getUid(),virtualPath)){
            map.put("headImgPath",virtualPath);
        }else {
            map.put("headImgPath","/image/moren.jpg");
        }
        return map;
    }

    /**
     * 修改用户密码
     *
     * @param user
     * @return
     */
    @RequestMapping("/backupPwd")
    public @ResponseBody
    Map<String, Object> backupPwd(ModelMap modelMap, User user) throws Exception {
        User sessionUser = (User) modelMap.get("user");
        Map<String, Object> map = new HashMap<>();
        System.out.println(user);
        //判断密码是否被修改
        if (userService.changePwd(user)) {
            map.put("change_msg", true);
        } else {
            map.put("change_msg", false);
        }
        return map;
    }
}
