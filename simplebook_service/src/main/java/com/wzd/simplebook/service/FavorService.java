package com.wzd.simplebook.service;

import com.wzd.simplebook.dao.FavorDao;
import com.wzd.simplebook.domain.Favor;
import org.springframework.beans.factory.annotation.Autowired;

public interface FavorService {

    /**
     * 收藏文章
     *
     * @param favor
     * @throws Exception
     */
    void addFavor(Favor favor) throws Exception;

}
