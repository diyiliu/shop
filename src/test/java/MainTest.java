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
                // 可以进行类型转换
//                gen.writeString(value.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
            }
        });
        mapper.registerModule(module);

        System.out.println(mapper.writeValueAsString(goods));
    }


    @Test
    public void testReturn(){

       int  a = 10;

        b(a);
    }

    private int a(){

        System.out.println(1);

        return 1;
    }

    private int b(int b){

        if (b == 10){
           return a();
        }

        System.out.println(12);

        return 1;
    }


    @Test
    public void testSql(){

        String sql = "SELECT ID AS 测试ID, FUNCTION_ID AS 测试菜单, PERSON_ID AS 测试自然人ID  FROM NAT_SUBSIDY_INFO";

        int start = sql.indexOf("SELECT");
        int end  = sql.indexOf("FROM");

        sql = sql.substring(start + 6, end);

        String[] items = sql.split(",");

        for (String item: items){
            String[] col = item.split("AS");

            System.out.println(col[0]);
            if (col.length > 1){
                System.out.println(col[1]);
            }
        }
    }

}
