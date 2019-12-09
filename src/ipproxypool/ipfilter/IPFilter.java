package ipproxypool.ipfilter;

import ipproxypool.ipmodel.IPMessage;

import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.SocketAddress;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * Created by hg_yi on 17-8-11.
 *
 * @Description: 对xici代理网的ip进行质量筛选
 */
public class IPFilter {
	public static List<IPMessage> Filter(List<IPMessage> ipMessages1) {
		List<IPMessage> newIPMessages = new LinkedList<>();

		for (IPMessage ipMessage : ipMessages1) {
			String ipType = ipMessage.getIPType();
			String ipSpeed = ipMessage.getIPSpeed();

			ipSpeed = ipSpeed.substring(0, ipSpeed.indexOf('秒'));
			double Speed = Double.parseDouble(ipSpeed);

			if (ipType.equals("HTTPS") && Speed <= 3.0) {
				newIPMessages.add(ipMessage);

//				SocketAddress address = new InetSocketAddress(ipMessage.getIPAddress(),
//						Integer.parseInt(ipMessage.getIPPort()));
////				Proxy proxy = new Proxy(Type.HTTP, address);
//				System.getProperties().setProperty("proxySet", "true");
//				System.getProperties().setProperty("http.proxyHost", ipMessage.getIPAddress());
//				System.getProperties().setProperty("http.proxyPort", ipMessage.getIPPort());
//				System.getProperties().setProperty("https.proxyHost", ipMessage.getIPAddress());
//				System.getProperties().setProperty("https.proxyPort", ipMessage.getIPPort());
				
//				System.out.println("IPFilter:" + ipMessage.toString());
			}
		}

		return newIPMessages;
	}
}
