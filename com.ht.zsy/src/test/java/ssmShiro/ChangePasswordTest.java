package ssmShiro;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ht.zsy.po.User;
import com.ht.zsy.service.Impl.UserService;

import net.sf.json.JSONArray;
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:config/spring-beans.xml"
	,"classpath:config/spring-shiro-web.xml","classpath:config/spring-mvc.xml"	
		
})
public class ChangePasswordTest {
	@Autowired
	private UserService userService;
	private Logger log=LoggerFactory.getLogger(ChangePasswordTest.class);
	@Test
	public void changeMimaTest(){
		Long userId=2l;
		String newPassword="1234";
		userService.changePassword(userId, newPassword);
//		User user=new User();
//		user.setId(2l);
//		user.setLocked(false);
//		user.setPassword("1234");
//		user.setSalt("zhong");
//		user.setUsername("zhong");
//
//		userService.createUser(user);
	}
	@Test
	public void RoleSetByUsername(){
		Set<String> set=userService.findRoles("zhong");
		Iterator<String> it = set.iterator();  
		while (it.hasNext()) {  
		  String str = it.next();  
		  System.out.println(str);  
		}  
		
	}
	@Test
	public void UserIdByUsername(){
		int i=userService.findUserId("zhong");
		log.info("我是测试信息》》》》》》》》》》返回的用户Id为"+i);
		System.out.println("我是测试信息》》》》》》》》》》返回的用户Id为"+i);
	}
	@Test
	public void RoleIdByUsername(){
		List<Map<String, Object>> maplist=userService.findRoleId("zhong");
		HashMap<String, Object> mapel=(HashMap<String, Object>)maplist.get(1);
		System.out.println(mapel);
		System.out.println(JSONArray.fromObject(maplist));

		System.out.println(JSONArray.fromObject(maplist).toString());
		
	}

	@Test
	public void PermissionByUsername(){
		List<Map<String, Object>> list=userService.findPerssionId("zhong");
		System.out.println("我是测试信息》》》》》》》》》》返回的权限Id为"+list);
	}
}
