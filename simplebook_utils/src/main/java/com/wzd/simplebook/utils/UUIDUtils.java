package com.wzd.simplebook.utils;

import org.springframework.stereotype.Component;

import java.util.Random;
import java.util.UUID;

@Component
public class UUIDUtils {

    public String getUUID() {
        String articleId = UUID.randomUUID().toString().replace("-", "");
        return articleId;
    }


}
