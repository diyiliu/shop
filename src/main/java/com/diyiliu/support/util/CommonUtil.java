package com.diyiliu.support.util;

import java.util.Date;
import java.util.UUID;

/**
 * Description: CommonUtil
 * Author: DIYILIU
 * Update: 2016-09-27 11:20
 */

public class CommonUtil {


    public static String generateDateSerial(){

        String time = String.format("%1$tY%1$tm%1$td", new Date());

        String uuid = UUID.randomUUID().toString().substring(0, 8);


        return uuid + time;
    }

    public static String generateSerial(){

        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
