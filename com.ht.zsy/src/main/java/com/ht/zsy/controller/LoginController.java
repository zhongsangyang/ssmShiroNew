package com.ht.zsy.controller;

import com.ht.zsy.entity.PageSearch;
import com.ht.zsy.entity.Shoporder;
import com.ht.zsy.entity.TShop;
import com.ht.zsy.exception.CustomException;
import com.ht.zsy.po.User;
import com.ht.zsy.service.Impl.ShoporderService;
import com.ht.zsy.service.Impl.TshopService;
import com.ht.zsy.service.Impl.UserService;
import com.ht.zsy.utils.AjaxResult;
import com.ht.zsy.utils.PageUtils;
import com.ht.zsy.utils.UploadImageUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final String STATESTR = "state";
	private static final String ERRORSTR = "error";
	private static final String SUCCESSSTR = "success";
	private static final String MESSAGESTR = "message";
	@Resource
	private UserService userService;
	@Autowired
	private TshopService tshopService;
	@Autowired
	private ShoporderService shoporderService;
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(String userName,String password, Model model){
	       CustomException customException=null;  
	       System.out.println(userName+">>>>>"+password);
	       
	       if((userName!=null && password!=null)){
	           UsernamePasswordToken token=new UsernamePasswordToken(userName,password);
	           Subject subject= SecurityUtils.getSubject();  
	           try{  
	               subject.login(token);  
	           }catch (AuthenticationException e){  
	               customException=new CustomException(e.getMessage());  
	               System.out.println(customException.getMessage());
	           }  
	           
	           if(subject.isAuthenticated()){  
	        	    
	               System.out.println("认证成功");
	               model.addAttribute("username",userName);
	               return "success";  
	           }else {  
	               model.addAttribute("exception",customException.getMessage());  
	               return "redirect:/unauthorized.jsp";
	           }  
	       }  
	       return "success";  
	   }  
	@RequestMapping("/success")
	public String teString(Model model){
		Session session=SecurityUtils.getSubject().getSession();
			model.addAttribute("user",session.getAttribute("user"));
		return "success";
	}
	@RequestMapping("/hasRole")
	public String testHasRole(){
		System.out.println("测试两个地方一个shiro-web拥有这个角色，一个注解地方能控制有这个角色");
		return "success";
		
	}
	@RequestMapping(value="/loginout",method=RequestMethod.GET)
	public String testLogout(){
		System.out.println("我已经进来了");
		SecurityUtils.getSubject().logout();
		return "login";
	}
	@RequestMapping(value="/register",method =RequestMethod.POST)
	public String toLogin(String userName,String password){
		User user=userService.findByUsername(userName);
		if(user==null){
			userService.createUser(new User(userName,password));
			return "redirect:/login/guodu";
		}else {

			return "redirect:/login/chongfujsp";
		}

	}
	@RequestMapping(value="/chongfujsp",method = RequestMethod.GET)
	public String toCHonfuJsp(){
		return "zhanghaochongfu";
	}
	@RequestMapping(value = "guodu",method=RequestMethod.GET)
	public String guoduYemian(){
		return "guodu";
	}

	@RequestMapping("/shopList")
	public String shopList(Model model, HttpServletRequest request, @RequestParam(value = "index", required = false, defaultValue = "1") Integer pageIndex,
						   @RequestParam(value = "pageNum", required = false, defaultValue = "10") Integer pageNum){
		Integer afterpageIndex=(pageIndex-1)*pageNum;
		pageNum=pageIndex*pageNum;

		List<TShop> tShopList=tshopService.selectShopList(afterpageIndex,pageNum);
		Integer pageCount = 0;
		if (tShopList != null && !tShopList.isEmpty()) {
			pageCount = tShopList.get(0).getAllcount();
		}
		String param = request.getQueryString();
		String requestStr = request.getRequestURI();
		PageSearch pageSearch = PageUtils.shzwo(String.valueOf(pageIndex), pageCount, pageNum, requestStr, true, param);
		model.addAttribute("page", pageSearch);
		model.addAttribute("shopList", tShopList);

		return "shopList";
	}
	@RequestMapping(value="/addShop",method = RequestMethod.GET)
	public String returnShopcode(){

		return "addShop";
	}
	@RequestMapping(value="/addShopComplete",method = RequestMethod.POST)
	public String  returnShopcode2(MultipartFile file,TShop tShop,HttpServletRequest request){

		if(file!=null){
			tShop.setShopimageurl(UploadImageUtil.uploadImage(request,file));
		}
		tshopService.insertSelective(tShop);
		return "addShop";
	}
	@RequestMapping(value = "/addgouwuche",method = RequestMethod.POST)
	public @ResponseBody
	AjaxResult resultaddgouwuche(String shopid){
		AjaxResult ajaxResult=null;
		Shoporder shoporder=new Shoporder();
		shoporder.setShopid(Integer.parseInt(shopid));
		Session session=SecurityUtils.getSubject().getSession();
		User user=(User) session.getAttribute("user");
		String longId=String.valueOf(user.getId());
		Integer userid=Integer.parseInt(longId);
		Integer shopidI=Integer.parseInt(shopid);
		shoporder.setUserId(userid);
		Shoporder i1=shoporderService.selectOrderisExit(userid,shopidI);
		if(i1!=null){
			Integer count=i1.getBuycount()+1;
			shoporder.setBuycount(count);
			shoporder.setAllprice(i1.getOneprice()*count);
			shoporder.setOrderid(i1.getOrderid());
			int i2= shoporderService.updateByPrimaryKeySelective(shoporder);
			return coomencode(i2);
		}else {
			TShop tShop=tshopService.selectByPrimaryKey(shopidI);
			Shoporder shoporder1=new Shoporder();
			shoporder1.setAllprice(tShop.getShopprice());
			shoporder1.setBuycount(1);
			shoporder1.setUserId(userid);
			shoporder1.setShopName(tShop.getShopname());
			shoporder1.setOneprice(tShop.getShopprice());
			shoporder1.setShopid(shopidI);
			int i=shoporderService.insert(shoporder1);
			return coomencode(i);
		}

	}
	@RequestMapping(value = "/jianshaogouwuche",method = RequestMethod.POST)
	public @ResponseBody
	AjaxResult resultaddgouwuche2(String shopid){
		AjaxResult ajaxResult=null;
		Shoporder shoporder=new Shoporder();
		shoporder.setShopid(Integer.parseInt(shopid));
		Session session=SecurityUtils.getSubject().getSession();
		User user=(User) session.getAttribute("user");
		String longId=String.valueOf(user.getId());
		Integer userid=Integer.parseInt(longId);
		Integer shopidI=Integer.parseInt(shopid);
		shoporder.setUserId(userid);
		Shoporder i1=shoporderService.selectOrderisExit(userid,shopidI);
		int i2=0;
		Integer count=0;
		boolean iszuihou=false;
		if(i1!=null){
			 count=i1.getBuycount()-1;
			if(count<0){
				count=0;
				iszuihou=true;
			}
			shoporder.setBuycount(count);
			shoporder.setAllprice(i1.getOneprice()*count);
			shoporder.setOrderid(i1.getOrderid());
		}
		i2=shoporderService.updateByPrimaryKeySelective(shoporder);
		if(iszuihou){
			return AjaxResult.Failed("此商品已经没有数量了，不能再减少!");
		}
		return coomencode(i2);

	}
	@RequestMapping("/gouwuche")
	public String gouwuchepList(Model model, HttpServletRequest request, @RequestParam(value = "index", required = false, defaultValue = "1") Integer pageIndex,
								@RequestParam(value = "pageNum", required = false, defaultValue = "10") Integer pageNum){
		Session session=SecurityUtils.getSubject().getSession();
		User user=(User) session.getAttribute("user");
		String longId=String.valueOf(user.getId());
		Integer userid=Integer.parseInt(longId);
		Integer afterpageIndex=(pageIndex-1)*pageNum;
		pageNum=pageIndex*pageNum;

		List<Shoporder> shoporderList=shoporderService.selectgowuche(afterpageIndex,pageNum,userid);
		Integer pageCount = 0;
		if (shoporderList != null && !shoporderList.isEmpty()) {
			pageCount = shoporderList.get(0).getAllcount();
		}
		String param = request.getQueryString();
		String requestStr = request.getRequestURI();
		PageSearch pageSearch = PageUtils.shzwo(String.valueOf(pageIndex), pageCount, pageNum, requestStr, true, param);
		model.addAttribute("page", pageSearch);
		model.addAttribute("shoporderList", shoporderList);
		return "gouwuche";
	}
	public AjaxResult coomencode(int i){
		AjaxResult ajaxResult=null;
		if(i>0){
			ajaxResult= AjaxResult.Success("添加到购物车操作成功");
			return  ajaxResult;
		}else{
			ajaxResult= AjaxResult.Failed("操作失败请联系技术人员");
			return ajaxResult;
		}
	}
@RequestMapping(value = "/deleteOrder",method = RequestMethod.POST)
public @ResponseBody
Map deleteUserInRoles(Integer orderid) {
	Map<String, String> map = new HashMap<>();
	int i =shoporderService.deleteByPrimaryKey(orderid);
	if(i>0){
		successmapcodetip(map);
	}else{
		failmapcodtip(map);
	}
	return map;
}
	public void successmapcodetip(Map<String, String> map) {

		map.put(STATESTR, SUCCESSSTR);
		map.put(MESSAGESTR, "修改成功！");
	}
	public void failmapcodtip(Map<String, String> map) {

		map.put(STATESTR, ERRORSTR);
		map.put(MESSAGESTR, "修改失败！请联系管理员");
	}
}
