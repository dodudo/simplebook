package com.wzd.simplebook.utils;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class EmailUtil {
    //实例化一个StringBuiler对象，用于存储验证码
    private StringBuilder checkCode = new StringBuilder(4);
    public void sendEmail(String emailUrl,String username) throws EmailException {
        //清空StringBuilder
        checkCode.setLength(0);
        //创建一个HtmlEmail对象
        HtmlEmail email = new HtmlEmail();
        //设置邮箱smtp服务器地址
        email.setHostName("smtp.163.com");
        //设置发送的字符集类型
        email.setCharset("utf-8");

        //设置收件人
        email.addTo(emailUrl);
        //设置发送人邮箱和用户名
        email.setFrom("18384354901@163.com","【simplebook】");
        //设置邮箱地址和授权码
        email.setAuthentication("18384354901@163.com","201304wy");
        //设置发送主题
        email.setSubject("【simplebook】尊敬的”" + username + "“，您好！");

        for (int i = 0 ; i<4 ;i++){
            checkCode.append(new Random().nextInt(10));
        }
        System.out.println("邮箱地址"+emailUrl+"用户名"+username);
        System.out.println(checkCode);
        email.setContent("<h3>尊敬的“"+username+"”您的验证码为</h3><h1><u>"+checkCode+"</u></h1>","text/html");
        email.send();
    }
    public boolean checkCodeEquals(String checkCode){
        if (this.checkCode.toString().equals(checkCode)){
            this.checkCode.setLength(0);
            return true;
        }else {
            return false;
        }
    }
}
