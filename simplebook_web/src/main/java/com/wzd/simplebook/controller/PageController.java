package com.wzd.simplebook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面管理
 */
@Controller
public class PageController {
    @RequestMapping("/welcome")
    public String showWelcome(){
        return "welcome";
    }

    @RequestMapping("/memberList")
    public String showMemberList(){
        return "member-list";
    }
    @RequestMapping("/memberList1")
    public String showMemberList1(){
        return "member-list1";
    }
    @RequestMapping("/memberDel")
    public String showMemberDel(){
        return "member-del";
    }
    @RequestMapping("/statistics")
    public String showStatistics(){
        return "statistics";
    }
    @RequestMapping("/essayList")
    public String showEssayList(){
        return "essay-list";
    }
    @RequestMapping("/essayList1")
    public String showEssayList1(){
        return "essay-list1";
    }
    @RequestMapping("/cate")
    public String showCate(){
        return "cate";
    }
    @RequestMapping("/adminList")
    public String showAdminList(){
        return "admin-list";
    }
    @RequestMapping("/adminRole")
    public String showAdminRole(){
        return "admin-role";
    }
    @RequestMapping("/adminCate")
    public String showAdmincate(){
        return "admin-cate";
    }
     @RequestMapping("/adminRule")
    public String showAdminRule(){
        return "admin-rule";
    }
    @RequestMapping("/adminEdit")
    public String showAdminEdit(){
        return "admin-edit";
    }
    @RequestMapping("/error")
    public String showError(){
        return "error";
    }

    @RequestMapping("/adminlogin")
    public String showLogin(){
        return "adminlogin";
    }
     @RequestMapping("/user")
    public String showUser(){
        return "User";
    }
    @RequestMapping("/login")
    public String showSingnIn(){
        return "signin";
    }
    @RequestMapping("/register")
        public String showSingnUp(){
            return "signup";
        }
    @RequestMapping("/target")
        public String target(){
            return "target";
        }
    @RequestMapping("/index")
    public String showIndex(){
        return "index";
    }
    @RequestMapping("/admin")
    public String showGms(){
        return "admin";
    }
}
