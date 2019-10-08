package com.wzd.simplebook.controller;

import com.github.pagehelper.PageInfo;
import com.sun.deploy.net.HttpResponse;
import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.service.AdminService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"admin"})
public class AdminController {

    @Autowired
    AdminService adminService;

    /**
     * 管理员登录
     * @param
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView adminLogin(ModelMap modelMap, String aname, String apassword) throws Exception {
        ModelAndView mv = new ModelAndView();
        Admin admin1 = adminService.findByNamePwd(aname,apassword);
        System.out.println(admin1);
        if (admin1!=null){
            modelMap.addAttribute("admin",admin1);
            mv.setViewName("redirect:/admin");
        }else {
            mv.addObject("admin-login-err","账号密码错误");
            mv.setViewName("adminlogin");
        }
        return mv;
    }

    /**
     * 查询所有管理员
     * @param modelMap
     * @param pageNum
     * @return
     */
    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAllAdmin(ModelMap modelMap,int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo<Admin> adminsPageInfo = adminService.findAllAdmin(pageNum);
        map.put("adminsPageInfo",adminsPageInfo);
        return map;
    }

    /**
     * 更改管理员状态
     * @param modelMap
     * @param aid
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeState")
    public @ResponseBody Map<String,Object> changeState(ModelMap modelMap, @Param("aid") String[] aid, int state) throws Exception {
        Map<String, Object> map = new HashMap<>();
        Admin admin = (Admin) modelMap.get("admin");
        System.out.println(admin);
        System.out.println("aid:::::::::"+aid);
        if (admin.getRole()!=1){
            map.put("role_msg", false);
        }else {
            String id = null;
            if (aid.length > 0 && aid != null) {
                if (aid.length == 1) {
                    id = aid[0];
                } else {
                    StringBuffer sb = new StringBuffer();
                    for (int i = 0; i < aid.length; i++) {
                        if (i == 0) {
                            sb.append(aid[i]);
                        } else {
                            sb.append("," + aid[i]);
                        }
                    }
                    id = sb.toString();
                }
                if (adminService.changeState(id, state)) {
                    map.put("msg", true);
                } else {
                    map.put("msg", false);
                }
            }
            map.put("role_msg", true);
        }

        return map;
    }

}
