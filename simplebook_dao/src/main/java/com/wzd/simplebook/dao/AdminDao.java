package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import javax.swing.text.EditorKit;
import java.util.List;

@Repository
public interface AdminDao {
    /**
     * 根据管理员用户名和密码查询账号密码是否正确
     * @return
     */
    @Select("select * from admin where aname = #{aname} and apassword = #{apassword}")
    Admin findByNamePassword(@Param("aname") String aname, @Param("apassword") String apassword) throws Exception;

    /**
     * 查询所有管理员
     * @return
     * @throws Exception
     */
    @Select("select * from admin where state != 0")
    List<Admin> findAllAdmin() throws Exception;

    /**
     * 更改用户状态
     * @param aid
     * @param state
     * @return
     */
    @Update("update admin set state = #{state} where adminid in (#{adminid})")
    int changeState(@Param("adminid") String aid, @Param("state") int state);
}
