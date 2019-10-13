package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Article;
import com.wzd.simplebook.domain.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Repository;

import java.nio.charset.CoderMalfunctionError;
import java.util.List;

@Repository
public interface UserDao {
    /**
     * 查询所有用户
     * @return
     */
    @Select("select * from user")
    List<User> findAll() throws Exception;

    /**
     * 添加用户
     * @param user
     * @return
     */
    @Insert("insert into user(uid,uname,upassword,email,userstate) values(#{uid},#{uname},#{upassword},#{email},1)")
    Integer addUser(User user) throws Exception;

    /**
     * 根据用户名查找用户
     * @param uname
     *
     */
    @Select("select uname from user where uname = #{uname}")
    String findUserByName(String uname) throws Exception;

    /**
     * 根据邮箱查找用户
     * @param email
     * @return
     */
    @Select("select email from user where email = #{email}")
    String findUserByEmail(String email) throws Exception;

    /**
     * 根据邮箱和密码登录
     * @param email
     * @param upassword
     * @return
     */
    @Select("select * from user where email = #{email} and upassword = #{upassword}")
    User findUserByEmailPwd(@Param("email") String email,@Param("upassword") String upassword) throws Exception;

    /**
     * 根据用户名和密码查用户
     * @param uname
     * @param upassword
     * @return
     */
    @Select("select * from user where uname = #{uname} and upassword = #{upassword}")
    User findUserByNamePwd(@Param("uname") String uname,@Param("upassword") String upassword) throws Exception;

    /**
     * 根据用户id查询所有用户信息
     * @param uid
     * @return
     */
    @Select("select * from user where uid = #{uid}")
    @Results(id = "userMap",value = {
            @Result(column = "uid",property = "uid"),
            @Result(column = "uname",property = "uname"),
            @Result(column = "upassword",property = "upassword"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "about",property = "about"),
            @Result(column = "headimgs",property = "headImgs"),
            @Result(column = "userstate",property = "userState"),
    })
    User findUserByUid(@Param("uid") String uid) throws Exception;

    /**
     * 根据用户名修改用户头像
     * @param uid
     * @param virtualPath
     * @return
     */
    @Update("update user set headimgs = #{virtualPath} where uid = #{uid}")
    int chanteUserHeadImg(@Param("uid") String uid,@Param("virtualPath")String virtualPath)throws Exception;

    /**
     * 修改用户信息
     * @param user
     * @return
     * @throws Exception
     */
    @Update("update user set uname = #{uname},phone = #{phone},sex = #{sex},about = #{about} where uid = #{uid}")
    int changeUserInfo(User user)throws Exception;

    /**
     * 修改用户密码
     *
     * @param user
     * @return
     */
    @Update("update user set upassword = #{upassword} where email = #{email}")
    int changePwd(User user) throws Exception;

    /**
     * 根据状态关键字查询用户
     * @param state
     * @param key
     * @return
     */
    @Select("<script> SELECT * FROM USER " +
            "<where>" +
            "<if test='state == 1'>and userstate != 0</if>" +
            "<if test='state == 0'>and userstate = 0</if>" +
            "<if test='key != null'>and uname like #{key}</if>" +
            "</where>" +
            "</script>")
    List<User> findUsers(@Param("state") int state, @Param("key") String key)throws Exception;
}
