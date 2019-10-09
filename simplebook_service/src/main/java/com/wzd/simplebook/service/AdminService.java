package com.wzd.simplebook.service;

import com.github.pagehelper.PageInfo;
import com.wzd.simplebook.domain.Admin;

public interface AdminService {
    /**
     * 根据管理员账号密码查询账号是否存在
     * @param aname
     * @param apassword
     * @return
     */
    Admin findByNamePwd(String aname, String apassword) throws Exception;

    /**
     * 查找所有管理员
     * @param pageNum
     * @return
     */
    PageInfo<Admin> findAllAdmin(int pageNum) throws Exception;

    /**
     * 修改管理员状态
     * @param aid
     * @return
     */
    boolean changeState(String aid, int state) throws Exception;

    /**
     * 根据管理员id查询该管理员
     *
     * @param aid
     * @return
     */
    Admin findById(String aid) throws Exception;

    /**
     * 判断昵称是否存在
     *
     * @param aname
     * @return
     */
    boolean findByName(String aname) throws Exception;

    /**
     * 修改管理员信息
     *
     * @param admin
     * @return
     */
    boolean updateById(Admin admin) throws Exception;

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    boolean add(Admin admin) throws Exception;

    /**
     * 根据关键字查询管理员
     *
     * @param pageNum
     * @param key
     * @return
     */
    PageInfo<Admin> findByKey(int pageNum, String key) throws Exception;
}
