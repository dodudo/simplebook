package com.wzd.simplebook.service.impl;

import com.wzd.simplebook.dao.AdminDao;
import com.wzd.simplebook.domain.Admin;
import com.wzd.simplebook.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    public Admin findByNamePwd(String aname, String apassword) throws Exception {
        return adminDao.findByNamePassword(aname,apassword);
    }
}
