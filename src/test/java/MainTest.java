import com.diyiliu.support.util.CommonUtil;
import org.junit.Test;

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
}
