package com.kevin.util;

import java.io.IOException;

import org.apache.http.HttpHost;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import database.MyRedis;
import ipproxypool.ipmodel.IPMessage;

public class CheckIp {
	public IPMessage checkProxyIp(String proxyIp, int proxyPort) {

		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpHost proxy = new HttpHost(proxyIp, proxyPort);
		RequestConfig requestConfig = RequestConfig.custom().setProxy(proxy).setConnectTimeout(10000)
				.setSocketTimeout(10000).setConnectionRequestTimeout(3000).build();
		// RequestConfig requestConfig = RequestConfig.custom().setProxy(proxy).build();
		HttpGet httpGet = new HttpGet("http://www.baidu.com"); //测试代理IP是否有效 http://music.163.com
		httpGet.setConfig(requestConfig);
		httpGet.setHeader("Accept-Language", "zh-cn,zh;q=0.5");
		httpGet.setHeader("Accept-Charset", "GB2312,utf-8;q=0.7,*;q=0.7");
		httpGet.setHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		httpGet.setHeader("Accept-Encoding", "gzip, deflate");
		httpGet.setHeader("User-Agent",
				"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0");
		MyRedis myRedis = new MyRedis();
		IPMessage ipMessage = new IPMessage();
		try {
			CloseableHttpResponse response = httpClient.execute(httpGet);
			int statuCode = response.getStatusLine().getStatusCode();
			if (statuCode == 200) {
//				System.out.println("true");
				ipMessage.setIPAddress(proxyIp);
				ipMessage.setIPPort(Integer.toString(proxyPort));
				myRedis.setIPToList(ipMessage); //有效IP添加到表头
//				System.out.println("Check The Avilable! IP:" + proxyIp + ",Port:" + proxyPort);
				return ipMessage; //若IP有用则返回，否则返回null
			} else {
				return null;
			}
		} catch (Exception e) {
//			System.out.println("catch out");
		} finally {
			if (httpGet != null) {
				httpGet.abort();
			}
		}
		return null;
	}
	
	// SongController检查获得的IP
	public IPMessage checkTheProxyIp(String proxyIp, int proxyPort) {

		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpHost proxy = new HttpHost(proxyIp, proxyPort);
		RequestConfig requestConfig = RequestConfig.custom().setProxy(proxy).setConnectTimeout(10000)
				.setSocketTimeout(10000).setConnectionRequestTimeout(3000).build();
		// RequestConfig requestConfig = RequestConfig.custom().setProxy(proxy).build();
		HttpGet httpGet = new HttpGet("http://www.baidu.com"); //测试代理IP是否有效 http://music.163.com
		httpGet.setConfig(requestConfig);
		httpGet.setHeader("Accept-Language", "zh-cn,zh;q=0.5");
		httpGet.setHeader("Accept-Charset", "GB2312,utf-8;q=0.7,*;q=0.7");
		httpGet.setHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		httpGet.setHeader("Accept-Encoding", "gzip, deflate");
		httpGet.setHeader("User-Agent",
				"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0");
		MyRedis myRedis = new MyRedis();
		IPMessage ipMessage = new IPMessage();
		try {
			CloseableHttpResponse response = httpClient.execute(httpGet);
			int statuCode = response.getStatusLine().getStatusCode();
			if (statuCode == 200) {
				System.out.println("available");
				ipMessage.setIPAddress(proxyIp);
				ipMessage.setIPPort(Integer.toString(proxyPort));
//				myRedis.setIPToList(ipMessage); //有效IP添加到表头。 此时不在插入，否则重复两次
//				System.out.println("---use IP:" + proxyIp + ",Port:" + proxyPort);
				return ipMessage; //若IP有用则返回，否则返回null
			} else {
				System.out.println("false");
				return null;
			}
		} catch (Exception e) {
			System.out.println("---checkTheIP catch");
		} finally {
			if (httpGet != null) {
				httpGet.abort();
			}
		}
		return null;
	}

}
