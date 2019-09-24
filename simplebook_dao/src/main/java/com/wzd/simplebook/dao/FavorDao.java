package com.wzd.simplebook.dao;

import com.wzd.simplebook.domain.Article;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavorDao {
    /**
     * 查询用户的收藏数量
     * @param uid
     * @return
     */
    @Select("select count(*) where uid = #{uid}")
    int findTotalFavorByUid(String uid);

    /**
     * 根据用户id查询所收藏文章id
     * @param uid
     * @return
     */
    @Select("select articleid from favor where uid = #{uid}")
    List<Integer> findFavorArticleId(String uid);
}
