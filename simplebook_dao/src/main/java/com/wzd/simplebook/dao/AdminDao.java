package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Admin;
import org.apache.ibatis.annotations.Insert;
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
    @Select("select * from admin where aname = #{aname} and apassword = #{apassword} and state = 1")
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
    @Update({
            "<script>"
                    + "update admin set state = #{state} where adminid in "
                    + "<foreach item='item' index = 'index' collection = 'adminid' open ='(' separator = ',' close=')'>"
                    + "#{item}"
                    + "</foreach>"
                    + "</script>"
    })
    int changeState(@Param("adminid") String[] aid, @Param("state") int state) throws Exception;

    /**
     * 根据id查找admin
     *
     * @param aid
     * @return
     */
    @Select("select * from admin where adminid = #{adminid}")
    Admin findById(@Param("adminid") String aid) throws Exception;

    /**
     * 查找昵称是否存在
     *
     * @param aname
     * @return
     */
    @Select("select * from admin where aname = #{aname}")
    Admin findByName(@Param("aname") String aname) throws Exception;

    /**
     * 根据id修改信息
     *
     * @param admin
     * @return
     */
    @Update("update admin set aname = #{aname},phone = #{phone},email = #{email},role = #{role} where adminid = #{adminId}")
    int updateById(Admin admin) throws Exception;

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    @Insert("insert into admin(adminid,aname,apassword,email,phone,role,state) values(#{adminId},#{aname},#{apassword},#{email},#{phone},#{role},1)")
    int add(Admin admin) throws Exception;

    /**
     * 根据关键字查找admin
     *
     * @param key
     * @return
     * @throws Exception
     */
    @Select("select * from admin where state != 0 and aname like #{key}")
    List<Admin> findByKey(@Param("key") String key) throws Exception;

    /**
     * 查询所有被删除的管理员
     *
     * @return
     */
    @Select("select * from admin where state = 0")
    List<Admin> findAllDel() throws Exception;

    /**
     * 根据关键字查询所有被删除的管理员
     *
     * @return
     */
    @Select("select * from admin where state = 0 and aname like #{key}")
    List<Admin> findDelByKey(String key);
}
