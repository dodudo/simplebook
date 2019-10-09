package com.wzd.simplebook.controller;

import com.wzd.simplebook.dao.AdminDao;
import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 页面管理
 */
@Controller
@SessionAttributes({"admin"})
public class PageController {
    @Autowired
    AdminService adminService;

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

    @RequestMapping("/error")
    public String showError(){
        return "error";
    }

    @RequestMapping("/editor-sccuss")
    public String showEditorsccuss() {
        return "editor-sccuss";
    }

    @RequestMapping("/editor")
    public String showEditor() {
        return "editor";
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
    @RequestMapping("/article-delete")
    public String showarticledelete(){
        return "article-delete";
    }

    @RequestMapping("/admin-add")
    public ModelAndView showAdminAdd(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin.getRole() == 1) {
            mv.setViewName("admin-edit");
        } else {
            mv.setViewName("roleError");
        }
        return mv;
    }
    @RequestMapping("/adminEdit")
    public ModelAndView showAdminEdit(HttpServletRequest request, String aid) throws Exception {
        ModelAndView mv = new ModelAndView();
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (aid != null && aid.length() != 0) {
            if (admin.getAdminId().equals(aid) || admin.getRole() == 1) {
                Admin beChangeAdmin = adminService.findById(aid);
                if (beChangeAdmin != null) {
                    mv.addObject("beChangeAdmin", beChangeAdmin);
                }
                mv.setViewName("admin-edit");
            } else {
                mv.setViewName("roleError");
            }
        }
        return mv;
    }

}
