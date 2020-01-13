package com.kevin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.json.jsonResult;
import com.kevin.pojo.User;
import com.kevin.serviceDao.UserServiceDao;
import com.kevin.util.CommonUtil;

import net.sf.json.JSONObject;

/**
 * 用户登录
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/userAction")
public class UserController {
	UserServiceDao usd = new UserServiceDao();

	@RequestMapping("/getOpenId") // 获取用户信息
	@ResponseBody
	public Map<String, Integer> getOpenId(@RequestParam("code") String code, @RequestParam("nickname") String nickname,
			@RequestParam("avatarUrl") String avatarUrl, @RequestParam("gender") Integer gender) {
		System.out.println("nickname:" + nickname + ",avaUrl:" + avatarUrl);
		String WX_URL = "https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code";

		Map<String, Integer> map = new HashMap<String, Integer>();
		try {
			if (code == null || code.length() == 0) {
				System.out.println("code为空");
			} else {// 小程序唯一标识 (在微信小程序管理后台获取)
				/*String requestUrl = WX_URL.replace("APPID", "wx6aa68b1cd8c98061")
						.replace("SECRET", "deb6c3e370e00ca21df53c4fe3d51f4c").replace("JSCODE", code)
						.replace("authorization_code", "authorization_code");*/
				// 个人账户
				/*String requestUrl = WX_URL.replace("APPID", "wxaaebee5ca83d5e50")
						.replace("SECRET", "9ac01424d2545a89205d8fe969fab7fe").replace("JSCODE", code)
						.replace("authorization_code", "authorization_code");*/
				// 佳码账户
				String requestUrl = WX_URL.replace("APPID", "wxb74afc75f2c20b65")
						.replace("SECRET", "46b189c6bd06d159129df117d0a39092").replace("JSCODE", code)
						.replace("authorization_code", "authorization_code");
				JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
				// System.out.println("---jsobj:" + jsonObject);
				if (jsonObject != null) {
					try {
						// 业务操作
						String openid = jsonObject.getString("openid");

						int selectUserId = usd.selectByOpenId(openid);
						System.out.println("ULC] sUID:" + selectUserId);

						if (selectUserId == 0) { // 如果库中无此用户，则insert并重新获取设置userId
							System.out.println("不存在此用户");
							User user = new User(openid, nickname, avatarUrl, gender);
							usd.insert(user);
							// wechatService.selectUserByOpenId(openid, headurl, nickname, sex, country,
							// province, city);
							System.out.println("---Insert openId:" + openid);
							selectUserId = usd.selectByOpenId(user.getWxOpenId());
							System.out.println("new uid:" + selectUserId);
						}
						map.put("userId", selectUserId);
						return map; // 库中有此用户，直接返回userId
					} catch (Exception e) {
						System.out.println("业务操作失败");
						e.printStackTrace();
					}
				} else {
					System.out.println("code无效");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("userId", 0);
		return map;
	}
	
	/**
	 * 获取用户音感度，音缘指数信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/getUserYYInfo")
	@ResponseBody
	public jsonResult getUserYYInfo(@RequestParam() Integer id) {
		System.out.println("get id:"+id);
		List<User> userList = usd.getUserYYInfo(id);
		jsonResult json = new jsonResult();
		json.add(userList);
		System.out.println("getUserYYInfo json:"+json);
		return json;
	}
	
	/**
	 * 通过音缘听歌更新音感
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateYinganByYinyuan")
	@ResponseBody
	public jsonResult updateYinganByYinyuan(@RequestParam() Integer id) {
		boolean isUpdate = usd.updateYinganByYinyuan(id);
		jsonResult json = new jsonResult();
		json.add(isUpdate);
		System.out.println("updateYinganByYinyuan json:"+json);
		return json;
	}

}
