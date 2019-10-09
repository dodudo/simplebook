package com.wzd.simplebook.controller;

import com.github.pagehelper.PageInfo;
import com.sun.deploy.net.HttpResponse;
import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.service.AdminService;
import com.wzd.simplebook.utils.UUIDUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    UUIDUtils uuidUtils;
    /**
     * 管理员登录
     * @param
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView adminLogin(HttpServletRequest request, String aname, String apassword) throws Exception {
        ModelAndView mv = new ModelAndView();
        Admin admin1 = adminService.findByNamePwd(aname,apassword);
        System.out.println(admin1);
        if (admin1!=null){
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin1);
            mv.setViewName("redirect:/admin");
        }else {
            mv.addObject("admin-login-err","账号密码错误");
            mv.setViewName("adminlogin");
        }
        return mv;
    }

    /**
     * 查询所有管理员
     * @param
     * @param pageNum
     * @return
     */
    @RequestMapping("/findAll")
    public @ResponseBody
    Map<String, Object> findAllAdmin(int pageNum) throws Exception {
        Map<String,Object> map = new HashMap<>();
        PageInfo<Admin> adminsPageInfo = adminService.findAllAdmin(pageNum);
        map.put("adminsPageInfo",adminsPageInfo);
        return map;
    }

    /**
     * 更改管理员状态
     * @param request
     * @param aid
     * @return
     * @throws Exception
     */
    @RequestMapping("/changeState")
    public @ResponseBody
    Map<String, Object> changeState(HttpServletRequest request, @RequestParam("aid") String[] aid, int state) throws Exception {
        Map<String, Object> map = new HashMap<>();
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        System.out.println(admin);
        System.out.println("aid:::::::::"+aid);
        if (admin.getRole()!=1){
            map.put("role_msg", false);
        }else {
            String id = null;
            boolean flag = true;
            for (String a : aid) {
                if (a.equals(admin.getAdminId())) {
                    flag = false;
                }
            }
            if (aid.length > 0 && aid != null && flag) {
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
            } else {
                map.put("msg", false);
            }
            map.put("role_msg", true);
        }

        return map;
    }

    /**
     * 验证昵称是否存在
     *
     * @param aname
     * @return
     * @throws Exception
     */
    @RequestMapping("/checkAname")
    public @ResponseBody
    Map<String, Object> checkUser(String aname) throws Exception {
        Map<String, Object> map = new HashMap<>();
        if (adminService.findByName(aname)) {
            map.put("hadAname", true);
        } else {
            map.put("hadAname", false);
        }
        return map;
    }

    /**
     * 修改信息
     *
     * @param admin
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateById")
    public @ResponseBody
    Map<String, Object> updateById(Admin admin) throws Exception {
        Map<String, Object> map = new HashMap<>();
        // System.out.println("admin:::::::::"+admin);
        if (adminService.updateById(admin)) {
            map.put("msg", true);
        } else {
            map.put("msg", false);
        }
        return map;
    }

    /**
     * 添加admin
     *
     * @param admin
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    public @ResponseBody
    Map<String, Object> add(Admin admin) throws Exception {
        Map<String, Object> map = new HashMap<>();
        admin.setAdminId(uuidUtils.getUUID());
        System.out.println("admin:::::::::" + admin);
        if (adminService.add(admin)) {
            map.put("msg", true);
        } else {
            map.put("msg", false);
        }
        return map;
    }

    /**
     * 根据关键字查询管理员
     *
     * @param
     * @param pageNum
     * @return
     */
    @RequestMapping("/findByKey")
    public @ResponseBody
    Map<String, Object> findByKey(int pageNum, String key) throws Exception {
        Map<String, Object> map = new HashMap<>();
        PageInfo<Admin> adminsPageInfo = adminService.findByKey(pageNum, key);
        map.put("adminsPageInfo", adminsPageInfo);
        return map;
    }

}
