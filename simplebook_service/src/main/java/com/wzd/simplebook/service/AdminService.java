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
    boolean changeState(String aid,int state);
}
