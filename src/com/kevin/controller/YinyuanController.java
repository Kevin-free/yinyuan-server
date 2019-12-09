package com.kevin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.json.jsonResult;
import com.kevin.pojo.User;
import com.kevin.pojo.UserFeel;
import com.kevin.pojo.UserPp;
import com.kevin.pojo.Yinyuan;
import com.kevin.serviceDao.UserServiceDao;
import com.kevin.serviceDao.YinyuanServiceDao;

/**
 * 音缘匹配记录
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/yinyuanAction")
public class YinyuanController {
	YinyuanServiceDao ysd = new YinyuanServiceDao();
	UserServiceDao usd = new UserServiceDao();
	
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, Boolean> insertYinyuan(@RequestParam() Integer userId,
			@RequestParam() Integer hostId,@RequestParam() String yyNum,
			@RequestParam() Integer ppzs,@RequestParam() Integer addyingan){
		System.out.println("--userId:"+userId+",ppzs"+ppzs+",addyingan"+addyingan);
		Yinyuan yinyuan = new Yinyuan(userId, hostId, yyNum, ppzs);
		boolean isInsert = ysd.insert(yinyuan);
		System.out.println("yy isInsert:"+isInsert);
//		 更新两个用户的总音缘指数和音感
		boolean isUpdateUser =  usd.updateZyyzsAndYingan(userId,hostId,ppzs,addyingan);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("isInsert", isInsert);
		map.put("isUpdateUser", isUpdateUser);
		System.out.println("map:"+map);
		return map;
	}
	
	/**
	 * 获取匹配信息
	 * @param yyNum 音缘房间号
	 * @return
	 */
	@RequestMapping("/getppInfo")
	@ResponseBody
	public jsonResult getppInfo(@RequestParam() String yyNum){
//		通过yyNum查询userId的头像，和匹配指数返回给前端显示
		/*ArrayList<User> userList = ysd.getUserAva(yyNum);
		System.out.println("--userList:"+userList.toString());
		jsonResult json = new jsonResult();
		json.add(userList);
		Integer ppzs = ysd.getPpzs(yyNum); */
		ArrayList<UserPp> userPpList = ysd.getUserPp(yyNum);
		System.out.println("--userPpList:"+userPpList.toString());
		jsonResult json = new jsonResult();
		json.add(userPpList);
		return json;
	}
	
	/**
	 * 获取排行榜信息
	 * @return
	 */
	@RequestMapping("/getRankInfo")
	@ResponseBody
	public jsonResult getRankInfo() {
		ArrayList<User> userList = usd.getRankInfo();
		System.out.println("--getRankInfo:"+userList.toString());
		jsonResult json = new jsonResult();
		json.add(userList);
		return json;
	}
	
}
