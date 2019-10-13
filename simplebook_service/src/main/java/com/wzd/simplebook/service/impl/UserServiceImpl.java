package com.wzd.simplebook.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.dao.UserDao;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    @Cacheable("usersCache")
    public PageInfo<User> findUsers(int pageNum,int state,String key) throws Exception {
        PageHelper.startPage(pageNum,10);
        try {
            if (!"".equals(key)&&key != null){
                key = "%"+key+"%";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<User> users = userDao.findUsers(state,key);
        PageInfo pageInfo = new PageInfo(users);
        return pageInfo;
    }

    @Override
    @CacheEvict(value = {"userCache","usersCache"},allEntries = true)
    public boolean addUser(User user) throws Exception {
        int row = userDao.addUser(user);
        System.out.println(user.getUid());
        //判断是否添加成功
        if (row>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean findUserByName(String uname) throws Exception {
        String name = userDao.findUserByName(uname);
        if (name==null||name.length()==0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean findUserByEmail(String email) throws Exception {
        String uemail = userDao.findUserByEmail(email);
        if(uemail==null||uemail.length()==0){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public User findUserByNamePwd(String uname, String upassword) throws Exception {
        User user = new User();
        //根据字符串中是否含有@判断是否为邮箱登录
        if (uname.indexOf("@")==-1){ //不是邮箱登录，为用户名登录
            user = userDao.findUserByNamePwd(uname,upassword);
        }else {  //是，则为邮箱登录
            user = userDao.findUserByEmailPwd(uname,upassword);
        }
        return user;
    }

    @Override
    @Cacheable(value = "userCache")
    public User findUserByUid(String uid) throws Exception {
//        System.out.println("哈哈哈");
        return userDao.findUserByUid(uid);
    }

    @Override
    @CacheEvict(value = {"userCache","usersCache"},allEntries = true)
    public boolean changeUserHeadImg(String uid, String virtualPath) throws Exception {
        if (userDao.chanteUserHeadImg(uid,virtualPath)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    @CacheEvict(value = {"userCache","usersCache"},allEntries = true)
    public boolean changeUserInfo(User user) throws Exception {
        if (userDao.changeUserInfo(user)>0){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 修改用户密码
     *
     * @param user
     * @return
     */
    @Override
    @CacheEvict(value = {"userCache","usersCache"},allEntries = true)
    public boolean changePwd(User user) throws Exception {
        if (userDao.changePwd(user) > 0) {
            return true;
        } else {
            return false;
        }
    }
}
