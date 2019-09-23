package com.wzd.simplebook.controller;


import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.domain.UserTotal;
import com.wzd.simplebook.service.UserService;
import com.wzd.simplebook.utils.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.jws.WebParam;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
@SessionAttributes({"user"})
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private EmailUtil emailUtil;
    /**
     * 查询所有用户
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findAll();
        mv.addObject("users",users);
        mv.setViewName("member-list");
        return mv;
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
   public String addUser(User user,String checkCode) throws Exception {
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
                mv.setViewName("redirect:/index");
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
    @RequestMapping("/findUserInfo")
    public @ResponseBody Map<String,Object> findUserInfo(ModelMap map) throws Exception {
        Map<String ,Object> userMap = new HashMap<>();
        //记录总字数
        int fontCount = 0;
        //记录总点赞数
        int totalGood = 0;
        //获得当前登录用户
        User user = (User) map.get("user");
        //获取用户详细信息
        User userInfo = userService.findUserByUid(user.getUid()+"");

        //将usermap，userTotal等对象存入map集合中
        userMap.put("userMap",userInfo);

        return userMap;
    }
}
