package com.wzd.simplebook.controller;

import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    /**
     * 跳转到用户列表页
     *
     * @return
     */
    @RequestMapping("/memberList")
    public String showMemberList(){
        return "member-list";
    }

    /**
     * 跳转到用户列表页
     * @return
     */
    @RequestMapping("/memberList1")
    public String showMemberList1(){
        return "member-list1";
    }

    /**
     * 跳转到用户删除页
     * @return
     */
    @RequestMapping("/memberDel")
    public String showMemberDel(){
        return "member-del";
    }
    @RequestMapping("/statistics")
    public String showStatistics(){
        return "statistics";
    }

    /**
     * 跳转到文章列表页
     * @return
     */
    @RequestMapping("/essayList")
    public String showEssayList(){
        return "essay-list";
    }

    /**
     * 跳转到文章列表页
     * @return
     */
    @RequestMapping("/essayList1")
    public String showEssayList1(){
        return "essay-list1";
    }

    /**
     *
     * @return
     */
    @RequestMapping("/cate")
    public String showCate(){
        return "cate";
    }

    /**
     * 跳转到管理员列表页
     * @return
     */
    @RequestMapping("/adminList")
    public String showAdminList(){
        return "admin-list";
    }

    /**
     * 跳转到管理员删除页
     *
     * @return
     */
    @RequestMapping("/adminDelList")
    public String showAdminRole() {
        return "admin-del-list";
    }

    /**
     * 跳转到错误页
     * @return
     */
    @RequestMapping("/error")
    public String showError(){
        return "error";
    }


    @RequestMapping("/editor-sccuss")
    public String showEditorsccuss() {
        return "editor-sccuss";
    }

    /**
     * 跳转到编辑页
     * @return
     */
    @RequestMapping("/editor")
    public String showEditor() {
        return "editor";
    }

    /**
     * 跳转到管理员登录
     * @param session
     * @return
     */
    @RequestMapping("/adminlogin")
    public String showLogin(HttpSession session) {
        session.invalidate();
        return "adminlogin";
    }

    /**
     * 跳转到用户页
     * @return
     */
    @RequestMapping("/user")
    public String showUser(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        //判断用户是否登录
        if (user != null) {
            return "User";
        } else {
            return "signin";
        }

    }

    /**
     * 跳转到登陆页
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public String showSingnIn(HttpSession session) {
        session.invalidate();
        return "signin";
    }

    /**
     * 跳转到注册页
     * @return
     */
    @RequestMapping("/register")
    public String showSingnUp(){
        return "signup";
    }

    /**
     * 跳转到中间页
     * @return
     */
    @RequestMapping("/target")
    public String target(){
        return "target";
    }

    /**
     * 跳转到前台主页面
     * @return
     */
    @RequestMapping("/index")
    public String showIndex(){
        return "index";
    }

    /**
     * 跳转到管理员主页
     * @return
     */
    @RequestMapping("/admin")
    public String showGms(){
        return "admin";
    }

    /**
     * 跳转到文章删除页
     * @return
     */
    @RequestMapping("/article-delete")
    public String showarticledelete(){
        return "article-delete";
    }

    /**
     * 跳转到管理员添加窗口
     * @param request
     * @return
     */
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

    /**
     * 跳转管理员信息编辑窗口
     * @param request
     * @param aid
     * @return
     * @throws Exception
     */
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

    @RequestMapping("/changePwd")
    public String changePwd() {
        return "backuppwd";
    }
}
