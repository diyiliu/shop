package com.diyiliu.support.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Description: CommonUtil
 * Author: DIYILIU
 * Update: 2016-09-27 11:20
 */

public class CommonUtil {


    public static String generateDateSerial() {

        String time = String.format("%1$tY%1$tm%1$td", new Date());

        String uuid = UUID.randomUUID().toString().substring(0, 8);


        return uuid + time;
    }

    public static String generateSerial() {

        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    public static String generateSerial(int length) {
        String str = generateSerial();

        return str.substring(0, str.length() > length ? length : str.length());
    }


    public static String toJson(Object obj) throws JsonProcessingException {
        ObjectMapper objMapper = new ObjectMapper();
        objMapper.setDateFormat(new SimpleDateFormat("yyyy -MM-dd HH:mm:ss"));

        return objMapper.writeValueAsString(obj);
    }
}
