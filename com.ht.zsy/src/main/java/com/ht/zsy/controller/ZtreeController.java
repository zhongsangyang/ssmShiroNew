package com.ht.zsy.controller;

import com.ht.zsy.po.TreeVo;
import com.ht.zsy.po.UserInfo;
import com.ht.zsy.service.Impl.UserService;
import net.sf.json.JSONArray;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ztree")
public class ZtreeController {
	@Resource
	private UserService userService;
	@RequestMapping("/test")
	public String toZTreeJsp(){
		
		return "zTree";
	}
	@ResponseBody
	@RequestMapping(value="/jsonZtree",method=RequestMethod.POST)
	public List<TreeVo> toZTreeJsonJsp(HttpServletRequest request){
		List<TreeVo> list=new ArrayList<TreeVo>();
		String username=(String)SecurityUtils.getSubject().getPrincipal();
		System.out.println(username+"我已经运行了");
		
		//new TreeVo(user.getUserId(),"0","角色名称","是否展开");
		//new TreeVo(role.getRoleId(),user.getUserId(),"权限名称","是否展开");
		//1<=10万      用户Id
		//10万以上《=20万   角色Id
		//20万以上《=40万 权限Id
		list.add(new TreeVo("1", "0",username, "true"));
		List<Map<String,Object>> maplist=userService.findRoleId(username);
		String iString="1";
		for(Map<String,Object> map :maplist){
			list.add(new TreeVo(map.get("role_id")+"",iString,map.get("role")+"","true"));
		}
		return list;
	}
	@RequestMapping(value="/hello")
    @ResponseBody
    public Map<String,UserInfo> hello(HttpServletResponse response) throws IOException{
        UserInfo u1=new UserInfo();
        u1.setAge(15);
        u1.setUname("你好");
        
        UserInfo u2=new UserInfo();
        u2.setAge(152);
        u2.setUname("你好2");
        Map<String,UserInfo> map=new HashMap<String, UserInfo>();
        map.put("001", u1);
        map.put("002", u2);
        
        return map;
    }
	@RequestMapping(value="/childrenZtree",method=RequestMethod.POST)
	@ResponseBody
	public List ZtreeChildren(String pid){
		String username=(String)SecurityUtils.getSubject().getPrincipal();
		List<TreeVo> list=new ArrayList<>();
		List<Map<String,Object>> list2=userService.findPerssionId(pid);
		//System.out.println(list2);
		//System.out.println(list2.get(0).get("role_id")+""+list.size());
		String jsonStr=JSONArray.fromObject(list2).toString();
		System.out.println(list2);
		if(!(jsonStr.equals("[]"))){
				if((list2.get(0).get("role_id")+"").equals(pid)){
					System.out.println("我已经进来了");
					list.add(new TreeVo(list2.get(0).get("perssionId")+"",pid,list2.get(0).get("permission").toString(),"true"));
				}
		}
		return list;
	}
	
}
