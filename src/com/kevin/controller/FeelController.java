package com.kevin.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kevin.json.jsonResult;
import com.kevin.pojo.Feel;

/**
 * 感受
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/feelAction")
public class FeelController {
	private static final Logger logger = Logger.getLogger(FeelController.class);
	private int returnContentNum = 9; // 返回的内容数量

	@RequestMapping("/getIdAndContent")
	@ResponseBody
	public jsonResult getIdAndContent(@RequestParam("neId") Integer neId) {
		// String pyPath ="E:\\Code\\Python_Code\\SpiderNet-master\\qqmusic\\qqmusic\\spider2\\spide.py";
//		String pyPath = "/home/pyCode/getIdAndContent.py";
		String pyPath = "/home/pyCode/spide3.py";
		System.out.println("测试编码/////pyPath:"+pyPath);
		String[] arguments = new String[] { "python", pyPath, Integer.toString(neId) };
		String result = null;
		try {
			Process process = Runtime.getRuntime().exec(arguments);
			BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line = null;
			while ((line = in.readLine()) != null) {
				System.out.println(line);
				result = line;
			}
			in.close();
			int re = process.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("result:" + result);
//		String rpres = result.replace(" ", "").replaceAll("\\[", ""); // 去空格后替换掉所有的[为空
		String rpres = result==null?"" : result.replace(" ", "").replaceAll("\\[", ""); // 去空格后替换掉所有的[为空
		System.out.println("rpres:" + rpres);
		String[] resArr = rpres.split("],"); // 以]分割为数组
		logger.debug("resArr length:"+resArr.length);
		ArrayList<Feel> feelList = new ArrayList<Feel>();
		if(resArr.length >= returnContentNum) {
			for (int i = 0; i < returnContentNum; i++) {
				// System.out.println(resArr[i]);
				String resArrStr = ArrayUtils.toString(resArr[i], ","); // 数组转String 以,分割
				// System.out.println("resArrStr:"+resArrStr);
				String[] resArrItem = resArrStr.split(",");
				// System.out.println("id:"+resArrItem[0]+ ",content:"+resArrItem[1]);
				Feel feel = new Feel();
				feel.setCommentId(Integer.parseInt(resArrItem[0]));
				feel.setContent(resArrItem[1].replace("\"", ""));
				System.out.println("---feel:" + feel.toString());
				feelList.add(feel);
				// System.out.println(Arrays.toString(resArrItem));
			}
		}else {
//			定义好9条备用感受信息
			Feel feel = new Feel();
			feel.setCommentId(1);
			feel.setContent("喜欢");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(2);
			feel.setContent("好听");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(3);
			feel.setContent("无感");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(4);
			feel.setContent("忧愁");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(5);
			feel.setContent("心动的感觉");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(6);
			feel.setContent("不想听");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(7);
			feel.setContent("励志");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(8);
			feel.setContent("想哭");
			feelList.add(feel);
			feel = new Feel();
			feel.setCommentId(9);
			feel.setContent("开心");
			feelList.add(feel);
			for (int i = 0; i<resArr.length-1; i++) {
				String resArrStr = ArrayUtils.toString(resArr[i], ","); // 数组转String 以,分割
				 System.out.println("resArrStr:"+resArrStr);
				String[] resArrItem = resArrStr.split(",");
				 System.out.println("id:"+resArrItem[0]+ ",content:"+resArrItem[1]);
				 feel = new Feel();
				feel.setCommentId(Integer.parseInt(resArrItem[0]));
				feel.setContent(resArrItem[1].replace("\"", ""));
				System.out.println("---feel:" + feel.toString());
//				feelList.add(feel);
//				若有感受，从第一条开始插入
				feelList.add(i, feel);
			}
		}
		System.out.println(Arrays.toString(resArr));

		jsonResult json = new jsonResult();
		json.add(feelList);
		System.out.println("getComment json:" + json);

		return json;
	}
}
