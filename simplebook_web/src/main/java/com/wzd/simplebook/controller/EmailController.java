package com.wzd.simplebook.controller;

import com.wzd.simplebook.utils.EmailUtil;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
public class EmailController {
    @Autowired
    EmailUtil emailUtil;

    @RequestMapping("/sendEmailCode")
    public @ResponseBody Map<String,String> sendEmailCode(String emailUrl,String username) throws EmailException {
        Map<String,String> map = new HashMap<>();
        emailUtil.sendEmail(emailUrl,username);
        return map;
    }
    @RequestMapping("/checkEmailCode")
    public @ResponseBody Map<String, Object> checkEmailCode(String emailCode) throws EmailException {
        Map<String,Object> map = new HashMap<>();
        if (emailUtil.checkCodeEquals(emailCode)){
            map.put("errMsg",true);
        }else {
            map.put("errMsg",false);
        }
        return map;
    }

}
