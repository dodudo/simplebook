package com.wzd.simplebook.service.impl;

import com.wzd.simplebook.dao.FollowDao;
import com.wzd.simplebook.domain.Follow;
import com.wzd.simplebook.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FollowServiceImpl implements FollowService {
    @Autowired
    FollowDao followDao;

    @Override
    public void addFollow(Follow follow) throws Exception {
        followDao.addFollow(follow);
    }
}
