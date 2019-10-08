package com.wzd.simplebook.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.AdminDao;
import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    public Admin findByNamePwd(String aname, String apassword) throws Exception {
        return adminDao.findByNamePassword(aname,apassword);
    }

    /**
     * 查找所有管理员
     *
     * @param pageNum
     * @return
     */
    @Override
    @Cacheable(value = "adminsCache")
    public PageInfo<Admin> findAllAdmin(int pageNum) throws Exception {
        PageHelper.startPage(pageNum,10);
        List<Admin> admins = adminDao.findAllAdmin();
        PageInfo pageInfo = new PageInfo(admins);
        return pageInfo;
    }

    /**
     * 修改管理员状态
     *
     * @param aid
     * @param state
     * @return
     */
    @Override
    @CacheEvict(value = {"adminsCache"},allEntries = true)
    public boolean changeState(String aid, int state) {
        if(adminDao.changeState(aid,state)>0){
            return true;
        }else {
            return false;
        }
    }

}
