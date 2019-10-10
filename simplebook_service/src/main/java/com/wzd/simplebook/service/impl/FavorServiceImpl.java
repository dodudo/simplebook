package com.wzd.simplebook.service.impl;

import com.wzd.simplebook.dao.FavorDao;
import com.wzd.simplebook.domain.Favor;
import com.wzd.simplebook.service.FavorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FavorServiceImpl implements FavorService {
    @Autowired
    FavorDao favorDao;

    @Override
    public void addFavor(Favor favor) throws Exception {
        favorDao.addFavor(favor);

    }
}
