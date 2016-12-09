package com.diyiliu.support.util;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;

import java.io.IOException;
import java.math.BigDecimal;
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

        //objMapper.setDateFormat(new SimpleDateFormat("yyyy -MM-dd HH:mm:ss"));

        SimpleModule module = new SimpleModule();

        // 保留两位小数
        module.addSerializer(BigDecimal.class, new JsonSerializer<BigDecimal>() {
            @Override
            public void serialize(BigDecimal value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
                gen.writeString(value.setScale(1, BigDecimal.ROUND_HALF_UP).toString());
            }
        });

        module.addSerializer(Date.class, new JsonSerializer<Date>() {
            @Override
            public void serialize(Date value, JsonGenerator gen, SerializerProvider serializers) throws IOException {

                gen.writeString(String.format("%1$tY-%1$tm-%1$td %1$tH:%1$tM:%1$tS", value));
            }
        });

        objMapper.registerModule(module);


        return objMapper.writeValueAsString(obj);
    }
}
