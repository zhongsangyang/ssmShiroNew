package xiangmuJunitTest;

import com.ht.zsy.entity.TShop;
import com.ht.zsy.service.Impl.TshopService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:config/spring-beans.xml"
        ,"classpath:config/spring-shiro-web.xml","classpath:config/spring-mvc.xml","classpath:config/spring-mybatis.xml"

})
public class ShopTest {
    @Autowired
    private TshopService tshopService;
    @Test
    public  void testSHopLIst(){
        //#{pageNum} * (#{pageIndex }- 1) + 1 and
        //    #{pageNum}*#{pageIndex}
       List<TShop> tShopList=tshopService.selectShopList(10*(1-1),1*10);
        System.out.println(tShopList);
    }
    @Test
    public  void testgowuche(){
        //#{pageNum} * (#{pageIndex }- 1) + 1 and
        //    #{pageNum}*#{pageIndex}
//        List<TShop> selectgouwuchebyuserid=tshopService.selectgouwuchebyuserid(2,10*(1-1),1*10);
//        System.out.println(tshopService.seleccountGouwut(2));
//        System.out.println(selectgouwuchebyuserid);
    }
}
