import com.diyiliu.console.entity.Goods;
import com.diyiliu.support.util.CommonUtil;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;
import org.junit.Test;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.UUID;

/**
 * Description: MainTest
 * Author: DIYILIU
 * Update: 2016-09-27 11:22
 */

public class MainTest {


    @Test
    public void testSerial() {

        System.out.println(CommonUtil.generateDateSerial());

        System.out.println(CommonUtil.generateSerial().length());

        System.out.println(UUID.randomUUID().toString().replaceAll("-", "").length());
    }

    @Test
    public void testStr() {

        String s = "E:\\Develop\\Workspces\\fragment\\shop\\out\\artifacts\\shop\\exploded\\shop-1.0-SNAPSHOT.war\\source\\upload\\20161208\\2.jpg";

        System.out.println(s.substring(s.lastIndexOf("source")));
    }

    @Test
    public void testDecimal() {

        BigDecimal decimal = new BigDecimal(99);

        decimal = decimal.setScale(2, BigDecimal.ROUND_HALF_UP);
        System.out.println(decimal.toString());

        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        System.out.println(decimalFormat.format(decimal.doubleValue()));

    }

    @Test
    public void testJackson() throws Exception {
        Goods goods = new Goods();
        goods.setPrice(new BigDecimal(99));

        ObjectMapper mapper = new ObjectMapper();

        SimpleModule module = new SimpleModule();
        module.addSerializer(BigDecimal.class, new JsonSerializer<BigDecimal>() {
            @Override
            public void serialize(BigDecimal value, JsonGenerator gen, SerializerProvider serializers) throws IOException{
                gen.writeNumber(value.setScale(2, BigDecimal.ROUND_HALF_UP));
            }
        });
        mapper.registerModule(module);

        System.out.println(mapper.writeValueAsString(goods));
    }

}
