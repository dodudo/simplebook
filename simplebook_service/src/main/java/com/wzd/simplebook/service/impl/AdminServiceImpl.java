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
    public boolean changeState(String[] aid, int state) throws Exception {
        if(adminDao.changeState(aid,state)>0){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 根据管理员id查询该管理员
     *
     * @param aid
     * @return
     */
    @Override
    public Admin findById(String aid) throws Exception {
        Admin admin = adminDao.findById(aid);
        if (admin != null) {
            return admin;
        } else {
            return null;
        }
    }

    /**
     * 判断昵称是否存在
     *
     * @param aname
     * @return
     */
    @Override
    public boolean findByName(String aname) throws Exception {
        if (adminDao.findByName(aname) != null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 修改管理员信息
     *
     * @param admin
     * @return
     */
    @Override
    @CacheEvict(value = {"adminsCache"}, allEntries = true)
    public boolean updateById(Admin admin) throws Exception {
        if (adminDao.updateById(admin) > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    @Override
    @CacheEvict(value = {"adminsCache"}, allEntries = true)
    public boolean add(Admin admin) throws Exception {
        if (adminDao.add(admin) > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据关键字查询管理员
     *
     * @param pageNum
     * @param key
     * @return
     */
    @Override
    public PageInfo<Admin> findByKey(int pageNum, String key) throws Exception {
        PageHelper.startPage(pageNum, 10);
        key = "%" + key + "%";
        List<Admin> admins = adminDao.findByKey(key);
        PageInfo pageInfo = new PageInfo(admins);
        return pageInfo;
    }

    /**
     * 查询所有被删除的管理员
     *
     * @param pageNum
     * @return
     */
    @Override
    public PageInfo<Admin> findAllDel(int pageNum) throws Exception {
        PageHelper.startPage(pageNum, 10);
        List<Admin> admins = adminDao.findAllDel();
        PageInfo pageInfo = new PageInfo(admins);
        return pageInfo;
    }

    /**
     * 根据关键字查找被删除的管理员
     *
     * @param pageNum
     * @param key
     * @return
     */
    @Override
    public PageInfo<Admin> findDelByKey(int pageNum, String key) {
        PageHelper.startPage(pageNum, 10);
        key = "%" + key + "%";
        List<Admin> admins = adminDao.findDelByKey(key);
        PageInfo pageInfo = new PageInfo(admins);
        return pageInfo;
    }

}
