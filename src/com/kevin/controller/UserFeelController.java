package com.kevin.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.pojo.UserFeel;
import com.kevin.serviceDao.UserFeelServiceDao;

/**
 * 用户感受记录
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/userFeelAction")
public class UserFeelController {
	UserFeelServiceDao ufsd = new UserFeelServiceDao();
	
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, String> insertUserFeel(@RequestParam("yyNum") String yyNum, @RequestParam(name="hostId",required=false,defaultValue="") Integer hostId, @RequestParam("userId") Integer userId
			,@RequestParam(name="userSongList",required=false,defaultValue="") Integer[] userSongList,
			@RequestParam("userFeelList") Integer[] userFeelList){
		System.out.println("yyNum:"+yyNum+",userSongList:"+userSongList[0]);
//		如果接收的是String则需要转化处理
//		String struserSongList = StringUtils.strip(userSongList, "[]"); //去掉两端的[]
//		String struserFeelList = StringUtils.strip(userFeelList, "[]"); //去掉两端的[]
//		System.out.println("struserSongList:"+struserSongList);
//		System.out.println("struserFeelList:"+struserFeelList);
//		String[] arruserSongList = struserSongList.split(","); //根据分隔符, 分隔转为字符数组
//		String[] arruserFeelList = struserFeelList.split(","); //根据分隔符, 分隔转为字符数组
//		System.out.println("length:"+arruserSongList.length);
		for(int i=0; i<userFeelList.length; i++) {
			UserFeel userfeel = new UserFeel(yyNum, hostId, userId, userSongList[i], userFeelList[i]);
			boolean isInsert = ufsd.insert(userfeel);
			System.out.println("isInsert:"+isInsert);
		}
		
		Map<String, String> map = new HashMap<>();
		return map;
	}

}
