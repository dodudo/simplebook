package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Follow;
import org.apache.ibatis.annotations.Insert;

public interface FollowDao {

    @Insert("insert into follow(followid,uid,articleid) value (#{followId},#{uid},#{articleId})")
    void addFollow(Follow follow) throws Exception;
}
