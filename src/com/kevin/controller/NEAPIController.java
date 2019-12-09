package com.kevin.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.kevin.json.jsonResult;

import sun.misc.BASE64Encoder;

/**
 * 复用网易云音乐API接口
 * 
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/neapi")
public class NEAPIController {
//	记录登录后的用户信息
	public String user = "";
//	记录cookie变量
	public String cookie = "";
//	设置基本cookie
	public String baseCookie = "JSESSIONID-WYYY=; _iuqxldmzr_=; _ntes_nnid=11111111111111111111111111111111,1532077868777; _ntes_nuid=11111111111111111111111111111111; __utma=; __utmz=; __oc_uuid=; __utma=; __utmz=; usertrack=; _ga=; WM_TID=; __utmb=; __utmc=; WM_NI=; WM_NIKE=";

	/**
	 * 创建网易云api请求
	 * 
	 * @param path
	 *            详细的请求url子路径
	 * @param data
	 *            请求参数
	 * @param cookie
	 * 			  cookie缓存
	 * @throws Exception
	 */
	private String createNEAPIRequest(String path, String data, String cookie) throws Exception {
		String secKey = "FFFFFFFFFFFFFFFF";
		// 两遍ASE加密
		String encText = aesEncrypt(aesEncrypt(data, "0CoJUm6Qyw8W8jud"), secKey);
		String encSecKey = rsaEncrypt();
		// 创建httpClient实例
		CloseableHttpClient httpclient = HttpClients.createDefault();
		// 创建HttpResponse实例
		CloseableHttpResponse response = null;
		// 创建httpPost实例
		HttpPost httpPost = new HttpPost("http://music.163.com" + path);
		// 设置请求头消息
//		System.out.println("----createNEAPIRequest cookie:" + cookie);
		httpPost.addHeader("Referer", "http://music.163.com/");
		httpPost.addHeader("Cookie", cookie);
		httpPost.addHeader("User-Agent",
				"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0");
		List<NameValuePair> ls = new ArrayList<NameValuePair>();
		// 添加请求参数
		ls.add(new BasicNameValuePair("params", encText));
		ls.add(new BasicNameValuePair("encSecKey", encSecKey));
		UrlEncodedFormEntity paramEntity = new UrlEncodedFormEntity(ls, "utf-8");
		httpPost.setEntity(paramEntity);
		try {
			// 客户端执行httpPost方法，返回响应
			response = httpclient.execute(httpPost);
			int httpStatus;

			// System.out.println("header[0]:"+headers[0]);

			// 得到服务响应状态码
			httpStatus = response.getStatusLine().getStatusCode();
			if (httpStatus != 200) {
				createNEAPIRequest(path, data, cookie);
//				System.out.println("---httpStatus!=200");
				return null;
			} else {
				/*System.out.println("--res:" + response);
				System.out.println("getAllHeaders:" + response.getAllHeaders());
				System.out.println("Set-Cookie:" + response.getHeaders("Set-Cookie"));// 返回的是数组
				System.out.println("header[].length:" + response.getHeaders("Set-Cookie").length);
				System.out.println("---httpStatus:" + httpStatus);*/

				Header[] ssoResponseHeader = response.getHeaders("Set-Cookie");
				String cookieVlue = "";
				if (ssoResponseHeader != null && ssoResponseHeader.length != 0) {
					for (Header stepHeader : ssoResponseHeader) {
						if (stepHeader != null) {
							// System.out.println(stepHeader.getName()+"~~"+stepHeader.getValue());
							// 将获取的cookie存到变量中
							cookieVlue += stepHeader.getValue();
//							System.out.println("----cookieVlue:" + cookieVlue);
							// response.addHeader(stepHeader.getName(), stepHeader.getValue());
						}
					}
				}
				HttpEntity entity = response.getEntity(); // 获取返回实体

				if (response.getHeaders("Set-Cookie").length != 0) {
//					System.out.println("-------toS:" + response.getHeaders("Set-Cookie").toString());
					// 需要+用户的cookie才能获取用户推荐相互信息，否则返回301
//					System.out.println("2222---cookieVlue:" + cookieVlue);
					cookie = baseCookie + ';' + cookieVlue;
					// TODO 将mycookie返回前端进行保存，每次发请求在将mycookie带上
					/*javax.servlet.http.Cookie mycookie = new javax.servlet.http.Cookie("mycookie", cookie);
					mycookie.setMaxAge(-1);//-1为内存保持
			   		//  System.err.println(request.getContextPath());
					mycookie.setPath(request.getContextPath()+"/");
			   		  response.addCookie(mycookie);*/

//					System.out.println("-------rep cookie:" + cookie);
					user = EntityUtils.toString(entity, "utf-8").toString();
					System.out.println("---user:" + user);
					Map<String, String> map = new HashMap<>();
					map.put("code", "200");
					map.put("cookie", cookie);
					map.put("user", user);
					
					Gson gson = new Gson();
					String json = gson.toJson(map);
					System.out.println("----json:"+json);
//					System.out.println("----map.toString():"+map.toString());
					return json;
//					return map.toString();
//					return user;
				}
//				System.out.println("---entity:" + entity);
				if (entity != null) {
					String json = EntityUtils.toString(entity, "utf-8").toString();
//					System.out.println("netease返回的json：" + json);
					return json;
				}
			}
			response.close();
			System.out.println("-----close");
			httpclient.close();
			return null;
		} catch (Exception e) {
			System.out.println("---catch");
			e.printStackTrace();
			// return new jsonResult(false, "连接超时");
			return "false";
		}
	}

	//获取用户信息
	@RequestMapping("/mine")
	@ResponseBody
	public String mine() {
		System.out.println("----mine user:" + user);
		return user;
	}
	//手机登录
	@RequestMapping("/login/cellphone")
	@ResponseBody
	public String cellphone(@RequestParam("phone") String phone, @RequestParam("password") String password)
			throws Exception {
		System.out.println("phone--:" + phone);
		// 获得MD5摘要算法的 MessageDigest 对象
		MessageDigest mdInst = MessageDigest.getInstance("MD5");
		// 使用指定的字节更新摘要
		mdInst.update(password.getBytes());
		// digest()最后确定返回md5 hash值，返回值为8位字符串。
		String md5psd = new BigInteger(1, mdInst.digest()).toString(16);
		System.out.println("md5psd:---" + md5psd);
		// 字符串需要手动加 ''，否则识别为整型，请求不对
		String data = "{phone:"+phone+", password:'" + md5psd + "', rememberLogin:'true'}";
		System.out.println("---login data:" + data);
		String jr = createNEAPIRequest("/weapi/login/cellphone", data, null);
		System.out.println("cellphone jr---" + jr);
		return jr;
	}
	// 单曲播放地址
	@RequestMapping("/music/url")
	@ResponseBody
	public String getNESongUrlById(@RequestParam("id") Integer id) throws Exception {
		// 定义请求中的参数
		// 这个接口中的ids为数组类型
		// String data = "{ids:\"[" + urlId + "]\", br: \"320000\", csrf_token:\"\"}";
		String data = "{ids:[" + id + "], br:320000, csrf_token:''}";
		System.out.println("-----url data:" + data);
		return createNEAPIRequest("/weapi/song/enhance/player/url", data, null);
	}
	//fm
	@RequestMapping("/fm")
	@ResponseBody
	public String fm(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		System.out.println("-------fm data:"+data);
		System.out.println("-------fm cookie:"+cookie);
		return createNEAPIRequest("/weapi/v1/radio/get", data, cookie);
	}
	//每日推荐歌曲
	@RequestMapping("/recommend/songs")
	@ResponseBody
	public String recommend(@RequestParam(defaultValue="0") String offset,
			@RequestParam(defaultValue="true") Boolean total,
			@RequestParam(defaultValue="20") String limit,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{offset:"+offset+",total:"+total+",limit:"+limit+",csrf_token:''}";
		System.out.println("-------recommend data:"+data);
		System.out.println("-------recommend cookie:"+cookie);
		//TODO 每次请求要cookie时前端都发送cookie，有的话重置，无的话为空串
		return createNEAPIRequest("/weapi/v1/discovery/recommend/songs", data, cookie);
	}
	//红心歌曲
	@RequestMapping("/likelist")
	@ResponseBody
	public String likelist(@RequestParam() String uid,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{uid:"+uid+",csrf_token:''}";
//		System.out.println("-------likelist data:"+data);
//		System.out.println("-------likelist cookie:"+cookie);
		return createNEAPIRequest("/weapi/song/like/get", data, cookie);
	}
	//歌单类型列表
	@RequestMapping("/playlist/catlist")
	@ResponseBody
	public String catlist(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		System.out.println("-------catlist data:"+data);
		return createNEAPIRequest("/weapi/playlist/catalogue", data, cookie);
	}
	//推荐新音乐
	@RequestMapping("/personalized/newsong")
	@ResponseBody
	public String newsong(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{type: \"recommend\"}";
		System.out.println("-------newsong data:"+data);
		return createNEAPIRequest("/api/personalized/newsong", data, cookie);
	}
	//推荐歌单
	@RequestMapping("/personalized")
	@ResponseBody
	public String personalized(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{}";
		return createNEAPIRequest("/api/personalized/playlist", data, cookie);
	}
	//推荐mv
	@RequestMapping("/personalized/mv")
	@ResponseBody
	public String personalizedmv(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{}";
		return createNEAPIRequest("/api/personalized/mv", data, cookie);
	}
	//独家放送
	@RequestMapping("/personalized/privatecontent")
	@ResponseBody
	public String privatecontent(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{}";
		return createNEAPIRequest("/api/personalized/privatecontent", data, cookie);
	}
	//推荐dj
	@RequestMapping("/personalized/djprogram")
	@ResponseBody
	public String djprogram(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{}";
		return createNEAPIRequest("/api/personalized/djprogram", data, cookie);
	}
	//推荐dj
	@RequestMapping("/personalized/topic")
	@ResponseBody
	public String topic(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{}";
		return createNEAPIRequest("/weapi/personalized/topic", data, cookie);
	}
	//单曲详情
	@RequestMapping("/music/detail")
	@ResponseBody
	public String detail(@RequestParam("id") String id,
			@RequestParam(defaultValue="") String cookie) throws Exception{
//		id: 'id',  ''可以多加不能少加
		String data = "{id:'"+id+"',c:'[{\"id\":"+id+"}]',ids:["+id+"],csrf_token:''}";
		System.out.println("-------detail data:"+data);
		return createNEAPIRequest("/weapi/v3/song/detail", data, cookie);
	}
	//添加评论
	@RequestMapping("/addcomment")
	@ResponseBody
	public String addcomment(@RequestParam() String threadId,
			@RequestParam() String content,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{threadId:'"+threadId+"',content:'"+content+"',checkToken:'',csrf_token:''}";
		System.out.println("-------addcomment data:"+data);
		return createNEAPIRequest("/weapi/resource/comments/add", data, cookie);
	}
	//评论
	@RequestMapping("/comments")
	@ResponseBody
	public String comments(@RequestParam() String id,
			@RequestParam() String limit,
			@RequestParam() String offset,
			@RequestParam(defaultValue="comments") String type,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		System.out.println("---1 type:"+type);
		type = type == "hot" ? "hotcomments" : "comments";
		System.out.println("type:"+type);
		String data = "{rid:'"+id+"',offset:'"+offset+"',limit:'"+limit+"',total:false,csrf_token:''}";
		System.out.println("-------comments data:"+data);
		return createNEAPIRequest("/weapi/v1/resource/"+type+"/"+id, data, cookie);
	}
	//歌单详情
	@RequestMapping("/playlist/detail")
	@ResponseBody
	public String playlistdetail(@RequestParam() String id,
			@RequestParam(defaultValue="0") String offset,
			@RequestParam(defaultValue="20") String limit,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{id:"+id+",offset:"+offset+",n:"+limit+",limit:"+limit+",total:false,csrf_token:''}";
		System.out.println("-------playlistdetail data:"+data);
		return createNEAPIRequest("/weapi/v3/playlist/detail", data, cookie);
	}
//	歌词
	@RequestMapping("/lyric")
	@ResponseBody
	public String lyric(@RequestParam() String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		System.out.println("-----lyric "+id);
		return createNEAPIRequest("/api/song/lyric?os=osx&id="+id+"&lv=-1&kv=-1&tv=-1", "", cookie);
	}
//	搜索
	@RequestMapping("/search")
	@ResponseBody
	public String search(@RequestParam(defaultValue="") String keywords,
			@RequestParam(defaultValue="1") String type,
			@RequestParam(defaultValue="0") String offset,
			@RequestParam(defaultValue="20") String limit,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{s:'"+keywords+"',offset:"+offset+",limit:"+limit+",type:"+type+"}";
		System.out.println("-----search data:"+data);
		return createNEAPIRequest("/weapi/cloudsearch/get/web", data, cookie);
	}
	//艺术家
	@RequestMapping("/artist")
	@ResponseBody
	public String artist(@RequestParam() String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		return createNEAPIRequest("/weapi/v1/artist/"+id, data, cookie);
	}
	//艺术家-专辑
	@RequestMapping("/artist/album")
	@ResponseBody
	public String artistalbum(@RequestParam String id,
			@RequestParam(defaultValue="0") String offset,
			@RequestParam(defaultValue="20") String limit,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{offset:"+offset+",limit:"+limit+",csrf_token:''}";
		System.out.println("-------artistalbum data:"+data);
		return createNEAPIRequest("/weapi/artist/albums/"+id, data, cookie);
	}
	//艺术家-mv
	@RequestMapping("/artist/mv")
	@ResponseBody
	public String artistmv(@RequestParam String id,
			@RequestParam(defaultValue="0") String offset,
			@RequestParam(defaultValue="20") String limit,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{artistId:"+id+",offset:"+offset+",limit:"+limit+",total:true,csrf_token:''}";
		System.out.println("-------artistmv data:"+data);
		return createNEAPIRequest("/weapi/artist/mvs", data, cookie);
	}
	//艺术家 信息
	@RequestMapping("/artist/desc")
	@ResponseBody
	public String desc(@RequestParam() String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{id:"+id+",csrf_token:''}";
		System.out.println("-------desc data:"+data);
		return createNEAPIRequest("/weapi/artist/introduction", data, cookie);
	}
	//艺术家 ,相似歌手
	@RequestMapping("/artist/simi")
	@ResponseBody
	public String simi(@RequestParam() String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{artistid:'"+id+"',csrf_token:''}";
		System.out.println("-------simi data:"+data);
		return createNEAPIRequest("/weapi/discovery/simiArtist", data, cookie);
	}
	// 点赞和取消点赞评论
	@RequestMapping("/commentlike")
	@ResponseBody
	public String commentlike(@RequestParam() String threadId,
			@RequestParam() String cid, @RequestParam() String like,
			@RequestParam(defaultValue="") String cookie ) throws Exception {
		String url = like.equals("true") ? "/weapi/v1/comment/like" : "/weapi/v1/comment/unlike";
		String data = "{threadId:'"+threadId+"',commentId:'"+cid+"',like:"+like+",checkToken:'',csrf_token:''}";
		System.out.println("-------commentlike data:"+data);
		return createNEAPIRequest(url, data, cookie);
	}
	//歌曲喜欢和删除 op=like or trash,songid,
	@RequestMapping("/song/tracks")
	@ResponseBody
	public String songtracks(@RequestParam() String op,@RequestParam() String id,
			@RequestParam() String r,@RequestParam(defaultValue="") String cookie) throws Exception {
//		String url = op == "like" ? "/weapi/radio/like" : "/weapi/radio/trash/add";
		String url = op.equals("like") ? "/weapi/radio/like" : "/weapi/radio/trash/add";
//		String alg = r!="del"?"itembased":"RT";
		String alg = !r.equals("del")?"itembased":"RT";
		String like = !r.equals("del")?"true":"false";
		String data = op.equals("like") ?"{alg:'"+alg+"',trackId:"+id+",like:"+like+",time:2,csrf_token:''}":"{alg:'RT',songId:"+id+",time:2,csrf_token:''}";
//		System.out.println("url:"+url);
//		System.out.println("op:"+op+",r:"+r+",alg:"+alg);
//		System.out.println("---songtracks data:"+data);
//		System.out.println("---songtracks cookie:"+cookie);
		return createNEAPIRequest(url, data, cookie);
	}
	//收藏单曲到歌单，从歌单删除歌曲 op=del,add;pid=歌单id,tracks=歌曲id
	@RequestMapping("/playlist/tracks")
	@ResponseBody
	public String playlisttracks(@RequestParam() String op,@RequestParam() String pid,
			@RequestParam() String tracks,@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{op:'"+op+"',pid:"+pid+",tracks:"+tracks+",trackIds:'["+tracks+"]',csrf_token:''}";
		System.out.println("---playlisttracks data:"+data);
		return createNEAPIRequest("/weapi/playlist/manipulate/tracks", data, cookie);
	}
	//用户歌单
	@RequestMapping("/user/playlist")
	@ResponseBody
	public String playlist(@RequestParam("uid") String uid,
			@RequestParam(defaultValue="0") String offset,
			@RequestParam(defaultValue="20") String limit,
			@RequestParam(defaultValue="") String cookie) throws Exception {

		String data = "{uid:"+uid+",offset:"+offset+",limit:"+limit+",csrf_token:''}";
		System.out.println("-------playlist data:"+data);
		return createNEAPIRequest("/weapi/user/playlist", data, cookie);
//		System.out.println("playlist jr---" + jr);
//		 接收中文乱码。解决：在spring.xml中设置 <value>text/html;charset=UTF-8</value>
	}
	//个人信息，歌单，收藏，mv,dj数量
	@RequestMapping("/user/subcount")
	@ResponseBody
	public String subcount(@RequestParam("id") String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
//		String cookie = "";
		String data = "{userId:"+id+", csrf_token:''}";
		System.out.println("-----subcount data:" + data);
		String jr = createNEAPIRequest("/weapi/subcount", data, cookie);
//		System.out.println("subcount jr---" + jr);
		return jr;
	}
	//分类歌单
	@RequestMapping("/top/playlist")
	@ResponseBody
	public String topPlaylist(@RequestParam String offset,
			@RequestParam(defaultValue="hot") String order,
			@RequestParam String limit,@RequestParam String type,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{offset:"+offset+",order:'"+order+"',limit:"+limit+",cat:'"+type+"',csrf_token:''}";
		System.out.println("-------topPlaylist data:"+data);
		return createNEAPIRequest("/weapi/playlist/list", data, cookie);
	}
	//电台类型列表
	@RequestMapping("/djradio/catelist")
	@ResponseBody
	public String djradiocatelist(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		return createNEAPIRequest("/weapi/djradio/category/get", data, cookie);
	}
	//推荐节目
	@RequestMapping("/program/recommend")
	@ResponseBody
	public String programrecommend(@RequestParam(required=false) String type,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{cateId:"+type+",csrf_token:''}";
		System.out.println("-------programrecommend data:"+data);
		return createNEAPIRequest("/weapi/program/recommend/v1", data, cookie);
	}
	//精选电台
	@RequestMapping("/djradio/recommend")
	@ResponseBody
	public String djradiorecommend(@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		return createNEAPIRequest("/weapi/djradio/recommend/v1", data, cookie);
	}
	//分类电台
	@RequestMapping("/djradio/hot")
	@ResponseBody
	public String djradiohot(@RequestParam(required=false) String type,
			@RequestParam(required=false) String limit,@RequestParam(required=false) String offset,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{cateId:"+type+",csrf_token:''}";
		System.out.println("-------djradiohot data:"+data);
		return createNEAPIRequest("/weapi/djradio/hot/v1", data, cookie);
	}
	//djradio detail
	@RequestMapping("/dj/detail")
	@ResponseBody
	public String djdetail(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{id:"+id+",csrf_token:''}";
		System.out.println("-------djdetail data:"+data);
		return createNEAPIRequest("/weapi/djradio/get", data, cookie);
	}
	//dj主播 radio
	@RequestMapping("/dj/program")
	@ResponseBody
	public String djprogram(@RequestParam String asc,@RequestParam String id,
			@RequestParam String limit,@RequestParam String offset,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{asc:"+asc+",radioId:"+id+",limit:"+limit+",offset:"+offset+",csrf_token:''}";
		System.out.println("-------djprogram data:"+data);
		return createNEAPIRequest("/weapi/dj/program/byradio", data, cookie);
	}
	//排行榜详细
	@RequestMapping("/toplist/detail")
	@ResponseBody
	public String toplistdetail(@RequestParam(required=false) String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{id:"+id+",limit:20,csrf_token:''}";
		System.out.println("-------toplistdetail data:"+data);
		return createNEAPIRequest("/weapi/toplist/detail", data, cookie);
	}
	//新歌上架 ,type ALL, ZH,EA,KR,JP
	@RequestMapping("/top/songs")
	@ResponseBody
	public String topsongs(@RequestParam String type,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{type:'"+type+"',area:'"+type+"',cat:'"+type+"',csrf_token:''}";
		System.out.println("-------topsongs data:"+data);
		return createNEAPIRequest("/weapi/v1/discovery/new/songs", data, cookie);
	}
	//新碟上架 ,type ALL, ZH,EA,KR,JP
	@RequestMapping("/top/album")
	@ResponseBody
	public String topalbum(@RequestParam String type,
			@RequestParam String limit,@RequestParam String offset,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{offset:"+offset+",limit:"+limit+",area:'"+type+"',total:true,csrf_token:''}";
		System.out.println("-------topalbum data:"+data);
		return createNEAPIRequest("/weapi/album/new", data, cookie);
	}
	//mv detail
	@RequestMapping("/mv")
	@ResponseBody
	public String mv(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{id:"+id+",csrf_token:''}";
		System.out.println("-------mv data:"+data);
		return createNEAPIRequest("/api/mv/detail?id=" + id + "&type=mp4", data, cookie);
	}
	//simi mv
	@RequestMapping("/mv/simi")
	@ResponseBody
	public String mvsimi(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{mvid:"+id+",csrf_token:''}";
		System.out.println("-------mvsimi data:"+data);
		return createNEAPIRequest("/weapi/discovery/simiMV", data, cookie);
	}
	//dj单期节目program-detail
	@RequestMapping("/program/detail")
	@ResponseBody
	public String programdetail(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{id:"+id+",csrf_token:''}";
		System.out.println("-------programdetail data:"+data);
		return createNEAPIRequest("/weapi/dj/program/detail", data, cookie);
	}
	//用户详情
	@RequestMapping("/user/detail")
	@ResponseBody
	public String userdetail(@RequestParam String uid,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		System.out.println("-------userdetail data:"+data);
		return createNEAPIRequest("/api/v1/user/detail/"+uid, data, cookie);
	}
	//专辑详情
	@RequestMapping("/album/detail")
	@ResponseBody
	public String albumdetail(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{csrf_token:''}";
		System.out.println("-------albumdetail data:"+data);
		return createNEAPIRequest("/weapi/v1/album/"+id, data, cookie);
	}
	//simi ,相似歌单，歌曲，关注的用户
	@RequestMapping("/simi/playlist")
	@ResponseBody
	public String simiplaylist(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{songid:"+id+",csrf_token:''}";
		System.out.println("-------simiplaylist data:"+data);
		return createNEAPIRequest("/weapi/discovery/simiPlaylist", data, cookie);
	}
	@RequestMapping("/simi/song")
	@ResponseBody
	public String simisong(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{songid:"+id+",csrf_token:''}";
		System.out.println("-------simisong data:"+data);
		return createNEAPIRequest("/weapi/v1/discovery/simiSong", data, cookie);
	}
	@RequestMapping("/simi/user")
	@ResponseBody
	public String simiuser(@RequestParam String id,
			@RequestParam(defaultValue="") String cookie) throws Exception {
		String data = "{songid:"+id+",csrf_token:''}";
		System.out.println("-------simiuser data:"+data);
		return createNEAPIRequest("/weapi/discovery/simiUser", data, cookie);
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

}
