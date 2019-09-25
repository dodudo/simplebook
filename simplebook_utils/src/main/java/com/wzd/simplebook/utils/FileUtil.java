package com.wzd.simplebook.utils;

import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

@Component
public class FileUtil {
    /**
     * 将传入的base64文件写入
     * @param file
     * @param path
     * @return
     */
    public String writeFile(String file,String path){
        Base64.Decoder decoder = Base64.getDecoder();
        //去掉base64编码的头部，否则转换的图片不能显示
        file = file.substring(23);
        //解码
        byte[] imgByte = decoder.decode(file);
        //在tomcat目录下创建userImg保存用户头像
        //获取项目真实路径

        File dir = new File(path);
        if (!dir.exists()){ //判断路径是否存在
            dir.mkdir();
        }
        //生成图片文件名
        String fileName = getFileName();
        //因为windows和linux路径不同，生成路径
        path = path + System.getProperty("file.separator")+fileName;
        // System.out.println("最终生成路径::::::::::::"+path);
        try {
            //将文件写入
            FileOutputStream out = new FileOutputStream(path);
            out.write(imgByte);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }
    /**
     * 根据日期和uuid生成图片名
     * @return
     */
    private String getFileName() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timeStr = sdf.format(new Date());
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        String fileName = timeStr+uuid+".jpg";
        return fileName;
    }
}
