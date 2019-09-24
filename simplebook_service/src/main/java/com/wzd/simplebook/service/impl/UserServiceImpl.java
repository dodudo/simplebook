package com.wzd.simplebook.service.impl;

import com.wzd.simplebook.dao.UserDao;
import com.wzd.simplebook.domain.User;
import com.wzd.simplebook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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
    public List<User> findAll() throws Exception {
        return userDao.findAll();
    }

    @Override
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
    @Cacheable(value = "userCache",key = "#uid")
    public User findUserByUid(String uid) throws Exception {
        System.out.println("哈哈哈");
        return userDao.findUserByUid(uid);
    }
}
