package com.kevin.test;

import org.junit.Test;

import redis.clients.jedis.Jedis;

public class TestJedis {
	@Test
	public void testJedis() {
		Jedis jedis = new Jedis("172.19.65.80", 6379);
		jedis.auth("1024");
		System.out.println("Conn to server success");
		System.out.println("Server is runing: "+jedis.ping());
	}

}
