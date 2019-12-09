package ipproxypool.operation;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import com.kevin.util.CheckIp;

import database.MyRedis;
import ipproxypool.grabutils.URLFecter;
import ipproxypool.ipfilter.IPFilter;
import ipproxypool.ipmodel.IPMessage;
import ipproxypool.jobthread.CreateIPProxyPool;
import ipproxypool.jobthread.IPProxyGrabThread;
import ipproxypool.timer.MyTimer;

/**
 * @Author: spider_hgyi
 * @Date: Created in 上午11:43 18-1-31.
 * @Modified By:
 * @Description: 创建执行IP代理池的后台线程
 */
public class IPProxyPoolThread implements Runnable {
	private final Object lock;

	public IPProxyPoolThread(Object lock) {
		this.lock = lock;
	}

	@Override
	public void run() {
		// MyTimer.startIPProxyPool(lock);

		MyRedis myRedis = new MyRedis();
		IPMessage ipMessage = new IPMessage();
		CheckIp ci = new CheckIp();
		// 创建一个有关任务队列的读写锁
		Object taskLock = new Object();

		// 如果IP代理池中没有ip信息，则IP代理池进行工作
		while (true) {
			String ipAddress = "";
			String ipPort = "";
			while (myRedis.isEnough()) { // Redis中记录大于50时，检验ip
				try {
					synchronized (lock) {
						System.out.println("当前线程：" + Thread.currentThread().getName() + ", 开始检查IP");
						ipMessage = myRedis.getIPByListLast(); // 从表尾开始取
						ipAddress = ipMessage.getIPAddress();
						ipPort = ipMessage.getIPPort();
						ipMessage = ci.checkProxyIp(ipAddress, Integer.parseInt(ipPort));
						// System.out.println("job:" + ipMessage);
					}
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}

			while (myRedis.isLittle()) { // Redis中记录小于100时，爬取ip
				synchronized (lock) {
					System.out.println("当前线程：" + Thread.currentThread().getName() + ", 开始更新IP代理池");
					// 存放爬取下来的ip信息
					List<IPMessage> ipMessages = new LinkedList<>();
					// 创建任务队列
					Queue<String> urls = new LinkedList<>();
					// 对创建的子线程进行收集
					List<Thread> threads = new ArrayList<>();

					// 首先使用本机ip爬取xici代理网第一页
					URLFecter.urlParse(ipMessages);
					// 对得到的IP进行筛选，将IP速度在三秒以内的并且类型是https的留下，其余删除
					ipMessages = IPFilter.Filter(ipMessages);

					for (IPMessage theipMessage : ipMessages) {
						System.out.println("toStr:" + theipMessage.toString());
					}

					// 构造种子url(2000条ip)
					for (int i = 2; i <= 10; i++) {
						urls.offer("http://www.xicidaili.com/nn/" + i);
					}

					// 使用多线程对urls进行解析并过滤,拿到所有目标IP，将所有的IP存储进ipMessages这个共享变量中
					CreateIPProxyPool createIpProxyPool = new CreateIPProxyPool(ipMessages);
					for (int i = 0; i < 2; i++) {
						IPProxyGrabThread IPProxyGrabThread = new IPProxyGrabThread(urls, createIpProxyPool, taskLock);
						Thread thread = new Thread(IPProxyGrabThread);
						thread.setName("ip-proxy-pool-thread-" + i);
						threads.add(thread);
						thread.start();
					}

					for (Thread thread : threads) {
						try {
							thread.join();
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}

					// 将爬取下来的ip信息写进Redis数据库中(List集合)
					myRedis.setIPToList(ipMessages);

					System.out.println("当前线程：" + Thread.currentThread().getName() + ", IP代理池已经更新完毕");

					lock.notifyAll();
				}
			}

			// //从redis数据库中随机拿出一个IP
			// IPMessage ipMessage = myRedis.getIPByList();
			// System.out.println(ipMessage.getIPAddress());
			// System.out.println(ipMessage.getIPPort());
			// myRedis.close();
		}

	}
}
