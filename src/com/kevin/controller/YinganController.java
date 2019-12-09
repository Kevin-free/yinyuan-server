package com.kevin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.json.jsonResult;
import com.kevin.pojo.User;
import com.kevin.serviceDao.YinganServiceDao;

/**
 * 音感处理类
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/yinganAction")
public class YinganController {
	YinganServiceDao ysd = new YinganServiceDao();

	@RequestMapping("/update")
	@ResponseBody
	public jsonResult update(@RequestParam() Integer id,@RequestParam Integer yingan) {
		System.out.println("update id:"+id+",yingan:"+yingan);
		User user = new User();
		user.setId(id);
		user.setYingandu(yingan);
		Boolean isUpdate = ysd.update(user);
		jsonResult json = new jsonResult();
		json.setSuccess(isUpdate);
		System.out.println("updata json:"+json);
		return json;
	}
	
	@RequestMapping("/getYingan")
	@ResponseBody
	public jsonResult getYingan(@RequestParam() Integer id) {
		System.out.println("get id:"+id);
		Integer returnYingan = ysd.getYingan(id);
		jsonResult json = new jsonResult();
		json.add(returnYingan);
		System.out.println("getYingan json:"+json);
		return json;
	}
}
