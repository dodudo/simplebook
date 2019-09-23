package com.wzd.simplebook.service;

import com.wzd.simplebook.domain.Admin;

public interface AdminService {
    /**
     * 根据管理员账号密码查询账号是否存在
     * @param aname
     * @param apassword
     * @return
     */
    Admin findByNamePwd(String aname, String apassword) throws Exception;
}
