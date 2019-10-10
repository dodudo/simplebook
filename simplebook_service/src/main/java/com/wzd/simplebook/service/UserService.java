package com.wzd.simplebook.service;

import com.wzd.simplebook.domain.User;
import org.springframework.cache.annotation.CachePut;

import java.util.List;

public interface UserService {
    /**
     * 查询所有用户
     * @return
     */
    List<User> findAll() throws Exception;

    /**
     * 添加用户
     * @param user //用户实体类对象
     * @return
     */
    boolean addUser(User user) throws Exception;

    /**
     * 根据用户名查找用户
     * @param uname
     * @return
     */
    boolean findUserByName(String uname) throws Exception;

    /**
     * 根据邮箱查找用户
     */
    boolean findUserByEmail(String email) throws Exception;

    /**
     * 根据用户名密码查找用户
     * @param uname
     * @param upassword
     * @return
     */
    User findUserByNamePwd(String uname, String upassword) throws Exception;

    /**
     * 根据用户id查找用户详细信息
     * @param uid
     * @return
     */
    User findUserByUid(String uid) throws Exception;

    /**
     * 修改用户头像
     * @param uid
     * @param virtualPath
     * @return
     * @throws Exception
     */
    boolean changeUserHeadImg(String uid, String virtualPath) throws Exception;

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    boolean changeUserInfo(User user) throws Exception;

    /**
     * 修改用户密码
     *
     * @param user
     * @return
     */
    boolean changePwd(User user) throws Exception;
}
