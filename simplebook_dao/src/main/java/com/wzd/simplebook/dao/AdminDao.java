package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {
    /**
     * 根据管理员用户名和密码查询账号密码是否正确
     * @return
     */
    @Select("select * from admin where aname = #{aname} and apassword = #{apassword}")
    Admin findByNamePassword(@Param("aname") String aname, @Param("apassword") String apassword) throws Exception;

}
