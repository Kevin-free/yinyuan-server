package com.kevin.util;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Author: kevin
 * @Date: Created in 2019.03.13
 * @Modified By:
 * @Description: 使用FixedThreadPool，控制线程池
 */
public class MyThreadPool {
	// 设置同时执行线程最大数为 1
	public static ExecutorService executorService =  Executors.newFixedThreadPool(1);

    
    public static void shutDown() {
    	executorService.shutdown();//一定要调用这个方法，不然executorService.isTerminated()永远不为true
        while(true){//等待所有任务都结束了继续执行
            try {
                if(executorService.isTerminated()){
                    System.out.println("所有的子线程都结束了！");
                    break;
                }
                Thread.sleep(1000);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
	}  

    }

