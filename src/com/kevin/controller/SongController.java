package com.kevin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.kevin.json.jsonResult;
import com.kevin.pojo.Song;
import com.kevin.pojo.UserFeel;
import com.kevin.pojo.UserLike;
import com.kevin.pojo.UserSong;
import com.kevin.serviceDao.SongServiceDao;
import com.kevin.util.CheckIp;
import com.kevin.util.Const;

import database.MyRedis;
import ipproxypool.ipmodel.IPMessage;
import ipproxypool.operation.IPProxyPool;
import sun.misc.BASE64Encoder;

/**
 * 歌曲处理类
 * 
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/songAction")
public class SongController {
	MyRedis myRedis = new MyRedis();
	IPMessage ipMessages = null;
	// 创建供上述变量使用的读写锁
	private ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

	SongServiceDao ssd = new SongServiceDao();

	public static String cookies = "JSESSIONID-WYYY=; _iuqxldmzr_=; _ntes_nnid=11111111111111111111111111111111,1532077868777; _ntes_nuid=11111111111111111111111111111111; __utma=; __utmz=; __oc_uuid=; __utma=; __utmz=; usertrack=; _ga=; WM_TID=; __utmb=; __utmc=; WM_NI=; WM_NIKE=";

	@RequestMapping("/myLikeList")
	@ResponseBody
	public jsonResult myLikeList(@RequestParam() Integer userId) {
		System.out.println("get params---userId:" + userId);
		List<Integer> likeListIds = ssd.getMyLikeList(userId);
		System.out.println("likeListIds---:" + likeListIds);
		jsonResult jr = new jsonResult(likeListIds);

		return jr;
	}

	// 更新userSong的评分
	@RequestMapping("/updateUserSong")
	@ResponseBody
	public jsonResult updateUserSong(@RequestParam() Integer userId, @RequestParam() Integer nesongId,
			@RequestParam() Integer updateScore) {
		System.out.println("get params---userId:" + userId + ",songId:" + nesongId + ",updateScore:" + updateScore);
		UserSong userSong = new UserSong(userId, nesongId, updateScore);
		Boolean isUpdate = ssd.updateUserSong(userSong);
		System.out.println("isUpdate:" + isUpdate);
		jsonResult jr = new jsonResult();
		jr.add(isUpdate);
		return jr;
	}

	// 添加听歌记录到userSong表中
	@RequestMapping("/addUserSong")
	@ResponseBody
	public jsonResult addUserSong(@RequestParam() Integer userId, @RequestParam() Integer nesongId) {
		System.out.println("get params---userId:" + userId + ",songId:" + nesongId);
		UserSong userSong = new UserSong(userId, nesongId);
		Boolean isAdduserSong = ssd.adduserSong(userSong);
		jsonResult jr = new jsonResult();
		System.out.println("---addUserSong json:" + jr);
		jr.add(isAdduserSong);
		return jr;
	}

	/**
	 * 加心心、取消心
	 * 
	 * @param op
	 * @param r
	 * @param userId
	 * @param songId
	 * @return
	 */
	@RequestMapping("/songtracks")
	@ResponseBody
	public jsonResult songtracks(@RequestParam() String op, @RequestParam() String r, @RequestParam() Integer userId,
			@RequestParam() Integer songId) {
		System.out.println("get params---userId:" + userId + ",songId:" + songId + ",op:" + op + ",r:" + r);
		System.out.println("r.equals(\"del\"):" + r.equals("del"));
		jsonResult jr = new jsonResult();
		Map<String, Object> map = new HashMap<String, Object>();
		// 如果是丢弃
		if (op.equals("trash")) {
			// 将歌曲记录到usersong表并操作评分
			System.out.println("trash usersong表并操作评分---");
			UserSong userSong = new UserSong(userId, songId, -5);
			Boolean isUpdate = ssd.updateUserSong(userSong);
			System.out.println("isUpdate:" + isUpdate);
			map.put("isUpdate", isUpdate);
			jr.add(map);
		} else {
			// 如果是加心心
			if (!r.equals("del")) {
				// 将歌曲记录到userlike表
				System.out.println("加心心---");
				UserLike userLike = new UserLike(userId, songId, Const.likeYes);
				Boolean isAddLike = ssd.addLike(userLike);
				System.out.println("isAddLike:" + isAddLike);
				map.put("isAddLike", isAddLike);
				// 将歌曲记录到usersong表并操作评分
				System.out.println("usersong表并操作评分---");
				UserSong userSong = new UserSong(userId, songId, 3);
				Boolean isUpdate = ssd.updateUserSong(userSong);
				System.out.println("isUpdate:" + isUpdate);
				map.put("isUpdate", isUpdate);
				jr.add(map);
			}
			// 如果是取消心
			else {
				// 更新歌曲记录到userlike表
				System.out.println("取消心---");
				UserLike userLike = new UserLike(userId, songId, Const.likeNo);
				Boolean isDelLike = ssd.delLike(userLike);
				System.out.println("isDelLike:" + isDelLike);
				map.put("isDelLike", isDelLike);
				// 将歌曲记录到usersong表并操作评分
				System.out.println("usersong表并操作评分---");
				UserSong userSong = new UserSong(userId, songId, -3);
				Boolean isUpdate = ssd.updateUserSong(userSong);
				System.out.println("isUpdate:" + isUpdate);
				map.put("isUpdate", isUpdate);
				jr.add(map);
			}
		}
		return jr;
	}

	/**
	 * 通过歌曲neId获得歌曲基本信息
	 * 
	 * @param userSongList
	 * @return
	 */
	@RequestMapping("/getNESongInfoById")
	@ResponseBody
	public jsonResult getNESongInfoById(@RequestParam("userSongList") ArrayList<Integer> userSongList) {

		for (int i = 0; i < userSongList.size(); i++) {
			System.out.println("userSong:" + userSongList.get(i));
		}
		List<Song> songList = ssd.getNESongInfoById(userSongList);
		// System.out.println(songList.toString());
		jsonResult json = new jsonResult();
		json.add(songList);

		System.out.println("getNESongInfoRand json:" + json);

		return json;
	}

	/**
	 * 随机获得歌曲基本信息
	 * 
	 * @return json
	 */
	@RequestMapping("/getNESongInfoRand")
	@ResponseBody
	public jsonResult getNESongInfoRand() {
		List<Song> songList = ssd.getNESongInfoRand();
		System.out.println(songList.toString());
		jsonResult json = new jsonResult();
		json.add(songList);

		System.out.println("getNESongInfoRand json:" + json);

		return json;
	}

	/**
	 * java爬虫 通过网易云歌曲id获得音乐url
	 * 
	 * @param urlId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getNESongUrlById")
	@ResponseBody
	public jsonResult getNESongUrlById(@RequestParam("urlId") Integer urlId) throws Exception {
		/*
		 * // 创建生产者（ip-proxy-pool）与消费者（thread-tagBasicPageURL-i）等待/通知机制所需的对象锁 Object
		 * lock = new Object(); // 创建一个 ip-proxy-pool 线程，执行IP代理池
		 * IPProxyPool.startExecute(lock); // 检查IP 和 爬取IP
		 */
		// 定义请求中的参数
		String first_param = "{ids:\"[" + urlId + "]\", br: \"320000\", csrf_token:\"\"}";
		String secKey = "FFFFFFFFFFFFFFFF";
		// 两遍ASE加密
		String encText = aesEncrypt(aesEncrypt(first_param, "0CoJUm6Qyw8W8jud"), secKey);
		String encSecKey = rsaEncrypt();

		String ipAddress = "";
		String ipPort = "";
		CheckIp ci = new CheckIp();
		// 从Redis中获取IP并检查有效性
		// TODO 效果不佳
		/*
		 * if (ipMessages == null) {// 若无ip，从Redis中获取 do {
		 * System.out.println("get IP from Redis..."); ipMessages =
		 * myRedis.getIPByList(); // 从表头开始取（表头存放有效的IP） readWriteLock.writeLock().lock();
		 * ipAddress = ipMessages.getIPAddress(); ipPort = ipMessages.getIPPort(); //报错
		 * java.lang.IllegalMonitorStateException at
		 * java.util.concurrent.locks.ReentrantReadWriteLock$Sync.tryRelease(
		 * ReentrantReadWriteLock.java:371) // readWriteLock.writeLock().unlock();
		 * ipMessages = ci.checkTheProxyIp(ipAddress, Integer.parseInt(ipPort));
		 * System.out.println("---the ipMess:" + ipMessages); //
		 * System.out.println("ipAvilable:" + ipAvilable); } while (ipMessages == null);
		 * } else { // 若以保存ip,使用前再次检查有效性 System.out.println("----used IP:" +
		 * ipMessages.getIPAddress() + "port:" + ipMessages.getIPPort()); ipAddress =
		 * ipMessages.getIPAddress(); ipPort = ipMessages.getIPPort(); ipMessages =
		 * ci.checkTheProxyIp(ipAddress, Integer.parseInt(ipPort)); // 使用前再次检查ip
		 * System.out.println("---used ipMess:" + ipMessages); } if (ipMessages == null)
		 * { // 如果保存的IP变为无效，则重新从Redis中获取 do {
		 * System.out.println("---reGet IP from Redis..."); ipMessages =
		 * myRedis.getIPByList(); // 从表头开始取（表头存放有效的IP） readWriteLock.writeLock().lock();
		 * ipAddress = ipMessages.getIPAddress(); ipPort = ipMessages.getIPPort(); //
		 * readWriteLock.writeLock().unlock(); ipMessages =
		 * ci.checkTheProxyIp(ipAddress, Integer.parseInt(ipPort));
		 * System.out.println("---the ipMess:" + ipMessages); } while (ipMessages ==
		 * null); }
		 */

		// 创建httpClient实例
		CloseableHttpClient httpclient = HttpClients.createDefault();
		// 创建HttpResponse实例
		CloseableHttpResponse response = null;
		// 创建httpPost实例
		HttpPost httpPost = new HttpPost("http://music.163.com/weapi/song/enhance/player/url");
		System.out.println("---ne ipAddress:" + ipAddress + ",ipPort:" + ipPort);
		// 设置代理IP，设置连接超时时间 、 设置 请求读取数据的超时时间 、 设置从connect Manager获取Connection超时时间、
		/*
		 * HttpHost proxy = new HttpHost(ipAddress, Integer.parseInt(ipPort));
		 * RequestConfig requestConfig =
		 * RequestConfig.custom().setProxy(proxy).setConnectTimeout(10000)
		 * .setSocketTimeout(10000).setConnectionRequestTimeout(3000).build(); //
		 * httpPost设置配置 httpPost.setConfig(requestConfig);
		 */
		// 设置请求头消息
		httpPost.addHeader("Referer", "http://music.163.com/");
		httpPost.addHeader("Cookie", cookies);
		httpPost.addHeader("User-Agent",
				"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0");
		List<NameValuePair> ls = new ArrayList<NameValuePair>();
		ls.add(new BasicNameValuePair("params", encText));
		ls.add(new BasicNameValuePair("encSecKey", encSecKey));
		UrlEncodedFormEntity paramEntity = new UrlEncodedFormEntity(ls, "utf-8");
		httpPost.setEntity(paramEntity);
		try {
			// 客户端执行httpPost方法，返回响应
			response = httpclient.execute(httpPost);
			int httpStatus;
			// 得到服务响应状态码
			httpStatus = response.getStatusLine().getStatusCode();
			if (httpStatus == 200) {
				System.out.println("---httpStatus:" + httpStatus);
			} else {
				System.out.println("---httpStatus Err!");
			}
			HttpEntity entity = response.getEntity(); // 获取返回实体
			// getIp(httpPost);
			if (entity != null) {
				String json = EntityUtils.toString(entity, "utf-8").toString();
				System.out.println("返回的json：" + json);
				JSONObject jsStr = JSONObject.parseObject(json);
				String json1 = jsStr.getString("data").replace("[", "").replace("]", "");
				JSONObject jsStr1 = JSONObject.parseObject(json1);
				String url = jsStr1.getString("url");
				// System.out.println(jsStr1.getString("url"));
				System.out.println("url:" + url);

				// List<String> urlJR = url;
				jsonResult jr = new jsonResult();
				jr.add(url);

				System.out.println("getNESongUrlById jr:" + jr);
				return jr;
			}
			response.close();
			httpclient.close();
			return null;
		} catch (Exception e) {
			System.out.println("---catch");
			e.printStackTrace();
			return new jsonResult(false, "连接超时");
		}
	}

	/**
	 * java爬虫 搜索歌曲信息
	 * 
	 * @param s
	 *            搜索字符
	 * @param offset
	 * @param limit
	 * @param type
	 *            类型: 单曲(1), 专辑(10), 歌手(100), 歌单(1000), 用户(1002)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchSongInfo")
	@ResponseBody
	public jsonResult searchSongInfo(@RequestParam("s") String s,
			@RequestParam(name = "offset", required = false, defaultValue = "0") Integer offset,
			@RequestParam(name = "limit", required = false, defaultValue = "100") Integer limit,
			@RequestParam(name = "type", required = false, defaultValue = "1") Integer type) throws Exception {

		// 定义请求中的参数
		String first_param = "{s:\"" + s + "\", offset:\"" + offset + "\", limit:\"" + limit + "\", type:\"" + type
				+ "\", csrf_token:\"\"}";
		System.out.println("---param:" + first_param);
		String secKey = "FFFFFFFFFFFFFFFF";
		// 两遍ASE加密
		String encText = aesEncrypt(aesEncrypt(first_param, "0CoJUm6Qyw8W8jud"), secKey);
		String encSecKey = rsaEncrypt();

		// 创建httpClient实例
		CloseableHttpClient httpclient = HttpClients.createDefault();
		// 创建HttpResponse实例
		CloseableHttpResponse response = null;
		// 创建httpPost实例
		HttpPost httpPost = new HttpPost("http://music.163.com/weapi/cloudsearch/get/web");

		// 设置请求头消息
		httpPost.addHeader("Referer", "http://music.163.com/");
		httpPost.addHeader("Cookie", cookies);
		httpPost.addHeader("User-Agent",
				"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0");
		List<NameValuePair> ls = new ArrayList<NameValuePair>();
		ls.add(new BasicNameValuePair("params", encText));
		ls.add(new BasicNameValuePair("encSecKey", encSecKey));
		UrlEncodedFormEntity paramEntity = new UrlEncodedFormEntity(ls, "utf-8");
		httpPost.setEntity(paramEntity);
		try {
			// 客户端执行httpPost方法，返回响应
			response = httpclient.execute(httpPost);
			int httpStatus;
			// 得到服务响应状态码
			httpStatus = response.getStatusLine().getStatusCode();
			if (httpStatus == 200) {
				System.out.println("---httpStatus:" + httpStatus);
			} else {
				System.out.println("---httpStatus Err!");
			}
			HttpEntity entity = response.getEntity(); // 获取返回实体
			// getIp(httpPost);
			if (entity != null) {
				String json = EntityUtils.toString(entity, "utf-8").toString();
				System.out.println("返回的json：" + json);
				JSONObject jsStr = JSONObject.parseObject(json);
				String json1 = jsStr.getString("result");// .replace("[", "").replace("]", "")
				System.out.println("json1:" + json1);
				JSONObject jsStr1 = JSONObject.parseObject(json1);
				String songs = jsStr1.getString("songs").replace("[", "").replace("]", "");
				// System.out.println(jsStr1.getString("url"));
				// System.out.println("songs:" + songs);

				// List<String> urlJR = url;
				jsonResult jr = new jsonResult();
				jr.add(songs);

				// System.out.println("getNESongUrlById jr:" + jr);

				return jr;
			}
			response.close();
			httpclient.close();
			return null;
		} catch (Exception e) {
			System.out.println("---catch");
			e.printStackTrace();
			return new jsonResult(false, "连接超时");
		}
	}

	/**
	 * ASE-128-CBC加密模式可以需要16位
	 *
	 * @param src
	 *            加密内容
	 * @param key
	 *            密钥
	 * @return
	 */
	public static String aesEncrypt(String src, String key) throws Exception {
		String encodingFormat = "UTF-8";
		String iv = "0102030405060708";
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		byte[] raw = key.getBytes();
		SecretKeySpec secretKeySpec = new SecretKeySpec(raw, "AES");
		IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
		// 使用CBC模式，需要一个向量vi，增加加密算法强度
		cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
		byte[] encrypted = cipher.doFinal(src.getBytes(encodingFormat));
		return new BASE64Encoder().encode(encrypted);
	}

	public static String rsaEncrypt() {
		String secKey = "257348aecb5e556c066de214e531faadd1c55d814f9be95fd06d6bff9f4c7a41f831f6394d5a3fd2e3881736d94a02ca919d952872e7d0a50ebfa1769a7a62d512f5f1ca21aec60bc3819a9c3ffca5eca9a0dba6d6f7249b06f5965ecfff3695b54e1c28f3f624750ed39e7de08fc8493242e26dbc4484a01c76f739e135637c";
		return secKey;
	}

	// 已废弃，更新为getNESongInfoRand
	/*
	 * @RequestMapping("/createSongByRand")
	 * 
	 * @ResponseBody public jsonResult createSongByRand() { List<Song> songList =
	 * ssd.createSongByRand(); jsonResult json = new jsonResult();
	 * json.add(songList);
	 * 
	 * System.out.println("json:" + json);
	 * 
	 * return json; }
	 */
}
