package com.kevin.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import com.kevin.json.jsonResult;
import com.kevin.pojo.Feel;
import com.kevin.pojo.Song;

public class TestUsePy {

	public static void main(String[] args) {
		final int returnContentNum = 9; // 返回的内容数量
		int songId = 60263;
//		String pyPath = "/home/pyCode/getIdAndContent.py";
		String pyPath = "/home/pyCode/spide3.py";
		System.out.println("/////测试pyPath:" + pyPath);
		// String[] arguments = new String[] {"python",
		// "E:\\Code\\Python_Code\\SpiderNet-master\\qqmusic\\qqmusic\\spider2\\test_usedByJava.py",
		// "测试", "25"};
		String[] arguments = new String[] { "python", pyPath, Integer.toString(songId) }; // toString() 比 +""快
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
			// System.out.println(re);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("result:" + result);
		String rpres = result.replace(" ", "").replaceAll("\\[", ""); // 去空格后替换掉所有的[为空
		System.out.println("rpres:" + rpres);
		String[] resArr = rpres.split("],"); // 以]分割为数组
		ArrayList<Feel> feelList = new ArrayList<Feel>();
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
		System.out.println(Arrays.toString(resArr));

		jsonResult json = new jsonResult();
		json.add(feelList);
		System.out.println("getComment json:" + json);
	}
}
