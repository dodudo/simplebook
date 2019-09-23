package com.wzd.simplebook.controller;

import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    /**
     * 管理员登录
     * @param
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView adminLogin(String aname,String apassword) throws Exception {
        ModelAndView mv = new ModelAndView();
        Admin admin1 = adminService.findByNamePwd(aname,apassword);
        System.out.println(admin1);
        if (admin1!=null){
            mv.addObject("admin",admin1);
            mv.setViewName("admin");
        }else {
            mv.addObject("admin-login-err","账号密码错误");
            mv.setViewName("adminlogin");
        }
        return mv;
    }
}
